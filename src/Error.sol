// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.20;

contract Error {
    error CustomError();

    function throwRequire() public pure {
        require(false, "require thrown");
    }

    function throwCustomError() public pure {
        revert CustomError();
    }
}
