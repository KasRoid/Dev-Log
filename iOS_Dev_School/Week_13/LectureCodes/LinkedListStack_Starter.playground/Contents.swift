import Foundation

protocol LinkedListStack {
    var isEmpty: Bool { get } // 노드가 있는지 여부
    var size: Int { get }     // 전체 개수
    func push(node: Node)     // 데이터 삽입
    func peek() -> String?    // 마지막 데이터 확인
    func pop() -> String?     // 데이터 추출
}


final class Node {
    var value: String
    var next: Node?
    
    init(value: String) {
        self.value = value
    }
}


final class SingleLinkedList: LinkedListStack {
    
    private var head: Node? = nil
    var isEmpty: Bool { head == nil }
    var size: Int = 0
    
    private var lastNode: Node? {
        guard var currentNode = head else { return nil }
        while let nextNode = currentNode.next {
            currentNode = nextNode
        }
        return currentNode
    }
    
    func push(node newNode: Node) {
        size += 1
        if let lastNode = lastNode { //  node 가 하나 이상 있을 때
            lastNode.next = newNode
        }
        else { // head 가 nil 일 때
            head = newNode
        }
    }
    
    func peek() -> String? {
        return lastNode?.value
    }
    
    func pop() -> String? {
        guard var currentNode = head else { return nil }
        while let _ = currentNode.next?.next {
            currentNode = currentNode.next!
        }
        size -= 1
        if let popValue = currentNode.next?.value {
            currentNode.next = nil
            return popValue
        } else {
            defer { head = nil } // 모든 경우에 최종적으로 실행되게하는 커맨드
            return head!.value
        }
    }
    
}

let linkedList = SingleLinkedList()
linkedList.isEmpty

linkedList.push(node: Node(value: "A"))
linkedList.push(node: Node(value: "B"))
linkedList.peek()
linkedList.size

linkedList.isEmpty
linkedList.pop()
linkedList.push(node: Node(value: "C"))
linkedList.push(node: Node(value: "D"))
linkedList.peek()
linkedList.size

linkedList.pop()
linkedList.pop()
linkedList.pop()
linkedList.pop()
linkedList.size
linkedList.isEmpty
