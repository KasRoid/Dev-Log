import Foundation

/*
 < 1번 문제 > 고차함수만을 이용하여 구현
 1)
 1부터 100까지의 숫자를 가진 배열에서 홀수만을 골라 각 숫자에 1씩 더해준 배열을 출력
 Output: [2, 4, 6, 8, 10, 12, ... 98, 100]
 
 2)
 ["1", "2", "3", "4", "5", "A", "B", "C", "D"]
 위 배열에서 숫자에 해당하는 문자열만 골라낸 뒤, 그것을 제곱한 숫자들을 모두 더한 결과 출력
 Output: 55
 */

print("\n---------- [ 1번 문제 ] ----------\n")

// 1)
let oneToHundred = Array(1...100)
let result1 = oneToHundred
  .filter { !$0.isMultiple(of: 2) }
  .map { $0 + 1 }
print(result1)


// 2)
let strings = ["1", "2", "3", "4", "5", "A", "B", "C", "D"]
let result2 = strings
  .compactMap(Int.init)
  .map { $0 * $0 }
  .reduce(0, +)
print(result2)




/*
 < 2번 문제 >
 단일 연결 리스트(Single Linked List) 구현하기
 */

print("\n---------- [ 2번 문제 ] ----------\n")

protocol LinkedListStack {
  var isEmpty: Bool { get } // 노드가 있는지 여부
  var size: Int { get }     // 전체 개수
  func push(node: Node)     // 데이터 삽입
  func pop() -> String?     // 데이터 추출
  func peek() -> String?    // 마지막 데이터 확인
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
  private(set) var size = 0
  var isEmpty: Bool { return head == nil }
  
  private var lastNode: Node? {
    guard var currentNode = head else { return nil }
    while let nextNode = currentNode.next {
      currentNode = nextNode
    }
    return currentNode
  }
  
  func push(node newNode: Node) {
    size += 1
    
    if let lastNode = lastNode {
      lastNode.next = newNode
    } else {
      head = newNode
    }
  }
  
  func peek() -> String? {
    lastNode?.value
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
      defer { head = nil }
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
linkedList.peek()
linkedList.size

linkedList.pop()
linkedList.pop()
linkedList.pop()
linkedList.size
linkedList.isEmpty




/*
 < 3번 문제 >
 버블 정렬(Bubble Sort) 구현하기
 */

print("\n---------- [ 3번 문제 ] ----------\n")

var inputCases = [
  [],
  [1],
  [1, 2, 3, 5, 6, 7, 9, 10, 14],
  [1, 1, 2, 2, 3, 3, 3, 3, 1, 1, 2, 2],
  [14, 10, 9, 7, 6, 5, 3, 2, 1],
  [5, 6, 1, 3, 10, 2, 7, 14, 9],
  Array(1...10).map { _ in Int.random(in: 1...999) },
]


func bubbleSort(input: inout [Int]) {
  guard !input.isEmpty else { return }
  
  for i in 1..<input.count {
    var isSorted = true
    
    for idx in 0..<input.count - i {
      guard input[idx] > input[idx + 1] else { continue }
      input.swapAt(idx, idx + 1)
      isSorted = false
    }
    guard !isSorted else { break }
  }
}


// 정답지 - 기본 정렬 함수
let sorted = inputCases.map { $0.sorted() }

// 직접 만든 정렬 함수 적용
for idx in inputCases.indices {
  bubbleSort(input: &inputCases[idx])
}

// 결과 비교. 정렬 완료가 나오면 성공
func testCases() {
  inputCases.enumerated().forEach { idx, arr in
    guard sorted[idx] != arr else { return }
    print("케이스 \(idx + 1) 정렬 실패 - \(inputCases[idx])")
  }
}
let isSuccess = sorted == inputCases
isSuccess ? print("정렬 완료") : testCases()





/***************************************************
 수고하셨습니다!
 ***************************************************/



