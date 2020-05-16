pragma solidity ^0.4.11;

contract Loop1{

  uint sum = 0;
  uint number = 0;
  
  function multiply(uint a){
    
    for(uint i = 0; i<a; i++){
      if(i<5){
          sum = sum-number;
      }else{
        
        sum = sum+number;
      }
    }

  }

  function enter(){
    number = 5;
    multiply(7);    
  }


}
