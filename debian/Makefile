BUILD_PATH=${SNAKES_HOME}

.PHONY: clean
clean:
	cd sources && rm -rf *

.PHONY: dist-clean
dist-clean:
	rm -rf ${BUILD_PATH}

.PHONY: python
python: ${BUILD_PATH}/bin/python
${BUILD_PATH}/bin/python: sources/python2.7_2.7.3-0ubuntu3.1.dsc
	cd sources/python2.7-2.7.3 ; CPPFLAGS="-I${BUILD_PATH}/include" LDFLAGS="-L${BUILD_PATH}/lib" ./configure --prefix=${BUILD_PATH} ; cd ../
	cd sources/python2.7-2.7.3 ; CPPFLAGS="-I${BUILD_PATH}/include" LDFLAGS="-L${BUILD_PATH}/lib" make ; cd ..
	cd sources/python2.7-2.7.3 ; make install ; cd ../

.PHONY: debfile
debfile: snakes_2.7.3-${SNAKES_VER}_amd64.deb
snakes_2.7.3-${SNAKES_VER}_amd64.deb: python
	mkdir -p dist
	bundle exec fpm -s dir -t deb -p dist/snakes_VERSION_ARCH.deb -n snakes -v 2.7.3-${SNAKES_VER} \
	 -d 'libc6 >= 2.4' -d 'libxml2 >= 2.7.4' -d 'libxslt1.1 >= 1.1.26' -d 'libblas3gf >= 1.2.20110419-2ubuntu1'\
	 -d 'liblapack3gf >= 3.3.1-1' -d 'gfortran >= 4:4.6.3-1ubuntu5' -d 'libssl1.0.0 >= 1.0.0' \
	 -d 'dpkg >= 1.15.6' -d 'libgfortran3 >= 4.6' -d 'libstdc++6 >= 4.1.1' -d 'libumfpack5.4.0 >= 1:3.4.0' \
	 -d 'libgcc1 >= 1:4.1.1' -d 'libyaml-0-2 >= 0.1.4-2' ${SNAKES_HOME}

.PHONY: release
release: python debfile
	mkdir -p apt-repo/
	s3cmd --verbose --follow-symlinks sync s3://${APT_BUCKET}/ apt-repo/
	reprepro -b apt-repo/ includedeb precise dist/snakes_2.7.3-${SNAKES_VER}_amd64.deb
	s3cmd --verbose --delete-removed --follow-symlinks sync apt-repo/ s3://${APT_BUCKET}/

sources/python2.7_2.7.3-0ubuntu3.1.dsc:
	cd sources && apt-get source python2.7
