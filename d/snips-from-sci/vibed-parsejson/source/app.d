import vibe.vibe;
import std.stdio;

void test1() {
  immutable string ayy = `{"name" : "Alex", "langs": ["d", "python", "java"]}`;

  auto jval = parseJsonString(ayy);

  writeln(jval.toPrettyString());
}

void main() {
  test1();
}
