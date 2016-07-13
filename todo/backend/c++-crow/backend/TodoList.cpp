//
// Created by alex on 7/12/16.
//

#include "TodoList.h"
#include <algorithm>

using namespace std;

vector<Todo> TodoList::searchTodos(const string &term) {
    auto filtered = vector<Todo>();

    for_each(todos.begin(), todos.end(), [term, &filtered](Todo t) {
        if(t.toString().find(term) > -1) {
            filtered.push_back(t);
        }
    });

    return filtered;
}

//struct
TodoList::TodoList(string _name) : name(_name), todos{vector<Todo>()} {
//    this->name = _name;
}

vector<Todo> TodoList::getTodos() {
    return this->todos;
}

void TodoList::addTodo(Todo t) {
    this->todos.push_back(t);
}