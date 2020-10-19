{{
  "language": "Solidity",
  "sources": {
    "/home/julian/betx/betx-contracts/contracts/impl/permissions/SuperAdminRole.sol": {
      "keccak256": "0x5dc1514aa7825b62bb419effa1ef57b9e09de7cd49e26d769618e638c9f1c305",
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/permissions/ISuperAdminRole.sol": {
      "keccak256": "0x6ad66846e01a39300df731455ab5aa8984edd52807700a5da232fecef83532e9",
pragma solidity ^0.5.16;\n\ncontract    },
    "openzeppelin-solidity/contracts/access/Roles.sol": {
      "keccak256": "0x659ba0f9a3392cd50a8a5fafaf5dfd8c6a0878f6a4613bceff4e90dceddcd865",
      "content": "pragma solidity ^0.5.0;\n\n/**\n * @title Roles\n * @dev Library for managing addresses assigned to a Role.\n */\nlibrary Roles {\n    struct Role {\n        mapping (address => bool) bearer;\n    }\n\n    /**\n     * @dev give an account access to this role\n     */\n    function add(Role storage role, address account) internal {\n        require(account != address(0));\n        require(!has(role, account));\n\n        role.bearer[account] = true;\n    }\n\n    /**\n     * @dev remove an account's access to this role\n     */\n    function remove(Role storage role, address account) internal {\n        require(account != address(0));\n        require(has(role, account));\n\n        role.bearer[account] = false;\n    }\n\n    /**\n     * @dev check if an account has this role\n     * @return bool\n     */\n    function has(Role storage role, address account) internal view returns (bool) {\n        require(account != address(0));\n        return role.bearer[account];\n    }\n}\n"
    },
    "openzeppelin-solidity/contracts/math/SafeMath.sol": {
      "keccak256": "0x965012d27b4262d7a41f5028cbb30c51ebd9ecd4be8fb30380aaa7a3c64fbc8b",
      "content": "pragma solidity ^0.5.0;\n\n/**\n * @title SafeMath\n * @dev Unsigned math operations with safety checks that revert on error\n */\nlibrary SafeMath {\n    /**\n    * @dev Multiplies two unsigned integers, reverts on overflow.\n    */\n    function mul(uint256 a, uint256 b) internal pure returns (uint256) {\n        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the\n        // benefit is lost if 'b' is also tested.\n        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522\n        if (a == 0) {\n            return 0;\n        }\n\n        uint256 c = a * b;\n        require(c / a == b);\n\n        return c;\n    }\n\n    /**\n    * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.\n    */\n    function div(uint256 a, uint256 b) internal pure returns (uint256) {\n        // Solidity only automatically asserts when dividing by 0\n        require(b > 0);\n        uint256 c = a / b;\n        // assert(a == b * c + a % b); // There is no case in which this doesn't hold\n\n        return c;\n    }\n\n    /**\n    * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).\n    */\n    function sub(uint256 a, uint256 b) internal pure returns (uint256) {\n        require(b <= a);\n        uint256 c = a - b;\n\n        return c;\n    }\n\n    /**\n    * @dev Adds two unsigned integers, reverts on overflow.\n    */\n    function add(uint256 a, uint256 b) internal pure returns (uint256) {\n        uint256 c = a + b;\n        require(c >= a);\n\n        return c;\n    }\n\n    /**\n    * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),\n    * reverts when dividing by zero.\n    */\n    function mod(uint256 a, uint256 b) internal pure returns (uint256) {\n        require(b != 0);\n        return a % b;\n    }\n}\n"
    }
  },
  "settings": {
    "evmVersion": "istanbul",
    "libraries": {},
    "optimizer": {
      "details": {
        "constantOptimizer": true,
        "cse": true,
        "deduplicate": true,
        "jumpdestRemover": true,
        "orderLiterals": true,
        "peephole": true,
        "yul": true,
        "yulDetails": {
          "stackAllocation": true
        }
      },
      "runs": 200
    },
    "remappings": [],
    "outputSelection": {
      "*": {
        "*": [
          "evm.bytecode",
          "evm.deployedBytecode",
          "abi"
        ]
      }
    }
  }
}}