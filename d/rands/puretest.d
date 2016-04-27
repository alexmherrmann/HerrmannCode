import std.stdio;

immutable int globalint = 5;
int nonimmutableglobalint = 10;

pure int add(int i1, int i2) {
  return i1 + i2;
}

pure int addglobal(int i1) {
  return globalint + i1;
}

/*
// Doesn't compile because of pure
pure int addglobal2(int i1) {
  return nonimmutableglobalint + i1;
}
*/

void main() {
  writeln("3 + 2 = ", add(3,2));
  writeln("3 + globalint (5) = ", addglobal(3));
}
