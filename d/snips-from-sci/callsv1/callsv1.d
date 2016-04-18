import std.stdio;
import std.json;
import std.format;
import curl=std.net.curl;

JSONValue j(T)(T yup) {
  // JSONValue outj = yup;
  return JSONValue(yup) ;
}

immutable string urlstring = "localhost:8085/v1/tests";
///submit tests
void call1() {
  JSONValue jval = ["name": j("aww yiss")];
  JSONValue[string][] questions = [
    ["question": j("ayy"), "answer": j("lmao"), "correct": j("lmao")],
    ["question": j("Wu-____ clan"), "correct": j("tang"), "answer": j("shaolin")]
  ];
  jval["questions"] = questions;

  writeln(jval.toPrettyString());

  auto x = curl.put(urlstring, jval.toString());
}

/// get tests
void call2() {
  auto x = curl.get(urlstring);

  writeln(x);
  auto jval = parseJSON(x);
  writeln(jval.toPrettyString);
}

/// delete tests
void call3() {
  curl.del(urlstring);
}

/// see that they're empty
void call4() {
  auto x = parseJSON(curl.get(urlstring));
  writeln(x.toPrettyString);

}

enum string call(string input) {
  return `writeln("--------------------\nbeginning %1$s");%1$s();writeln("done with %1$s");`.format(input);
}

void main() {
  mixin(call("call1"));
  mixin(call("call2"));
  mixin(call("call3"));
  mixin(call("call4"));
}
