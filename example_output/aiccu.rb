name :
	 Aiccu
homepage :
	 https://www.sixxs.net/tools/aiccu/
url :
	 https://deb.debian.org/debian/pool/main/a/aiccu/aiccu_20070115.orig.tar.gz
description :
	 Automatic IPv6 Connectivity Client Utility
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 diff --git a/Makefile b/Makefile
	 index 0e96136..78609bd 100644
	 --- a/Makefile
	 +++ b/Makefile
	 @@ -36,10 +36,11 @@ export DESTDIR
	 CFLAGS=${RPM_OPT_FLAGS}
	 -dirsbin=/usr/sbin/
	 -dirbin=/usr/bin/
	 -diretc=/etc/
	 -dirdoc=/usr/share/doc/${PROJECT}/
	 +prefix=
	 +dirsbin=${prefix}/sbin/
	 +dirbin=${prefix}/bin/
	 +diretc=${prefix}/etc/
	 +dirdoc=${prefix}/share/doc/${PROJECT}/
	 export PROJECT
	 @@ -79,21 +80,13 @@ install: aiccu
	 @echo "Configuration..."
	 @mkdir -p ${DESTDIR}${diretc}
	 ifeq ($(shell echo "A${RPM_BUILD_ROOT}"),A)
	 -	$(shell [ -f ${DESTDIR}${diretc}${PROJECT}.conf ] || cp -R doc/${PROJECT}.conf ${DESTDIR}${diretc}${PROJECT}.conf)
	 @echo "Documentation..."
	 +	@cp doc/${PROJECT}.conf ${DESTDIR}${dirdoc}
	 @cp doc/README ${DESTDIR}${dirdoc}
	 @cp doc/LICENSE ${DESTDIR}${dirdoc}
	 @cp doc/HOWTO  ${DESTDIR}${dirdoc}
	 -	@echo "Installing Debian-style init.d"
	 -	@mkdir -p ${DESTDIR}${diretc}init.d
	 -	@cp doc/${PROJECT}.init.debian ${DESTDIR}${diretc}init.d/${PROJECT}
	 -else
	 -	@echo "Installing Redhat-style init.d"
	 -	@mkdir -p ${DESTDIR}${diretc}init.d
	 -	@cp doc/${PROJECT}.init.rpm ${DESTDIR}${diretc}init.d/${PROJECT}
	 -	@cp doc/${PROJECT}.conf ${DESTDIR}${diretc}${PROJECT}.conf
	 -	@echo "Installation into ${DESTDIR}/ completed"
	 +	@echo "Installation into ${DESTDIR}${prefix}/ completed"
	 help:
	 @echo "$(PROJECT) - $(PROJECT_DESC)"
	 diff --git a/common/aiccu.h b/common/aiccu.h
	 index ef65000..5b2eb43 100755
	 --- a/common/aiccu.h
	 +++ b/common/aiccu.h
	 @@ -65,17 +65,17 @@
	 * the data. Could be useful in the event
	 * where we can't make contact to the main server
	 */
	 -#define AICCU_CACHE	"/var/cache/aiccu.cache"
	 +#define AICCU_CACHE	"HOMEBREW_PREFIX/var/cache/aiccu.cache"
	 /* The PID we are running as when daemonized */
	 -#define AICCU_PID	"/var/run/aiccu.pid"
	 +#define AICCU_PID	"HOMEBREW_PREFIX/var/run/aiccu.pid"
	 /* AICCU Configuration file */
	 #ifdef _WIN32
	 /* GetWindowsDirectory() is used to figure out the directory to store the config */
	 #define AICCU_CONFIG	"aiccu.conf"
	 #else
	 -#define AICCU_CONFIG	"/etc/aiccu.conf"
	 +#define AICCU_CONFIG	"HOMEBREW_PREFIX/etc/aiccu.conf"
	 #endif
	 /* Inbound listen queue */
install :
	 inreplace "doc/aiccu.conf", "daemonize true", "daemonize false"
	 system "make", "prefix=#{prefix}"
	 system "make", "install", "prefix=#{prefix}"
	 etc.install "doc/aiccu.conf"
