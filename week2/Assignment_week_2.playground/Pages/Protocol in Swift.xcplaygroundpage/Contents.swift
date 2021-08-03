//: [Previous : Enumerations and Optionals in Swift](@previous)
/*:
 # Protocol in Swift
 */
//MARK:- 1. 2. 4.

struct Person : PoliceMan{
    
    var name : String
    
    var toolMan : ToolMan
    
    func arrestCriminals(){
        print("How dare you !")
    }
}

protocol PoliceMan {
    
    func arrestCriminals()
}

//MARK:- 3.

protocol ToolMan {
    
    func fixComputer()
}

//MARK:- 5.

struct Engineer : ToolMan {
    
    func fixComputer(){
        
        print ("Have you tried turning if off and on again? ")
    }
}

//MARK:- 6.

let steve = Person(name:"Steve", toolMan: Engineer())



//: [Next : Error Handling in Swift](@next)

