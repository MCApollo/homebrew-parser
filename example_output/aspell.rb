name :
	 Aspell
homepage :
	 http://aspell.net/
url :
	 https://ftp.gnu.org/gnu/aspell/aspell-0.60.6.1.tar.gz
description :
	 Spell checker with better logic than ispell
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 diff --git a/interfaces/cc/aspell.h b/interfaces/cc/aspell.h
	 index 9c8e81b..2cd00d4 100644
	 --- a/interfaces/cc/aspell.h
	 +++ b/interfaces/cc/aspell.h
	 @@ -237,6 +237,7 @@ void delete_aspell_can_have_error(struct AspellCanHaveError * ths);
	 /******************************** errors ********************************/
	 +#ifndef __cplusplus
	 extern const struct AspellErrorInfo * const aerror_other;
	 extern const struct AspellErrorInfo * const aerror_operation_not_supported;
	 extern const struct AspellErrorInfo * const   aerror_cant_copy;
	 @@ -322,6 +323,7 @@ extern const struct AspellErrorInfo * const   aerror_missing_magic;
	 extern const struct AspellErrorInfo * const   aerror_bad_magic;
	 extern const struct AspellErrorInfo * const aerror_expression;
	 extern const struct AspellErrorInfo * const   aerror_invalid_expression;
	 +#endif
	 /******************************* speller *******************************/
install :
	 system "./configure", "--prefix=#{prefix}"
	 system "make", "install"
	 ENV.prepend_path "PATH", bin
	 languages = []
	 available_languages.each do |lang|
	 languages << lang if build.with? "lang-#{lang}"
	 end
	 languages.concat(available_languages) if build.with? "all-langs"
	 languages.each do |lang|
	 resource(lang).stage do
	 system "./configure", "--vars", "ASPELL=#{bin}/aspell", "PREZIP=#{bin}/prezip"
	 system "make", "install"
	 end
	 end
