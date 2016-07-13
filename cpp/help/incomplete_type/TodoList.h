#ifndef ALEX_TODOLIST
#define ALEX_TODOLIST

#include "Todo.h"
#include <vector>
#include <string>

using namespace std;
class TodoList {
public:
  vector<Todo> todos;

  void addTodo(Todo t);
  vector<Todo> checkedTodos();
};

#endif /* end of include guard: ALEX_TODOLIST */
