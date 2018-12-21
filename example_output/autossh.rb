name :
	 Autossh
homepage :
	 http://www.harding.motd.ca/autossh/
url :
	 http://www.harding.motd.ca/autossh/autossh-1.4f.tgz
description :
	 Automatically restart SSH sessions and tunnels
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 diff --git a/rscreen b/rscreen
	 index f0bbced..ce232c3 100755
	 --- a/rscreen
	 +++ b/rscreen
	 @@ -23,4 +23,4 @@ fi
	 #AUTOSSH_PATH=/usr/local/bin/ssh
	 export AUTOSSH_POLL AUTOSSH_LOGFILE AUTOSSH_DEBUG AUTOSSH_PATH AUTOSSH_GATETIME AUTOSSH_PORT
	 -autossh -M 20004 -t $1 "screen -e^Zz -D -R"
	 +autossh -M 20004 -t $1 "screen -D -R"
install :
	 system "./configure", "--prefix=#{prefix}", "--mandir=#{man}"
	 system "make", "install"
	 bin.install "rscreen"
