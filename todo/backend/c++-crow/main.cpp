#include <iostream>
#include "backend/Todo.h"
#include "crow/include/crow.h"


using namespace std;

string todo::toString()  {
    string nstring;
    nstring.append(description);
    nstring.append(" : ");
    nstring.append(this->checked ? "true" : "false");
    return nstring;
};

void crowApp(crow::SimpleApp& apptoconfig) {

    CROW_ROUTE(apptoconfig, "/")( []() {
        return "Hello world";
    });

    apptoconfig.port(10108);

//    apptoconfig.port(10108).run();

}

int main() {
    todo t1 = todo();

    t1.checked = false;
    t1.description = "Create first todo";

    cout << t1.toString() << endl;

    t1.checked = true;

    cout << t1.toString() << endl;

    crow::SimpleApp app;
    // now set up the application
    crowApp(app);
    app.multithreaded().run();


    return 0;
}