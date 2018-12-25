name :
	 Gwt
homepage :
	 http://www.gwtproject.org/
url :
	 https://storage.googleapis.com/gwt-releases/gwt-2.8.2.zip
description :
	 Google web toolkit
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
	 rm Dir["*.cmd"]
	 libexec.install Dir["*"]
	 (bin/"webAppCreator").write <<~EOS
	 #!/bin/sh
	 HOMEDIR=#{libexec}
	 java -cp "$HOMEDIR/gwt-user.jar:$HOMEDIR/gwt-dev.jar" com.google.gwt.user.tools.WebAppCreator "$@";
	 EOS
	 (bin/"benchmarkViewer").write <<~EOS
	 #!/bin/sh
	 APPDIR=#{libexec}
	 java -Dcom.google.gwt.junit.reportPath="$1" -cp "$APPDIR/gwt-dev.jar" com.google.gwt.dev.RunWebApp -port auto $APPDIR/gwt-benchmark-viewer.war;
	 EOS
	 (bin/"i18nCreator").write <<~EOS
	 #!/bin/sh
	 HOMEDIR=#{libexec}
	 java -cp "$HOMEDIR/gwt-user.jar:$HOMEDIR/gwt-dev.jar" com.google.gwt.i18n.tools.I18NCreator "$@";
	 EOS
