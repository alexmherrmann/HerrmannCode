// import statements
import std.stdio;
import std.string;

// compile time function evaluation
string reportVar(string varname) {
  // super cool funky string literals
  return `writefln("%1$s: %%s", %1$s);`.format(varname);
}


// conditional compilation
version(Posix) {
  bool supercool = true;
} else {
  bool supercool = false;
}

void reportCoolness() {
  writefln("Is your operating system cool? %s", supercool);
}

// mixin templates
mixin template intx() {
  int y = 7;
}

void somebasics() {
  // tell things to execute when we leave scope
  scope(exit) writeln("somebasics finished");
  int x = 5;
  writefln("report var creates: %s", reportVar("x"));
  mixin intx;

  assert (x == 5);
  // notice that y hasn't been declared in this codeblock... BUT, it is in scope
  assert (y == 7);

  mixin(reportVar("x"));
  mixin(reportVar("y"));
}

class Person {
  public int age = -1; // default values
  public string name;
}

@nogc auto nogcMathTest() {
  int[10] ayy;
  for(int i = 0; i < ayy.length; i++) {
    ayy[i] = i ^^ 2;
  }
  return ayy;
}

// @nogc void nogcArrayTest() {
//   import std.container.array;
//   Array!int intarray;
//   intarray.insert(1);
//   intarray.insert(2);
//   intarray.insert(3);
// }


public @nogc void nogcThrowTest() {
  string[] ayy;
  // ayy ~= "lmao";
}


void math() {
  float square_root_9 = 9 ^^ .5;
  mixin(reportVar("square_root_9"));
}


void main() {
  somebasics();
  reportCoolness();
  writefln("nogc array %s", nogcMathTest());
  math();
}
