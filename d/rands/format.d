import std.stdio;
import std.format;
import std.range;
import std.array;

void category(string input) {
  const string dashes = "-".repeat(10).join;
  writefln("%1$s %2$s %1$s", dashes, input);
}
void main() {

  category("ints");
  writefln("%d", 5);
  writefln("%2d", 5);
  writefln("%02d", 5);
  writefln("%02d", 11);

  category("floats");
  const float floatexample = 5.25;
  writefln("%f", floatexample);
  writefln("%5f", floatexample);
  writefln("%05f", floatexample);
  writefln("%5.1f", floatexample);
  writefln("%5.3f", floatexample);
  writefln("%.2f", floatexample);
}
