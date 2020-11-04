import Foundation

var str = "https://www.hackerrank.com/challenges/print-the-elements-of-a-linked-list/problem"

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
printLinkedList(head: llist.head)
