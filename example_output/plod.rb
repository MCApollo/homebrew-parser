name :
	 Plod
homepage :
	 http://www.deer-run.com/~hal/
url :
	 http://www.deer-run.com/~hal/plod/plod.shar
description :
	 Keep an online journal of what you're working on
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
	 system "sh", "plod.shar"
	 pager = ENV["PAGER"] || "/usr/bin/less"
	 editor = ENV["EDITOR"] || "/usr/bin/emacs"
	 visual = ENV["VISUAL"] || editor
	 inreplace "plod" do |s|
	 s.gsub! "#!/usr/local/bin/perl", "#!/usr/bin/env perl"
	 s.gsub! '"/bin/crypt"', "undef"
	 s.gsub! "/usr/local/bin/less", pager
	 s.gsub! '$EDITOR = "/usr/local/bin/emacs"', "$EDITOR = \"#{editor}\""
	 s.gsub! '$VISUAL = "/usr/local/bin/emacs"', "$VISUAL = \"#{visual}\""
	 end
	 man1.install "plod.man" => "plod.1"
	 bin.install "plod"
	 prefix.install "plod.el.v1", "plod.el.v2"
	 (prefix/"plodrc").write <<~EOS
	 #
	 EOS
