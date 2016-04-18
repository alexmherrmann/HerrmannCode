module test;

import std.stdio;

version(feature_a) {
  public import test.A;
  alias f = a;
}

version(feature_b) {
  public import test.B;
  alias f = b;
}
