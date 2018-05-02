//: Playground - noun: a place where people can play

import UIKit

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0 ..< middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex ..< array.count]))
    return merge(leftArray, rightArray)
}

func  merge( _ left: [Int], _ right: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var orderedArray: [Int] = []
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElemet = right[rightIndex]
        if leftElement < rightElemet {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElemet {
            orderedArray.append(rightElemet)
            rightIndex += 1
        } else {
            orderedArray.append(leftElement)
            leftIndex += 1
            orderedArray.append(rightElemet)
            rightIndex += 1
        }
    }
    return orderedArray
}
// Generic Swift Merge Sort Implementation

func mergeSort<T: Comparable>(_ array: [T]) -> [T] {
    guard array.count > 1 else {
        return array
    }
    let middleIndex = array.count / 2
    let leftArray = mergeSort(Array(array[0 ..< middleIndex]))
    let rightArray = mergeSort(Array(array[middleIndex ..< array.count]))
    return merge(leftArray, rightArray)
}

func  merge<T: Comparable>( _ left: [T], _ right: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var orderedArray: [T] = []
    while leftIndex < left.count && rightIndex < right.count {
        let leftElement = left[leftIndex]
        let rightElemet = right[rightIndex]
        if leftElement < rightElemet {
            orderedArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElemet {
            orderedArray.append(rightElemet)
            rightIndex += 1
        } else {
            orderedArray.append(leftElement)
            leftIndex += 1
            orderedArray.append(rightElemet)
            rightIndex += 1
        }
    }
    return orderedArray
}

let array = [7, 2, 6, 3, 9]
mergeSort(array)


