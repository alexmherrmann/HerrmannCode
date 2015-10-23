import std.stdio;
import std.algorithm;

immutable int[] ints = [1,2,3,4,5,6];
void main(string[] args) {
  writeln(ints.reduce!"a+b");
  other();
}

void other() {
  mixin(q{writeln("hello world");});
  const string sfunc = "a - b";
  auto func = delegate (int a, int b) { mixin("return " ~ sfunc ~ ";");};
  writeln(ints.reduce!func);
  writeln(ints.reduce!"a-b");
  writeln(ints.reduce!"a*b");
  writeln(ints.reduce!((a,b) => (a * b) + 2));
  writeln(ints.reduce!( delegate (int a, int b) {return (a * b) + 2;} ));
  writeln(ints.reduce!( delegate (int a, int b) {return a + (b*2);} ));
  writeln(ints.reduce!"a+(b*2)");
}
