//: [Previous](@previous)

import Foundation

/*:
Given two strings, write a method to decide if one is a permutation of the other.
 
Hint #1: Describe what it means for two string to be permutatios of each other. Now, look at that definition you provided. Can you check that strings against that definition?
 
A permutation of a string is another string that contains same characters, only the order of characters are different.
ie. "abcd" and "dabc" are permutations of each other
 
Is the string a single word? is the string a sentence or a phrase?
 * "driving"
 * "drivign" <- Permutation
 * "ddriving" <- NOT a permutation
 * "riving" <- NOT a permutation
 * "criving" <- NOT a permutation
 
 * the cow jumps over the moon.
 * the moon jumos over the cow. <- permutation
 * the cow      jumps over the moon. <- permutation
 
Hint #84: There is one solution that is 0(n log n) time. Another solution uses some space, but is O(n) time.

Hint #122: Could a hash table be useful?
 
Hint #131: Two strings that are permutations should have the same characters, but in difference orders. Can you make the orders the same?
 
 Notes:
* input: string
* output: bool
    true -> if the string is made of unique characters
    false -> if the string is NOT made up unique characters
* constraints:
* edge cases:
    no input
    string has one character or two characters
    the string is a phrase, and not a single word
    the number of whitespaces
 
 Interview Notes:
 * Should confirm details with interviewer. Is the permutation case sensitive? Is whitespace signigicant?
*/

//: ## Angela's Solution
// Imagine writing down both words and crossing out any letters that match in the other
// O(n ^ 2), does work for some edges cases
// TODO: (Angela) Refactor so the func takes into account some of the edge cases

func isPermutation(firstStr: String, secondStr: String) -> Bool {
    
  if firstStr.count != secondStr.count { return false }

  var first = firstStr
    
  for char in secondStr { //O(n)
    if let index = first.firstIndex(of: char) { //firstIndex -> O(n)
      first.remove(at: index)
    } else {
      return false
    }
  }
  
  return true
}

let one = "bbba"
let two = "aaab"
let example = "hello" 

print(isPermutation(firstStr: one, secondStr: two))
print(isPermutation(firstStr: one, secondStr: example))

//: ## Jocelyn's Solution

//assume the two strings are case sensitive and whitespace is significant
//O(2n) -> O(n) - drop the constants
func checkPermutation(s1: String, s2: String) -> Bool {
    
    //clean the string and all remove the whitespaces
    let string1 = s1.replacingOccurrences(of: " ", with: "").lowercased()
    let string2 = s2.replacingOccurrences(of: " ", with: "").lowercased()
    
    //check if the strings are the same length
    guard string1.count == string2.count else { return false }

    //instantiate a dictionary
    var letterDict = [Character:Int]()
    
    for char in string1 { //O(n)
        //increment through the first string
        if let value = letterDict[char] {
            letterDict[char] = value + 1
        } else {
            letterDict[char] = 1
        }
        print(letterDict)
    }
    
    for char in string2 { //O(n)
        //decrement through the second string
        if let value = letterDict[char] {
            letterDict[char] = value - 1
            if value < 0 { return false }
        } else {
            return false
        }
        print(letterDict)
    }
    return true //letterDict has no neg values, and therefore no positive values either
}
var str1 = "the cow jumped over the moon"
var str2 = "the COW jumped over the MOON"
print(checkPermutation(s1: str1, s2: str2))

//: ## Cracking the Interview Code Solutions
// Solution #1 - Sort the string
func permutation(s: String, t: String) -> Bool {
    if s.count != t.count {
        return false
    }
    return s.sorted() == t.sorted()
}
print(permutation(s: one, t: two))
print(permutation(s: one, t: example))

//Solution #2 - Check if the two strings have identical character counts
//See Jocelyn's solution for implementation


//: [Next](@next)
