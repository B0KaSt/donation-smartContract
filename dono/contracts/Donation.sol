//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Donation {
    address payable ow;
    uint alldono;
    
    struct dono {
        address users;
        uint am;
    }

    mapping(address => dono) public donos;
    mapping(int8 => address) public id;
    int8 public idSize = 0;

    constructor() {
        ow = payable(msg.sender);
    }

    function donate() public payable {
        if (donos[msg.sender].am > 0) {
            donos[msg.sender].am += msg.value;
        }
        else {
            idSize++;
            donos[msg.sender].am = msg.value;
            donos[msg.sender].users = msg.sender;
        }
        alldono += msg.value;
    }

    function get() public view returns (uint) {
        return alldono;
    }

    function GetU() public view returns (address) {
        for (int8 index = 0; index < idSize; index++) {
            return donos[id[index]].users;
        }
    }

    function out(address payable gol) public {
        require(ow == msg.sender);
        gol.transfer(alldono);
        alldono = 0;
    }
}
