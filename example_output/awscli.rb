name :
	 Awscli
homepage :
	 https://aws.amazon.com/cli/
url :
	 https://github.com/aws/aws-cli/archive/1.16.70.tar.gz
description :
	 Official Amazon AWS command-line interface
build_deps :
link_deps :
	 python
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
install :
	 venv = virtualenv_create(libexec, "python3")
	 system libexec/"bin/pip", "install", "-v", "--no-binary", ":all:",
	 "--ignore-installed", buildpath
	 system libexec/"bin/pip", "uninstall", "-y", "awscli"
	 venv.pip_install_and_link buildpath
	 pkgshare.install "awscli/examples"
	 rm Dir["#{bin}/{aws.cmd,aws_bash_completer,aws_zsh_completer.sh}"]
	 bash_completion.install "bin/aws_bash_completer"
	 zsh_completion.install "bin/aws_zsh_completer.sh"
	 (zsh_completion/"_aws").write <<~EOS
	 #compdef aws
	 _aws () {
	 local e
	 e=$(dirname ${funcsourcetrace[1]%:*})/aws_zsh_completer.sh
	 if [[ -f $e ]]; then source $e; fi
	 }
	 EOS
	 end
	 def caveats; <<~EOS
	 The "examples" directory has been installed to:
	 #{HOMEBREW_PREFIX}/share/awscli/examples
	 EOS
