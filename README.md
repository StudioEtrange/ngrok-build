build : [![Circle CI](https://circleci.com/gh/StudioEtrange/ngrok-build/tree/master.svg?style=svg)](https://circleci.com/gh/StudioEtrange/ngrok-build/tree/master)


# ngrok-build

Build ngrokd server and ngrok client without a pain for Linux, MacOS and Windows in one time.

So you can use your own ngrok server on you own server with your domain name

* ngrokd and ngrok are cross-compiled with gonative and gox
* generate certificate with your domain
* ngrokd and ngrok binary are paired together
* generate appropriate config file for client
* ngrok-build can be use on linux and macos (and windows SOON)

ngrok famous tool is a reverse proxy (see https://github.com/inconshreveable/ngrok)

NOTE : ngrok-build is built with _stella_ (see https://github.com/StudioEtrange/stella)


# Requirements

Standard build tools, git, openssl (for certificate generation)

NOTE : you dont need go. An isolated version of go will be built in current workspace

# Build ngrokd and ngrok

## On Linux/MacOS

### installation :


automatic way (recommanded) :
	
	cd ~
	git clone https://github.com/StudioEtrange/ngrok-build
	cd ngrok-build
	./stella-link.sh bootstrap

manual way :

	cd ~
	git clone https://github.com/StudioEtrange/stella
	cd stella
	./stella.sh stella install dep

	cd ~
	git clone https://github.com/StudioEtrange/ngrok-build
	cd ngrok-build
		

### cross compile ngrokd and ngrok :

	./ngrok-build.sh prepare
	./ngrok-build.sh build -d <domain.com>

replace domain.com whith you server domain name and see produced files in release folder

FOR INFORMATION : _gonative_ and _gox_ are used for cross-compile client and server
* see : https://github.com/mitchellh/gox
* see : https://github.com/inconshreveable/gonative

### for cleaning :

	./ngrok-build.sh clean


### for help :

	./ngrok-build.sh -h


# ngrokd and ngrok usage

Your built binaries are in release directory.
For more details on how to use ngrok see https://github.com/inconshreveable/ngrok

## On Linux/MacOS

If your domain is domain.com

### client :

	./ngrok -subdomain=test1.domain.com -config=ngrok-config 80

### server :

	sudo ./ngrokd -tlsKey='device.key' -tlsCrt='device.crt' -domain='domain.com' -httpAddr=':80' -httpsAddr=':443'

### DNS resolution :

On the host running the client or the server, *.domain.dom must be resolved.

* Quick solution : add test1.domain.com to /etc/hosts file of the server host and the client host, pointing to the ip of your server
* Real solution : add a CNAME *.domain.com to a dns server pointing to the ip of your server


# Links

* official build server instruction : https://github.com/inconshreveable/ngrok/blob/master/docs/SELFHOSTING.md
* SequenceIQ article : http://blog.sequenceiq.com/blog/2014/10/09/ngrok-docker/
