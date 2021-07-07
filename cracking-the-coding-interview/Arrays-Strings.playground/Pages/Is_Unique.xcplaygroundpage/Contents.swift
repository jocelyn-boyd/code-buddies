//: [Previous](@previous)
import Cocoa

/*:
Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?
*/

// generate sample strings
func randomString(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyz"
  return String((0..<length).map{ _ in letters.randomElement()! })
}

// input: string
// output: bool
    // true -> if the string is made of unique characters
    // false -> if the string is NOT made up unique characters
// constraints: can't use additional data structures
// edge cases: no input, string has one character

// check the length of the string, if string length is < 2, return true
// instatiate a dictionary - key: character, value: count
// dictionary lookup - O(1)
// loop through each character in the string O(n)
// check if character is in dictionary
// if yes, return false
// if no, put it in the dictionary with the value of 1
// return true

func isUnique(input: String) -> Bool {
    
    if input.count < 2 {
        return true
    }
    
    var stringDict = [Character:Int]()
    
    for element in input {
        print(element)
        if let _ = stringDict[element] {
            return false
        } else {
            stringDict[element] = 1
        }
    }
    return true
}

var input = "lgvsvxggxzzkknjqtjqtcqgva" //randomString(length: 25)
print(input)
print(isUnique(input: input))
//: [Next](@next)
