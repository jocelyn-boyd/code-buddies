//: [Previous](@previous)

import Foundation

/*:
Given two string, write a method to decide if one is a permutation of the other.
Hints: #1, #84, #122, #131
*/
//: [Next](@next)

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
