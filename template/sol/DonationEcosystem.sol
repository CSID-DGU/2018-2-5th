pragma solidity ^0.4.24;

import "./Ownable.sol";
import "./SafeMath.sol";
import "./DonationManager.sol";

contract DonationEcosystem is DonationManager {

    using SafeMath for uint;

    event NewDonation(string cardId, address from, address to, string date);

    struct Donation {
        address recipient;
        uint total;
    }

    mapping(uint=>Donation) donations;

    function openDonation(uint _articleId) public {
        donations[_articleId] = Donation(msg.sender, 0);
    }

    function doDonation(uint _articleId) public {
        string storage _cardId = numToCardId[getNumsByOwner(msg.sender)[0]];
        Donation storage _donation = donations[_articleId];
        address _recipient = _donation.recipient;
        cardToOwner[_cardId] = _recipient;
        _donation.total = _donation.total.add(1);
        ownerCardCount[msg.sender] = ownerCardCount[msg.sender].sub(1);
        ownerCardCount[_recipient] = ownerCardCount[_recipient].add(1);
        emit NewDonation(_cardId, msg.sender, _recipient, cards[_cardId].date);
    }

    function getTotal(uint _articleId) public view returns (uint){
        return donations[_articleId].total;
    }

    function getRecipient(uint _articleId) public view returns (address) {
        return donations[_articleId].recipient;
    }
}
