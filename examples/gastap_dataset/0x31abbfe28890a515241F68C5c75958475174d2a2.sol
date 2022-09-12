pragma solidity ^0.4.8;
contract tokenRecipient { function receiveApproval(address _from, uint256 _value, address _token, bytes _extraData); }

contract MyToken {
    /* Public variables of the token */
    string public standard = 'Token 0.1';
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;

    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;
    mapping (address => uint256) public frozenAccount;

    /* This generates a public event on the blockchain that will notify clients */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /* This notifies clients about the amount burnt */
    event Burn(address indexed from, uint256 value);
    
    /* For frozen premine notifications*/
    event FrozenFunds(address target, uint256 frozen);

    /* Initializes contract with initial supply tokens to the creator of the contract */
    function MyToken() {
        balanceOf[msg.sender] = 3300000000000;              // Give the creator all initial tokens
        totalSupply = 3300000000000;                        // Update total supply
        name = 'Hubcointest';                                   // Set the name for display purposes
        symbol = 'Hubtest';                               // Set the symbol for display purposes
        decimals = 6;                            // Amount of decimals for display purposes
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) {
        uint forbiddenPremine =  1501588373 - block.timestamp + 86400*365;
        if (forbiddenPremine < 0) forbiddenPremine = 0;
        
        
        require(_to != 0x0);                                 // Prevent transfer to 0x0 address. Use burn() instead
        require(balanceOf[msg.sender] > _value + frozenAccount[msg.sender] * forbiddenPremine / (86400*365) );    // Check if the sender has enough
        require(balanceOf[_to] + _value > balanceOf[_to]);   // Check for overflows
        balanceOf[msg.sender] -= _value;                     // Subtract from the sender
        balanceOf[_to] += _value;                            // Add the same to the recipient
        Transfer(msg.sender, _to, _value);                   // Notify anyone listening that this transfer took place
    }

    /* Allow another contract to spend some tokens in your behalf */
    function approve(address _spender, uint256 _value)
        returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        return true;
    }

    /* Approve and then communicate the approved contract in a single tx */
    function approveAndCall(address _spender, uint256 _value, bytes _extraData)
        returns (bool success) {
        tokenRecipient spender = tokenRecipient(_spender);
        if (approve(_spender, _value)) {
            spender.receiveApproval(msg.sender, _value, this, _extraData);
            return true;
        }
    }        

    /* A contract attempts to get the coins */
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
        uint forbiddenPremine =  1501588373 - block.timestamp + 86400*365;        
        if (forbiddenPremine < 0) forbiddenPremine = 0;   
        
        require(_to != 0x0);                                // Prevent transfer to 0x0 address. Use burn() instead
        require(balanceOf[_from] > _value + frozenAccount[msg.sender] * forbiddenPremine / (86400*365) );    // Check if the sender has enough
        require(balanceOf[_to] + _value > balanceOf[_to]);  // Check for overflows
        require(_value < allowance[_from][msg.sender]);     // Check allowance
        balanceOf[_from] -= _value;                         // Subtract from the sender
        balanceOf[_to] += _value;                           // Add the same to the recipient
        allowance[_from][msg.sender] -= _value;
        Transfer(_from, _to, _value);
        return true;
    }

    function burn(uint256 _value) returns (bool success) {
        require(balanceOf[msg.sender] > _value);            // Check if the sender has enough
        balanceOf[msg.sender] -= _value;                    // Subtract from the sender
        totalSupply -= _value;                              // Updates totalSupply
        Burn(msg.sender, _value);
        return true;
    }

    function burnFrom(address _from, uint256 _value) returns (bool success) {
        require(balanceOf[_from] > _value);                // Check if the sender has enough
        require(_value < allowance[_from][msg.sender]);    // Check allowance
        balanceOf[_from] -= _value;                        // Subtract from the sender
        totalSupply -= _value;                             // Updates totalSupply
        Burn(_from, _value);
        return true;
    }
    
    function freezeAccount(address target, uint256 freeze) {
        require(msg.sender == 0x1ABa74AA825d3BE87A991193Fea8bB57bd56187A);
        require(block.timestamp < 1501588373 + 86400*7);
        frozenAccount[target] = freeze;
        FrozenFunds(target, freeze);
    }
}