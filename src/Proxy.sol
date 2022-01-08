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

  /// TODO: proxy
}
