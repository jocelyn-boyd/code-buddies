//: [Previous](@previous)

import Foundation

/*:
Given two string, write a method to decide if one is a permutation of the other.
Hints: #1, #84, #122, #131
*/
//: [Next](@next)

//: ## Angela's Solution
// Imagine writing down both words and crossing out any letters that match in the other
func isPermutation(firstStr: String, secondStr: String) -> Bool {
  if firstStr.count != secondStr.count { return false }

  var first = firstStr
  for char in secondStr {
    if let index = first.firstIndex(of: char) {
      first.remove(at: index)
    } else {
      return false
    }
  }
  
  return true
}

let one = "apple"
let two = "paple"
let example = "hello" 

print(isPermutation(firstStr: one, secondStr: two))
print(isPermutation(firstStr: one, secondStr: example))

//Jocelyn's Solution
//assume the two strings all contains all lower case letters
var str1 = "the cow jumped over the moon"
var str2 = "the moon jumped over the cob"

func checkPermutation(s1: String, s2: String) -> Bool {
    
    //clean the string and all remove the whitespaces
    let string1 = s1.replacingOccurrences(of: " ", with: "")
    let string2 = s2.replacingOccurrences(of: " ", with: "")
    
    //check if the strings are the same length
    guard string1.count == string2.count else { return false }

    //instantiate a dictionary
    var letterDict = [Character:Int]()
    
    //store all items from string1 into a dictionary
    for char in string1 {
        letterDict[char] = 1
    }

    //iterate through each item
    //if an item is NOT inside the hashtable
    //return false
    for value in string2 {
        if letterDict[value] == nil {
            return false
        }
    }
    
    //If we got this far in our code without returning false,
    //then it means that all the items in the s2
    //must be containted within s1
    return true
}

print(checkPermutation(s1: str1, s2: str2))
