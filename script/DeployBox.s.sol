// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "forge-std/Script.sol";
import "../src/BoxV1.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

contract DeployBox is Script {
    function run() external returns (address) {
        address proxy = deployBox();
        return proxy;
    }

    function deployBox() public returns (address) {
        vm.startBroadcast();
        BoxV1 box1 = new BoxV1(); //implementation/logic
        ERC1967Proxy proxy = new ERC1967Proxy(address(box1), "");
        vm.stopBroadcast();
        return address(proxy);
    }
}
