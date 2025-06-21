// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.2 ;


contract Inbox{
    uint256 public num1=20;
    int8 public num2=20;
    function add() view private returns (int256){
         return int256(num1) + num2;//只能有符号整型转无符号整型
    }
    //任何人都可以调用
    function setValue()  public returns(uint256){
        num1=30;
        return num1;
    }
    //只有合约本身可以调用
    function setValue1()  private  {
        num1=30;
    }
     string public str;
    //向合约付钱
    function pay(string memory src ) public payable {
        str=src;
    }
    //获取余额
    function getContractBalance()  view public returns (uint256)  {
        return address(this).balance;
    }
    address public addr1=0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    //获取转账地址的余额
    function getBalance()  view public returns (uint256)  {
        return addr1.balance;
    }
    //合约向指定地址转账
    function transfer() public{
        payable (addr1).transfer(10**18);
    }
    //数组
    bytes1 b1="h";
    bytes20 b20="helloworld";
    function getLen() view public  returns (bytes20){
        return b20;
    }
    //枚举
    enum Weekdays{
        Mon,Tues,Wednseday ,Thursday 
    }
    Weekdays currentDay;
    function getWeekday() view public returns (Weekdays){
        return currentDay;
    }

}