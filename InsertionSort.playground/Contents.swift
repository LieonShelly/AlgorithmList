//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 
 Goal: Sort an array from low to high (or high to low).
 
 You are given an array of numbers and need to put them in the right order. The insertion sort algorithm works as follows:
 
 Put the numbers on a pile. This pile is unsorted.
 Pick a number from the pile. It doesn't really matter which one you pick, but it's easiest to pick from the top of the pile.
 Insert this number into a new array.
 Pick the next number from the unsorted pile and also insert that into the new array. It either goes before or after the first number you picked, so that now these two numbers are sorted.
 Again, pick the next number from the pile and insert it into the array in the proper sorted position.
 Keep doing this until there are no more numbers on the pile. You end up with an empty pile and an array that is sorted.
 That's why this is called an "insertion" sort, because you take a number from the pile and insert it in the array in its proper sorted position
 */
func insertionSort(_ array: [Int]) -> [Int] {
    var a = array
    for x in 1 ... a.count {
        var y = x
        let temp = a[y]
        while y > 0 && temp < a[y - 1] {
            a[y] = a[y - 1]
            y -= 1
        }
        a[y] = temp
    }
    return a
}

insertionSort([ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ])

func insertionSort<T>(_ array: [T], isOrderedBefore: (T, T) -> Bool) -> [Int] {
    var a = array
    for x in 1 ... a.count {
        var y = x
        let temp = a[y]
        while y > 0 && isOrderedBefore(temp, a[y -1]) {
            a[y] = a[y - 1]
            y -= 1
        }
        a[y] = temp
    }
    return a
}

insertionSort([ 10, -1, 3, 9, 2, 27, 8, 5, 1, 3, 0, 26 ], isOrderedBefore: >)
