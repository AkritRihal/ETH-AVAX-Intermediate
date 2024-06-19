// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ExampleContract {
    uint256 public value;

    constructor(uint256 _initialValue) {
        require(_initialValue > 0, "Initial value must be greater than zero");
        value = _initialValue;
    }

    function setValue(uint256 _value) public {
        require(_value > 0, "Value must be greater than zero");
        value = _value;
    }

    function incrementValue() public {
        uint256 newValue = value + 1;
        assert(newValue > value); 
        value = newValue;
    }

    function resetValue() public {
        if (value <= 10) {
            revert("Current value is too low to reset");
        }
        value = 0;
        
    }
}
