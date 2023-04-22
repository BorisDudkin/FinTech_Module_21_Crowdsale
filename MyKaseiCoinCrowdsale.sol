pragma solidity ^0.5.0;

import "./KaseiCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundableCrowdsale.sol";


// Have the KaseiCoinCrowdsale contract inherit the following OpenZeppelin:
// * Crowdsale
// * MintedCrowdsale
// contract KaseiCoinCrowdsale is Crowdsale, MintedCrowdsale { // UPDATE THE CONTRACT SIGNATURE TO ADD INHERITANCE
    
//     // Provide parameters for all of the features of your crowdsale, such as the `rate`, `wallet` for fundraising, and `token`.
//     constructor(
//         uint256 rate, // rate in TKNbits - uint256 and uint are interchangeable
//         address payable wallet, // sale beneficiary
//         KaseiCoin token // the KaseiCoin itself that the KaseiCoinCrowdsale will work with
//     )
//         Crowdsale(rate, wallet, token)
//         public  {
//         // constructor can stay empty
//     }
// }

contract KaseiCoinCrowdsale is Crowdsale, CappedCrowdsale, TimedCrowdsale, RefundableCrowdsale {

    constructor(
        uint256 rate,            // rate, in TKNbits
        address payable wallet,  // wallet to send Ether
        KaseiCoin token,            // the token
        uint256 cap,             // total cap, in wei
        uint256 openingTime,     // opening time in unix epoch seconds
        uint256 closingTime,      // closing time in unix epoch seconds
        uint256 goal             // the minimum goal, in wei
    )
        CappedCrowdsale(cap)
        TimedCrowdsale(openingTime, closingTime)
        Crowdsale(rate, wallet, token)
        RefundableCrowdsale(goal)
        public
    {
        // nice, we just created a crowdsale that's only open
        // for a certain amount of time
        // and stops accepting contributions once it reaches `cap`
    }
}

contract KaseiCoinCrowdsaleDeployer {
     // Create an `address public` variable called `kasei_token_address`.
    address public kasei_token_address;
    // Create an `address public` variable called `kasei_crowdsale_address`.
    address public kasei_crowdsale_address;

    // Add the constructor.
    constructor(
        string memory name,
        string memory symbol,
        address payable wallet ,// this address will receive all Ether raised by the sale
        uint256 cap,             // total cap, in wei
        uint256 openingTime,     // opening time in unix epoch seconds
        uint256 closingTime,      // closing time in unix epoch seconds
        uint256 goal
    ) public {
        // Create a new instance of the KaseiCoin contract.
        KaseiCoin token = new KaseiCoin(name, symbol, 0);
        // Assign the token contract’s address to the `kasei_token_address` variable.
        kasei_token_address = address(token);

        // Create a new instance of the `KaseiCoinCrowdsale` contract
        KaseiCoinCrowdsale kasei_crowdsale = new KaseiCoinCrowdsale(1, wallet, token, cap, openingTime, closingTime, goal);
            
        // Aassign the `KaseiCoinCrowdsale` contract’s address to the `kasei_crowdsale_address` variable.
        kasei_crowdsale_address = address(kasei_crowdsale);

        // Set the `KaseiCoinCrowdsale` contract as a minter
        token.addMinter(kasei_crowdsale_address);
        
        // Have the `KaseiCoinCrowdsaleDeployer` renounce its minter role.
        token.renounceMinter();
    }
}
