// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.23;

contract Timer {
    uint timeStart = block.timestamp;
    uint timeNow = timeStart;
    uint timeSystem = timeStart;
    uint timeDif = 0;
    uint deltaTime = (timeSystem - timeStart)/60;
    // setDeltaTime function
    function setDeltaTime() internal { 
        deltaTime = (timeSystem - timeStart)/60; 
    }
    //function for skip 1 min in system
    function skipTime() public {
       timeDif = timeDif + 1 * 60;
       timeSystem = timeNow + timeDif;
       setDeltaTime();
    }
    function viewTime () public view returns(uint,uint,uint,uint,uint) {
        return (timeStart, timeNow, timeSystem, timeDif, deltaTime);
    }
    //cycle time function
    function cycleTime() public  {
        timeNow = block.timestamp;
        setDeltaTime();
    }
}