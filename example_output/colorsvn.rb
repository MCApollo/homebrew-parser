name :
	 Colorsvn
homepage :
	 http://colorsvn.tigris.org/
url :
	 http://colorsvn.tigris.org/files/documents/4414/49311/colorsvn-0.3.3.tar.gz
description :
	 Subversion output colorizer
build_deps :
link_deps :
conflicts :
patches :
EOF_patch :
	 diff --git a/Makefile.in b/Makefile.in
	 index 84a3d97..54c2f74 100644
	 --- a/Makefile.in
	 +++ b/Makefile.in
	 @@ -13,8 +13,6 @@ srcdir=@srcdir@
	 mandir=@mandir@
	 sysconfdir=@sysconfdir@
	 -confdir=/etc
	 -
	 CP=@CP@
	 PERL=@PERL@
	 RM=@RM@ -f
	 @@ -36,10 +34,10 @@ colorsvn:
	 install: colorsvn
	 $(INSTALL) -d $(DESTDIR)$(bindir) && \
	 $(INSTALL) -m 755 $(PACKAGE) $(DESTDIR)$(bindir)/$(PACKAGE) && \
	 -	$(INSTALL) -d $(DESTDIR)/$(confdir) && \
	 -	$(INSTALL) -m 644 $(CONFIGFILE) $(DESTDIR)/$(confdir)/$(CONFIGFILE) && \
	 -	$(INSTALL) -d $(DESTDIR)/$(confdir)/profile.d && \
	 -	$(INSTALL) -m 755 $(PROFFILE) $(DESTDIR)/$(confdir)/profile.d/$(PROFFILE) && \
	 +	$(INSTALL) -d $(DESTDIR)/$(sysconfdir) && \
	 +	$(INSTALL) -m 644 $(CONFIGFILE) $(DESTDIR)/$(sysconfdir)/$(CONFIGFILE) && \
	 +	$(INSTALL) -d $(DESTDIR)/$(sysconfdir)/profile.d && \
	 +	$(INSTALL) -m 755 $(PROFFILE) $(DESTDIR)/$(sysconfdir)/profile.d/$(PROFFILE) && \
	 if [ -f $(srcdir)/colorsvn.1 ] ; then \
	 $(INSTALL) -d $(DESTDIR)$(mandir)/man1/ ; \
	 $(INSTALL) -m 644 $(srcdir)/colorsvn.1 $(DESTDIR)$(mandir)/man1/ ; \
	 @@ -54,6 +52,6 @@ clean:
	 uninstall:
	 $(RM) $(DESTDIR)$(bindir)/$(PACKAGE) && \
	 -	$(RM) $(DESTDIR)/$(confdir)/$(CONFIGFILE)  && \
	 -	$(RM) $(DESTDIR)/$(confdir)/profile.d/$(PROFFILE)
	 +	$(RM) $(DESTDIR)/$(sysconfdir)/$(CONFIGFILE)  && \
	 +	$(RM) $(DESTDIR)/$(sysconfdir)/profile.d/$(PROFFILE)
install :
	 svn_binary = which_all("svn").reject do |bin|
	 bin.to_s.start_with?("#{HOMEBREW_REPOSITORY}/Library/ENV/")
