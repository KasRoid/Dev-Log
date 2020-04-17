import UIKit

/*
[ 도전 과제 ]
1. 아래 두 클로저를 Syntax Optimization을 이용하여 최대한 줄여보기

let someClosure: (String, String) -> Bool = { (s1: String, s2: String) -> Bool in
  let isAscending: Bool
  if s1 > s2 {
    isAscending = true
  } else {
    isAscending = false
  }
  return isAscending
}


let otherClosure: ([Int]) -> Int = { (values: [Int]) -> Int in
  var count: Int = 0
  for _ in values {
    count += 1
  }
  return count
}
*/


let someClosure: (String, String) -> Bool = {
    let isAscending = $0 > $1
    return isAscending
}


// for 문을 사용해야한다면 이게 한계인듯?
//let otherClosure: ([Int]) -> Int = {
//  var count = 0
//  for _ in $0 {
//    count += 1
//  }
//  return count
//}

// for 문을 꼭 쓰지 않아도 된다면 이렇게 까지 줄일 수 있다.
let otherClosure: ([Int]) -> Int = {
    $0.count
}

