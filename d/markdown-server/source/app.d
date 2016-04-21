import std.stdio;
import std.file;
import vibe.d;
immutable string content_type = "text/html; charset=UTF-8";

void renderMd(HTTPServerRequest req, HTTPServerResponse res) {
  string file = "files/" ~ req.params["doc"] ~ ".md";
  // Good to render it!
  //TODO: switch all functions to vibe.d functions
  if (exists(file) && isFile(file) ) {
    res.writeBody(filterMarkdown(readFileUTF8(file)), content_type);
  } else {
    res.statusCode = 404;
    res.writeBody("<h1>404!: %s could not be found</h1>".format(file), content_type);
  }
}

void showMainPage(HTTPServerRequest req, HTTPServerResponse res) {
  FileInfo[] infos;
  listDirectory("files", (FileInfo info) { infos ~= info; return false; });
  res.render!("basicpage.dt", infos);
}

static this()  {
  auto router = new URLRouter();
  router.get("/", &showMainPage);
  router.get("/md/:doc", &renderMd);
  auto settings = new HTTPServerSettings;
  listenHTTP(settings, router);
}
