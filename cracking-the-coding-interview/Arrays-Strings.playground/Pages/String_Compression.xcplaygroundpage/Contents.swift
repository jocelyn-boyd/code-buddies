//: [Previous](@previous)
import Foundation

/*:
Implement a method to perform basic string compression using the counts of repeated characters. For example, the string 'aabcccccaaa' would become 'a2b1c5a3'. If the "compressed" string would not become smaller than the original string, your method should return the original string. You can assume the string has only uppercase and lowercase letters (a-z).
Hints: #92, #110
*/

func stringCompression(input: String) -> String {
  var result = ""
  var previous: String? = nil
  var count = 0

  for letter in input {
    if previous == nil {
      previous = String(letter)
      count += 1
      continue
    }

    if let prev = previous {
      if String(letter) == prev {
        count += 1
        continue
      } else {
        result += "\(prev)\(count)"
        previous = String(letter)
        count = 1
      }
    }
  }

  result += "\(previous ?? "")\(count)"

  if result.count > input.count {
    return input
  } else {
    return result
  }

}

let compressionExample = "aabcccccaaa"
print(stringCompression(input: compressionExample))

//: [Next](@next)
