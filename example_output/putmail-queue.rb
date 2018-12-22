name :
	 PutmailQueue
homepage :
	 https://putmail.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/putmail/putmail-queue/0.2/putmail-queue-0.2.tar.bz2
description :
	 Putmail queue package
build_deps :
link_deps :
	 putmail
conflicts :
patches :
EOF_patch :
install :
	 bin.install "putmail_dequeue.py", "putmail_enqueue.py"
	 man1.install Dir["man/man1/*.1"]
