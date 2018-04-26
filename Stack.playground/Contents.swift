//: Playground - noun: a place where people can play

import UIKit
/// FILO
public struct Stack<T> {
    fileprivate var array = [T]()
    public var isEmapty: Bool {
        return array.isEmpty
    }
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
}


var stack = Stack<Int>()
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)
let element = stack.pop()

