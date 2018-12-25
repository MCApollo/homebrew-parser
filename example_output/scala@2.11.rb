name :
	 ScalaAT211
homepage :
	 https://www.scala-lang.org/
url :
	 https://downloads.lightbend.com/scala/2.11.12/scala-2.11.12.tgz
description :
	 JVM-based programming language
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
	 rm_f Dir["bin/*.bat"]
	 doc.install Dir["doc/*"]
	 share.install "man"
	 libexec.install "bin", "lib"
	 bin.install Dir[libexec/"bin/*"]
	 bin.env_script_all_files(libexec/"bin", Language::Java.java_home_env("1.8"))
	 idea = prefix/"idea"
	 idea.install_symlink libexec/"src", libexec/"lib"
	 idea.install_symlink doc => "doc"
	 end
	 test do
	 file = testpath/"Test.scala"
	 file.write <<~EOS
	 object Test {
	 def main(args: Array[String]) {
	 println(s"${2 + 2}")
	 }
	 }
	 EOS
	 out = shell_output("#{bin}/scala #{file}").strip
	 system bin/"fsc", "-shutdown"
	 assert_equal "4", out
	 end
