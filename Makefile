PREFIX = /usr/local

all:
	@echo "nothing to do"

install:
	@mkdir -p ${DESTDIR}${PREFIX}/bin
	install -m 755 mksh-skel ${DESTDIR}${PREFIX}/bin/
