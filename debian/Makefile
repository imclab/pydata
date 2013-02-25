SNAKES_HOME=/opt/snakes
BUILD_PATH=$(PATH):$(SNAKES_HOME)/bin

lxml: $(SNAKES_HOME)/lib/libxslt.so $(SNAKES_HOME)/lib/python2.7/site-packages/libxml2mod.so /opt/snakes/bin/python
	cd lxml-3.0.2 ; PATH=$(BUILD_PATH) $(SNAKES_HOME)/bin/python setup.py build --with-cython 

atlas:
	mkdir -p libatlas-3.8.4
	cd libatlas-3.8.4 ; PATH=$(BUILD_PATH) CFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses -I$(SNAKES_HOME)/include/libxml2/libxml" CPPFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses -I$(SNAKES_HOME)/include/libxml2/libxml" LDFLAGS="-L$(SNAKES_HOME)/lib" ../atlas-3.8.4/configure --prefix=$(SNAKES_HOME) -Si cputhrchk 0
	cd libatlas-3.8.4 ; PATH=$(BUILD_PATH) CFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses -I$(SNAKES_HOME)/include/libxml2/libxml" CPPFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses -I$(SNAKES_HOME)/include/libxml2/libxml" LDFLAGS="-L$(SNAKES_HOME)/lib" make
	cd libatlas-3.8.4 ; PATH=$(BUILD_PATH) CFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses -I$(SNAKES_HOME)/include/libxml2/libxml" CPPFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses -I$(SNAKES_HOME)/include/libxml2/libxml" LDFLAGS="-L$(SNAKES_HOME)/lib" make install
	

$(SNAKES_HOME)/lib/libxslt.so: $(SNAKES_HOME)/lib/python2.7/site-packages/libxml2mod.so $(SNAKES_HOME)/lib/libgcrypt.so 
	cd libxslt-1.1.26 ; PATH=$(BUILD_PATH) CFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses -I$(SNAKES_HOME)/include/libxml2/libxml" CPPFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses -I$(SNAKES_HOME)/include/libxml2/libxml" LDFLAGS="-L$(SNAKES_HOME)/lib" ./configure --prefix=$(SNAKES_HOME) 
	cd libxslt-1.1.26 ; PATH=$(BUILD_PATH) CFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses -I$(SNAKES_HOME)/include/libxml2/libxml" CPPFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses -I$(SNAKES_HOME)/include/libxml2/libxml" LDFLAGS="-L$(SNAKES_HOME)/lib" make  
	cd libxslt-1.1.26 ; PATH=$(BUILD_PATH) CFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses -I$(SNAKES_HOME)/include/libxml2/libxml" CPPFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses -I$(SNAKES_HOME)/include/libxml2/libxml" make install 

$(SNAKES_HOME)/lib/libgcrypt.so: $(SNAKES_HOME)/lib/libgpg-error.so
	cd libgcrypt11-1.5.0 ; PATH=$(BUILD_PATH) CFLAGS="-I$(SNAKES_HOME)/include -L$(SNAKES_HOME)/lib" CPPFLAGS="-I$(SNAKES_HOME)/include -L$(SNAKES_HOME)/lib" ./configure --prefix=$(SNAKES_HOME)
	cd libgcrypt11-1.5.0 ; PATH=$(BUILD_PATH) CFLAGS="-I$(SNAKES_HOME)/include -L$(SNAKES_HOME)/lib" CPPFLAGS="-I$(SNAKES_HOME)/include -L$(SNAKES_HOME)/lib" make
	cd libgcrypt11-1.5.0 ; PATH=$(BUILD_PATH) CFLAGS="-I$(SNAKES_HOME)/include -L$(SNAKES_HOME)/lib" CPPFLAGS="-I$(SNAKES_HOME)/include -L$(SNAKES_HOME)/lib" make install

$(SNAKES_HOME)/lib/libgpg-error.so:
	cd libgpg-error-1.10 ; CFLAGS="-I$(SNAKES_HOME)/include" CPPFLAGS="-I$(SNAKES_HOME)/include" ./configure --prefix=$(SNAKES_HOME)
	cd libgpg-error-1.10 ; CFLAGS="-I$(SNAKES_HOME)/include" CPPFLAGS="-I$(SNAKES_HOME)/include" make
	cd libgpg-error-1.10 ; CFLAGS="-I$(SNAKES_HOME)/include" CPPFLAGS="-I$(SNAKES_HOME)/include" make install

.PHONY: libxml2	

libxml: $(SNAKES_HOME)/lib/python2.7/site-packages/libxml2mod.so

$(SNAKES_HOME)/lib/python2.7/site-packages/libxml2mod.so:
	cd libxml2-2.7.8.dfsg ; ./configure --prefix=$(SNAKES_HOME) ; make ; make install ; cd ../

.PHONY: cython

cython: $(SNAKES_HOME)/bin/cython

