import std.stdio;

void main() {

  char[int] intzample;
  char[int[]] intarrzample;
  char[char[]] example;


  writefln("%s", typeid(example)); // char[int];
  writefln("%s", typeid(intzample)); // char[ const (int[])]
  writefln("%s", typeid(intarrzample)); // char[ const(char[])]


  // using example
  const(char[]) yeah = "yeah";
  example[yeah] = 'e';
  writefln("%s", example);
}
