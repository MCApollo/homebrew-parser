name :
	 DependencyCheck
homepage :
	 https://www.owasp.org/index.php/OWASP_Dependency_Check
url :
	 https://dl.bintray.com/jeremy-long/owasp/dependency-check-4.0.1-release.zip
description :
	 OWASP dependency-check
build_deps :
link_deps :
	 :java
conflicts :
patches :
EOF_patch :
install :
	 rm_f Dir["bin/*.bat"]
	 chmod 0755, "bin/dependency-check.sh"
	 libexec.install Dir["*"]
	 mv libexec/"bin/dependency-check.sh", libexec/"bin/dependency-check"
	 bin.install_symlink libexec/"bin/dependency-check"
	 (var/"dependencycheck").mkpath
	 libexec.install_symlink var/"dependencycheck" => "data"
	 (etc/"dependencycheck").mkpath
	 jar = "dependency-check-core-#{version}.jar"
	 corejar = libexec/"repo/org/owasp/dependency-check-core/#{version}/#{jar}"
	 system "unzip", "-o", corejar, "dependencycheck.properties", "-d", libexec/"etc"
	 (etc/"dependencycheck").install_symlink libexec/"etc/dependencycheck.properties"
