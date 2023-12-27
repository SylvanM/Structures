//
//  LinkedList.swift
//
//
//  Created by Sylvan Martin on 12/26/23.
//

import Foundation

/**
 * A linked list impementation that contains data of type `T`
 */
public class LinkedList<T: Equatable>: Sequence, Collection, ExpressibleByArrayLiteral, CustomStringConvertible {
    
    public typealias ArrayLiteralElement = T
    
    // MARK: Types
    
    public typealias Index = Int

    // MARK: - Classes
    
    public class Iterator: IteratorProtocol {
        
        public typealias Element = T
        
        private var current: Node<T>?
        
        public func next() -> T? {
            let toReturn = current
            current = current?.next
            return toReturn?.data
        }
        
        fileprivate init(current: Node<T>?) {
            self.current = current
        }
        
    }
    
    /**
     * A node in a linked list
     */
    fileprivate class Node<D> {
        
        typealias Element = D
        
        /**
         * The data contained at this node
         */
        var data: D
        
        /**
         * The next node, if it exists
         */
        var next: Node<D>?
        
        init(data: D, next: Node<D>? = nil) {
            self.data = data
            self.next = next
        }
    }
    
    // MARK: Initializers
    
    public required convenience init(arrayLiteral elements: T...) {
        self.init(elements)
    }
    
    public convenience init(_ array: [T]) {
        self.init()
        for a in array {
            self.append(a)
        }
        self.count = array.count
    }
    
    public init() {
        count = 0
    }

    // MARK: Data
    
    private var head: Node<T>?
    
    private var caboose: Node<T>?
    
    public private(set) var count: Int
    
    // MARK: Computed Properties
    
    /**
     * The first item in the list
     */
    public var first: T? {
        head?.data
    }
    
    /**
     * The last item in the list
     */
    public var last: T? {
        caboose?.data
    }
    
    /**
     * `true` if this linked list contains no data
     */
    public var isEmpty: Bool {
        head == nil
    }
    
    public var startIndex = 0
    
    public var endIndex: Int {
        count - 1
    }
    
    public var description: String {
        if isEmpty {
            return "Empty Linked List"
        }
        if T.self is CustomStringConvertible.Type {
            var string = ""
            for x in self {
                string += "\(x) -> "
            }
            return String(string.dropLast(4))
        } else {
            return "Linked List containing \(count) nodes of type \(T.self)"
        }
    }
    
    // MARK: Methods
    
    public func contains(_ value: T) -> Bool {
        if head == nil {
            return false
        } else {
            var current = head
            
            repeat {
                if current?.data == value {
                    return true
                }
                
                current = current?.next
                
            } while current != nil
            
            return false
        }
    }
    
    /**
     * Pushes a new value onto the front of the list
     */
    public func push(_ value: T) {
        let newHead = Node(data: value, next: head)
        head = newHead
        count += 1
    }
    
    /**
     * Pops the head off this list and returns it
     */
    @discardableResult
    public func pop() -> T? {
        let toReturn = head
        head = head?.next
        
        if toReturn != nil {
            count -= 1
        }
        
        return toReturn?.data
    }
    
    /**
     * Adds a value to the end of this linked list
     */
    public func append(_ value: T) {
        let newNode = Node(data: value)
        
        if head == nil {
            head = newNode
            caboose = newNode
        } else {
            caboose!.next = Node(data: value)
            caboose = caboose!.next
        }
    }
    
    // MARK: - Conformance
    
    public func makeIterator() -> Iterator {
        LinkedList.Iterator(current: head)
    }
    
    // MARK: Subscript
    
    public subscript(position: Int) -> T {
        get {
            if position >= count {
                fatalError("Index out of bounds")
            }
            
            var counter = 0
            var current = head
            
            while counter < position {
                counter += 1
                current = current?.next
            }
            
            return current!.data
        }
    }
    
    public func index(after i: Int) -> Int {
        i + 1
    }
}
