pragma solidity ^0.4.25;

contract Sum {
  uint8 a = 3;
  int32 b = 2;
  uint c = 3;
  uint16 d = 7;
 function test (uint n) {
   a = 10;
   int32 x = b;
   c = 11;
   b = d;
   if (b>x){
       a = 5;
     }
   else{
     a = 7;
   }
  }  
}
