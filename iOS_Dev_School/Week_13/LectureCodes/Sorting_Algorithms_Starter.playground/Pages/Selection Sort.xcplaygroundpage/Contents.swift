//: [Previous](@previous)
/*:
 ---
 # Selection Sort (선택 정렬)
 ---
 */

var inputCases = [
  [],
  [1],
  [1, 2, 3, 5, 6, 7, 9, 10, 14],
  [1, 1, 2, 2, 3, 3, 1, 2, 3],
  [14, 10, 9, 7, 6, 5, 3, 2, 1],
  [5, 6, 1, 3, 10, 2, 7, 14, 9],
  Array(1...10).map { _ in Int.random(in: 1...999) },
]

/*:
 ---
 ### 정렬 함수 구현
 ---
 */

func selectionSort(input: inout [Int]) {
    let count = input.count
    var counter = 0
    var minNum: Int?
    var place: Int?
    
    while counter < count {
        for i in counter..<count - 1 {
            var placeHolder = input[i]
            if input[i + 1] < placeHolder {
                placeHolder = input[i + 1]
                minNum = placeHolder
                place = i + 1
            }
        }
        counter += 1
        guard let index = place, let minimunNum = minNum else { print("Sorted"); return }
        let placeHolder = input[counter - 1]
        input[counter - 1] = minimunNum
        input[index] = placeHolder
    }
}

func selectionSortSolution(input: inout [Int]) {
    for i in input.indices { // indices 는 0..<input.count 까지와 같다
        var minIndex = i
        for idx in (i + 1)..<input.count {
            guard input[minIndex] > input[idx] else { continue }
            minIndex = idx
        }
        input.swapAt(i, minIndex)
    }
}


/*:
---
### 결과 확인
---
*/
// 정답지 - 기본 정렬 함수
let sorted = inputCases.map { $0.sorted() }

// 직접 만든 정렬 함수 적용
for idx in inputCases.indices {
  selectionSort(input: &inputCases[idx])
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

//: [Next](@next)
