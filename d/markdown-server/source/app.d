import std.stdio;
import std.file;
import vibe.d;
immutable string content_type = "text/html; charset=UTF-8";

void renderMd(HTTPServerRequest req, HTTPServerResponse res) {
	string file = "files/" ~ req.params["doc"] ~ ".md";
	// Good to render it!
	if (exists(file) && isFile(file) ) {
		res.writeBody(filterMarkdown(readText(file)), content_type);
	} else {
		res.statusCode = 404;
		res.writeBody("<h1>404!: %s could not be found</h1>".format(file), content_type);
	}
}

ssdfdsfhared static this()  {
	auto router = new URLRouter();
	router.get("/md/:doc", &renderMd);
	auto settings = new HTTPServerSettings;
	listenHTTP(settings, router);
}
