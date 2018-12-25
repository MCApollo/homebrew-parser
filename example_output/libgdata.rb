name :
	 Libgdata
homepage :
	 https://wiki.gnome.org/Projects/libgdata
url :
	 https://download.gnome.org/sources/libgdata/0.16/libgdata-0.16.1.tar.xz
description :
	 GLib-based library for accessing online service APIs
build_deps :
	 gobject-introspection
	 intltool
	 pkg-config
link_deps :
	 json-glib
	 liboauth
	 libsoup
optional_deps :
	 vala
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/gdata/gdata.symbols b/gdata/gdata.symbols
	 index bba24ec..c80a642 100644
	 --- a/gdata/gdata.symbols
	 +++ b/gdata/gdata.symbols
	 @@ -966,9 +966,6 @@ gdata_documents_entry_get_quota_used
	 gdata_documents_service_copy_document
	 gdata_documents_service_copy_document_async
	 gdata_documents_service_copy_document_finish
	 -gdata_goa_authorizer_get_type
	 -gdata_goa_authorizer_new
	 -gdata_goa_authorizer_get_goa_object
	 gdata_documents_document_get_thumbnail_uri
	 gdata_tasks_task_get_type
	 gdata_tasks_task_new
	 @@ -1089,8 +1086,6 @@ gdata_freebase_topic_value_is_image
	 gdata_freebase_topic_result_get_type
	 gdata_freebase_topic_result_new
	 gdata_freebase_topic_result_dup_object
	 -gdata_freebase_result_error_get_type
	 -gdata_freebase_result_error_quark
	 gdata_freebase_result_get_type
	 gdata_freebase_result_new
	 gdata_freebase_result_dup_variant
install :
	 system "./configure", "--disable-dependency-tracking",
	 "--disable-silent-rules",
	 "--prefix=#{prefix}",
	 "--disable-gnome",
	 "--disable-tests"
	 system "make", "install"
