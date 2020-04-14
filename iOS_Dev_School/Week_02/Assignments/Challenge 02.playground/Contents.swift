import UIKit

/*
 [ Challenge 02 ]
 - 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
   ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]

 - 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고
   + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기
 */




/* Pseudo
 // set 에 넣어 포함된 알파벳 리스트를 획득
 // 리스트를 기준으로 원래 array 에 하나씩 비교하여 counter 가 1 인 문자만 뽑아내어 새로운 배열 생성
 */

let input = ["a", "b", "c", "a", "e", "d", "c"]

var inputSet = Set(input) // set 에 넣어 중복된 값을 없에고 포함된 알파벳 리스트를 획득
var result: Array<String> = [] // 결과를 넣기 위한 array
var counter = 0 // 알파벳이 몇 번 나오는지 세기 위한 변수

func noSameAlphabet (_ input: Array<String>) -> Array<String> {
    for i in inputSet { // 세트에 할당된 알파벳 리스트를 하나씩 순환
        counter = 0
        for j in 0...input.count - 1 { // input 배열의 데이터를 하나씩 순환
            if input[j] == i { // 세트 알파벳 리스트와 input 배열의 데이터가 같을 때마다 카운팅
                counter += 1
            }
        }
        if counter == 1 { // 중복 알파벳이 없는 카운터가 1인 알파벳을 result 배열에 할당
            result.append(i)
        }
    }
    return result
}

print(noSameAlphabet(input).sorted())



let animalType = [ // 이렇게 트리형식으로 작성해야 그나마 덜 헷갈리는 듯... 그래도 여전히 헷갈린다.
    "식육목": [
        "개과": ["개": ["자칼", "늑대", "북미산 이리" ],
                "여우": ["아메리카 여우", "유럽 여우"]],
        "고양이과":["고양이": ["고양이", "살쾡이"],
                  "표범": ["사자", "호랑이"]]]]


if let 식육목 = animalType["식육목"] // 정답
{
    if let 고양이과 = 식육목["고양이과"]
    {
        if let 표범 = 고양이과["표범"]
        {
            print(표범[0], 표범[1])
        }
    }
}

// 그냥 추가적으로 한줄 코드표현 연습
if let 식육목 = animalType["식육목"], let 고양이과 = 식육목["고양이과"], let 표범 = 고양이과["표범"], let result = 표범.first {
    print(result)
}

