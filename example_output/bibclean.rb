name :
	 Bibclean
homepage :
	 https://www.math.utah.edu/~beebe/software/bibclean/bibclean-03.html#HDR.3
url :
	 http://ftp.math.utah.edu/pub/bibclean/bibclean-2.17.tar.gz
description :
	 BibTeX bibliography file pretty printer and syntax checker
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 ENV.deparallelize
	 system "./configure", "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 inreplace "Makefile" do |s|
	 s.gsub! /[$][(]CP.*BIBCLEAN.*bindir.*BIBCLEAN[)]/,
	 "mkdir -p $(bindir) && $(CP) $(BIBCLEAN) $(bindir)/$(BIBCLEAN)"
	 s.gsub! /[$][(]CP.*bibclean.*mandir.*bibclean.*manext[)]/,
	 "mkdir -p $(mandir) && $(CP) bibclean.man $(mandir)/bibclean.$(manext)"
	 s.gsub! /mandir.*prefix.*man.*man1/, "mandir = $(prefix)/share/man/man1"
	 s.gsub! /install-ini.*uninstall-ini/,
	 "install-ini:  uninstall-ini\n\tmkdir -p #{pkgshare}"
	 s.gsub! /[$][(]bindir[)].*bibcleanrc/,
	 "#{pkgshare}/.bibcleanrc"
	 s.gsub! /[$][(]bindir[)].*bibclean.key/,
	 "#{pkgshare}/.bibclean.key"
	 s.gsub! /[$][(]bindir[)].*bibclean.isbn/,
	 "#{pkgshare}/.bibclean.isbn"
	 end
	 system "make", "all"
	 system "make", "check"
	 system "make", "install"
	 ENV.prepend_path "PATH", pkgshare
	 bin.env_script_all_files(pkgshare, :PATH => ENV["PATH"])
