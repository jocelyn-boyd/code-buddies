//: [Previous](@previous)
import Cocoa

/*:
Implement an algorithm to determine if a string has all unique characters.
What if you cannot use additional data structures?
*/

// input: string
// output: bool
    // true -> if the string is made of unique characters
    // false -> if the string is NOT made up unique characters
// constraints: can't use additional data structures
// edge cases: no input, string has one character

func isUnique(input: String) -> Bool {
    
    //check the length of the string, return if less than 2
    if input.count < 2 { return true }
    
    //instatiate a dictionary - key: character, value: count
    var stringDict = [Character:Int]()
    
    //loop through each character in the string - O(n)
    for element in input {
        //if the the character is in the dictionary, return false
        if let _ = stringDict[element] {
            return false
        } else {
            //else, put it in the dictionary with a value of 1
            stringDict[element] = 1
        }
    }
    //If we got this far in our code without returning false,
    //then it means that all characters in the string are unique
    return true
}


//function to generate sample input strings
func randomString(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyz"
  return String((0..<length).map{ _ in letters.randomElement()! })
}

var input = randomString(length: 25)
var result = isUnique(input: input)
print("\(input) -> \(result)")
//: [Next](@next)
