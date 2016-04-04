string injson =`
[
{"ayy": "lmao"},
{"ayy": "gimme da pizza", "butt": true}
]

`;

import std.json, std.stdio;
void main() {
  auto x = parseJSON(injson);

  foreach(size_t i, JSONValue j ; x) {
    writeln(j.toPrettyString());
    writeln(j["ayy"]);
  }
}
