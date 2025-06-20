// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.2 ;

contract Inbox{
    string public message;

    function setMessage(string memory newMessage) public { 
        message = newMessage; 
    }

    function getMessage() view public  returns (string memory){ 
        return message ; 
    }
}