#   #14 iOS Class Remote Learning Assignment Week1
### 1: Git & GitHub
#### Q2.

| commands| meanings|use cases|
| ------------- | ------------- |------------- |
| git status  | Show the working tree status.We can learn which branch we are currently on. And is there any change haven't add to staging area or commit?  | When checkout to a branch and want to know the latest status of that branch.
| git add  | Add file contents to the index, preparing the content staged for the next commit. |After creating new files or make some changes, we have to do "git add" to add those changes to the staging area, so that we can commit them.|
| git commit  | Record changes to the repository. A snapshot would be made to record the contents in the directory, the metadata(author,date,time,commit message...) and the differences between its parent commit(s). The record would have a SHA1 format ID.|After making changes,type git add to add changes to staging area, and then type git commit to record the changes. 
| git log| Show commit logs.We can leaarn SHA1、Author、Date、commit message.  |Use this command when want to see the history of commits.
| git push  [ Repo_name ] [ Branch_name ]  | The Repo_name and the Branch_name are all refer to remote. This command means to push commits to the specific Repo and Branch on remote. | If the branch doesn't exist in remote, it would be created with the name in command line, so it is also a way to upload a local branch to remote.
| git remote -v  | List the remote connections(and show the URL) you have to other repositories.| Use this command after connecting to a new repo, to check if the connection succeeded. 
| git branch |List all local branches. There would be a star sign before the branch where we are currently on.   | Use this command to see which branch we are currently on.
| fork| To fork other's github repo to my own github, is kind of like copy other's repo to my github account.  |When seeing a project you interested in on github, just fork the repo to your won account and you can do whatever you want with that repo.

#### Q3. 
Step1.In GitHub website, there is a "+" button next to your profile picture, click it and select "New repository".

