import vibe.vibe;

class A {
  string name;
  int powerlevel;
  public this (string inname, int power) {
    this.name = inname;
    this.powerlevel = power;
  }

  public Json toJson() const {
    auto j = Json.emptyObject;

    j["name"] = this.name;
    j["power"] = this.powerlevel;

    return j;
  }

  public static A fromJson(Json input) {
    A r = new A(input.name.to!string, input.power.to!int);
    return r;
  }
}

class B {
  public A[] As;

  public Json toJson() {
    auto j = Json.emptyArray;

    foreach(A a ; As) {
      j ~= a.toJson();
    }

    return j;
  }

  public static B fromJson(Json input) {
    A[] arr;
    foreach(Json j ; input[0..$-1])
      arr ~= A.fromJson(j);
    B r = new B(arr);
    return r;
  }

  public this(A[] inas) {
    this.As = inas;
  }

}

void main() {
  import std.stdio;
  A a1 = new A("alex", 9000);
  A a2 = new A("Jean", 9000*100);
  A a3 = new A("Zach", 89911);

  A[] inas = [a1, a2, a3];
  B b1 = new B(inas);

  writeln(b1.toJson().toPrettyString());
}
