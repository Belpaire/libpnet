
build: src/*.rs src/*/*.rs
	bash build.sh

# The testsuite must be run differently on each OS:
# Linux:
#   with CAP_NET_RAW set, tests can run without root
# FreeBSD/OS X:
#   with read/write access to /dev/bpf, layer2 can run without root, but higher
#   layers still need root (SOCK_RAW/TransportStream)
# Windows:
#   run everything as admin
#
# On every OS except Linux, PNET_TEST_IFACE must be set to an interface to test
# on - there's a hack to find an interface below.
test:
	bash build.sh test

doc:
	bash build.sh doc