![image](https://github.com/Astrid-sudo/AppWorksSchoolAssignment/blob/master/week1/pics%20in%20assignment/Step1.png)

Step2.In "Create a new repository" page, set the new repository name, decide this repo will be public or private, and tick the box if you want GitHub help you to create README, .gitignore or license file. After you've completed all the settings, click "Create repository".

![image](https://github.com/Astrid-sudo/AppWorksSchoolAssignment/blob/master/week1/pics%20in%20assignment/Step2.png)

Step3.The website will direct to the repo you've just created.There should be a URL on this page, make sure this is a https URL ,and then copy it.

![image](https://github.com/Astrid-sudo/AppWorksSchoolAssignment/blob/master/week1/pics%20in%20assignment/Step3.png)

Step4. Head to terminal, cd yourself to the local repo which you'd like to connect with remote, and then type  `git remote add origin HttpsURL`. We are now connect the local repo to gitHub.

![image](https://github.com/Astrid-sudo/AppWorksSchoolAssignment/blob/master/week1/pics%20in%20assignment/Step4.png)

Step5.  Execute `git push --set-upstream origin master`. This means the local branch 'master' set up to track remote branch'master' from 'origin'.

![image](https://github.com/Astrid-sudo/AppWorksSchoolAssignment/blob/master/week1/pics%20in%20assignment/Step5.png)

Step6. We will have to provide GitHub username and password in terminal. After that, we can head back to GitHub website and see our files been successfully uploaded to remote!

![image](https://github.com/Astrid-sudo/AppWorksSchoolAssignment/blob/master/week1/pics%20in%20assignment/Step6.png)

p.s.:If you are using two-factor authentication in GitHub, the password terminal asked in step6 is actually not your GitHub password but a personal access token. Below is the method to create personal access token.

Step7. Go to GitHub website, you will see a tiny triangle next to your profile picture, click it and select "Settings" in the dropdown menu.

![image](https://github.com/Astrid-sudo/AppWorksSchoolAssignment/blob/master/week1/pics%20in%20assignment/Step7.png)

Step8.In "Settings" page, click on "Developer settings".

![image](https://github.com/Astrid-sudo/AppWorksSchoolAssignment/blob/master/week1/pics%20in%20assignment/Step8.png)

Step9. In "Developer settings" page, select "Personal access tokens", and then click "Generate new token".

![image](https://github.com/Astrid-sudo/AppWorksSchoolAssignment/blob/master/week1/pics%20in%20assignment/Step9.png)


Step10. Write down the purpose of this token in Note text field, and tick the box in repo section. Click "Next", and the token would appear! Copy that, back to the terminal and paste it after the password placeholder. And you will see your files show up on GitHub web in your remote repo!
![image](https://github.com/Astrid-sudo/AppWorksSchoolAssignment/blob/master/week1/pics%20in%20assignment/Step10.png)


---




## 2: Basic
#### Q1.
    let pi = Double.pi

#### Q2.
    let x: Int = 100
    let y: Int = 30
    let average: Int = ( x + y ) / 2
#### Q3.
    let averageInRecord = Double(average)

   ###### 10 / 3
   10 / 3 operates in Int type. Which means the result of this opearation would also be Int.
   
   In math, the result of 10/3 would be 3.33333...(infinite recurring decimal). However, in Swift, in order to keep the result to be Int type, digits after  decimal point would be chopped off. 

So the result of 10 / 3 in Swift is 3.

   ###### 10.0 / 3.0
   
  On the other hand, 10.0 / 3.0 operates in Double type. Which means the result of this operation would also be Double.
  
  Double has a precision of at least 15 decimal digits. In the case of presenting 
  3.33333...(infinite recurring decimal), Double would keep 15 digits after decimal point.
  
So the result of 10.0 / 3.0 in Swift is 3.333333333333333.
  
#### Q4.
    
    var flag: Bool = true
    var inputString: String = "Hello world."
    let bitsInBite: Int = 8
    let averageScore: Double = 86.8
#### Q5.
     var salary = 22000
     salary += 28000
#### Q6.
    
    The equality operator in swift  ==
#### Q7.
    let i : Int = 10
    let j : Int = 3
    let remainder = i % j
#### Q8.
Both let and var are for creating variables in Swift. let helps you create immutable variables (constants) while var creates mutable variables.

 Constant and variables are both cotainer that can store value.
 
   
   let: The value of a constant can’t be changed once it’s set.
   
   var: A variable can be set to a different value in the future.
#### Q9.

* Name for variables which can store value:
Use noun.

* Name for function:
    Function represent tasks or actions, so use verb to a function name.

    If there is a return value, name functions or methods for the values they return.

    Alternatively, you can add a verb before the noun of the return value.

    Both of the styles are acceptable, just make sure you stay consistent.

* The first character of typed name should in upper case.

#### Q10.
Type inference enables a compiler to deduce the type of a particular expression automatically when it compiles your code, simply by examining the values you provide.
#### Q11.
The type of phoneNumber is Int.
The type of "Hello world" is String.
Cannot assign value of type 'String' to type 'Int.

---

### 3: Collection
#### Q1.
    var myFriends = [String]()
#### Q2.
    myFriends += ["Ian", "Bomi", "Kevin"]
#### Q3.
    myFriends.append("Michael")
#### Q4.
    myFriends.remove(at: 2)
    myFriends.insert("Kevin", at: 0)
#### Q5.
    for friend in myFriends{
    print(friend)
    }
#### Q6.

Arrays in Swift are always zero-indexed.The first item in the array has an index of 0, not 1. 
There are four items in myFriends, which means valid index is between 0 and 3.

So if I try to fetch item using the index out of valid range. The message - "Fatal error : Index out of range" would appear. 

#### Q7.
    myFriends.first
#### Q8.
    myFriends.last
#### Q9.
    var myCountryNumber : [Int: String] = [:]
#### Q10.
    myCountryNumber = ["US":1, "GB":44, "JP":81]
#### Q11.
    myCountryNumber["GB"] = 0
#### Q12.
To create an empty dictionary, the type of key and value have to be specified.
        
        var emptyDictionary: [Int: String] = [:]
#### Q13.

 For instance, if I want to remove the "US" key-value pair , I will use the syntax below:
    
    myCountryNumber.removeValue(forKey: "US")
    
    or
    
    myCountryNumber["US"] = nil

---

### 4: Control Flow
#### Q1.
    for number in lottoNumbers.count - 3..<lottoNumbers.count {
    print(lottoNumbers[number])
    }
#### Q2.
    print (lottoNumbers[5])
    print (lottoNumbers[4])
    print (lottoNumbers[3])
    print (lottoNumbers[2])
    print (lottoNumbers[1])
    print (lottoNumbers[0])
#### -
    print (lottoNumbers[0])
    print (lottoNumbers[2])
    print (lottoNumbers[4])
#### -
#### -
    var startIndex = lottoNumbers.count - 1
    for _ in lottoNumbers{
    print(lottoNumbers[startIndex])
    startIndex -= 1
    }
#### -
    for number in lottoNumbers where number % 2 == 0 {
    print(number)
    }
    
    
#### Q3.
    var startIndex = lottoNumbers.count - 1
    while startIndex >= 0 {
    print(lottoNumbers[startIndex])
    startIndex -= 1
    }
#### -
    var startIndex = 0
    while startIndex < lottoNumbers.count {
    print(lottoNumbers[startIndex])
    startIndex += 2
    }
    
    
#### Q4.
    var startIndex = lottoNumbers.count - 1
    repeat {
    print(lottoNumbers[startIndex])
       startIndex -= 1
       } while startIndex >= 0
       
#### -
       var startIndex = 0
       repeat {
           print(lottoNumbers[startIndex])
           startIndex += 2
       } while startIndex < lottoNumbers.count
      
#### Q5.

* while  :  while evaluates its condition at the start of each pass through the loop.
* repeat-while  :  repeat-while evaluates its condition at the end of each pass through the loop. It performs a single pass through the loop block first, before considering the loop’s condition.

Therefore, in repeat-while, even if the condition is false, the block of code would still be executed for one time. 


#### Q6.
    var isRaining = true
    if isRaining {
    print("It's raining, I don't want to work today.")
    } else {
    print("Although it's sunny, I still don't want to work today.")
    }
    
#### Q7.

    var jobLevel = 7
    
    switch jobLevel {
    case 1:
        print("Member")
    case 2:
        print("Team Leader")
    case 3:
        print("Manager")
    case 4:
        print("Director")
    default:
        print("We don't have this job.")
    }

---

### 5: Function
#### Q1.
    func greet(person name: String) -> String{
    return "Hello, \(name)"
    }
#### Q2.
    func multiply(a:Int, b:Int = 10){
    print (a * b)
    }
#### Q3.

![image](https://github.com/Astrid-sudo/AppWorksSchoolAssignment/blob/master/week1/pics%20in%20assignment/argumentParameter.png)


The argument label is used when calling the function; each argument is written in the function call with its argument label before it. 

The parameter name is used in the implementation of the function. 

By default, parameters use their parameter name as their argument label.
   
  
#### Q4.
    String
    Double
