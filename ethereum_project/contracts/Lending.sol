pragma solidity ^0.8.0;

contract Lending {
    address[16] public lenders;
    string[16] public titles;
    
    function createBook(uint bookId, string memory title) public returns (uint) {
        require (0 <= bookId && bookId <= 15);
        titles[bookId] = title;
        return bookId;
    }

    function removeBook(uint bookId) public returns (uint) {
        require (0 <= bookId && bookId <= 15);
        titles[bookId] = "";
        return bookId;
    }
    function lendBook(uint bookId) public returns (uint) {
        require (0 <= bookId && bookId <= 15);
        lenders[bookId] = msg.sender;
        return bookId;
    }

    function returnBook(uint bookId) public returns (uint) {
        require (0 <= bookId && bookId <= 15);
        lenders[bookId] = address(0);
        return bookId;
    }

    function getLenders() public view returns (address[16] memory) {
        return lenders;
    }

    function getTitles() public view returns (string[16] memory) {
        return titles;
    }
}