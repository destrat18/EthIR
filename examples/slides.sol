contract A{
  uint a;
  uint b;
  
  function set(uint m, uint n){
    a = m;
    b = n;}
  function pow(uint m,uint n) returns (uint[]){
    uint[] memory results;
    set(m,n);
    for(uint i=0;i<a;i++)
      results[i] = b*i;
    return results;}
  function main(){
    pow(5,4);
  }
}
