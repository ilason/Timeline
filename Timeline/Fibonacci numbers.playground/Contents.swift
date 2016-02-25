//: Playground - noun: a place where people can play

import UIKit

//func fibonacciNumber(number: Int) -> Int {
//    var fibonacci = 1
//    var last = 0
//    var placeholder = 0
//    while fibonacci<=number {
//        placeholder = fibonacci
//        fibonacci = last + fibonacci
//        last = placeholder
//    }
//    return fibonacci
//    
//}
//print (fibonacciNumber(2000))

func fibonacci2(number: Int) -> Int {
    var thisFib = 1
    var lastFib = 0
    var placeHolder = 0
    
    while thisFib <= number {
        placeHolder = thisFib
        thisFib += lastFib
        lastFib = placeHolder
    }
    return lastFib
}
fibonacci2(2000)

