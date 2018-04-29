
pragma solidity ^0.4.16;

interface YOURTOKENHERE {
    function transfer(address receiver, uint amount);
}

contract Crowdsale {

    /**
     * Constructor
     * ifSuccessfulSendTo: Address where funds should be sent if sale reaches target
     * goalInEther: What is the target goal for the crowdsale in ethers.
     * durationInMinutes: How long will the crowdsale be running.
     * tokenPriceInEther: How much does each token cost
     * addressOfToken: Where is the token contract deployed.
     */
    function Crowdsale(
        address ifSuccessfulSendTo,
        uint goalInEther,
        uint durationInMinutes,
        uint tokenPriceInEther,
        address addressOfToken
    ) {

    }

    /**
     * Fallback function
     *
     * Default function which gets called when someone sends money to the contract. Will be used for joining sale.
     */
    function () payable {

    }

    /**
     * Modifier used to check if deadline for crowdsale has passed
     */
    modifier afterDeadline() {

    }

    /**
     * Check if the funding goal was reached. Will only be checked if afterDeadline modifier above is true.
     *
     */
    function checkGoalReached() afterDeadline {

    }


    /**
     * Withdraw the funds
     *
     * Will withdraw the money after the deadline has been reached. If the goal was reached, only the owner can withdraw money to the beneficiary account.
     * If you goal was not reached, everyone who participated can withdraw their share.
     */
    function safeWithdrawal() afterDeadline {

    }
}
