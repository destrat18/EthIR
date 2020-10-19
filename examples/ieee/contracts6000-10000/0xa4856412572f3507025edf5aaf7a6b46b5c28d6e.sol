{"EIP20Interface.sol":{"content":"pragma solidity ^0.4.21;\r\n\r\n\r\ncontract EIP20Interface {\r\n\r\n    uint256 public totalSupply;\r\n\r\n    function balanceOf(address _owner) public view returns (uint256 balance);\r\n\r\n    function transfer(address _to, uint256 _value) public returns (bool success);\r\n\r\n    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);\r\n\r\n    function approve(address _spender, uint256 _value) public returns (bool success);\r\n\r\n    function allowance(address _owner, address _spender) public view returns (uint256 remaining);\r\n\r\n    event Transfer(address indexed _from, address indexed _to, uint256 _value);\r\n    event Approval(address indexed _owner, address indexed _spender, uint256 _value);\r\n}"},"HUGS.sol":{"content":"/*\r\nImplements EIP20 token standard: https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md\r\n.*/\r\n\r\n\r\npragma solidity ^0.4.21;\r\n\r\nimport \"./EIP20Interface.sol\";\r\n\r\n\r\ncontract HUGS is EIP20Interface {\r\n    \r\n    uint256 constant private MAX_UINT256 = 2**256 - 1;\r\n    mapping (address =\u003e uint256) public balances;\r\n    mapping (address =\u003e mapping (address =\u003e uint256)) public allowed;\r\n    string public name;             \r\n    uint8 public decimals;            \r\n    string public symbol;   \r\n    \r\n    constructor(\r\n        uint256 _initialAmount,\r\n        string _tokenName,\r\n        uint8 _decimalUnits,\r\n        string _tokenSymbol\r\n    ) \r\n    public\r\n    {\r\n        balances[msg.sender] = _initialAmount;        \r\n        totalSupply = _initialAmount;       \r\n        name = _tokenName;                              \r\n        decimals = _decimalUnits;                       \r\n        symbol = _tokenSymbol;                             \r\n    }\r\n\r\n    function transfer(address _to, uint256 _value) public returns (bool success) {\r\n        require(balances[msg.sender] \u003e= _value);\r\n        balances[msg.sender] -= _value;\r\n        balances[_to] += _value;\r\n        emit Transfer(msg.sender, _to, _value); //solhint-disable-line indent, no-unused-vars\r\n        return true;\r\n    }\r\n\r\n    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {\r\n        uint256 allowance = allowed[_from][msg.sender];\r\n        require(balances[_from] \u003e= _value \u0026\u0026 allowance \u003e= _value);\r\n        balances[_to] += _value;\r\n        balances[_from] -= _value;\r\n        if (allowance \u003c MAX_UINT256) {\r\n            allowed[_from][msg.sender] -= _value;\r\n        }\r\n        emit Transfer(_from, _to, _value); //solhint-disable-line indent, no-unused-vars\r\n        return true;\r\n    }\r\n\r\n    function balanceOf(address _owner) public view returns (uint256 balance) {\r\n        return balances[_owner];\r\n    }\r\n\r\n    function approve(address _spender, uint256 _value) public returns (bool success) {\r\n        allowed[msg.sender][_spender] = _value;\r\n        emit Approval(msg.sender, _spender, _value); //solhint-disable-line indent, no-unused-vars\r\n        return true;\r\n    }\r\n\r\n    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {\r\n        return allowed[_owner][_spender];\r\n    }\r\n}"}}