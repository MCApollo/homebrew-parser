name :
	 Markdown
homepage :
	 https://daringfireball.net/projects/markdown/
url :
	 https://daringfireball.net/projects/downloads/Markdown_1.0.1.zip
description :
	 Text-to-HTML conversion tool
build_deps :
link_deps :
conflicts :
	 discount
	 multimarkdown
patches :
EOF_patch :
install :
	 bin.install "Markdown.pl" => "markdown"
