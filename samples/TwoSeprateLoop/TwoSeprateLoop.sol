pragma solidity >=0.4.0 <= 0.4.26;

contract TwoSeprateLoop{
    function func3(uint k1, uint k2) public
    {
        for(uint i = 0; i < k1; i++)
        {}
        for(uint j = 0; j < k2; j++)
        {}
    }
}