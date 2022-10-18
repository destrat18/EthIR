pragma solidity >=0.4.0 <= 0.4.26;

contract FunctionCall{

    function callee(uint a, uint b) returns (uint) {
        return a+b;
    }

    function caller() public
    {
        callee(1, 2);
    }
}