//Task 1 part 1
// Gate level
// F=x'y+yz+y
// Designed by Usman Aslam
//FA16-EEE-036
module task1a (F,x,y,z);
  input x,y,z;
  output F;
  wire n1, n2, n3;
  not a1 (n1,x);
  and a2 (n2, n1, y);
  and a3 (n3, y, z);
  or a4 (F, n2, n3, y);
endmodule
  
  
