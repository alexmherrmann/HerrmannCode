//
// Created by Alex Herrmann
// Let's see if we can't get this working
//

#include <iostream>
#include "crow/include/crow.h"
#include "crow/include/json.h"

#include "backend/CrowBack.h"
#include "backend/Todo.h"
#include "backend/TodoList.h"
using namespace std;
using namespace crow;

void crowApp(crow::SimpleApp& apptoconfig) {

    CROW_ROUTE(apptoconfig, "/")( []() {
        return "Hello world";
    });

    CROW_ROUTE(apptoconfig, "/add/<int>/<int>")( [] (int a, int b) {
        return to_string(a + b);
    });

    auto tl = TodoList("eyy?");
    tl.addTodo(Todo("todo 1", false));
    tl.addTodo(Todo("todo 2", true));

    CROW_ROUTE(apptoconfig, "/test")( [tl]() {
        auto rendered = renderBasicPage(tl);
        return rendered;
    });

    apptoconfig.port(10108);

//    apptoconfig.port(10108).run();

}

int main() {
    crow::SimpleApp app;
    // now set up the application
    crowApp(app);
    app.multithreaded().run();

    return 0;
}