// DRY - don't repeat yourself

var wallet = [100, 5, 1, 5, 5, 20, 50, 100, 1, 1]

var sum = 0
for value in wallet {
    sum += value
}

sum

// create function

func calculateMoney(_: [Int]) -> Int {
    var sum = 0
    for value in wallet {
        sum += value
    }
    return sum                              // break function always
}

var money = calculateMoney(wallet)



func calculateMoneyTwo(_: [Int], type: Int) -> (total: Int, count: Int) {
    var sum = 0
    var count = 0
    for value in wallet {
        if value == type {
        sum += value
        count += 1
        }
    }
    return (sum, count)                  // break function always
}

//var moneyTwo = calculateMoneyTwo(wallet, type: 33)

var (moneyNew, count) = calculateMoneyTwo(wallet, type: 100)

moneyNew
count

func calculateMoneyThree(inWallet wallet: [Int], type: Int?) -> (total: Int, count: Int) {
    var sum = 0
    var count = 0
    for value in wallet {
        if (type == nil) || (type != nil && value == type!) {
        sum += value
        count += 1
        }
    }
    return (sum, count)                  // break function always
}

(moneyNew, count) = calculateMoneyThree(inWallet: wallet, type: 5)
moneyNew
count

(moneyNew, count) = calculateMoneyThree(inWallet: wallet, type: nil)
moneyNew
count

calculateMoneyThree(inWallet: wallet, type: 100).count

func calculateYourMoney(inSequence range: Int...) -> Int {
    var sum = 0
    for value in range {
    sum += value
    }
    return sum
}

calculateYourMoney(inSequence: 5,5,10,2,3,4,3,23,34)

func sayHi() -> () {
    print("Hi!")
}

let hi : () -> () = sayHi

hi()

func sayPhrase(phrase: String) -> Int? { // type of func is type of input parametr + type of retitn parametr
    print(phrase)
    return nil
}

sayPhrase(phrase: "aaa")            // there is no using return parametr, you can do it

let phrase = sayPhrase
phrase("bbb")

func doSomething(whatToDo: () -> ()) {
    whatToDo()
}

doSomething(whatToDo: hi)
