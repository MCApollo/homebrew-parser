name :
	 Wmctrl
homepage :
	 https://sites.google.com/site/tstyblo/wmctrl
url :
	 https://sites.google.com/site/tstyblo/wmctrl/wmctrl-1.07.tar.gz
description :
	 UNIX/Linux command-line tool to interact with an EWMH/NetWM
build_deps :
	 pkg-config
link_deps :
	 gettext
	 glib
	 :x11
optional_deps :
conflicts :
resource :
	 []
	 []
patches :
EOF_patch :
	 --- wmctrl-1.07.orig/main.c
	 +++ wmctrl-1.07/main.c
	 @@ -1425,6 +1425,16 @@
	 *
	 * long_length = Specifies the length in 32-bit multiples of the
	 *               data to be retrieved.
	 +     *
	 +     * NOTE:  see
	 +     * https://mail.gnome.org/archives/wm-spec-list/2003-March/msg00067.html
	 +     * In particular:
	 +     *
	 +     * 	When the X window system was ported to 64-bit architectures, a
	 +     * rather peculiar design decision was made. 32-bit quantities such
	 +     * as Window IDs, atoms, etc, were kept as longs in the client side
	 +     * APIs, even when long was changed to 64 bits.
	 +     *
	 */
	 if (XGetWindowProperty(disp, win, xa_prop_name, 0, MAX_PROPERTY_VALUE_LEN / 4, False,
	 xa_prop_type, &xa_ret_type, &ret_format,
	 @@ -1440,7 +1450,18 @@ static gchar *get_property (Display *disp, Window win, /*{{{*/
	 }
	 /* null terminate the result to make string handling easier */
	 -    tmp_size = (ret_format / 8) * ret_nitems;
	 +    switch (ret_format) {
	 +        case 8:
	 +            tmp_size = sizeof(char) * ret_nitems;
	 +            break;
	 +        case 16:
	 +            tmp_size = sizeof(short) * ret_nitems;
	 +            break;
	 +        case 32:
	 +        default:
	 +            tmp_size = sizeof(long) * ret_nitems;
	 +            break;
	 +    }
	 ret = g_malloc(tmp_size + 1);
	 memcpy(ret, ret_prop, tmp_size);
	 ret[tmp_size] = '\0';
install :
	 system "./configure", "--disable-debug", "--disable-dependency-tracking",
	 "--prefix=#{prefix}",
	 "--mandir=#{man}"
	 system "make", "install"
