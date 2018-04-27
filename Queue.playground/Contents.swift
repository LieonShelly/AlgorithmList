//: Playground - noun: a place where people can play

import UIKit

/*
 FIFO
 A queue gives you a FIFO or first-in, first-out order. The element you inserted first is the first one to come out. It is only fair! (A similar data structure, the stack, is LIFO or last-in first-out.)
 */

/*
 A more efficient queue
 To make dequeuing efficient, we can also reserve some extra free space but this time at the front of the array. We must write this code ourselves because the built-in Swift array does not support it.
 
 The main idea is whenever we dequeue an item, we do not shift the contents of the array to the front (slow) but mark the item's position in the array as empty (fast). After dequeuing "Ada", the array is:
 
 [ xxx, "Steve", "Tim", "Grace", xxx, xxx ]
 After dequeuing "Steve", the array is:
 
 [ xxx, xxx, "Tim", "Grace", xxx, xxx ]
 Because these empty spots at the front never get reused, you can periodically trim the array by moving the remaining elements to the front:
 
 [ "Tim", "Grace", xxx, xxx, xxx, xxx ]
 This trimming procedure involves shifting memory which is an O(n) operation. Because this only happens once in a while, dequeuing is O(1) on average.
 */

public struct Queue<T> {
    fileprivate var array = [T]()
    fileprivate var head = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else {
            return nil
        }
        array[head] = nil
        head += 1
        /*这将计算开始时空点的百分比，作为总阵列大小的比例。 如果超过25％的阵列未被使用，我们会砍掉那个浪费的空间。 但是，如果数组很小，我们不会一直调整它的大小，所以在我们尝试修剪它之前，数组中至少有50个元素。
         */
        let percentage = Double(head) / Double(array.count)
        if array.count > 50 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        return element
    }
    
    public var font: T? {
        if isEmpty {
            return nil
        } else {
            return array[head]
        }
    }
    
}
