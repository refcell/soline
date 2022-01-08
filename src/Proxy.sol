// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.11;

/// @title Proxy
/// @dev Proxy contract to orchestrate contract redeployment
/// @author Andreas Bigger <andreas@nascent.xyz>
contract Proxy {
  /// @dev The current deployed contract
  address public deployed;

  /// @dev A manager for upgradability
  address public immutable MANAGER;

  /// @dev Set the manager as the deployer
  constructor() {
    MANAGER = msg.sender;
  }

  ///////////////////////////////////////////
  //           DEPLOYMENT LOGIC            //
  ///////////////////////////////////////////

  /// @dev Deploys the deployed to the given address using the create opcode
  function deploy() external returns (address redeployed) {
    assembly {
      // Load the contract 
      let ptr := mload(0x40)

      // sload deployed
      // safe op since address doesn't exceed 256 bits
      let tempdeployed := sload(deployed.slot)

      // ???
      mstore(ptr, 0x3d602d80600a3d3981f3363d3d373d3d3d363d73000000000000000000000000)
      mstore(add(ptr, 0x14), shl(0x60, tempdeployed))
      mstore(add(ptr, 0x28), 0x5af43d82803e903d91602b57fd5bf30000000000000000000000000000000000)
      
      // Copy msg.data into the contract impl
      calldatacopy(0x38, 0, calldatasize())

      // Create the new contract
      redeployed := create(0, ptr, 0x37)

      // Self destruct contract at deployed, recovering gas
      selfdestruct(tempdeployed)

      // Set the new contract
      sstore(deployed.slot, redeployed)
    }
  }

  ///////////////////////////////////////////
  //            CALL DELEGATION            //
  ///////////////////////////////////////////

  /// @dev Receive fallback to delegate calls
  receive() external payable virtual {
    _delegate();
  }

  /// @dev Fallback function simply calls our delegation logic to deployed
  fallback() external payable virtual {
    _delegate();
  }

  /// @dev Delegates a call to the current deployed contract
  function _delegate() internal virtual {
    assembly {
      // Copy msg.data. We take full control of memory in this inline assembly
      // block because it will not return to Solidity code. We overwrite the
      // Solidity scratch pad at memory position 0.
      calldatacopy(0, 0, calldatasize())

      // sload deployed
      // safe op since address doesn't exceed 256 bits
      let tempdeployed := sload(deployed.slot)

      // out and outsize are 0 because we don't know the size yet.
      let result := delegatecall(gas(), tempdeployed, 0, calldatasize(), 0, 0)

      // Copy the returned data.
      returndatacopy(0, 0, returndatasize())

      switch result
      // delegatecall returns 0 on error.
      case 0 {
          revert(0, returndatasize())
      }
      default {
          return(0, returndatasize())
      }
    }
  }

}
