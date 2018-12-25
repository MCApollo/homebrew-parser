name :
	 Opendetex
homepage :
	 https://github.com/pkubowicz/opendetex
url :
	 https://github.com/pkubowicz/opendetex/archive/v2.8.4.tar.gz
description :
	 Tool to strip TeX or LaTeX commands from documents
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/detex.1l b/detex.1l
	 index a70c813..7033b44 100644
	 --- a/detex.1l
	 +++ b/detex.1l
	 @@ -1,4 +1,4 @@
	 -.TH DETEX 1L "12 August 1993" "Purdue University"
	 +.TH DETEX 1 "12 August 1993" "Purdue University"
	 .SH NAME
	 detex \- a filter to strip \fITeX\fP commands from a .tex file.
	 .SH SYNOPSIS
	 @@ -103,7 +103,7 @@ The old functionality can be essentially duplicated by using the
	 .B \-s
	 option.
	 .SH SEE ALSO
	 -tex(1L)
	 +tex(1)
	 .SH DIAGNOSTICS
	 Nesting of \\input is allowed but the number of opened files must not
	 exceed the system's limit on the number of simultaneously opened files.
install :
	 system "make"
	 bin.install "detex"
	 bin.install "delatex"
	 man1.install "detex.1l" => "detex.1"
