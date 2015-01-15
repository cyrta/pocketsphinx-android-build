# Automatic Build for PocketSpinx Android App
 
## Tools
 
 - Docker      
	https://www.docker.com/
  on windows use boot2docker:   
	http://boot2docker.io/ or follow: http://docs.docker.com/installation/windows/
	
	
 - repo for scripts *[pocketsphinx-android-build-env]()*  
	- Dockerfile   
	- requirements.txt  
		 
## Prepare Environment
 
 1. checkout git of building environment *[pocketsphinx-android-build-env]()*
  ```
	git clone github.com/cyrta/pocketsphinx-android-build-env
  ```
	
 2. use docker image 
   You can prepare your own image or use already available   
   - official docker hub image with Android SDK&NDK (~2.7GB): https://registry.hub.docker.com/u/dockerbase/android/
   - mostly used: https://index.docker.io/u/wasabeef/android
   
   In order to build pocketsphinx we need following dependencies:
   install dependencies / requirements / packages:
		- builds tools:  apt-get install -y build-essential make gcc
		- git: apt-get install -y git
		- java JDK >= 1.6:
		- apache ant:  apt-get install -y ant
		-  SWIG >= 2.0
		- android sdk
		- android ndk
   
   Here, we use already available, prepared and maintained 
   (check by yourself what is the version Android SDK and NDK)
   Run in commandline to get workplace ready:
   
   ```
	docker pull dockerbase/android
	
	docker run -it --rm --name dockerbase-android dockerbase/android
	
   ```
  

## Build
 
 1. checkout of official repos for pocketsphinx
  - https://github.com/cmusphinx/sphinxbase
  - https://github.com/cmusphinx/pocketsphinx
  - https://github.com/cmusphinx/pocketsphinx-android
	
 2. run build
 
  ```
	make build
  ```
  
 3. run test

  ```
	make test
  ```
  
 4. run delivery
 
  ```
	make package
  ```
  
  5. email or put to s3 results
  
   ```
	make deliver
  ```
 
 
## Bibliography

 - [Pocketsphinx on Android - building procedure](http://cmusphinx.sourceforge.net/wiki/tutorialandroid)
 
 - [Android Project PocketSphinx implementation  - Video](https://www.youtube.com/watch?v=8JyCUzUBGg8)
	https://www.youtube.com/watch?v=vfaNLIowSyk
 
 - [Introduction to boot2docker](http://thepracticalsysadmin.com/introduction-to-boot2docker/)
 
 - [Android development environment in Docker](http://stackoverflow.com/questions/26419701/android-development-environment-in-docker)
 
 - [Fun building Android apps in Docker containers](https://plus.google.com/+BradFitzpatrick/posts/CmqtqAShWZJ)
 
 - [Analyzing an Android App With Docker and Androguard](http://bitjudo.com/blog/2014/04/24/analyzing-an-android-app-with-docker-and-androguard/)
 
 - [Appium Server setup for automated android testing using real devices](https://registry.hub.docker.com/u/aluedeke/appium-android/)
 
 - [android-cross-compile is an environment to build binaries for the android platform](https://registry.hub.docker.com/u/ddrown/android-cross-compile/)
 
	To compile an x86 binary: ARCH_NAME=x86 agcc -o test-x86 test.c ARCH_NAME=x86 agcc -pie -fPIE -o test-x86-pie test.c

	To compile an arm binary: ARCH_NAME=arm agcc -o test-arm test.c ARCH_NAME=arm agcc -pie -fPIE -o test-arm-pie test.c

	
	
	
	
	http://robwin.blogspot.de/2014/05/my-lessons-learned-using-vagrant_9.html
