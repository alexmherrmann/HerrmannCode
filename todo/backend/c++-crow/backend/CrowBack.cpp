//
// Created by alex on 7/12/16.
//

#include "CrowBack.h"

string read_all(const string& filename)  {
    ifstream is(filename);
    const string read = {istreambuf_iterator<char>(is), istreambuf_iterator<char>()};
    return read;
}

string renderBasicPage(TodoList from) {
    auto contextValue = json::wvalue();

    std::vector<Todo> localTodos = from.getTodos();
    contextValue["todolist"]["name"] = from.name;
    for(int i = 0; i < localTodos.size(); i++) {
        Todo t = localTodos[i];

        contextValue["todolist"]["todos"][i]["description"] = t.description;
        contextValue["todolist"]["todos"][i]["checked"] = t.checked;
    }

//    cout << "rendering: " <<  json::dump(contextValue) << endl;

    const string &body = read_all("../simplefront/defaulttodos.mustache");
    string rendered = mustache::compile(body).render(contextValue);
    cout << "rendered:" << rendered << endl;
    return rendered;
}
