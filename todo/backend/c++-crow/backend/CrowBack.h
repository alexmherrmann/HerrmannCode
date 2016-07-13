//
// Created by alex on 7/8/16.
//

#ifndef CROW_TODO_CROWBACK_H
#define CROW_TODO_CROWBACK_H

#include <string>
#include <fstream>
#include <vector>

#include "../crow/include/crow.h"
#include "../crow/include/json.h"
#include "../crow/include/mustache.h"
#include "TodoList.h"

using namespace std;
using namespace crow;

string renderBasicPage(TodoList from);

#endif //CROW_TODO_CROWBACK_H
