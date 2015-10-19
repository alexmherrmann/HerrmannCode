public class Person {
  public String name;
  public void say(String input) {
    System.out.println(this.name + " says: " + input);
  }

  public static void main(String[] args) {
    Person p = new Person();
    p.name = "Alex";
    p.say("Hello World!");
  }
}