$(SNAKES_HOME)/bin/cython: $(SNAKES_HOME)/bin/python
	cd Cython-0.17.3 ; $(SNAKES_HOME)/bin/python setup.py install ; cd ..

.PHONY: pip

pip: $(SNAKES_HOME)/bin/pip

$(SNAKES_HOME)/bin/pip: $(SNAKES_HOME)/bin/python
	cd pip-1.0 ; $(SNAKES_HOME)/bin/python setup.py install ; cd ..

.PHONY: zlib

zlib: $(SNAKES_HOME)/lib/libz.so

$(SNAKES_HOME)/lib/libz.so:
	cd zlib-1.2.3.4.dfsg ; ./configure --prefix=$(SNAKES_HOME) ; cd ..
	cd zlib-1.2.3.4.dfsg ; make ; cd ..
	cd zlib-1.2.3.4.dfsg ; make install ; cd ..

.PHONY: distribute

distribute: $(SNAKES_HOME)/bin/easy_install

$(SNAKES_HOME)/bin/easy_install: $(SNAKES_HOME)/bin/python
	cd distribute-0.6.32 ; $(SNAKES_HOME)/bin/python setup.py install

.PHONY: python

python: $(SNAKES_HOME)/bin/python

$(SNAKES_HOME)/bin/python: $(SNAKES_HOME)/lib/libreadline.so $(SNAKES_HOME)/lib/libssl.so $(SNAKES_HOME)/lib/libgdbm.so $(SNAKES_HOME)/lib/libbz2.a $(SNAKES_HOME)/lib/libtcl8.5.so $(SNAKES_HOME)/lib/libz.so
	cd python2.7-2.7.3 ; CPPFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses" LDFLAGS="-L$(SNAKES_HOME)/lib" ./configure --prefix=$(SNAKES_HOME) ; cd ../
	cd python2.7-2.7.3 ; CPPFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses" LDFLAGS="-L$(SNAKES_HOME)/lib" make ; cd ..
	cd python2.7-2.7.3 ; make install ; cd ../

.PHONY: readline

readline: $(SNAKES_HOME)/lib/libreadline.so

$(SNAKES_HOME)/lib/libreadline.so: $(SNAKES_HOME)/lib/libncurses.so
	cd readline6-6.2 ; CPPFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses" LDFLAGS="-L$(SNAKES_HOME)/lib" ./configure --prefix=$(SNAKES_HOME) ; cd ../
	cd readline6-6.2 ; CPPFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses" LDFLAGS="-L$(SNAKES_HOME)/lib" make ; cd ../
	cd readline6-6.2 ; make install ; cd ../	

.PHONY: ncurses

ncurses: $(SNAKES_HOME)/lib/libncurses.so

$(SNAKES_HOME)/lib/libncurses.so:
	cd ncurses-5.9 ; ./configure --prefix=$(SNAKES_HOME) --with-shared ; cd ..
	cd ncurses-5.9 ; make ; cd ..
	cd ncurses-5.9 ; make install ; cd ..

.PHONY: openssl

openssl: $(SNAKES_HOME)/lib/libssl.so

$(SNAKES_HOME)/lib/libssl.so:
	cd openssl-1.0.1 ; ./configure --prefix=$(SNAKES_HOME) shared ; cd ..
	cd openssl-1.0.1 ; make ; cd ..
	cd openssl-1.0.1 ; make install_sw ; cd ..
	

.PHONY: gdbm
gdbm: $(SNAKES_HOME)/lib/libgdbm.so

$(SNAKES_HOME)/lib/libgdbm.so:
	cd gdbm-1.8.3 ; ./configure --prefix=$(SNAKES_HOME) ; make ; make install

.PHONY: bzlib2
bzlib2: $(SNAKES_HOME)/lib/libbz2.a
$(SNAKES_HOME)/lib/libbz2.a:
	cd bzip2-1.0.6 ; make ; make install PREFIX=$(SNAKES_HOME)

.PHONY: sqlite3

sqlite3: $(SNAKES_HOME)/lib/libsqlite3.so

$(SNAKES_HOME)/lib/libsqlite3.a: $(SNAKES_HOME)/lib/libtcl8.5.so
	cd sqlite3-3.7.9 ; PATH=$(PATH):$(SNAKES_HOME)/bin ./configure --prefix=$(SNAKES_HOME) ; cd ..
	cd sqlite3-3.7.9 ; PATH=$(PATH):$(SNAKES_HOME)/bin make ; cd ..
	cd sqlite3-3.7.9 ; make install ; cd ..

.PHONY: tcl

tcl: $(SNAKES_HOME)/lib/libtcl8.5.so

$(SNAKES_HOME)/lib/libtcl8.5.so:
	cd tcl8.5-8.5.11/unix ; PATH=$(PATH):$(SNAKES_HOME)/bin ./configure --prefix=$(SNAKES_HOME) ; make ; make install ; cd ../..
