
import std.stdio;
import std.parallelism;
import std.format;
import std.datetime;

import core.time;
import core.thread;

void log(string write) {
  SysTime now = Clock.currTime();
  string timestr = "%02d:%02d:%02d.%04d".format(now.hour, now.minute, now.second, now.fracSecs.total!"msecs");
  writefln("[%s]> %s", timestr , write);
}

auto returnIn(in string input, long time) {
  // return "yee";
  auto rval = task!((string s, long t) {Thread.sleep(t.msecs); return s;})(input, time);
  rval.executeInNewThread();
  return rval;
}

void realtest() {
  auto seconds3 = returnIn("Ayy lmao", 3000);
  auto seconds1 = returnIn("Lmao Ayy?", 1000);
  writeln(typeid(typeof(seconds1)));

  log("beginning, executing 1");
  writeln(seconds1.yieldForce());
  log("waiting on 3");
  writeln(seconds3.yieldForce());
  log("done");

  Thread.sleep(50.msecs);
  log("msecs working?");
}

void typetest() {
  auto t = Task(&returnIn, "yes", 40);
}

void main() {
  typetest();
  realtest();
}
