pragma solidity >0.5.2;

contract Course {
  address public admin;

  string public _name;

  // courses
  mapping(address => string[]) credentials;

  mapping(uint256 => address) _owners;

  uint256 public _tokenCount;

  constructor() public {
    admin = msg.sender;
    _name = "Dogecation";
    _tokenCount = 1;
  }

  event Transfer(
    address indexed from,
    address indexed to,
    uint256 indexed tokenId
  );

  modifier onlyAdmin() {
    require(msg.sender == admin);
    _;
  }

  function addTokenTo(address to, uint256 tokenId) private {
    _owners[tokenId] = to;
  }

  function mint(address to, uint256 tokenId) public {
    require(to != address(0));
    addTokenTo(to, tokenId);
    emit Transfer(address(0), to, tokenId);
  }
}
