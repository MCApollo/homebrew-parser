name :
	 Cdargs
homepage :
	 https://www.skamphausen.de/cgi-bin/ska/CDargs
url :
	 https://www.skamphausen.de/downloads/cdargs/cdargs-1.35.tar.gz
description :
	 Bookmarks for the shell
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 diff --git a/contrib/cdargs-bash.sh b/contrib/cdargs-bash.sh
	 index 8a197ef..f3da067 100644
	 --- a/contrib/cdargs-bash.sh
	 +++ b/contrib/cdargs-bash.sh
	 @@ -11,6 +11,12 @@
	 CDARGS_SORT=0
	 CDARGS_NODUPS=1
	 +
	 +if [ -n "$ZSH_VERSION" ]; then
	 +	autoload bashcompinit
	 +	bashcompinit
	 +fi
	 +
	 @@ -166,7 +172,7 @@ function mark ()
	 local tmpfile
	 -    if [[ "$CDARGS_NODUPS" && -e "$HOME/.cdargs" ]]; then
	 +    if [ "$CDARGS_NODUPS" ] && [ -e "$HOME/.cdargs" ]; then
	 tmpfile=`echo ${TEMP:-${TMPDIR:-/tmp}} | sed -e "s/\\/$//"`
	 tmpfile=$tmpfile/cdargs.$USER.$$.$RANDOM
	 grep -v "^$1 " "$HOME/.cdargs" > $tmpfile && 'mv' -f $tmpfile "$HOME/.cdargs";
install :
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make"
	 system "make", "install-strip"
	 rm Dir["contrib/Makefile*"]
	 prefix.install "contrib"
	 bash_completion.install_symlink "#{prefix}/contrib/cdargs-bash.sh"
