{{
  "language": "Solidity",
  "sources": {
    "/home/julian/betx/betx-contracts/contracts/impl/trading/Fills.sol": {
      "keccak256": "0x10c992f1789b047ca9fcb02b823bb76a0ea519a4a647a4a1262e422eecb0c0a4",
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/trading/ICancelOrder.sol": {
      "keccak256": "0x4e4177b0180817c7f707a385ba70ee6976a6381fbac5b40c226af4e8c9c31806",
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/trading/IFillOrder.sol": {
      "keccak256": "0x913ab0babd2dff79480ceb1870c6daab0ca4915e46e67fd8c8e2f919cb64c970",
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/trading/IFills.sol": {
      "keccak256": "0xfea2ad6a899e4792dcdd4b6f4d1f7a77a6944583eb0f79e62c6610ede6a1ec1a",
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/libraries/LibOrder.sol": {
      "keccak256": "0xa391c14ee06c57f6c5f81ee05684535fa02e6e1ea7d83b0b03879f4cad128a0a",
pragma solidity ^0.5.16;\npragma    },
    "openzeppelin-solidity/contracts/cryptography/ECDSA.sol": {
      "keccak256": "0xb48974d92a87053dc1d6c5389f3d1b2ad522dec23afcb508eaa935d98dfdc0b6",
      "content": "pragma solidity ^0.5.0;\n\n/**\n * @title Elliptic curve signature operations\n * @dev Based on https://gist.github.com/axic/5b33912c6f61ae6fd96d6c4a47afde6d\n * TODO Remove this library once solidity supports passing a signature to ecrecover.\n * See https://github.com/ethereum/solidity/issues/864\n */\n\nlibrary ECDSA {\n    /**\n     * @dev Recover signer address from a message by using their signature\n     * @param hash bytes32 message, the hash is the signed message. What is recovered is the signer address.\n     * @param signature bytes signature, the signature is generated using web3.eth.sign()\n     */\n    function recover(bytes32 hash, bytes memory signature) internal pure returns (address) {\n        bytes32 r;\n        bytes32 s;\n        uint8 v;\n\n        // Check the signature length\n        if (signature.length != 65) {\n            return (address(0));\n        }\n\n        // Divide the signature in r, s and v variables\n        // ecrecover takes the signature parameters, and the only way to get them\n        // currently is to use assembly.\n        // solhint-disable-next-line no-inline-assembly\n        assembly {\n            r := mload(add(signature, 0x20))\n            s := mload(add(signature, 0x40))\n            v := byte(0, mload(add(signature, 0x60)))\n        }\n\n        // Version of signature should be 27 or 28, but 0 and 1 are also possible versions\n        if (v < 27) {\n            v += 27;\n        }\n\n        // If the version is correct return the signer address\n        if (v != 27 && v != 28) {\n            return (address(0));\n        } else {\n            return ecrecover(hash, v, r, s);\n        }\n    }\n\n    /**\n     * toEthSignedMessageHash\n     * @dev prefix a bytes32 value with \"\\x19Ethereum Signed Message:\"\n     * and hash the result\n     */\n    function toEthSignedMessageHash(bytes32 hash) internal pure returns (bytes32) {\n        // 32 is the length in bytes of hash,\n        // enforced by the type signature above\n        return keccak256(abi.encodePacked(\"\\x19Ethereum Signed Message:\\n32\", hash));\n    }\n}\n"
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