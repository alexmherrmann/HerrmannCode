#ifndef ALEX_TODO
#define ALEX_TODO

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

#endif /* end of include guard: ALEX_TODO */
