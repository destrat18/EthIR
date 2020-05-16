contract Prueba {

  uint b;
  uint c;
  uint[] private pp;
  uint a;

  /* function pp(uint n) returns (uint) { */
  /*   return pp[n]; */
  /* } */
    
  
  function m(uint i){    
    pp[0] = 3;
    pp[1] = 4;
    pp[2] = 6;
    pp[3] = 5;
    delete pp[i];
    
    //pp.length+=1;
    //pp[a] = 19;

  }


}
