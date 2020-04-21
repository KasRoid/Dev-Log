//
//  SomeClass.swift
//  AccessControl
//
//  Created by giftbot on 2020/04/20.
//  Copyright © 2020 giftbot. All rights reserved.
//

import Foundation

private class PrivateClass {
  public var publicProperty = 100
  internal var internalProperty = 200
  fileprivate var fileprivateProperty = 300
  private var privateProperty = 400
  
  // default 는 fileprivate 처럼 동작
  var defaultProperty = 500
  
  func someFileprivateFunction() {
  }
  private func somePrivateFunction() {
  }
}


class SomeOtherClass {
  // fileprivate 또는 private 으로 설정 필요
  fileprivate let privateClass = PrivateClass()
//  private let privateClass = PrivateClass()

  func someFunction() {
    let privateClass = PrivateClass()
    print(privateClass.publicProperty)
    print(privateClass.internalProperty)
    print(privateClass.fileprivateProperty)
//    print(privateClass.privateProperty)  // 접근 불가
    
    print(privateClass.defaultProperty)    // = fileprivate
    
    privateClass.someFileprivateFunction()
//    privateClass.somePrivateFunction()   // 접근 불가
  }
}

