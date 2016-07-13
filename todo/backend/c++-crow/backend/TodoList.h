//
// Created by alex on 7/12/16.
//

#ifndef CROW_TODO_TODOLIST_H
#define CROW_TODO_TODOLIST_H

#include <vector>
#include <string>
#include "Todo.h"

using std::string;
using std::vector;

class TodoList {

public:
    //vars
    string name;
    vector<Todo> todos;

    //functions
    vector<Todo> getTodos();
    vector<Todo> searchTodos(const string& term);

    void addTodo(Todo t);

    TodoList(string _name);
};

#include "Todo.h"

#endif //CROW_TODO_TODOLIST1_H
