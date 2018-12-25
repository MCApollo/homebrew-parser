name :
	 Colordiff
homepage :
	 https://www.colordiff.org/
url :
	 https://www.colordiff.org/colordiff-1.0.18.tar.gz
description :
	 Color-highlighted diff(1) output
build_deps :
link_deps :
optional_deps :
conflicts :
	 cdiff
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/Makefile b/Makefile
	 index 6ccbfc7..e5d64e7 100644
	 --- a/Makefile
	 +++ b/Makefile
	 @@ -28,8 +29,8 @@ install:
	 if [ ! -f ${DESTDIR}${INSTALL_DIR}/cdiff ] ; then \
	 install cdiff.sh ${DESTDIR}${INSTALL_DIR}/cdiff; \
	 fi
	 -	install -Dm 644 colordiff.1 ${DESTDIR}${MAN_DIR}/colordiff.1
	 -	install -Dm 644 cdiff.1 ${DESTDIR}${MAN_DIR}/cdiff.1
	 +	install -m 644 colordiff.1 ${DESTDIR}${MAN_DIR}/colordiff.1
	 +	install -m 644 cdiff.1 ${DESTDIR}${MAN_DIR}/cdiff.1
	 if [ -f ${DESTDIR}${ETC_DIR}/colordiffrc ]; then \
	 mv -f ${DESTDIR}${ETC_DIR}/colordiffrc \
	 ${DESTDIR}${ETC_DIR}/colordiffrc.old; \
	 @@ -37,7 +38,6 @@ install:
	 install -d ${DESTDIR}${ETC_DIR}; \
	 fi
	 cp colordiffrc ${DESTDIR}${ETC_DIR}/colordiffrc
	 -	-chown root.root ${DESTDIR}${ETC_DIR}/colordiffrc
	 chmod 644 ${DESTDIR}${ETC_DIR}/colordiffrc
	 uninstall:
install :
	 man1.mkpath
	 system "make", "INSTALL_DIR=#{bin}",
	 "ETC_DIR=#{etc}",
	 "MAN_DIR=#{man1}",
	 "install"
