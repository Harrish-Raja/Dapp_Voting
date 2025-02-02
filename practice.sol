// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Practice {



    // int public num = -3;
    // uint public t = 6;
    // address public add = 0x03C6FcED478cBbC9a4FAB34eF9f40767739D1Ff7;
    // bool public status = false ;
    // string public name = "ShamStark";
    // bytes public madeupName = "Kingpin";

    /*
    function functionName(argument) visibility state mutability returns(data type){

    }    
     */
    
    /*
    function Wish() public pure returns(string memory){
        return "Family";
    }

    string public str = "Have a Bump";
    // Get input and change the var str.
    function func(string memory _txt) public {
        str = _txt;
    }

    // Sending a Ether to the Practice contract.
    function Fundme()public payable {} // payable used to transact ether.

    // Arrays
    uint[10] public arr ;
    function addElement(uint _index,uint _element) public {
        arr[_index] = _element;
    }

    // function removeElement() public {
    //     arr.pop();
    // }

    function deleteElement(uint _i) public {
        delete arr[_i];
    }   

    function getArr() public view returns(uint[10] memory){
        return arr;
    }

    function getLen() public view returns(uint){
        return arr.length;
    }

    // Struct - combination of data.
    struct Todo{
        string work;
        bool status;
    }

    Todo todo;

    function addWork(string memory _work, bool _status) public{
        todo = Todo({work:_work,status:_status});
    }

    function getWork() public view returns (string memory){
        return todo.work;
    }
    */

    

    // Mapping 
    mapping(address => uint) public myMap;

    function setValue(address _addr, uint _id) public{
        myMap[_addr] = _id;
    }

    function removeAddress(address _addr) public {
        delete myMap[_addr];
    }

    mapping(address => uint) public balanceOf;

    function fundMe() public payable {
        balanceOf[msg.sender] = msg.value;
        // msg.sender -> (Global Variable)gives current address of the interacting account  
    }

    // Nested mapping
    mapping(address => mapping(uint => bool)) public NestedMap;

    function setNestedMapVal(address _addr, uint _i,bool _bool) public {
        NestedMap[_addr][_i] = _bool;
    }

    function removeNested(address _addr,uint _i) public {
        delete NestedMap[_addr][_i];
    }

    // for loop
    uint public  _no1;
    function forL(uint _num) public returns(string memory){
        for(uint i = 0 ; i< _num ; i++){
            _no1 ++;
        }

        return "The for loop is executed.";
    }

    // Error Handling - revert(),assert(),require()
    // function testRevert(uint _number) public pure{
        
    //     assert(_number != 10);

    // }

    address owner =0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

   


    // error onlyOwner(address owner,address interactor);
    // function testRevert() public view{
    //     if(msg.sender != owner){
    //         revert onlyOwner({
    //             owner : owner,
    //             interactor : msg.sender
    //         });
    //     }
    // }




    // Function Modifiers
    // require() - function

    modifier onlyOwner(){
        require(msg.sender == owner,"Not The Owner");
        _;
    }

    function f() public view onlyOwner returns(string memory){
        // require(msg.sender == owner,"Not The Owner");
        return "I'm The Owner";
    }

    // Example Modifier
    uint public val = 5;
    bool lock;

    modifier onlyOnce(){
        require(!lock,"No-ReEntrance");
        _;
        lock = true;
    }

    function dec() public onlyOnce{
        val--;
    }

    // Events - used to emit the Tranction emmited in the blockchain.
    event Wish(address indexed sender,string message);

    function func()public {
        emit Wish(msg.sender,"The01Kingpin'sden");
    }

    event Paid(address indexed sender,uint indexed amount);
    function Transaction() public payable {
        emit Paid(msg.sender,msg.value);
    }
 

}