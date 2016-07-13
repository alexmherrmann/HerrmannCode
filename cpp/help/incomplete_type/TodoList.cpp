#include "TodoList.h"

#include <algorithm>
#include <string>
#include <vector>

using namespace std;

void TodoList::addTodo(Todo t) {
  this->todos.push_back(t);
}

vector<Todo> TodoList::checkedTodos() {
  vector<Todo> reduced;

  for_each(this->todos.begin(), this->todos.end(), [&reduced] (Todo t) {
    if(!t.checked)
      reduced.push_back(t);
  });

  return reduced;
}
