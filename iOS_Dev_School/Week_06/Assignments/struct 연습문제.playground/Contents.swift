import UIKit


struct User {
  var friends: [Friends] = []
  var blocks: [Friends] = []
}

struct Friends: Equatable {
  let name: String
}

/*
 ↑ User와 Friends 타입은 수정 금지
 ↓ FriendList 타입은 수정 허용
 */

struct FriendList {
        
  mutating func addFriend(name: String) {
    // 호출 시 해당 이름의 친구를 friends 배열에 추가
    var myFriends = Friends(name: name)
    user.friends.append(myFriends)
  }
  
  func blockFriend(name: String) {
    // 호출 시 해당 이름의 친구를 blocks 배열에 추가
    // 만약 friends 배열에 포함된 친구라면 friends 배열에서 제거
    
    let myFriends = Friends(name: name)
    User.init(blocks: [myFriends])
  }
}


// 아래에 있는 코드를 수정해 문제에서 요구하는 결과 도출하기.

// user를 전역변수로 사용하지 말 것.
let user = User()

var friendList = FriendList()
friendList.addFriend(name: "원빈")
friendList.addFriend(name: "장동건")
friendList.addFriend(name: "정우성")

// 중간 결과값
user.friends    // 원빈, 장동건, 정우성


friendList.blockFriend(name: "정우성")
friendList.blockFriend(name: "소지섭")


// 최종 결과값
user.friends   // 원빈, 장동건
user.blocks    // 정우성, 소지섭

