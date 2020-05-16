pragma solidity ^0.4.24;

contract Example {

    function foo (uint [] a, uint n) public  {
    	require(n < a.length);
	for (uint i = 0; i < n; i ++) {	    
            a[i] = 0;
        }
    }
}
