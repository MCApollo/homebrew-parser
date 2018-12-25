name :
	 LaunchctlCompletion
homepage :
	 https://github.com/CamJN/launchctl-completion
url :
	 https://github.com/CamJN/launchctl-completion/archive/v1.0.tar.gz
description :
	 Bash completion for Launchctl
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
	 bash_completion.install "launchctl-completion.sh" => "launchctl"
