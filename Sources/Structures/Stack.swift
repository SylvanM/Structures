//
//  Stack.swift
//
//
//  Created by Sylvan Martin on 12/27/23.
//

import Foundation

class Stack<T: Equatable> {
    
    // MARK: Properties
    
    private var list: LinkedList<T>
    
    /**
     * The number of items currently in the stack
     */
    public var count: Int {
        list.count
    }
    
    /**
     * Whether or not the stack is empty
     */
    public var isEmpty: Bool {
        list.isEmpty
    }
    
    /**
     * A peek at the next element to come out of the stack
     */
    public var next: T? {
        list.first
    }
    
    // MARK: Initializers
    
    /**
     * Creates a stack from the order of a given linked list
     */
    init(_ list: LinkedList<T>) {
        self.list = list
    }
    
    /**
     * Creates a stack from an array
     */
    init(_ array: [T]) {
        self.list = LinkedList(array)
    }
    
    // MARK: Methods
    
    /**
     * Removes the next item off the stack and returns it
     */
    func pop() -> T? {
        list.pop()
    }
    
    /**
     * Pushes something onto the top of the stack
     */
    func push(_ value: T) {
        list.push(value)
    }
    
}
