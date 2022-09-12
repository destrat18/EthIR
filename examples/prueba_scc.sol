pragma solidity ^0.4.11;

contract Sum {
 function testfunc (uint n) returns (uint) {
   uint c = 5;
   for(uint i=0;i<n;i++)
     for(uint j = 0;j<n;j++)
       c = c+1;
  }  
}
