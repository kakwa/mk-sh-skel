# mk-sh-skel #
==========

just a simple script skeleton initializer

## License ##

mk-sh-skel is released under the MIT Public License

## Installation ##

As root:
```shell
curl https://raw.github.com/kakwa/mk-sh-skel/master/mk-sh-skel.sh -o /usr/local/bin/mk-sh-skel.sh
chmod 755 /usr/local/bin/mk-sh-skel.sh
```

## Usage ##

It's quite simple:

```shell
mk-sh-skel.sh -n <path/to/new/script>
```

## Skeleton output ##

It generates a basic skeleton with help and getopts

```shell
#!/bin/sh

help(){
  echo "usage: `basename $0` <args>"
  echo ""
  echo "<description>"
  echo "arguments:"
  echo "  <options>"
  exit 1
}

while getopts ":hn:" opt; do
  case ? in

    h) help
        ;;
#    n)
#        NAME="$OPTARG"
#        ;;
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
```
