prefix = /data/data/com.termux/files/usr
sysconfdir = /data/data/com.termux/files/usr/etc
localstatedir = /data/data/com.termux/files/usr/var

all:
	sed "s|@prefix@|$(prefix)|g" shpm.in>shpm
	sed -i "s|@sysconfdir@|$(sysconfdir)|g" shpm
	sed -i "s|@localstatedir@|$(localstatedir)|g" shpm
	chmod 755 shpm

install:
	install -m755 shpm $(DESTDIR)$(prefix)/bin/shpm
	install -m644 shpm.conf $(DESTDIR)$(sysconfdir)/shpm.conf

clean:
	rm shpm

distclean: clean
	rm Makefile

uninstall:
	rm -f $(DESTDIR)$(prefix)/bin/shpm $(DESTDIR)$(sysconfdir)/shpm.conf
	rm -rf $(DESTDIR)$(localstatedir)/lib/shpm  $(DESTDIR)$(localstatedir)/cache/shpm/packages

.PHONY: all install clean distclean uninstall
