
NAME = dockerbase/android
2 VERSION = 1.1 

#see for extending on docker image building
#https://github.com/dockerbase/android/blob/master/Makefile

.PHONY: all 

all: build test package deliver

checkout:
	git clone https://github.com/cmusphinx/sphinxbase
	git clone https://github.com/cmusphinx/pocketsphinx
	git clone https://github.com/cmusphinx/pocketsphinx-android  
	
download:
	wget http://sourceforge.net/code-snapshots/svn/c/cm/cmusphinx/code/cmusphinx-code-12781-trunk.zip
	wget http://apache.mirror.triple-it.nl//ant/binaries/apache-ant-1.9.4-bin.tar.gz
	
env:
	docker pull dockerbase/android
	docker run -it --rm --name dockerbase-android dockerbase/android
#docker run -i -t -P

docker run -t -i --rm -e http_proxy http://emea.nics.nxp.com:8080 --name dockerbase-android dockerbase/android

docker run -t -i --rm -e http_proxy=http://emea.nics.nxp.com:8080 -e https_proxy=https://emea.nics.nxp.com:8080 --name dockerbase-android dockerbase/android

env-build:
	docker build -t="cyrta/pocketsphinx-android-build" .
	
build: 
	cd pocketsphinx-android  
	ant jar
	../

release:
	ant release
	
debug:
	ant debug
	
test:

package:




deliver:

clean: