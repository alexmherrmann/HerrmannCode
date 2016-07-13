#include <string>
#include "Todo.h"

using namespace std;

Todo::Todo(const char* s, bool b) {
    this->checked = b;
    this->description = string(s);
}

Todo::Todo() {
    this->checked = false;
    this->description = string("");
}

string Todo::toString() {
  string nstring;
  nstring.append(description);
  nstring.append(" : ");
  nstring.append(this->checked ? "true" : "false");
  return nstring;
}
