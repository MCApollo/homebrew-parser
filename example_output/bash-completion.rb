name :
	 BashCompletion
homepage :
	 https://salsa.debian.org/debian/bash-completion
url :
	 https://src.fedoraproject.org/repo/pkgs/bash-completion/bash-completion-1.3.tar.bz2/a1262659b4bbf44dc9e59d034de505ec/bash-completion-1.3.tar.bz2
description :
	 Programmable completion for Bash 3.2
build_deps :
link_deps :
conflicts :
	 bash-completion@2
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/c1d87451da3b5b147bed95b2dc783a1b02520ac5/bash-completion/bug-740971.patch
EOF_patch :
	 --- a/completions/man
	 +++ b/completions/man
	 @@ -27,7 +27,7 @@
	 fi
	 uname=$( uname -s )
	 -    if [[ $uname == @(Linux|GNU|GNU/*|FreeBSD|Cygwin|CYGWIN_*) ]]; then
	 +    if [[ $uname == @(Darwin|Linux|GNU|GNU/*|FreeBSD|Cygwin|CYGWIN_*) ]]; then
	 manpath=$( manpath 2>/dev/null || command man --path )
	 else
	 manpath=$MANPATH
install :
	 inreplace "bash_completion" do |s|
	 s.gsub! "/etc/bash_completion", etc/"bash_completion"
	 s.gsub! "readlink -f", "readlink"
