name :
	 Zbackup
homepage :
	 http://zbackup.org
url :
	 https://github.com/zbackup/zbackup/archive/1.4.4.tar.gz
description :
	 Globally-deduplicating backup tool (based on ideas in rsync)
build_deps :
	 cmake
link_deps :
	 lzo
	 openssl
	 protobuf
	 xz
conflicts :
patches :
	 https://github.com/zbackup/zbackup/commit/7e6adda6b1df9c7b955fc06be28fe6ed7d8125a2.diff?full_index=1
	 https://github.com/zbackup/zbackup/commit/f4ff7bd8ec63b924a49acbf3a4f9cf194148ce18.diff?full_index=1
EOF_patch :
install :
	 ENV.cxx11
	 inreplace [
	 "backup_creator.cc",
	 "check.hh",
	 "chunk_id.cc",
	 "chunk_storage.cc",
	 "compression.cc",
	 "encrypted_file.cc",
	 "encryption.cc",
	 "encryption_key.cc",
	 "mt.cc",
	 "tests/bundle/test_bundle.cc",
	 "tests/encrypted_file/test_encrypted_file.cc",
	 "unbuffered_file.cc",
	 ],
	 /\bCHECK\b/, "ZBCHECK"
	 system "cmake", ".", *std_cmake_args
	 system "make", "install"
