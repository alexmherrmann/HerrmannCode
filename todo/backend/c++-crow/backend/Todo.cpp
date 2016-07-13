//
// Created by alex on 7/8/16.
//

#include "Todo.h"
#include <string>
#include <vector>
#include <algorithm>

#include "../crow/include/crow.h"
#include "../crow/include/json.h"
#include "../crow/include/mustache.h"

using namespace std;
using namespace crow;

    string nstring;
string Todo::toString()  {
    nstring.append(description);
    nstring.append(" : ");
    nstring.append(this->checked ? "true" : "false");
    return nstring;
};

Todo::Todo(const char* s, bool b) : checked(false), description(""){
    this->checked = b;
    this->description = string(s);
    cout << this->toString() << endl;
}

Todo::Todo() {
    this->checked = false;
    this->description = string("");
}

