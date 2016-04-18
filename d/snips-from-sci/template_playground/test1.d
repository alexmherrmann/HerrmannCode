module test1;

import std.stdio;

interface PushPull(T) {
  void push(T intype);
  T pull();
  T peek();
  size_t numLeft();
}


class FifoStack(T) : PushPull!T {
  private T[] storage;

  void push(T intype) {
    this.storage ~= intype;
  }

  T peek() {
    return this.storage[0];
  }

  T pull() {
    auto rval = this.storage[0];
    this.storage = this.storage[1..$];
    return rval;
  }

  size_t numLeft() {
    return this.storage.length;
  }
}

class FiloStack(T) : PushPull!T {
  private T[] storage;

  void push(T intype) {
    this.storage ~= intype;
  }

  T peek() {
    return this.storage[$-1];
  }

  T pull() {
    auto rval = this.storage[$-1];
    this.storage = this.storage[0..$-1];
    return rval;
  }

  size_t numLeft() {
    return this.storage.length;
  }
}

void main() {
  writeln("FIFO test");
  PushPull!int intfifo = new FifoStack!int();

  intfifo.push(1);
  intfifo.push(2);
  intfifo.push(3);

  assert (intfifo.numLeft() == 3);
  assert (intfifo.pull() == 1);
  assert (intfifo.pull() == 2);
  assert (intfifo.pull() == 3);
  assert (intfifo.numLeft() == 0);

  writeln("FIFO string test");
  PushPull!string stringfifo = new FifoStack!string();

  stringfifo.push("1");
  stringfifo.push("2");
  stringfifo.push("3");

  assert (stringfifo.numLeft() == 3);
  assert (stringfifo.pull() == "1");
  assert (stringfifo.pull() == "2");
  assert (stringfifo.pull() == "3");
  assert (stringfifo.numLeft() == 0);

  writeln("FILO string test");
  PushPull!string stringfilo = new FiloStack!string();

  stringfilo.push("1");
  stringfilo.push("2");
  stringfilo.push("3");

  assert (stringfilo.numLeft() == 3);
  assert (stringfilo.pull() == "3");
  assert (stringfilo.pull() == "2");
  assert (stringfilo.pull() == "1");
  assert (stringfilo.numLeft() == 0);

}
