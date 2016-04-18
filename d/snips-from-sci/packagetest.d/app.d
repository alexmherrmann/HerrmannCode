import std.stdio;
void main() {
  import test;
  writeln("running now...");

  // f is an alias defined by version
  writefln("got %d", f());
}
