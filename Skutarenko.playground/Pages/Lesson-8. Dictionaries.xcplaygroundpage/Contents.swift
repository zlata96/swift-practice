var dict: [String: String] = ["машина": "car", "мужчина": "man"]
let dict2 : [Int: String] = [0:"car", 1:"man"]
dict2[1]
let dict3 : Dictionary<String, Double> = ["a" : 2.0] // but not recommend

dict["мужчина"]
dict.count
dict.isEmpty

var dict4 = [String: String]()

dict4.count
dict4.isEmpty

dict["компьютер"] = "computer" // add new element
dict["машина"] = "machine" // replacement value in key

dict.keys
Array(dict.keys) // show all keys in array. Attention dictionaries are disordered structure, haven't index

dict.values
Array(dict.values) // show all values in array

dict.updateValue("mac", forKey: "компьютер") // return old value

dict.updateValue("mac", forKey: "компьютер2") // return nill, there is no key "компьютер2", but add new key and value

//let comp = dict ["комп"] // type - String?

if let comp = dict["комп"] {
    print("\(comp)")
} else {
    print("no value for key комп")
}

dict["мужчина"] = nil

dict.removeValue(forKey: "ofkai`fj;zjf")
dict.removeValue(forKey: "компьютер2")// return old value

dict = [:] // make dictionary empty 

dict = ["машина":"car", "мужчина":"man", "компьютер":"mac"]

for key in dict.keys {
    print("Key = \(key), value = \(dict[key] ?? "no value")")
}

for (key, value) in dict{
    print("Key = \(key), value = \(value)")
}

