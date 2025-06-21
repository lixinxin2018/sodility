// SPDX-License-Identifier: GPL-3.0
  
pragma solidity 0.8.30;

contract RefType {
    // 声明一个 bytes 类型的状态变量
    bytes public data; //状态变量默认是storage


    // 函数：获取 bytes 数据
    function getData() public view returns (bytes memory) {
        return data;
    }

    // 函数：设置 bytes 数据
    function setData(bytes memory newData) public {
        data = newData;
    }
    // 函数: 通过索引获取数据
    function getByIndex(uint index) view public returns(bytes1){
        return data[index];
    }

    // 函数：通过索引设置单个字节
    function setByteAtIndex(uint index, bytes1 newByte) public {
        require(index < data.length, "Index out of bounds");
        data[index] = newByte;
    }

    // 函数：追加字节到 bytes 数组
    function appendByte(bytes1 newByte) public {
        data.push(newByte);
    }

    // 函数：从 bytes 数组中移除最后一个字节
    function removeLastByte() public {
        require(data.length > 0, "Bytes is empty");
        data.pop();
    }

    // 函数：将 string 转换为 bytes
    function stringToBytes(string memory str) public pure returns (bytes memory) {
        return bytes(str);
    }

    // 函数：将 bytes 转换为 string
    function bytesToString(bytes memory byteData) public pure returns (string memory) {
        return string(byteData);
    }
    //bytes10-bytes-string
    bytes10 public b10=0x68656c6c6f776f726c64;
    bytes public bs=new bytes(10);
    function fixbyteToBytes() public {
        for (uint256 i ;i<b10.length;i++){
            bs[i]=b10[i];
        }
    }
    string public str1;
    function fixbyteToString() public{
        fixbyteToBytes();
        str1=bytesToString(bs);
    }
    string public name="lily"; //状态变量默认是storage引用传递
    uint256 public num=10;//状态变量默认是storage引用传递

    function call1() public{
        setName1(name);
    }

    function call2() public{
        setName2(name);
    }
    //参数默认是memory值传递
    function setName1(string memory input) private {
        num=20;
        bytes(input)[0]="L";
    }
    //参数可显示指定为引用类型
    function setName2(string storage input) private {
        num=30;
        bytes(input)[0]="L";
    }
    //局部变量为字符串、数组、结构体的默认是sotrage
    function localTest() public{
        string storage tmp=name; 
        num=40;
        bytes(tmp)[0]="L";
    }
    //定长数组
    uint256[5] public nums=[1,2,3,4,5];
    uint256 public sum;
    //获取长度
    function getLen() view public returns (uint256){
        return nums.length;
    }
    //求和
    function total() public returns (uint256){
        for(uint256 i;i<getLen();i++){
            sum+=nums[i];
        }
        return sum;
    }
    //修改
    function modify(uint256 index,uint256 value) public {
        nums[index]=value;
    }
    //不定长数组
    uint256[] public dymaticArr=[1,2,3,4,5];
    //uint256[] public arr=new uint256[](7);
    function pushData(uint256 n) public{
        dymaticArr.push(n);
    }
    //局部变量无法改变长度
    function newArr() pure public{
        uint256[] memory arr=new uint256[](7);
        //arr.length=100;
    }
    //结构体
    struct Student{
        string name;
        uint age;
        bool sex;
    }
    //赋值
    Student public stu1=Student("lily",20,true);
    Student public stu2=Student({name:"tom",age:30,sex:false});
    //不能直接返回,可通过元组处理
    function getStudent() view public returns (Student memory){
        return stu1;
    }
    //映射
    mapping(uint256=>string) public id_name;
    constructor() {
        id_name[0x11]="lily";
        id_name[0x33]="tom";
    }

    function getNameByid(uint256 index) view public returns (string memory){
        return id_name[index];
    }

}