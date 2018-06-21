pragma solidity ^0.4.24;

contract QuoteRegistry {
	address ownerSelf;
    mapping (string => address) quoteRegistry;    
    
    constructor() public payable {
    	ownerSelf = msg.sender;
  	}

 	function owner() public view returns (address) {
  		return ownerSelf;
   	}

  	function register(string _quote) public {
  		// _quote already owned by someone else
  		if (quoteRegistry[_quote] != address(0x0)) {
  			revert();
  		}

  		quoteRegistry[_quote] = msg.sender;
  	}

  	function ownership (string _quote) public view returns (address) {
  		return quoteRegistry[_quote];
  	}

  	function transfer (string _quote, address _newOwner) public payable {
  		 if(msg.value >= 0.5 ether) {
            quoteRegistry[_quote].transfer(0.5 ether);
            quoteRegistry[_quote] = _newOwner;
        }
  	}
}
