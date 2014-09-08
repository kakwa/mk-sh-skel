#!/bin/sh
#this script is released under the MIT Public License

help(){
  echo "usage: `basename $0` -n <new/script/path>"
  echo ""
  echo "this script initialize a new script"
  echo "arguments:"
  echo "  -n <new/script/path>: the path to the new script"
  exit 1
}

init_skel(){
cat >$NEW_SCRIPT_PATH <<EOF
#!/bin/sh

help(){
  cat <<EOF
usage: \`basename \$0\` <args>

<description>

arguments:
  <options>
%EOF
  exit 1
}

while getopts ":hn:" opt; do
  case \$opt in

    h) 
        help
        ;;
    n)
        NAME="\$OPTARG"
        ;;
    \?)
        echo "Invalid option: -\$OPTARG" >&2
        help
        exit 1
        ;;
    :)
        echo "Option -\$OPTARG requires an argument." >&2
        help
        exit 1
        ;;
  esac
done
EOF
sed -i "s/%EOF/EOF/" $NEW_SCRIPT_PATH
chmod 755 $NEW_SCRIPT_PATH
}

while getopts ":hn:" opt; do
  case $opt in
    h) 
        help
        ;;
    n)
        NEW_SCRIPT_PATH="$OPTARG"
        ;;
    \?)
        echo "Invalid option: -$OPTARG" >&2
        help
        exit 1
        ;;
    :)
        echo "Option -$OPTARG requires an argument." >&2
        help
        exit 1
        ;;
  esac
done

if [ -z "$NEW_SCRIPT_PATH" ]
then
  echo "-n option is mandatory"
  help
fi

init_skel
