// SPDX-License-Identifier: GPL-3.0
  
pragma solidity 0.8.30;

contract SeniorFeature {
    /* address public owner;
    uint256 a;
    address public caller;
    //指定合约的归属者,构造函数部署后只运行一次,owner是不会变化的
    constructor() {
        owner=msg.sender;
    }
    //获取调用合约函数的使用者,可用来权限控制
    function setValue(uint256 input) public{
        a=input;
        caller =msg.sender;
    }

    modifier lessvalue(uint value){
        require(value>=100,unicode"转账金额不能少于100wei");
        _;//代表这个修饰器所修饰函数的代码
    }

    //事件
    event payEvent(address,uint256,uint);

    uint256 public money;
    //获取合约获得的金额(带错误处理)
    function pay() lessvalue(msg.value) public payable {
        //require(msg.value>=100,unicode"转账金额不能少于100wei");
        //assert(msg.value>=100);
        //revert();
        emit payEvent(msg.sender,msg.value ,block.timestamp );//发送事件
        money=msg.value;
    }

    //全局变量
    bytes32 public blockhash1;
    address public coinbase;
    uint public difficulty1;
    uint public gaslimit1;
    uint public blocknumber;
    uint public timestamp1;
    bytes public data;
    address public msgsender;
    bytes4 public msgsig;
    uint public msgvalue;
    uint public txgasprice;
    //展示全局变量
    function getBlockInfo() public payable {
        blocknumber   =    block.number;
        blockhash1=blockhash(blocknumber-1);
        coinbase = block.coinbase;
        difficulty1 =  block.prevrandao;
        gaslimit1  =   block.gaslimit;
        timestamp1    =  block.timestamp;
        data        =      msg.data;
        msgsender =  msg.sender;
        msgsig  =   bytes4(msg.sig);
        msgvalue   =    msg.value;
        txgasprice =block.basefee;
    } */

    function getValue() pure public returns (uint256){
        return 200;
    }

    function info() public payable returns(uint ret) {
        return 42;
    }

    function getBalance1() public view returns (uint256){
        return  address(this).balance;
    }

    
   

}

contract C{
    SeniorFeature public seniorFeature;
    //使用外部合约的方式
    function getBlockNumberValue() public returns (uint256){
        seniorFeature=new SeniorFeature();
        return seniorFeature.getValue();
    }
    //通过合约地址使用外部合约的方式
    function getBlockNumberValue1(address addr) public returns (uint256){
        seniorFeature=SeniorFeature(addr);
        return seniorFeature.getValue();
    }
    //合约之间转账
    function getBlockNumberValue2(address addr) public payable{
        seniorFeature=SeniorFeature(addr);
        seniorFeature.info{value:100,gas:800}();
    }

    function pay1() public payable  {
        
    }

    function getBalance2() public view returns (uint256){
        return  address(this).balance;
    }
    //元组
    function getTuple() public pure returns (uint, bool, string memory) {
        return (10, true, "hello");
    }

    
    //加密函数:keccak256
    function getHash() public pure returns (bytes32){
        return keccak256(abi.encodePacked("hello","b",uint256(1),"abc"));
     }
    

}

//继承  最远继承原则
contract inherit is C,SeniorFeature{
    //同一方法继承的是最远的

    string public str="hello";
    uint[5] public arr=[1,2,3,4,5];
    uint[] public arr1=[1,2,3,4,5];
    mapping (string => uint) public map1;
    
    
    function setMap() public {
        map1["hello"]=20;
    }

    function getMap() view public returns (uint) {
        return map1["hello"];
    }

    //delete关键字
    function deleteValue()  public {
        map1["hello"]=20;
        delete str;
        delete arr;
        delete arr1;
        delete map1["hello"];
    }
}