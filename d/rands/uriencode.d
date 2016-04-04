import std.stdio;
import std.format;
import std.uri;

void main() {
  immutable string googsearch = "https://google.com/search?q=%s";
  writefln(googsearch, "ayy lmao 54 bruh".encode());
}
