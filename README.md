# mk-sh-skel #

just a simple script skeleton initializer

## License ##

mk-sh-skel is released under the MIT Public License

## Installation ##

Quick and dirty:
```bash
rm -f /usr/local/bin/mksh-skel
curl https://raw.githubusercontent.com/kakwa/mk-sh-skel/master/mksh-skel \
-o /usr/local/bin/mksh-skel
chmod 755 /usr/local/bin/mksh-skel
#end
```
Cleaner:
```bash
# after recovering the sources
make install # PREFIX=/usr/local/ DESTDIR=./buildroot/
```

## Usage ##

It's quite simple:

```shell
mksh-skel -n <path/to/new/script>
```

## Skeleton output ##

It generates a basic skeleton with help and getopts

```bash
#!/bin/sh

help(){
  cat <<EOF
usage: `basename $0` <args>

<description>

arguments:
  <options>
EOF
  exit 1
}

while getopts ":hn:" opt; do
  case $opt in
    h)  help;;
    n)  NAME="$OPTARG";;
    \?) echo "Invalid option: -$OPTARG" >&2 ;help; exit 1 ;;
    :)  echo "Option -$OPTARG requires an argument." >&2; help; exit 1;;
  esac
done
```

