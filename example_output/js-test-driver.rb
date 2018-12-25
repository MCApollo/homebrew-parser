name :
	 JsTestDriver
homepage :
	 https://code.google.com/archive/p/js-test-driver/
url :
	 https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/js-test-driver/JsTestDriver-1.3.5.jar
description :
	 JavaScript test runner
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
	 libexec.install "JsTestDriver-#{version}.jar"
	 bin.write_jar_script libexec/"JsTestDriver-#{version}.jar", "js-test-driver"
