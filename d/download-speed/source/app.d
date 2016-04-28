import std.stdio : stderr, writefln;
import std.algorithm;
import core.time;
import std.datetime;
import std.conv;
import std.file;

// import vibe.d;
import vibe.vibe;
import std.net.curl;
import core.thread;

import std.json;

void sleeptest() {
  Thread.sleep(msecs(20));
}

immutable ulong streamtestlength = 1024 * 24;
immutable string streamtesturl = "https://httpbin.org/stream-bytes/" ~ streamtestlength.to!string;
void curlTest() {
  // auto dat = get(streamtesturl);
  int count = 0;
  ubyte[] alldata;
  auto http = HTTP(streamtesturl);
  http.onReceive = (ubyte[] data) {alldata ~= data; return data.length;};
  http.perform();
  assert (alldata.length == streamtestlength);
  //writeln(alldata.length);

  //write("download.txt", cast(string) alldata);
}

void vibeTest() {
  ulong j;
  requestHTTP(streamtesturl,
    (scope req) {},
    (scope res) {j = res.bodyReader.readAll().length; res.dropBody();}
  );

  // logInfo("%5d == %5d", j, streamtestlength);
  assert (j == streamtestlength);
}


/**
 * Returns the milliseconds it took to runthe function
 */
long time(void function() totime, int reps=30, int warmup=5) {
  int totaltimes = reps + warmup;
  long[] times = new long[totaltimes];

  stderr.writeln("Beginning test....");
  for(int i = 0; i < totaltimes; i++) {
    stderr.writef("\r%4d/%4d", i+1, totaltimes);
    auto start = Clock.currTime();
    totime();
    auto end = Clock.currTime();
    times[i] = (end-start).split!"msecs"().msecs;
  }
  stderr.writeln();

  auto slice = times[warmup..$];

  assert (slice.length == reps);
  return slice.reduce!"a+b"/reps;
}
// TODO: ooh make a parallel one of the above too

void main() {
  stderr.writefln("should be 20: %3d", time(&sleeptest, 15,5));
  stderr.writefln("curl streamtest: %d", time(&curlTest, 8, 2));
  stderr.writefln("vibe streamtest: %d", time(&vibeTest, 8, 2));
  // time(&curlTest,1,0);
}
