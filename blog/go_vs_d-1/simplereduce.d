import std.stdio;
import std.algorithm;

void main(string[] args) {
  writeln([1,2,3,4,5,6].reduce!"a+b");
  other();
}

void other() {
  mixin(q{writeln("hello world");});

  const string sfunc = "a - b";
  auto func = delegate (int a, int b) { mixin("return " ~ sfunc ~ ";");};
  writeln([1,2,3,4,5,6].reduce!func);
  writeln([1,2,3,4,5,6].reduce!"a-b");
  writeln([1,2,3,4,5,6].reduce!"a*b");
  writeln([1,2,3,4,5,6].reduce!((a,b) => (a * b) + 2));
  writeln([1,2,3,4,5,6].reduce!( delegate (int a, int b) {return (a * b) + 2;} ));
  writeln([1,2,3,4,5,6].reduce!( delegate (int a, int b) {return a + (b*2);} ));
  writeln([1,2,3,4,5,6].reduce!"a+(b*2)");
}
