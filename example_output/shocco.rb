name :
	 Shocco
homepage :
	 https://rtomayko.github.io/shocco/
url :
	 https://github.com/rtomayko/shocco/archive/1.0.tar.gz
description :
	 Literate documentation tool for shell scripts (a la Docco)
build_deps :
link_deps :
	 markdown
	 python
conflicts :
patches :
EOF_patch :
	 diff --git a/configure b/configure
	 index 2262477..bf0af62 100755
	 --- a/configure
	 +++ b/configure
	 @@ -193,7 +193,7 @@ else stdutil xdg-open   XDG_OPEN   xdg-open
	 fi
	 stdutil ronn       RONN       ronn
	 -stdutil markdown   MARKDOWN   markdown Markdown.pl
	 +stdutil markdown   MARKDOWN   markdown Markdown.pl $MARKDOWN
	 stdutil perl       PERL       perl
	 stdutil pygmentize PYGMENTIZE pygmentize $PYGMENTIZE
install :
	 libexec.install resource("pygments").files("pygmentize", "pygments")
	 system "./configure",
	 "PYGMENTIZE=#{libexec}/pygmentize",
	 "MARKDOWN=#{HOMEBREW_PREFIX}/bin/markdown",
	 "--prefix=#{prefix}"
	 system "make"
	 system "make", "install"
