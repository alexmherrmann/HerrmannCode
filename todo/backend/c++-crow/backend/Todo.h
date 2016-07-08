//
// Created by alex on 7/8/16.
//

#include <string>

#ifndef C_CROW_TODO_H
#define C_CROW_TODO_H

using std::string;
struct todo {
public:
    string description;
    bool checked;

    string toString();
};
#endif //C_CROW_TODO_H
