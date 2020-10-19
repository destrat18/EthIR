{{
  "language": "Solidity",
  "sources": {
    "/home/julian/betx/betx-contracts/contracts/impl/AffiliateRegistry.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/impl/Escrow.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/impl/Initializable.sol": {
pragma solidity ^0.5.16;\n\n\ncontract    },
    "/home/julian/betx/betx-contracts/contracts/impl/Migrations.sol": {
pragma solidity ^0.5.16;\n\ncontract    },
    "/home/julian/betx/betx-contracts/contracts/impl/OutcomeReporter.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/impl/SystemParameters.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/impl/extensions/OrderValidator.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/impl/permissions/OutcomeReporterWhitelist.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/impl/permissions/SuperAdminRole.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/impl/permissions/SystemParamsWhitelist.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/impl/permissions/Whitelist.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/impl/test/DAI.sol": {
pragma solidity ^0.5.16;\n\n/*    },
    "/home/julian/betx/betx-contracts/contracts/impl/tokens/DetailedToken.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/impl/tokens/WETH.sol": {
pragma solidity ^0.5.16;\n\nimport    },
    "/home/julian/betx/betx-contracts/contracts/impl/trading/BaseFillOrder.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/impl/trading/CancelOrder.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/impl/trading/EIP712FillHasher.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/impl/trading/FeeSchedule.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/impl/trading/FillOrder.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/impl/trading/Fills.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/impl/trading/TokenTransferProxy.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/IAffiliateRegistry.sol": {
pragma solidity ^0.5.16;\n\ncontract    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/IEscrow.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/IOutcomeReporter.sol": {
pragma solidity ^0.5.16;\n\nimport    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/ISystemParameters.sol": {
pragma solidity ^0.5.16;\n\ncontract    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/extensions/IOrderValidator.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/permissions/ISuperAdminRole.sol": {
pragma solidity ^0.5.16;\n\ncontract    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/permissions/IWhitelist.sol": {
pragma solidity ^0.5.16;\n\ncontract    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/tokens/IDetailedTokenDAI.sol": {
pragma solidity ^0.5.16;\n\ncontract    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/trading/ICancelOrder.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/trading/IEIP712FillHasher.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/trading/IFeeSchedule.sol": {
pragma solidity ^0.5.16;\n\ncontract    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/trading/IFillOrder.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/trading/IFills.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/trading/IReadOnlyValidator.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/interfaces/trading/ITokenTransferProxy.sol": {
pragma solidity ^0.5.16;\n\ncontract    },
    "/home/julian/betx/betx-contracts/contracts/libraries/LibOrder.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/libraries/LibOrderAmounts.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/libraries/LibOutcome.sol": {
pragma solidity ^0.5.16;\npragma    },
    "/home/julian/betx/betx-contracts/contracts/libraries/LibString.sol": {
pragma solidity ^0.5.16;\npragma    },
    "openzeppelin-solidity/contracts/math/SafeMath.sol": {
      "content": "pragma solidity ^0.5.0;\n\n/**\n * @title SafeMath\n * @dev Unsigned math operations with safety checks that revert on error\n */\nlibrary SafeMath {\n    /**\n    * @dev Multiplies two unsigned integers, reverts on overflow.\n    */\n    function mul(uint256 a, uint256 b) internal pure returns (uint256) {\n        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the\n        // benefit is lost if 'b' is also tested.\n        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522\n        if (a == 0) {\n            return 0;\n        }\n\n        uint256 c = a * b;\n        require(c / a == b);\n\n        return c;\n    }\n\n    /**\n    * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.\n    */\n    function div(uint256 a, uint256 b) internal pure returns (uint256) {\n        // Solidity only automatically asserts when dividing by 0\n        require(b > 0);\n        uint256 c = a / b;\n        // assert(a == b * c + a % b); // There is no case in which this doesn't hold\n\n        return c;\n    }\n\n    /**\n    * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).\n    */\n    function sub(uint256 a, uint256 b) internal pure returns (uint256) {\n        require(b <= a);\n        uint256 c = a - b;\n\n        return c;\n    }\n\n    /**\n    * @dev Adds two unsigned integers, reverts on overflow.\n    */\n    function add(uint256 a, uint256 b) internal pure returns (uint256) {\n        uint256 c = a + b;\n        require(c >= a);\n\n        return c;\n    }\n\n    /**\n    * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),\n    * reverts when dividing by zero.\n    */\n    function mod(uint256 a, uint256 b) internal pure returns (uint256) {\n        require(b != 0);\n        return a % b;\n    }\n}\n"
    },
    "openzeppelin-solidity/contracts/token/ERC20/IERC20.sol": {
      "content": "pragma solidity ^0.5.0;\n\n/**\n * @title ERC20 interface\n * @dev see https://github.com/ethereum/EIPs/issues/20\n */\ninterface IERC20 {\n    function transfer(address to, uint256 value) external returns (bool);\n\n    function approve(address spender, uint256 value) external returns (bool);\n\n    function transferFrom(address from, address to, uint256 value) external returns (bool);\n\n    function totalSupply() external view returns (uint256);\n\n    function balanceOf(address who) external view returns (uint256);\n\n    function allowance(address owner, address spender) external view returns (uint256);\n\n    event Transfer(address indexed from, address indexed to, uint256 value);\n\n    event Approval(address indexed owner, address indexed spender, uint256 value);\n}\n"
    },
    "openzeppelin-solidity/contracts/access/Roles.sol": {
      "content": "pragma solidity ^0.5.0;\n\n/**\n * @title Roles\n * @dev Library for managing addresses assigned to a Role.\n */\nlibrary Roles {\n    struct Role {\n        mapping (address => bool) bearer;\n    }\n\n    /**\n     * @dev give an account access to this role\n     */\n    function add(Role storage role, address account) internal {\n        require(account != address(0));\n        require(!has(role, account));\n\n        role.bearer[account] = true;\n    }\n\n    /**\n     * @dev remove an account's access to this role\n     */\n    function remove(Role storage role, address account) internal {\n        require(account != address(0));\n        require(has(role, account));\n\n        role.bearer[account] = false;\n    }\n\n    /**\n     * @dev check if an account has this role\n     * @return bool\n     */\n    function has(Role storage role, address account) internal view returns (bool) {\n        require(account != address(0));\n        return role.bearer[account];\n    }\n}\n"
    },
    "openzeppelin-solidity/contracts/cryptography/ECDSA.sol": {
      "content": "pragma solidity ^0.5.0;\n\n/**\n * @title Elliptic curve signature operations\n * @dev Based on https://gist.github.com/axic/5b33912c6f61ae6fd96d6c4a47afde6d\n * TODO Remove this library once solidity supports passing a signature to ecrecover.\n * See https://github.com/ethereum/solidity/issues/864\n */\n\nlibrary ECDSA {\n    /**\n     * @dev Recover signer address from a message by using their signature\n     * @param hash bytes32 message, the hash is the signed message. What is recovered is the signer address.\n     * @param signature bytes signature, the signature is generated using web3.eth.sign()\n     */\n    function recover(bytes32 hash, bytes memory signature) internal pure returns (address) {\n        bytes32 r;\n        bytes32 s;\n        uint8 v;\n\n        // Check the signature length\n        if (signature.length != 65) {\n            return (address(0));\n        }\n\n        // Divide the signature in r, s and v variables\n        // ecrecover takes the signature parameters, and the only way to get them\n        // currently is to use assembly.\n        // solhint-disable-next-line no-inline-assembly\n        assembly {\n            r := mload(add(signature, 0x20))\n            s := mload(add(signature, 0x40))\n            v := byte(0, mload(add(signature, 0x60)))\n        }\n\n        // Version of signature should be 27 or 28, but 0 and 1 are also possible versions\n        if (v < 27) {\n            v += 27;\n        }\n\n        // If the version is correct return the signer address\n        if (v != 27 && v != 28) {\n            return (address(0));\n        } else {\n            return ecrecover(hash, v, r, s);\n        }\n    }\n\n    /**\n     * toEthSignedMessageHash\n     * @dev prefix a bytes32 value with \"\\x19Ethereum Signed Message:\"\n     * and hash the result\n     */\n    function toEthSignedMessageHash(bytes32 hash) internal pure returns (bytes32) {\n        // 32 is the length in bytes of hash,\n        // enforced by the type signature above\n        return keccak256(abi.encodePacked(\"\\x19Ethereum Signed Message:\\n32\", hash));\n    }\n}\n"
    }
  },
  "settings": {
    "optimizer": {
      "enabled": true,
      "runs": 200,
      "details": {
        "yul": true
      }
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