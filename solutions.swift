///////////////////////////
// 1.5.1 Using the not operator
// Version 1

for i in 1 ... 4 {
    moveForward()
    if isOnGem{
        collectGem()
    }
    else if !isOnGem{
        turnLeft()
        moveForward()
        moveForward()
        turnLeft()
        turnLeft()
        collectGem()
        moveForward()
        moveForward()
        turnLeft()
    }
}

///////////////////////////////////////
// version 2

for k in 1...8{
    moveForward()
        if isOnGem{
            collectGem()
        }
        else if !isOnGem{
            turnLeft()
            moveForward()
            moveForward()
            collectGem()
            turnLeft()
            turnLeft()
            moveForward()
            moveForward()
        }
}

///////////////////////////////////
/// 1.5.2 Spiral of not
// noobish///

for i in 1 ... 13 {
    moveForward()
    if isBlocked{
        turnLeft() 
        if isOnClosedSwitch{
            toggleSwitch()
    }
    }
}

while !isOnClosedSwitch{
    moveForward()
    if isBlocked{
        turnLeft()
    }
    if isOnClosedSwitch{
        toggleSwitch()
        break
    }
}
//////////////////////////////////////////////////
// pro //

for k in 1...16 {
    guard !isBlocked else { 
        turnLeft()
        continue 
    }
    moveForward()
    if isOnClosedSwitch { 
        toggleSwitch() 
    }
}

//////////////////////////////////////////////////
/// 1.5.3 Checking this and that
//// noobish /// 

for i in 1 ... 14 {
    moveForward()
    if isOnGem{
        collectGem()
    }
    if isBlocked && isBlockedLeft{
        turnRight()
    }
    if isOnClosedSwitch{
        toggleSwitch()
    }
    if isBlocked && !isBlockedLeft{
        turnLeft()
    }
}

turnLeft()
moveForward()
moveForward()
toggleSwitch()

/////////////////////////////////////////
// pro //

func doer(action: () -> Void, times: Int){
        for k in 1...times{
            action()
        }
    }

func SolveSwitch(){
    turnRight()
    doer(action: moveForward, times: 2)
    toggleSwitch()
    doer(action: turnLeft, times: 2)
    doer(action: moveForward, times: 2)
    turnRight()
}

for tile in 1...7{
    moveForward()
    collectGem()
    if [4, 6, 7].contains(tile){
        SolveSwitch()
    }
}




//////////////////////////////////////////////////
//// 1.5.4 Checking this or that
/// only one version is possible

for i in 1 ... 12 {
    moveForward()
    if isBlocked || isBlockedLeft{
        turnRight()
    }
    if isOnGem {
        collectGem()
}
}



//////////////////////////////////////////////////
//////////////////////////////////////////////////
//// 1.5.5 Local labyrinth 
/// version 1 /// 


for i in 1 ... 8 {
    moveForward()
    if isOnGem && isOnClosedSwitch {
        toggleSwitch()
        collectGem()
        turnRight()
        moveForward()
        moveForward()
        collectGem()
        turnLeft()
        turnLeft()
        moveForward()
        moveForward()
        turnRight()
    }
    else if isOnClosedSwitch{
        toggleSwitch()
        turnLeft()
    }
    else if isOnGem{
        collectGem()
    }
    if isBlocked{
        turnLeft()
    }
    
}

///////////////////////////////////////////////
// version 2 ///

func doer(n: Int, a: () -> ()){
    for k in 1...n{
        a()
    }
}


func pattern1(){
    while true {
        moveForward()
        collectGem()
        turnRight()
        doer(n: 2, a: moveForward)
        collectGem()
        doer(n: 2, a: turnLeft)
        doer(n: 2, a: moveForward)

        if isOnClosedSwitch{
            toggleSwitch()
            turnRight()
            break
        }

    }
}

func smallPat(){
    toggleSwitch()
    turnLeft()
    moveForward()
}

pattern1()
doer(n: 2, a: moveForward)
pattern1()
moveForward()
smallPat()
collectGem()
pattern1()
