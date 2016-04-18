// template struct
public struct Stack(T) {
  // import something just into this scope
  import std.container.array;
  // blocks of private fields, functions, etc.
  private {
    Array!T internallist;
  }
  // or just do it like this
  @nogc public T peek() {
    if(this.internallist.length > 0)
      return this.internallist[$];
    return null;
  }

  @nogc public {
    T pop() {
      // automatic
      auto val = this.peek();
      if(this.internallist.length > 0)
        this.internallist = this.internallist[0..$-1];
      return val;
    }

    void push(T blah) {
      this.internallist.insert(blah);
    }
  }
}
