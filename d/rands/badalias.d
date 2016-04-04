import std.stdio;

alias x = stderr.writefln;
alias y = writefln;
void main() {
  stderr.writefln("foo %s", "bar");
  x("foo %s", "bar");
  y("foo %s", "bar");
}
