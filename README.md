# ngrok-build

Build ngrokd server and ngrok without a pain.

So you can use your own ngrok server on you own server with your domain name


* ngrokd and ngrok are cross-compiled with gonative and gox
* generate certificate with your domain
* ngrokd and ngrok binary are paired together


NOTE : ngrok-build is built upon _stella_


# Requirements

classic build tools, git, openssl (for certificate generation)

NOTE : you dont need go. An isolated version of go will be built in current workspace

# Usage

## On Unix:

### installation :

	git clone https://github.com/StudioEtrange/ngrok-build
	cd ngrok-build

### cross compile ngrokd and ngrok :

	ngrok-build.sh prepare
	ngrob-build.sh build -d <your.domain.com>

NOTE : _gonative_ and _gox_ are used for cross-compile client and server
* see : https://github.com/mitchellh/gox
* see : https://github.com/inconshreveable/gonative

### for cleaning :

	ngrok-build.sh clean


### for help :

	ngrok-build.sh -h
