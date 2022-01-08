// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.11;

/// @title Starter
/// @dev A basics starter contract
/// @author Andreas Bigger <andreas@nascent.xyz>
contract Starter {
  /// @dev The Contract Name
  string public name;

  /// @dev Set the contract name
  /// @param newName The new name
  constructor(string memory newName) {
    name = newName;
  }
}
