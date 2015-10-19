# Java
install the JDK from [here](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)

**On windows** you will need to set your PATH (google for it)

run these commands:
```
javac Person.java
java Person
```

# C
C is a little bit more involved unfortunately. On linux it is very easy, simply use your favorite package manager, on ubuntu `sudo apt-get install clang` or `sudo apt-get install gcc`.

on windows you'll probably have to install [Mingw](http://www.mingw.org/)

On OSX (I can't prove this) you need to install Xcode with the command line tools
```
# if gcc
gcc person.c
./a.out
```

# Go
Go to their [download page](https://golang.org/dl/) and download the package that you need for your OS, and install it.

then run

yep, that's it
```
go run person.go
```
