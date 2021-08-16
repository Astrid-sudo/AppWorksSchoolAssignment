
let oddClosure : (Int) -> Bool  = {
   $0 % 2 != 0 ? true : false
}

oddClosure(-100)
oddClosure(-19)
oddClosure(0)
oddClosure(1)
oddClosure(88)


