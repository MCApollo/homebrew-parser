name :
	 AppEnginePython
homepage :
	 https://cloud.google.com/appengine/docs
url :
	 https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.70.zip
description :
	 Google App Engine
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
install :
	 pkgshare.install Dir["*"]
	 %w[
	 _python_runtime.py
	 _php_runtime.py
	 api_server.py
	 appcfg.py
	 backends_conversion.py
	 bulkload_client.py
	 bulkloader.py
	 dev_appserver.py
	 download_appstats.py
