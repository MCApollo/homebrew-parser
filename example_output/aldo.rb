name :
	 Aldo
homepage :
	 https://www.nongnu.org/aldo/
url :
	 https://savannah.nongnu.org/download/aldo/aldo-0.7.7.tar.bz2
description :
	 Morse code learning tool released under GPL
build_deps :
link_deps :
	 libao
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 diff --git a/src/menu.cc b/src/menu.cc
	 index 483b826..092d604 100644
	 --- a/src/menu.cc
	 +++ b/src/menu.cc
	 @@ -112,20 +112,17 @@ void Menu::add_item(id_type id, std::string c, Function2 f)
	 void Menu::add_item_at(unsigned int pos, id_type id, std::string c, Function1 f)
	 {
	 -    IT it(&m_its[pos]);
	 -    m_its.insert(it, Item(id,c,f) );
	 +    m_its.insert(m_its.begin()+pos, Item(id,c,f) );
	 }
	 void Menu::add_item_at(unsigned int pos, id_type id, std::string c, Function2 f)
	 {
	 -    IT it(&m_its[pos]);
	 -    m_its.insert(it, Item(id,c,f) );
	 +    m_its.insert(m_its.begin()+pos, Item(id,c,f) );
	 }
	 void Menu::delete_item_at(unsigned int pos)
	 {
	 -    IT it(&m_its[pos]);
	 -    m_its.erase(it);
	 +    m_its.erase(m_its.begin()+pos);
	 }
install :
	 system "./configure", "--disable-dependency-tracking", "--prefix=#{prefix}"
	 system "make", "install"
