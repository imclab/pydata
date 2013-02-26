SNAKES_HOME=/tmp/snakes
BUILD_PATH=$(PATH):$(SNAKES_HOME)/bin


.PHONY: all
all: $(SNAKES_HOME)/bin/pip $(SNAKES_HOME)/lib/python2.7/site-packages/lxml

.PHONY: clean
clean:
	bash 'cd sources && shopt -s extglob && rm !(README.md)'

$(SNAKES_HOME)lib/python2.7/site-packages/lxml: $(SNAKES_HOME)/bin/cython
	cd sources ; $(SNAKES_HOME)/bin/pip install lxml

$(SNAKES_HOME)/lib/libgcrypt.so: $(SNAKES_HOME)/lib/libgpg-error.so
	cd sources/libgcrypt11-1.5.0 ; PATH=$(BUILD_PATH) CFLAGS="-I$(SNAKES_HOME)/include -L$(SNAKES_HOME)/lib" CPPFLAGS="-I$(SNAKES_HOME)/include -L$(SNAKES_HOME)/lib" ./configure --prefix=$(SNAKES_HOME)
	cd sources/libgcrypt11-1.5.0 ; PATH=$(BUILD_PATH) CFLAGS="-I$(SNAKES_HOME)/include -L$(SNAKES_HOME)/lib" CPPFLAGS="-I$(SNAKES_HOME)/include -L$(SNAKES_HOME)/lib" make
	cd sources/libgcrypt11-1.5.0 ; PATH=$(BUILD_PATH) CFLAGS="-I$(SNAKES_HOME)/include -L$(SNAKES_HOME)/lib" CPPFLAGS="-I$(SNAKES_HOME)/include -L$(SNAKES_HOME)/lib" make install

$(SNAKES_HOME)/lib/libgpg-error.so:
	cd sources/libgpg-error-1.10 ; CFLAGS="-I$(SNAKES_HOME)/include" CPPFLAGS="-I$(SNAKES_HOME)/include" ./configure --prefix=$(SNAKES_HOME)
	cd sources/libgpg-error-1.10 ; CFLAGS="-I$(SNAKES_HOME)/include" CPPFLAGS="-I$(SNAKES_HOME)/include" make
	cd sources/libgpg-error-1.10 ; CFLAGS="-I$(SNAKES_HOME)/include" CPPFLAGS="-I$(SNAKES_HOME)/include" make install

$(SNAKES_HOME)/bin/cython: $(SNAKES_HOME)/bin/easy_install sources/Cython-0.18
	cd sources ; $(SNAKES_HOME)/bin/pip install cython

$(SNAKES_HOME)/bin/pip: $(SNAKES_HOME)/bin/easy_install
	$(SNAKES_HOME)/bin/easy_install pip

$(SNAKES_HOME)/lib/libz.so: sources/zlib-1.2.3.4.dfsg
	cd sources/zlib-1.2.3.4.dfsg ; ./configure --prefix=$(SNAKES_HOME) ; cd ..
	cd sources/zlib-1.2.3.4.dfsg ; make ; cd ..
	cd sources/zlib-1.2.3.4.dfsg ; make install ; cd ..

$(SNAKES_HOME)/bin/easy_install: $(SNAKES_HOME)/bin/python
	cd sources && curl -O http://python-distribute.org/distribute_setup.py
	cd sources && $(SNAKES_HOME)/bin/python distribute_setup.py

#$(SNAKES_HOME)/bin/python: $(SNAKES_HOME)/lib/libreadline.so $(SNAKES_HOME)/lib/libssl.so $(SNAKES_HOME)/lib/libgdbm.so $(SNAKES_HOME)/lib/libtcl8.5.so $(SNAKES_HOME)/lib/libz.so $(SNAKES_HOME)/lib/libncurses.so sources/python2.7-2.7.3
$(SNAKES_HOME)/bin/python: sources/python2.7-2.7.3
	#cd sources/python2.7-2.7.3 ; CPPFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses" LDFLAGS="-L$(SNAKES_HOME)/lib" ./configure --prefix=$(SNAKES_HOME) ; cd ../
	#cd sources/python2.7-2.7.3 ; CPPFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses" LDFLAGS="-L$(SNAKES_HOME)/lib" make ; cd ..
	cd sources/python2.7-2.7.3 ; CPPFLAGS="-I$(SNAKES_HOME)/include  LDFLAGS="-L$(SNAKES_HOME)/lib" ./configure --prefix=$(SNAKES_HOME) ; cd ../
	cd sources/python2.7-2.7.3 ; CPPFLAGS="-I$(SNAKES_HOME)/include LDFLAGS="-L$(SNAKES_HOME)/lib" make ; cd ..
	cd sources/python2.7-2.7.3 ; make install ; cd ../

