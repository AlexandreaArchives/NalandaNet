pragma solidity ^0.6.12;

// Ref: https://erc721.org/

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract TrajectoryToken is ERC721 {
    // Stores all game trajectories that have been made into tokens
    string[] public _pathways;
    mapping(string => bool) _pathExists;

    constructor() public ERC721("Trajectory", "TJR") {}

    function mint(string memory _path) public {
        require(_pathExists[_path] != true, "Trajectory already exists");

        _pathways.push(_path);
        uint256 _id = _pathways.length - 1;

        _mint(msg.sender, _id);

        _pathExists[_path] = true;
    }
}
