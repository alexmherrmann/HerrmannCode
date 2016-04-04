module prettycat;

import core.sync.mutex;

import std.file;
import std.parallelism;
import std.stdio;
import std.algorithm;
import std.range.primitives : walkLength;
import std.range : repeat;
import std.array : array;
import std.string : join;

class NonUniqueNamesException : Exception {
  public this(string msg) {
    super(msg);
  }
}

string newline = "\n";

string constructHeader(string filename, string prepend) {
  string rval;

  rval ~= prepend ~ "-".repeat(15).array().join() ~ newline
   ~ prepend ~ filename ~ newline
   ~ prepend ~ "-".repeat(15).array().join() ~ newline;

  return rval;
}

string doConcurrentCat(string prepend, bool dirnames, string[] paths) {

  debug stderr.writefln("Beginning cat on %s", paths);

  string[string] filecontents;
  auto mapwrite = new Mutex();

  if(paths.uniq().walkLength() != paths.length) {
    throw new NonUniqueNamesException("There are duplicate files in the paths string");
  }
  shared string masterstring = "";

  TaskPool readpool = new TaskPool();

  void read(string s) {
    auto contents = readText(s);
    debug stderr.writefln("finished reading %s", s);

    synchronized(mapwrite) {
      debug stderr.writefln("putting %s to map", s);
      filecontents[s] = contents;
    }
    return;
  }

  foreach(string s; paths) {
    if(isFile(s)) {
      debug stderr.writefln("beginning read of %s", s);
      auto contents = task(&read, s);
      readpool.put(contents);
    }
  }
  readpool.finish(true);
  debug stderr.writefln("done with all");

  foreach(string s; filecontents.keys()) {
    debug stderr.writefln("catting %s", s);
    masterstring ~= constructHeader(s, "//");
    masterstring ~= filecontents[s] ~ newline;
  }

  return masterstring;
}

/**
 * Do the pretty cat, but in a serial fashion (should take longer, especially for large files)
 *
 */
string doSerialCat(string prepend, bool dirnames, string[] paths) {
  throw new Exception("Not implemented");
}
