name :
	 Vdirsyncer
homepage :
	 https://github.com/pimutils/vdirsyncer
url :
	 https://github.com/pimutils/vdirsyncer.git
description :
	 Synchronize calendars and contacts
build_deps :
link_deps :
	 python
conflicts :
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
	 "--ignore-installed", "requests-oauthlib",
	 buildpath
	 system libexec/"bin/pip", "uninstall", "-y", "vdirsyncer"
	 venv.pip_install_and_link buildpath
	 prefix.install "contrib/vdirsyncer.plist"
	 inreplace prefix/"vdirsyncer.plist" do |s|
	 s.gsub! "@@WORKINGDIRECTORY@@", bin
	 s.gsub! "@@VDIRSYNCER@@", bin/name
	 s.gsub! "@@SYNCINTERVALL@@", "60"
	 inreplace prefix/"vdirsyncer.plist", "@@LOCALE@@", ENV["LC_ALL"] || ENV["LANG"] || "en_US.UTF-8"
