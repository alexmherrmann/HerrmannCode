#include <string>
#include <iostream>
#include "Todo.h"
#include "TodoList.h"

using namespace std;

int main() {
  Todo t1("hello yes", true);
  cout << t1.toString() << endl;

  Todo* t2 = new Todo("hmmm...", false);
  cout << t2->toString() << endl;

  TodoList tl1;
  tl1.addTodo(t1);
  tl1.addTodo(*t2);

  cout << "filtered:" << endl;
  for(Todo t: tl1.checkedTodos()) {
    cout << t.toString() << endl;
  }
}
