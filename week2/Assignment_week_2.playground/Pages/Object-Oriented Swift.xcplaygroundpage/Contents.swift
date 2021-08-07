/*:
 # Object-Oriented Swift
 */
//MARK:- 1

enum Gender {
    
    case male
    
    case female
    
    case undefied
    
}

class Animal {
    
    let gender: Gender
    
    init(gender:Gender = .undefied){
        
        self.gender = gender
    }
    
    func eat(){
        
        "I eat everything!"
    }
}


//MARK:- 2.

class Elephant : Animal {
    
    override func eat() {
        
        print("I love peanut!")
    }
}

class Tiger : Animal {
    
    override func eat() {
        
        print("I eat meat.")
    }
}

class Horse : Animal {
    
    override func eat() {
        
        print("I'd like to have some grass.Cheers.")
    }
}
//MARK:- 3.

class Zoo {
    
    var weeklyHot: Animal
    
    init(weeklyHot: Animal){
        
        self.weeklyHot = weeklyHot
    }
}

let zoo = Zoo(weeklyHot: Tiger())

let tiger = Tiger()
let elephant = Elephant()
let horse = Horse()

zoo.weeklyHot = tiger
zoo.weeklyHot = elephant
zoo.weeklyHot = horse

//MARK:- 4.
/*:
 
 ## 4. What’s the difference between Struct and Class ?

- **Structures**
 
1. value types
 
2. values : An instance of a structure is conceptually a value.
 
3. copy data : Structures copy their values when used in a new place. With a structure , when mutating any of its properties, is actually making an entirely new structure base on the original.
 
4. immutable : Structures are immutable when declared as constants.


- **Classes**
 
1. reference types
 
2. objects : Class instances are objects with identity.
 
3. share data : Classes share their data. We can change the value of variables in class and Swift won't consider we are working with new object. It's the   old object with the new value.
 
4. mutable : Classe properties remain mutable.
 */

//MARK:- 5.
/*:
 ## 5. What’s the difference between instance method and type method ?

In short,  instance method can be called only when we had accessed to the instance. However, type methods are easier to access, simply type the type name and using dot syntax, no instances needed.

Instance Method : In order to access instance method, we have to create an instance first. To access the method, we call method on an instance using dot syntax just as we do for properties.

Type Method: We call type methods on the type itself, instead of on an instance. To declare a type method in enum and struct, we prefix it with the static modifier. Classes can use the class keyword instead.
 
 */

//MARK:- 6.
/*:
 ## 6. What does initializer do in class and struct ?

When preparing for an instance ready to use, stored properties in class and struct can’t be left in an indeterminate state.Initializer setting an initial value for each stored property on that instance and performing any other setup or initialization that’s required before the new instance is ready for use.

The initializer in struct is relatively simple, because they don’t support inheritance, they can only delegate to another initializer that they provide themselves. Structure types automatically receive a memberwise initializer if they don’t define any of their own custom initializers, which you can use to initialize the member properties of new structure instances.

The initializer in class would be more complex. Because all of a class’s stored properties—including any properties the class inherits from its superclass—must be assigned an initial value during initialization. Unlike structures, class instances don’t receive a default memberwise initializer. In order to manage the load responsibilities in initialize a class instance,Swift defines two kinds of initializers - designated initializers and convenience initializers, for class types to help ensure all stored properties receive an initial value.

 */
//MARK:- 7.
/*:
 ## 7. What does self mean in an instance method and a type method ?

The self in an instance method is referring to the specific instance of this class/struct that will be created by the initializer. On the other hand , the self in type method  is referring to the type itself.
 
 */

//MARK:- 8.
/*:
 ## 8. What’s the difference between reference type and value type ?

Value and reference types differ in their assignment behavior.

Value types use assign-by-copy.All structures and enumerations are value types in Swift. This means that any structure and enumeration instances you create—and any value types they have as properties—are always copied when they’re passed around in your code.The value type guarantees the independence of variables.

Unlike value types,reference types use assign-by-reference. Reference types are not copied when they’re assigned to a variable or constant, or when they’re passed to a function. Rather than a copy, a reference to the same existing instance is used.
 */



//: [Next : Enumerations and Optionals in Swift](@next)


