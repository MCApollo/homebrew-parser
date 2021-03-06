name :
	 GitCredentialManager
homepage :
	 https://docs.microsoft.com/vsts/git/set-up-credential-managers
url :
	 https://github.com/Microsoft/Git-Credential-Manager-for-Mac-and-Linux/releases/download/git-credential-manager-2.0.4/git-credential-manager-2.0.4.jar
description :
	 Stores Git credentials for Visual Studio Team Services
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
	 libexec.install "git-credential-manager-#{version}.jar"
	 bin.write_jar_script libexec/"git-credential-manager-#{version}.jar", "git-credential-manager"
