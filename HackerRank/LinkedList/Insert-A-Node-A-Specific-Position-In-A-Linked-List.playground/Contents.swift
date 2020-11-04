import Foundation

var str = "https://www.hackerrank.com/challenges/insert-a-node-at-a-specific-position-in-a-linked-list/problem"


// insert a node at a set position
//  1 -> 2 -> 3
// data = 4 / position = 2
//  output: 1 -> 2 -> 4 -> 3
// after inserting Node then return head

final class SinglyLinkedListNode {
    var data: Int
    var next: SinglyLinkedListNode?

    public init(nodeData: Int) {
        self.data = nodeData
    }
}

final class SinglyLinkedList {
    var head: SinglyLinkedListNode?
    var tail: SinglyLinkedListNode?

    public init() {}

    public func insertNode(nodeData: Int) {
        self.insertNode(node: SinglyLinkedListNode(nodeData: nodeData))
    }

    private func insertNode(node: SinglyLinkedListNode) {
        if let tail = tail {
            tail.next = node
        } else {
            head = node
        }

        tail = node
    }
}

func printSinglyLinkedList(head: SinglyLinkedListNode?, sep: String, fileHandle: FileHandle) {
    var node = head

    while node != nil {
        fileHandle.write(String(node!.data).data(using: .utf8)!)

        node = node!.next

        if node != nil {
            fileHandle.write(sep.data(using: .utf8)!)
        }
    }
}

// Complete the insertNodeAtPosition function below.

/*
 * For your reference:
 *
 * SinglyLinkedListNode {
 *     data: Int
 *     next: SinglyLinkedListNode?
 * }
 *
 */
func insertNodeAtPosition(head: SinglyLinkedListNode?, data: Int, position: Int) -> SinglyLinkedListNode? {
    
    // check if head has a value if not return head
    if head == nil { return head }
    // use a pointer
    var currentNode = head
    // keep track of position / index
    var index = 0
    
    // loop through the list to find the position and insert the node
    while currentNode != nil {
        
        // alex's
//        if (index + 1) == position {
//            let newNode = SinglyLinkedListNode(nodeData: data)
//            let temp = currentNode?.next
//            newNode.next = temp
//            currentNode?.next = newNode
//        }
        
        // angela's
        if position == index {
            let temp = currentNode?.next
            let newNode = SinglyLinkedListNode(nodeData: currentNode!.data)
            newNode.next = temp
            currentNode?.data = data
            currentNode?.next = newNode
        }
        
        currentNode = currentNode?.next
        index += 1
    }
    
    return head
}

func printLinkedList(head: SinglyLinkedListNode?) -> Void {
    
    // make a pointer
    var currentNode = head
    
    // loop through the linked list using while loop
    while currentNode != nil {
        print(currentNode!.data)
        currentNode = currentNode?.next
    }
    
}

let llist = SinglyLinkedList()
llist.insertNode(nodeData: 16)
llist.insertNode(nodeData: 13)
llist.insertNode(nodeData: 7)
insertNodeAtPosition(head: llist.head, data: 1, position: 2)
printLinkedList(head: llist.head)