$(SNAKES_HOME)/lib/libreadline.so: sources/readline6-6.2 $(SNAKES_HOME)/lib/libncurses.so
	cd sources/readline6-6.2 ; CPPFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses" LDFLAGS="-L$(SNAKES_HOME)/lib" ./configure --prefix=$(SNAKES_HOME) ; cd ../
	cd sources/readline6-6.2 ; CPPFLAGS="-I$(SNAKES_HOME)/include -I$(SNAKES_HOME)/include/ncurses" LDFLAGS="-L$(SNAKES_HOME)/lib" make ; cd ../
	cd sources/readline6-6.2 ; make install ; cd ../	

$(SNAKES_HOME)/lib/libncurses.so: sources/ncurses-5.9
	cd sources/ncurses-5.9 ; ./configure --prefix=$(SNAKES_HOME) --with-shared ; cd ..
	cd sources/ncurses-5.9 ; make ; cd ..
	cd sources/ncurses-5.9 ; make install ; cd ..

$(SNAKES_HOME)/lib/libssl.so: sources/openssl-1.0.1
	cd sources/openssl-1.0.1 ; ./config --prefix=$(SNAKES_HOME) shared ; cd ..
	cd sources/openssl-1.0.1 ; make ; cd ..
	cd sources/openssl-1.0.1 ; make install_sw ; cd ..
	
$(SNAKES_HOME)/lib/libgdbm.so: sources/gdbm-1.8.3
	cd sources/gdbm-1.8.3 ; ./configure --prefix=$(SNAKES_HOME) ; make ; make install

sources/bzip2-1.0.6:
	cd sources && apt-get source bzip2

$(SNAKES_HOME)/bin/bunzip2: sources/bzip2-1.0.6
	cd sources/bzip2-1.0.6 ; make ; make install PREFIX=$(SNAKES_HOME)

$(SNAKES_HOME)/lib/libsqlite3.a: sources/sqlite3-3.7.9 $(SNAKES_HOME)/lib/libtcl8.5.so
	cd sources/sqlite3-3.7.9 ; PATH=$(PATH):$(SNAKES_HOME)/bin ./configure --prefix=$(SNAKES_HOME) ; cd ..
	cd sources/sqlite3-3.7.9 ; PATH=$(PATH):$(SNAKES_HOME)/bin make ; cd ..
	cd sources/sqlite3-3.7.9 ; make install ; cd ..

$(SNAKES_HOME)/lib/libtcl8.5.so: sources/tcl8.5-8.5.11
	cd sources/tcl8.5-8.5.11/unix ; PATH=$(PATH):$(SNAKES_HOME)/bin ./configure --prefix=$(SNAKES_HOME) ; make ; make install ; cd ../..

sources/gdbm-1.8.3:
	cd sources && apt-get source gdbm

sources/libgcrypt11-1.5.0:
	cd sources && apt-get source libgcrypt11

sources/libgpg-error-1.10:
	cd sources && apt-get source libgpg-error

sources/ncurses-5.9:
	cd sources && apt-get source ncurses

sources/openssl-1.0.1:
	cd sources && apt-get source openssl

sources/python2.7-2.7.3:
	cd sources && apt-get source python2.7

sources/readline6-6.2:
	cd sources && apt-get source readline6
sources/sqlite3-3.7.9:
	cd sources && apt-get source sqlite3

sources/tcl8.5-8.5.11:
	cd sources && apt-get source tcl8.5

sources/zlib-1.2.3.4.dfsg:
	cd sources && apt-get source zlib
