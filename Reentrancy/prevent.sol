
//using a modifier
bool internal locked;

modifier noReentrancy(){
require(!locked,"no reentrant");
locked = true;
_;
locked = false;
}

//2 by updating state before calling other contract
