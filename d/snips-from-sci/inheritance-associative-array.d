module assoc_test;
import std.conv;

public abstract class A {
  public int store;
  public this(in int ain) {
    this.store = ain;
  }
  public int a () {return this.store;}
  public int b();

  override string toString() {
    return this.store.to!string();
  }
}

public class B : A {
  public this(in int bin) {
    super(bin);
  }
  override public int b() {
    return this.a() * 2;
  }
}

public int main() {
  import std.stdio;
  import std.algorithm;
  import std.typecons;
  import std.array;

  A[string] amap;

  B newb(in int input) {
    return new B(input);
  }

  B[string] bmap = ["1": newb(1), "2": newb(2), "3": newb(3)];

  writefln("bmap: %s", bmap);

  foreach(key, value ; bmap.dup) {
    amap[key] = value;
  }

  bmap["2"].store = 5;
  writefln("bmap: %s", bmap);
  writefln("amap: %s", amap);
  return 0;
}
