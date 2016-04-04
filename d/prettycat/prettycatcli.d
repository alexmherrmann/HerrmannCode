import prettycat;
import undoprettycat;

import std.stdio;
import std.getopt;

void main(string[] args) {

  immutable string[] copyargs = args.idup;
  string prependstring = "";
  bool nodirname = false;

  GetoptResult optargs;
  try {
    optargs = getopt(args,
      "p|prepend", "What to prepend our added lines with", &prependstring,
      "d|nodirname", "Don't include the directory names when identifying bodies of text", &nodirname);
  } catch(GetOptException goe) {
    writefln("error parsing: %s", copyargs);
    return;
  }

  if (optargs.helpWanted)
  {
      defaultGetoptPrinter("How to use prettycat",
          optargs.options);

      debug {
        writefln("postitional args: %s", args[1..$]);
        writefln("prependstring: [%s]", prependstring);
        writefln("write out dir names?: %s", !nodirname);
      }
       return;
  }

  writeln(doConcurrentCat(prependstring, !nodirname, args[1..$]));
}
