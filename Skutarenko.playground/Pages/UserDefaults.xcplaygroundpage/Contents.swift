import UIKit

let defaults = UserDefaults.standard

defaults.set(0.24, forKey: "Volume")
defaults.set(true, forKey: "MusicOn")
defaults.set("John", forKey: "PlayerName")
defaults.set(Date(), forKey: "AppLastOpenedByUser")
let array = [1, 2, 3]
defaults.set(array, forKey: "MyArray")
let dictionary = ["name" : "Jack Black"]
defaults.set(dictionary, forKey: "MyDict")

// MARK: DEMO
let volume = defaults.float(forKey: "Volume")
let appLastOpen = defaults.object(forKey: "AppLastOpenedByUser")
let myArray = defaults.array(forKey: "MyArray") as! [Int]
let myDictionaru = defaults.dictionary(forKey: "MyDict")
print(volume)

