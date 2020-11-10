//Task 1 part 2
// Dataflow level
// F=x'y+yz+y
// Designed by Usman Aslam
//FA16-EEE-036
module task1b (F,x,y,z);
  input x,y,z;
  output F;
  assign F = (~x & y) | (y & z) | y;
endmodule
