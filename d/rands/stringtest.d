import std.stdio;

void t1() {
  string ayy = "ayy";
  string* lmao = &ayy;

  writefln("ayy: %s", ayy);
  writefln("lmao: %s", *lmao);

  *lmao = "lmao";

  writeln("changing lmao...");
  writefln("ayy: %s", ayy);
  writefln("lmao: %s", *lmao);
}

void t2() {
  string ayy = "ayy";
  string lmao = ayy;

  writefln("ayy: %s", ayy);
  writefln("lmao: %s", lmao);

  lmao = "lmao";

  writeln("changing lmao...");
  writefln("ayy: %s", ayy);
  writefln("lmao: %s", lmao);
}

void t3() {
  string ayy = "ayy";
  alias lmao = ayy;

  writefln("ayy: %s", ayy);
  writefln("lmao: %s", lmao);

  lmao = "lmao";

  writeln("changing ayy...");
  writefln("ayy: %s", ayy);
  writefln("lmao: %s", lmao);
}

void main() {
  writeln("t1");
  t1;
  writeln("t2");
  t2;
  writeln("t3");
  t3;
}
