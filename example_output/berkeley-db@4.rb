name :
	 BerkeleyDbAT4
homepage :
	 https://www.oracle.com/technology/products/berkeley-db/index.html
url :
	 https://download.oracle.com/berkeley-db/db-4.8.30.tar.gz
description :
	 High performance key/value database
build_deps :
link_deps :
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
	 https://raw.githubusercontent.com/Homebrew/formula-patches/4c55b1/berkeley-db%404/clang.diff
EOF_patch :
install :
	 ENV.deparallelize
	 args = %W[
	 --disable-debug
	 --prefix=#{prefix}
	 --mandir=#{man}
	 --enable-cxx
	 ]
	 cd "build_unix" do
	 system "../dist/configure", *args
	 system "make", "install"
	 doc.parent.mkpath
	 mv prefix+"docs", doc
	 end
	 end
	 test do
	 (testpath/"test.cpp").write <<~EOS
	 #include <assert.h>
	 #include <string.h>
	 #include <db_cxx.h>
	 int main() {
	 Db db(NULL, 0);
	 assert(db.open(NULL, "test.db", NULL, DB_BTREE, DB_CREATE, 0) == 0);
	 const char *project = "Homebrew";
	 const char *stored_description = "The missing package manager for macOS";
	 Dbt key(const_cast<char *>(project), strlen(project) + 1);
	 Dbt stored_data(const_cast<char *>(stored_description), strlen(stored_description) + 1);
	 assert(db.put(NULL, &key, &stored_data, DB_NOOVERWRITE) == 0);
	 Dbt returned_data;
	 assert(db.get(NULL, &key, &returned_data, 0) == 0);
	 assert(strcmp(stored_description, (const char *)(returned_data.get_data())) == 0);
	 assert(db.close(0) == 0);
	 }
	 EOS
	 flags = %W[
	 -I#{include}
	 -L#{lib}
	 -ldb_cxx
	 ]
	 system ENV.cxx, "test.cpp", "-o", "test", *flags
	 system "./test"
	 assert_predicate testpath/"test.db", :exist?
	 end
