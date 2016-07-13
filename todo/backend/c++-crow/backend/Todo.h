//
// Created by alex on 7/8/16.
//


#ifndef C_CROW_TODO_H
#define C_CROW_TODO_H

#include <string>
using namespace std;

class Todo {
public:
    string description;
    bool checked;
    string toString();

    Todo();
    Todo(const char* s, bool b);
};

#endif //C_CROW_TODO_H
