
NAME = dockerbase/android
VERSION = 1.1 

#see for extending on docker image building
#https://github.com/dockerbase/android/blob/master/Makefile

.PHONY: all 

all: build test package deliver

checkout:
	git clone https://github.com/cmusphinx/sphinxbase
	git clone https://github.com/cmusphinx/pocketsphinx
	git clone https://github.com/cmusphinx/pocketsphinx-android  
	
#	echo " sdk.dir=/home/devbase/.android/android-sdk.linux/ 
#	ndk.dir=/home/devbase/.android/android-ndk.linux/ 
#	sdk.version=20
#	" > build.properties

download:
	wget http://sourceforge.net/code-snapshots/svn/c/cm/cmusphinx/code/cmusphinx-code-12781-trunk.zip
	wget http://apache.mirror.triple-it.nl//ant/binaries/apache-ant-1.9.4-bin.tar.gz
	
env:
	docker pull dockerbase/android
	docker run -it --rm --name dockerbase-android dockerbase/android
#docker run -i -t -P


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