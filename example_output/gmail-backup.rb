name :
	 GmailBackup
homepage :
	 https://code.google.com/archive/p/gmail-backup-com/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/gmail-backup-com/gmail-backup-20110307.tar.gz
description :
	 Backup and restore the content of your Gmail account
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
	 bin.install "gmail-backup.py" => "gmail-backup"
	 libexec.install Dir["*"]
	 ENV.prepend_path "PYTHONPATH", libexec
	 bin.env_script_all_files(libexec, :PYTHONPATH => ENV["PYTHONPATH"])
