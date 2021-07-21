//: [Previous](@previous)
import Foundation

/*:
Given a string, write a function to check if it is a permutation of a palindrome. A palindrome is a word or phrase that is the same forwards and backwards. A permutation is a rearrangement of letters. The palindrome does not need to be linited to just dictionary words. You can ignore casing and non-letter characters.
```swift
Input: Tact Coa
Output: True (permutations: 'taco cat', 'atco cta', etc.)
```
Hints: #106, #121, #134, #136
*/

func isPalindromePermutation(str: String) -> Bool {
    let cleanStr = str.lowercased().replacingOccurrences(of: " ", with: "")
    var freqDict = [Character:Int]()
    
    for char in cleanStr {
        if let value = freqDict[char] {
            freqDict[char] = value + 1
        } else {
            freqDict[char] = 1
        }
    }
    
    var oddFreqCount = 0
    
    for value in freqDict.values {
        if value % 2 != 0 {
            oddFreqCount += 1
        }
    }
    
    return oddFreqCount <= 1
}

// reer, r:2, e:2
//civic c:2, i:2, v:1

isPalindromePermutation(str: "civic")
isPalindromePermutation(str: "Tact Cao")

//interviewCake solution O(n)
func hasPalindromePermutation(str: String) -> Bool {
    //To track characters we've seen an odd number of times
    var unpairedCharacters = Set<Character>()
    
    for char in str {
        if unpairedCharacters.contains(char) {
            unpairedCharacters.remove(char)
        } else {
            unpairedCharacters.insert(char)
        }
    }
    
    //The string has a palindrome permutation if it has one or zero character without a pair
    return unpairedCharacters.count <= 1
}

//: [Next](@next)
