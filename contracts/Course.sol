pragma solidity >0.5.2;

contract Course {
  address public admin;

  string public name;

  // courses
  mapping(address => string[]) credentials;

  constructor() public {
    admin = msg.sender;
    name = "Dogecation";
  }

  modifier onlyAdmin() {
    require(msg.sender == admin);
    _;
  }
}
