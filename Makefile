SNAKES_VER=ns.0.0.4
SNAKES_HOME=/opt/snakes
APT_BUCKET=snakes-apt
SCIPY_VER=0.11.0
M2CRYPTO_VER=0.21.1
NLTK_VER=2.0.4
PANDAS_VER=0.10.1
NUMPY_VER=1.7.0
LXML_VER=3.1.0
CYTHON_VER=0.18
BPYTHON_VER=0.12
BUILD_PATH=${SNAKES_HOME}
PIP_CMD=${BUILD_PATH}/bin/pip


.PHONY: debian-python
debian-python:
	cd debian && SNAKES_HOME=${SNAKES_HOME} SNAKES_VER=$(SNAKES_VER) APT_BUCKET=${APT_BUCKET} make python

.PHONY: debian
debian: debian-python all
	cd debian && SNAKES_HOME=${SNAKES_HOME} SNAKES_VER=$(SNAKES_VER) APT_BUCKET=${APT_BUCKET} make release

.PHONY: all
all: cython lxml numpy pandas nltk scipy M2Crypto bpython

.PHONY: bpython
bpython: ${BUILD_PATH}/lib/python2.7/site-packages/bpython-0.12-py2.7.egg-info/
${BUILD_PATH}/lib/python2.7/site-packages/bpython-0.12-py2.7.egg-info:
	cd sources ; ${PIP_CMD} install bpython==$(BPYTHON_VER)

.PHONY: scipy
scipy: ${BUILD_PATH}/lib/python2.7/site-packages/scipy-$(SCIPY_VER)-py2.7.egg-info/
${BUILD_PATH}/lib/python2.7/site-packages/scipy-$(SCIPY_VER)-py2.7.egg-info: numpy
	cd sources ; ${PIP_CMD} install scipy==$(SCIPY_VER)

.PHONY: M2Crypto
M2Crypto: ${BUILD_PATH}/lib/python2.7/site-packages/M2Crypto-$(M2CRYPTO_VER)-py2.7.egg-info/
${BUILD_PATH}/lib/python2.7/site-packages/M2Crypto-$(M2CRYPTO_VER)-py2.7.egg-info: pip
	cd sources; ${PIP_CMD} install M2Crypto==$(M2CRYPTO_VER)

.PHONY: nltk
nltk: ${BUILD_PATH}/lib/python2.7/site-packages/nltk-$(NLTK_VER)-py2.7.egg-info/
${BUILD_PATH}/lib/python2.7/site-packages/nltk-$(NLTK_VER)-py2.7.egg-info: numpy
	cd sources ; ${PIP_CMD} install nltk==$(NLTK_VER)

.PHONY: pandas
pandas: ${BUILD_PATH}/lib/python2.7/site-packages/pandas-$(PANDAS_VER)-py2.7.egg-info/
${BUILD_PATH}/lib/python2.7/site-packages/pandas-$(PANDAS_VER)-py2.7.egg-info: cython
	cd sources ; ${PIP_CMD} install pandas==$(PANDAS_VER)

.PHONY: numpy
numpy: ${BUILD_PATH}/lib/python2.7/site-packages/numpy-$(NUMPY_VER)-py2.7.egg-info/
${BUILD_PATH}/lib/python2.7/site-packages/numpy-$(NUMPY_VER)-py2.7.egg-info: cython
	cd sources ; ${PIP_CMD} install numpy==$(NUMPY_VER)

.PHONY: lxml
lxml: ${BUILD_PATH}/lib/python2.7/site-packages/lxml-$(LXML_VER)-py2.7.egg-info/
${BUILD_PATH}/lib/python2.7/site-packages/lxml-$(LXML_VER)-py2.7.egg-info: cython
	cd sources ; ${PIP_CMD} install lxml==$(LXML_VER)

.PHONY: cython
cython: ${BUILD_PATH}/lib/python2.7/site-packages/Cython-$(CYTHON_VER)-py2.7.egg-info/
${BUILD_PATH}/lib/python2.7/site-packages/Cython-$(CYTHON_VER)-py2.7.egg-info: pip
	cd sources ; ${PIP_CMD} install cython==$(CYTHON_VER)

.PHONY: pip
pip: $(BUILD_PATH)/bin/pip
$(BUILD_PATH)/bin/pip: ${BUILD_PATH}/bin/easy_install
	${BUILD_PATH}/bin/easy_install pip

.PHONY: easy_install
easy_install: ${BUILD_PATH}/bin/easy_install
${BUILD_PATH}/bin/easy_install: sources
	cd sources && curl -O http://python-distribute.org/distribute_setup.py
	cd sources && ${BUILD_PATH}/bin/python distribute_setup.py

sources:
	mkdir -p sources
