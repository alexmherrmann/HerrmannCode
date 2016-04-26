import std.stdio;

class StrStore {
  public string data;
}

void t1() {
  string b;
  {
    scope string a = "ayy";
    b = a;
  }

  writefln("b: [%s]", b);
}

void t2() {
  StrStore b;
  {
    scope StrStore a = new StrStore();
    a.data = "ayy";
    b = a;
    writefln("b before scope: [%s]", b.data);
  }
  writefln("b after scope: [%s]", b.data);
}

void t3() {
  StrStore b;
  {
    StrStore a = new StrStore();
    a.data = "ayy";
    b = a;
    writefln("b before scope: [%s]", b.data);
  }
  writefln("b after scope: [%s]", b.data);
}
void main() {
  writeln("strings");
  t1();
  writeln("scope class");
  t2();
  writeln("non-scope class");
  t3();
}
