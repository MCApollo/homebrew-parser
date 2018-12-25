name :
	 Libtensorflow
homepage :
	 https://www.tensorflow.org/
url :
	 https://github.com/tensorflow/tensorflow/archive/v1.12.0.tar.gz
description :
	 C interface for Google's OS library for Machine Intelligence
build_deps :
	 bazel
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
	 cmd = Language::Java.java_home_cmd("1.8")
	 ENV["JAVA_HOME"] = Utils.popen_read(cmd).chomp
	 ENV["PYTHON_BIN_PATH"] = which("python").to_s
	 ENV["CC_OPT_FLAGS"] = "-march=native"
	 ENV["TF_NEED_JEMALLOC"] = "1"
	 ENV["TF_NEED_GCP"] = "0"
	 ENV["TF_NEED_HDFS"] = "0"
	 ENV["TF_ENABLE_XLA"] = "0"
	 ENV["USE_DEFAULT_PYTHON_LIB_PATH"] = "1"
	 ENV["TF_NEED_OPENCL"] = "0"
	 ENV["TF_NEED_CUDA"] = "0"
	 ENV["TF_NEED_MKL"] = "0"
	 ENV["TF_NEED_VERBS"] = "0"
	 ENV["TF_NEED_MPI"] = "0"
	 ENV["TF_NEED_S3"] = "1"
	 ENV["TF_NEED_GDR"] = "0"
	 ENV["TF_NEED_KAFKA"] = "0"
	 ENV["TF_NEED_OPENCL_SYCL"] = "0"
	 ENV["TF_DOWNLOAD_CLANG"] = "0"
	 ENV["TF_SET_ANDROID_WORKSPACE"] = "0"
	 system "./configure"
	 system "bazel", "build", "--compilation_mode=opt", "--copt=-march=native", "tensorflow:libtensorflow.so"
	 lib.install Dir["bazel-bin/tensorflow/*.so"]
	 (include/"tensorflow/c").install "tensorflow/c/c_api.h"
	 (lib/"pkgconfig/tensorflow.pc").write <<~EOS
	 Name: tensorflow
	 Description: Tensorflow library
	 Version: #{version}
	 Libs: -L#{lib} -ltensorflow
	 Cflags: -I#{include}
	 EOS
