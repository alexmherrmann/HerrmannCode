import std.stdio;
import std.parallelism;
import std.net.curl;
import std.format;

import std.datetime;
import std.conv;
import core.time;

void log(string write) {
  SysTime now = Clock.currTime();
  string timestr = "%02d:%02d:%02d.%04d".format(now.hour, now.minute, now.second, now.fracSecs.total!"msecs");
  writefln("[%s]> %s", timestr , write);
  stdout.flush();
}

void log(char[] write) {log(write.to!string);}

alias carr = const(char[]);
struct AsyncDownload {

  private {
    HTTP internalHttp;
    int size = -1;
    int downloaded = -1;
    bool completed = false;

    TaskPool downloadPool = new TaskPool;
  }

  public this(string urlin) {
    this.internalHttp = HTTP(urlin);
    this.setUp(this.internalHttp);

    // this.downloadTask = null;
  }

  public bool isDone() {
    return this.completed;
  }


  public void execute() {
    auto gettask = task!((ref HTTP h, ref bool c) {
      h.perform();
      c = true;
    })(this.internalHttp, this.completed);
    downloadPool.put(gettask);
    // this.thetask = gettask;
    pragma(msg, typeof(typeid(gettask)));

  }

  public void wait() {
    this.downloadPool.finish(true);
  }

  private void setUp(ref HTTP inhttp) {
    inhttp.onReceive = (ubyte[] input) {
      log("Got %06d bytes".format(input.length));
      downloaded += input.length;
      return input.length;
    };

    inhttp.onReceiveHeader = (carr k, carr v) {
      if(k == "content-length") {
        log("Got content-length of " ~ v);
        this.size = v.to!int;
      }
    };
  }

}
void main() {
  HTTP get1 = HTTP("httpbin.org/ip");
  get1.onReceiveHeader((carr k, carr v) {writefln("%-30s : %s", k, v);});
  get1.perform();

  auto get2 = AsyncDownload("httpbin.org");
  log("Going to begin execution");
  get2.execute();
  log("Started execution");
  get2.wait();
  log("Finished!");
}
