// Switch
// Can use with every type

var age = 15

switch age {
case 0...16:                        // can use range, numbers, subsequences
    print("young"); fallthrough
case 17...25:
    print("student")
case 22:
    break
case 51, 56:
    print("adult +")
    
default:break
}

var name = "Alex"

switch name {
case "Alex" where age < 50: // you can add different conditions with where and logical operators
    print("Hi buddy!")
case "Alex" where age >= 50:
    print("Sorry, I don't know you!")
default:
    break
}

let tuple = (name, age)
switch tuple {
case ("Alex", 15):
    print("Hi, Alex!")
case ("Alex", 25):
    print("Sorry, I don't know you!")
case("Alex", _):
    print("Hi, Alex!")
   
    // value binding; in this case binding one parametr
    
case(_, let number) where number >= 16 && number <= 24:
    print("Hi, young man!")
    
default:
    break
}

let point = (5, -6)

switch point {
case let (x,y) where x == y: // in this case binding all tuple
    print("x == y")
case let (x,y) where x == -y:
    print("x == -y")
case let (_, y) where y < 0:
    print("y < 0")
default:
    break
}


