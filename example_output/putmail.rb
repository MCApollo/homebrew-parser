name :
	 Putmail
homepage :
	 https://putmail.sourceforge.io
url :
	 https://downloads.sourceforge.net/project/putmail/putmail.py/1.4/putmail.py-1.4.tar.bz2
description :
	 MTA or SMTP client designed to replace the sendmail command
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 bin.install "putmail.py"
	 man1.install "man/man1/putmail.py.1"
	 bin.install_symlink "putmail.py" => "putmail"
	 man1.install_symlink "putmail.py.1" => "putmail.1"
