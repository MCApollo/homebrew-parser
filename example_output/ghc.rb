name :
	 Ghc
homepage :
	 https://haskell.org/ghc/
url :
	 https://downloads.haskell.org/~ghc/8.4.4/ghc-8.4.4-src.tar.xz
description :
	 Glorious Glasgow Haskell Compilation System
build_deps :
	 sphinx-doc
link_deps :
	 python
	 :macos
conflicts :
patches :
EOF_patch :
	 diff --git a/docs/users_guide/flags.py b/docs/users_guide/flags.py
	 index cc30b8c066..21c7ae3a16 100644
	 --- a/docs/users_guide/flags.py
	 +++ b/docs/users_guide/flags.py
	 @@ -46,9 +46,11 @@
	 from docutils import nodes
	 from docutils.parsers.rst import Directive, directives
	 +import sphinx
	 from sphinx import addnodes
	 from sphinx.domains.std import GenericObject
	 from sphinx.errors import SphinxError
	 +from distutils.version import LooseVersion
	 from utils import build_table_from_list
	 @@ -597,14 +599,18 @@ def purge_flags(app, env, docname):
	 +
	 +    sphinx_version = LooseVersion(sphinx.__version__)
	 +    override_arg = {'override': True} if sphinx_version >= LooseVersion('1.8') else {}
	 app.add_object_type('ghc-flag', 'ghc-flag')
	 -    app.add_directive_to_domain('std', 'ghc-flag', Flag)
	 +    app.add_directive_to_domain('std', 'ghc-flag', Flag, **override_arg)
	 app.add_object_type('extension', 'extension')
	 -    app.add_directive_to_domain('std', 'extension', LanguageExtension)
	 +    app.add_directive_to_domain('std', 'extension', LanguageExtension,
	 +                                **override_arg)
install :
	 ENV["CC"] = ENV.cc
	 ENV["LD"] = "ld"
	 ENV["HOMEBREW_OPTFLAGS"] = "-march=#{Hardware.oldest_cpu}" unless build.bottle?
	 gmp = libexec/"integer-gmp"
	 ENV["MPN_PATH"] = "x86_64/fastsse x86_64/core2 x86_64 generic" if build.bottle?
	 resource("gmp").stage do
	 system "./configure", "--prefix=#{gmp}", "--with-pic", "--disable-shared"
	 system "make"
	 system "make", "check"
	 ENV.deparallelize { system "make", "install" }
	 end
	 args = ["--with-gmp-includes=#{gmp}/include",
	 "--with-gmp-libraries=#{gmp}/lib"]
	 if DevelopmentTools.clang_build_version >= 703 && DevelopmentTools.clang_build_version < 800
	 args << "--with-nm=#{`xcrun --find nm-classic`.chomp}"
	 system "#{bin}/ghc-pkg", "recache"
