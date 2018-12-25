name :
	 Fastqc
homepage :
	 https://www.bioinformatics.babraham.ac.uk/projects/fastqc/
url :
	 https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.7.zip
description :
	 Quality control tool for high throughput sequence data
build_deps :
link_deps :
	 :java
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 libexec.install Dir["*"]
	 chmod 0755, libexec/"fastqc"
	 bin.install_symlink libexec/"fastqc"
