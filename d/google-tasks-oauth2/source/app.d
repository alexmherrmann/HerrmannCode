import std.stdio;
import file = std.file;
import net = std.net.curl;
import std.uri : encode;
import std.process : execute;
import std.json;
import std.string;


shared {
  string client_id;
  string client_secret;
  string access_token;
  string refresh_token;
  string code;
}
JSONValue config;

void invalidate() {
  config.object["code"] = "NONE";
  file.write("creds.json", config.toPrettyString());
}
void pre_auth() {
  auto response_type=  "code".encode();
  auto client_id=  client_id.encode();
  auto redirect_uri=  "urn:ietf:wg:oauth:2.0:oob".encode();
  auto scopes=  "https://www.googleapis.com/auth/tasks".encode();
  auto state=  "Accepted!".encode();
  auto email = "alexandermherrmann@gmail.com".encode();

  immutable string URL = "https://accounts.google.com/o/oauth2/v2/auth?response_type=%s&client_id=%s&redirect_uri=%s&scope=%s&state=%s&login_hint=%s".format(
    response_type, client_id, redirect_uri, scopes, state, email);

  // auto response = net.get(URL);
  net.download(URL, "page.html");

  auto xdgopen = execute(["xdg-open", "page.html"]);
  assert (xdgopen.status == 0);

  writeln("please enter the code here:");
  string incode = stdin.readln();
  writefln("got incode: %s", incode);

  config.object["code"] = JSONValue(incode[0..$-1]);
  file.write("creds.json", config.toPrettyString());
}

void access_refresh_token() {
  immutable string URL = "https://www.googleapis.com/oauth2/v4/token?code=%s&client_id=%s&client_secret=%s&grant_type=authorization_code&redirect_uri=%s".format(
    code.encode, client_id.encode, client_secret.encode, "urn:ietf:wg:oauth:2.0:oob".encode());
  auto customhttp = net.HTTP();
  // redirect_uri=https://oauth2-login-demo.appspot.com/code&
  // customhttp.addRequestHeader("Content-Type", "application/x-www-form-urlencoded");
  try {
    auto response = net.post(URL, "");
  } catch (Exception e) {
    invalidate();
    throw new Exception("INVALIDATING CREDENTIALS!");
  }
  // writeln(response);
}

void makeRequest() {
  auto response = net.get("https://www.googleapis.com/tasks/v1/users/@me/lists?key=%s".format(access_token));
  writeln(response);
}


void main() {
  config = parseJSON(file.readText("creds.json"));

  client_id = config["client_id"].str();
  client_secret = config["client_secret"].str();

  if(config["code"].str() == "NONE") {
    pre_auth();
    access_refresh_token();
  } else {
    writeln("already authenticated");
  }
  code = config["code"].str();
  access_token = config["access_token"].str();
  refresh_token = config["refresh_token"].str();

  makeRequest();

}
