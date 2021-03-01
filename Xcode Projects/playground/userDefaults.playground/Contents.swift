import UIKit
//only good to manage small amount of data
//defaults are flexiable

let defaults = UserDefaults.standard //return the same thing "Singleton"

let dictionaryKey = "myDictionary"

//everything in this section has to be loaded up even if there is only use for one item
defaults.set(0.24, forKey: "Volume")
defaults.set(true, forKey: "MusicOn")
defaults.set("Hubert", forKey: "PlayerName")
defaults.set(Date(), forKey: "AppLastOpenedByUser")
let array = [1,2,3]
defaults.set(array, forKey: "myArray")
let dictionary = ["name", "Hubert"]
defaults.set(dictionary, forKey: dictionaryKey)


let volume = defaults.float(forKey: "Volume")
let appLastOpen = defaults.object(forKey: "AppLastOpenedByUser")
let myArray = defaults.array(forKey: "myArray") as! [Int]
let myDictionary = defaults.dictionary(forKey: dictionaryKey)
