//: [Previous : Object-Oriented Swift](@previous)
/*:
 # Enumerations and Optionals in Swift
 */
//MARK:- 1.

enum Gasoline : String {
    
    case oil92 = "92", oil95 = "95", oil98 = "98", diesel
    
    func getPrice() -> Double {
        
        switch self {
        
        case .oil92:
            return 28.7
            
        case .oil95:
            return 30.1
            
        case .oil98:
            return 32.2
            
        case .diesel:
            return 25.6
        }
    }
}

Gasoline.oil92.rawValue

/*:
 ## Please explain what enum associated value is and how it works.
 
 Enum associated value let us store custom values of other types alongside the case values.
 
 Below are rules regarding to associated value:
 
 - 1. Each enumeration case has zero or more associated values.
 - 2. The associated values for each enumeration case have their own data type.
 - 3. You can define associated values with label names like you would for named function parameters.
 - 4. An enumeration can have raw values or associated value, but not both.
 
 Now I am going to carry out the rules above and see how associated value works:
 
 I love to watch Olympic games ! But as a beginner in Swift, I have to study more. So I set a watching TV time quota for myself, that I can watch TV for at most 180 minutes a day.
 */
var quota = 180 {
    
    didSet{
        
        if quota >= 180 {
            quota = 180
        }
    }
}
/*:
 And I have a function to check my quota.
 */
func watchgames(for minutes: Int) {
    quota -= minutes
}
/*:
 I am going to rewrite the function and try to use enum with  associated value.
 
 Below I define an enumeration type called WatchOlympics, which can take either a value of keepWatching or a value of goStudy.
 
 KeepWatching case has two associated values of type Int and String, both associated values are with label names. GoStudy case has an associated value of type String and it also has label name.
 
 */

enum WatchOlympics {
    
    case keepWatching(remainingQuota: Int, message: String)
    case goStudy(message: String)
}
/*:
 I rewrite the function which now take one parameter of type Int and will return type WatchOlympics.
 */
func watchgames(for minutes: Int) -> WatchOlympics {
    
    if minutes < quota {
        quota -= minutes
        return .keepWatching(remainingQuota: quota, message: "Watch Olympics cheers you up!")
        
    } else {
        return .goStudy(message: "It's your turn to do something.")
    }
}

let tvTime : WatchOlympics = watchgames(for: 3000)

switch tvTime {

case .keepWatching( let remainingQuota, let message):
    print("\(message) You can watch \(remainingQuota) minutes more.")
    
case .goStudy(let message):
    print(message)
}



//MARK:- 2.

class Pet {
    
    var name : String
    
    init(name:String){
        self.name = name
    }
}

class People {
    
    var pet : Pet? 
    
    init(pet:Pet? = nil){
        self.pet = pet
    }
}

func guardCheckPet (with thePerson: People){
    guard let pet = thePerson.pet else { return }
    print("The pet's name is \(pet.name)")
}

let charlieBrown = People(pet: Pet(name: "Snoopy"))

guardCheckPet(with: charlieBrown)


func ifCheckPet(with thePerson: People){
    if let pet = thePerson.pet {
        print("The pet's name is \(pet.name)")
    }
}

let dora = People()

ifCheckPet(with: dora)



//: [Next : Protocol in Swift](@next)
