// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.28;

contract Base {
  error ErrInvalidAddress(address addr);
  error ErrUnauthorized(address addr);

  modifier validAddress(address addr) {
    require(addr != address(0), ErrInvalidAddress(addr));
    require(addr != address(this), ErrInvalidAddress(addr));
    _;
  }

  modifier only(address addr) {
    require(msg.sender == addr, ErrUnauthorized(addr));
    _;
  }
}
