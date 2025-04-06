pragma solidity ^0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Lending.sol";

contract TestLending {
    Lending lending = Lending(DeployedAddresses.Lending());

    uint expectedId = 8;
    address expectedAddress = address(this);

    function testCreateBook() public {
        uint returnedId = lending.createBook(expectedId, "Moby Dick");
        string[16] memory titles = lending.getTitles();
        Assert.equal(returnedId, expectedId, "Function should return ID of created book");
        Assert.equal(titles[expectedId], "Moby Dick", "function should set book title");
    }

    function testCanLend() public {
        uint returnedId = lending.lendBook(expectedId);
        Assert.equal(returnedId, expectedId, "Function should return ID of lended book");
    }

    function testGetLenderByBookId() public {
        address lender = lending.lenders(expectedId);

        Assert.equal(lender, expectedAddress, "Lender of the expected book should be this contract");
    }

    function testGetLenderArray() public {
        address[16] memory lenders = lending.getLenders();
        Assert.equal(lenders[expectedId], expectedAddress, "Lender of the expected book should be this contract");
    }

    function testCanReturn() public {
        lending.returnBook(expectedId);
        address[16] memory lenders = lending.getLenders();
        Assert.equal(lenders[expectedId], address(0), "Returning book should clear lender array");
    }

    function testCanRemove() public {
        lending.removeBook(expectedId);
        string[16] memory titles = lending.getTitles();
        Assert.equal(titles[expectedId], "", "Removing book should unset title");
    }
}