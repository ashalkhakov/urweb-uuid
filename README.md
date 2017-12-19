# Ur/Web UUID support

This aims to add support for UUID in Ur/Web.

# Building

On Ubuntu, assuming you already have `autotools` & co installed:

```
$ sudo apt-get install libuuid-dev
$ ./autogen.sh
$ ./configure
$ make
$ sudo make install
```

# Testing

There is a sample available in `tests` directory. Assuming you have
already built and installed the library, you should be able to do the
following to run the test:

```
$ cd tests
$ make
$ ./test.exe
```

Then in your browser, navigate to `http://localhost:8080/index`.
