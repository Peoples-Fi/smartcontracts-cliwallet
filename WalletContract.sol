// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract WalletContract {

    uint256 private constant MIN = 10000000000000000; // AMOUNT FROM NATIVE TOKEN
    address private constant HOT_WALLET = 0xC1516e5a9bfb19aB80602deD8D6233c805E2A0F3; //POLYGON MUMBAI TESNET (TEMPORARY)

    event DepositedOnPFDapp();

    function forward() private {
        if(msg.value >= MIN){
            (bool success, ) = payable(HOT_WALLET).call{value: address(this).balance}("");
            require(success);
            emit DepositedOnPFDapp();
        }
    }

    receive() external payable { forward();}
    fallback() external payable { forward();}
}