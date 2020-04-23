import UIKit

/*
[ 과제 - 알고리즘 ]
1. 정수 하나를 입력받은 뒤, 해당 숫자와 숫자 1사이에 있는 모든 정수의 합계 구하기
e.g.  5 -> 1 + 2 + 3 + 4 + 5 = 15,   -2 -> -2 + -1 + 0 + 1 = -2
*/

var result = 0

func calculateOneToInput(input: Int) -> Int {
    if input >= 1 {
        for i in 1...input {
            result += i
        }
    }
    else {
        for i in input...1 {
            result += i
        }
    }
    return result
}

calculateOneToInput(input: -2)

 
/*
2. 숫자를 입력받아 1부터 해당 숫자까지 출력하되, 3, 6, 9가 하나라도 포함되어 있는 숫자는 *로 표시
e.g.  1, 2, *, 4, 5, *, 7, 8, *, 10, 11, 12, *, 14, 15, * ...
*/

func printWithFilter (input: Int) {
    
    for i in 1...input {
        var placeHolder = i
        var arr: Array<Int> = []
        
        while placeHolder > 0 {
            arr.append(placeHolder % 10)
            placeHolder /= 10
        }
        
        if arr.contains(3) || arr.contains(6) || arr.contains(9) {
            print("*")
        }
        else {
            print(i)
        }
    }
}

printWithFilter(input: 10)

/*
3. 2개의 정수를 입력했을 때 그에 대한 최소공배수와 최대공약수 구하기
e.g.  Input : 6, 9   ->  Output : 18, 3
 
최대공약수
1) 두 수 중 큰 수를 작은 수로 나눈 나머지가 0이면 최대 공약수
2) 나머지가 0이 아니면, 큰 수에 작은 수를 넣고 작은 수에 나머지 값을 넣은 뒤 1) 반복

최소 공배수
- 주어진 두 수의 곱을 최대공약수로 나누면 최소공배수
*/

func findNums (input1: Int, input2: Int) -> [Int] {
    var arrOfResult: Array<Int> = []
    var inputGcf: Array<Int> = []
    var finalGcf: Array<Int> = []
    
    if input1 < input2 {
        for i in 1...input1 {
            if input1 % i == 0 {
                inputGcf.append(i)
            }
        }
        for i in inputGcf {
            if input2 % i == 0 {
                finalGcf.append(i)
            }
        }
    }
    else {
        for i in 1...input2 {
            if input2 % i == 0 {
                inputGcf.append(i)
            }
        }
        for i in inputGcf {
            if input1 % i == 0 {
                finalGcf.append(i)
            }
        }
    }
    arrOfResult.append(finalGcf.last!)
    arrOfResult.append(input1 * input2 / finalGcf.last!)
    
    
    print("최소공배수: \(arrOfResult[1]), 최대공약수: \(arrOfResult[0])")
    return arrOfResult
}

findNums(input1: 6, input2: 9)
