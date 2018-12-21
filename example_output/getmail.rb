name :
	 Getmail
homepage :
	 http://pyropus.ca/software/getmail/
url :
	 http://pyropus.ca/software/getmail/old-versions/getmail-5.6.tar.gz
description :
	 Extensible mail retrieval system with POP3, IMAP4, SSL support
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 libexec.install %w[getmail getmail_fetch getmail_maildir getmail_mbox]
	 inreplace Dir[libexec/"*"], %r{^#!/usr/bin/env python$}, "#!/usr/bin/python"
	 bin.install_symlink Dir["#{libexec}/*"]
	 libexec.install "getmailcore"
	 man1.install Dir["docs/*.1"]
