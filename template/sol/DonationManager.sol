pragma solidity ^0.4.24;

import "./Ownable.sol";
import "./SafeMath.sol";

contract DonationManager {

    using SafeMath for uint;

    event NewCard(string cardId, string date, string typeOf);

    struct Card {
        string date;
        string typeOf;
        string used;
    }

    uint totalCardCount;
    mapping(string => Card) cards;
    mapping(address => uint) internal ownerCardCount;
    mapping(string => address) internal cardToOwner;
    string[] public numToCardId;

    function creatCard(string _id, string _date, string _typeOf, address _to) public {

        cards[_id] = Card(_date, _typeOf, "unused");
        cardToOwner[_id] = _to;
        numToCardId.push(_id);
        ownerCardCount[_to] = ownerCardCount[_to].add(1);
        totalCardCount = totalCardCount.add(1);
        emit NewCard(_id, _typeOf, _date);
    }

    function getNumsByOwner(address _owner) public view returns (uint[]) {
        uint[] memory result = new uint[](ownerCardCount[_owner]);
        uint counter = 0;
        for (uint i = 0; i < totalCardCount; i++) {
          if (cardToOwner[numToCardId[i]] == _owner) {
            result[counter] = i;
            counter++;
          }
        }
        return result;
    }

    function getCard(address _owner, uint _count) public view returns (string, string, string, string) {

        return (
            numToCardId[getNumsByOwner(_owner)[_count]],
            cards[numToCardId[getNumsByOwner(_owner)[_count]]].date,
            cards[numToCardId[getNumsByOwner(_owner)[_count]]].typeOf,
            cards[numToCardId[getNumsByOwner(_owner)[_count]]].used
        );
    }
    function getCount(address _from) public view returns (uint) {

        return ownerCardCount[_from];
    }
    function getOwner(string _cardId) public view returns (address) {

        return cardToOwner[_cardId];
    }

    function ofOwner(string _cardId, address _owner) public view returns (bool) {

        return (_owner == cardToOwner[_cardId]);
    }

}
