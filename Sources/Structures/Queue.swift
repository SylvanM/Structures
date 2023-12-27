//
//  Queue.swift
//
//
//  Created by Sylvan Martin on 12/26/23.
//

import Foundation

/**
 * A first in, first out queue
 */
class Queue<T: Equatable> {
    
    // MARK: Properties
    
    private var list: LinkedList<T>
    
    /**
     * The number of items currently in the queue
     */
    public var count: Int {
        list.count
    }
    
    /**
     * Whether or not the queue is empty
     */
    public var isEmpty: Bool {
        list.isEmpty
    }
    
    /**
     * A peek at the next element to come out of the queue
     */
    public var next: T? {
        list.first
    }
    
    // MARK: Initializers
    
    /**
     * Creates a queue from the order of a given linked list
     */
    init(_ list: LinkedList<T>) {
        self.list = list
    }
    
    /**
     * Creates a queue from an array
     */
    init(_ array: [T]) {
        self.list = LinkedList(array)
    }
    
    // MARK: Methods
    
    /**
     * Removes the next item off the queue and returns it
     */
    func pop() -> T? {
        list.pop()
    }
    
    /**
     * Pushes something onto the end of the queue
     */
    func push(_ value: T) {
        list.append(value)
    }
    
}
