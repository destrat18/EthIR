pragma solidity >=0.4.0 <= 0.4.26;

contract array_neg{

    uint[] counts;
    
    function func3() public view
        returns(uint k){

        uint i;
        for (i = 0; i<counts.length; i=i+1)
        {
            counts.push(i);
            if(counts[i] >= 0)
            {
                break;
            }
        }
        
    }

}