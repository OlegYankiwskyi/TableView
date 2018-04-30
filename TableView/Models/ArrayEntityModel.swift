//
//  Model.swift
//  TableView
//
//  Created by Oleg Yankiwskyi on 4/12/18.
//  Copyright © 2018 Oleg Yankiwskyi. All rights reserved.
//

import UIKit

class ArrayEntityModel: ArrayEntityProtocol {
    
    private let arrayStructData = [EntityDataModel(title: "Stack",
                                                   linkWiki: "https://en.wikipedia.org/wiki/Stack_(abstract_data_type)",
                                                   type: ATDType.stack,
                                                   description: """
            For the use of the term LIFO in accounting, see LIFO (accounting). For the use of the term pushdown in strength training, see Pushdown (exercise). For other uses, see Stack (disambiguation).
            Simple representation of a stack runtime with push and pop operations. In computer science, a stack is an abstract data type that serves as a collection of elements, with two principal operations:
            push, which adds an element to the collection, and
            pop, which removes the most recently added element that was not yet removed.
            The order in which elements come off a stack gives rise to its alternative name, LIFO (last in, first out). Additionally, a peek operation may give access to the top without modifying the stack.[1] The name "stack" for this type of structure comes from the analogy to a set of physical items stacked on top of each other, which makes it easy to take an item off the top of the stack, while getting to an item deeper in the stack may require taking off multiple other items first.[2]
            Considered as a linear data structure, or more abstractly a sequential collection, the push and pop operations occur only at one end of the structure, referred to as the top of the stack. This makes it possible to implement a stack as a singly linked list and a pointer to the top element. A stack may be implemented to have a bounded capacity. If the stack is full and does not contain enough space to accept an entity to be pushed, the stack is then considered to be in an overflow state. The pop operation removes an item from the top of the stack.
"""),
                                   EntityDataModel(title: "Queue",
                                                   linkWiki: "https://en.wikipedia.org/wiki/Queue_(abstract_data_type)",
                                                   type: ATDType.queue,
                                                   description: """
                In computer science, a queue (/ˈkjuː/ KYEW) is a particular kind of abstract data type or collection in which the entities in the collection are kept in order and the principle (or only) operations on the collection are the addition of entities to the rear terminal position, known as enqueue, and removal of entities from the front terminal position, known as dequeue. This makes the queue a First-In-First-Out (FIFO) data structure. In a FIFO data structure, the first element added to the queue will be the first one to be removed. This is equivalent to the requirement that once a new element is added, all elements that were added before have to be removed before the new element can be removed. Often a peek or front operation is also entered, returning the value of the front element without dequeuing it. A queue is an example of a linear data structure, or more abstractly a sequential collection.
                Queues provide services in computer science, transport, and operations research where various entities such as data, objects, persons, or events are stored and held to be processed later. In these contexts, the queue performs the function of a buffer.
                Queues are common in computer programs, where they are implemented as data structures coupled with access routines, as an abstract data structure or in object-oriented languages as classes. Common implementations are circular buffers and linked lists.
"""),
                                   EntityDataModel(title: "Set",
                                                   linkWiki: "https://en.wikipedia.org/wiki/Set_(abstract_data_type)",
                                                   type: ATDType.set,
                                                   description: """
                In computer science, a set is an abstract data type that can store certain values, without any particular order, and no repeated values. It is a computer implementation of the mathematical concept of a finite set. Unlike most other collection types, rather than retrieving a specific element from a set, one typically tests a value for membership in a set.
                Some set data structures are designed for static or frozen sets that do not change after they are constructed. Static sets allow only query operations on their elements — such as checking whether a given value is in the set, or enumerating the values in some arbitrary order. Other variants, called dynamic or mutable sets, allow also the insertion and deletion of elements from the set.
                An abstract data structure is a collection, or aggregate, of data. The data may be booleans, numbers, characters, or other data structures. If one considers the structure yielded by packaging [a] or indexing,[b] there are four basic data structures:[1][2]
                        unpackaged, unindexed: bunch
                        packaged, unindexed: set
                        unpackaged, indexed: string (sequence)
                        packaged, indexed: list (array)
                In this view, the contents of a set are a bunch, and isolated data items are elementary bunches (elements). Whereas sets contain elements, bunches consist of elements.
                Further structuring may be achieved by considering the multiplicity of elements (sets become multisets, bunches become hyperbunches)[3] or their homogeneity (a record is a set of fields, not necessarily all of the same type).
"""),
                                   EntityDataModel(title: "Dequeue",
                                                   linkWiki: "https://en.wikipedia.org/wiki/Double-ended_queue",
                                                   type: ATDType.dequeue,
                                                   description: """
                There are at least two common ways to efficiently implement a deque: with a modified dynamic array or with a doubly linked list.
                The dynamic array approach uses a variant of a dynamic array that can grow from both ends, sometimes called array deques. These array deques have all the properties of a dynamic array, such as constant-time random access, good locality of reference, and inefficient insertion/removal in the middle, with the addition of amortized constant-time insertion/removal at both ends, instead of just one end. Three common implementations include:
                Storing deque contents in a circular buffer, and only resizing when the buffer becomes full. This decreases the frequency of resizings.
                Allocating deque contents from the center of the underlying array, and resizing the underlying array when either end is reached. This approach may require more frequent resizings and waste more space, particularly when elements are only inserted at one end.
                Storing contents in multiple smaller arrays, allocating additional arrays at the beginning or end as needed. Indexing is implemented by keeping a dynamic array containing pointers to each of the smaller arrays.
"""),
                                   EntityDataModel(title: "Priority Queue",
                                                   linkWiki: "https://en.wikipedia.org/wiki/Priority_queue",
                                                   type: ATDType.priorityQueue,
                                                   description: """
                A priority queue must at least support the following operations:
                is_empty: check whether the queue has no elements.
                insert_with_priority: add an element to the queue with an associated priority.
                pull_highest_priority_element: remove the element from the queue that has the highest priority, and return it.
                This is also known as "pop_element(Off)", "get_maximum_element" or "get_front(most)_element".
                Some conventions reverse the order of priorities, considering lower values to be higher priority, so this may also be known as "get_minimum_element", and is often referred to as "get-min" in the literature.
                This may instead be specified as separate "peek_at_highest_priority_element" and "delete_element" functions, which can be combined to produce "pull_highest_priority_element".
                In addition, peek (in this context often called find-max or find-min), which returns the highest-priority element but does not modify the queue, is very frequently implemented, and nearly always executes in O(1) time. This operation and its O(1) performance is crucial to many applications of priority queues.
                More advanced implementations may support more complicated operations, such as pull_lowest_priority_element, inspecting the first few highest- or lowest-priority elements, clearing the queue, clearing subsets of the queue, performing a batch insert, merging two or more queues into one, incrementing priority of any element, etc.
"""),
                                   EntityDataModel(title: "List(Array)",
                                                   linkWiki: "https://en.wikipedia.org/wiki/List_(abstract_data_type)",
                                                   type: ATDType.list,
                                                   description: """
                A simple dynamic array can be constructed by allocating an array of fixed-size, typically larger than the number of elements immediately required. The elements of the dynamic array are stored contiguously at the start of the underlying array, and the remaining positions towards the end of the underlying array are reserved, or unused. Elements can be added at the end of a dynamic array in constant time by using the reserved space, until this space is completely consumed. When all space is consumed, and an additional element is to be added, then the underlying fixed-sized array needs to be increased in size. Typically resizing is expensive because it involves allocating a new underlying array and copying each element from the original array. Elements can be removed from the end of a dynamic array in constant time, as no resizing is required. The number of elements used by the dynamic array contents is its logical size or size, while the size of the underlying array is called the dynamic array's capacity or physical size, which is the maximum possible size without relocating data.[2]
                A fixed-size array will suffice in applications where the maximum logical size is fixed (e.g. by specification), or can be calculated before the array is allocated. A dynamic array might be preferred if:
                the maximum logical size is unknown, or difficult to calculate, before the array is allocated
                it is considered that a maximum logical size given by a specification is likely to change
                the amortized cost of resizing a dynamic array does not significantly affect performance or responsiveness
"""),
                                   EntityDataModel(title: "MultiSet",
                                                   linkWiki: "https://en.wikipedia.org/wiki/Multiset",
                                                   type: ATDType.multiSet,
                                                   description: """
                In mathematics, a multiset (aka bag or mset) is a modification of the concept of a set that, unlike a set, allows for multiple instances for each of its elements. The positive integer number of instances, given for each element is called the multiplicity of this element in the multiset. As a consequence, an infinite number of multisets exist, which contain only elements a and b, but vary by the multiplicity of their elements:
                The set {a, b} contains only elements a and b, each having multiplicity 1, when {a, b} is seen as a multiset.
                In multiset {a, a, b}, the element a has multiplicity 2, and b has multiplicity 1.
                In multiset {a, a, a, b, b, b}, a and b both have multiplicity 3.
                These objects are all different, when viewed as multisets, although they are the same set, since they all consist of the same elements. As with sets, and in contrast to tuples, order does not matter in discriminating multisets, so {a, a, b} and {a, b, a} denote the same multiset. To distinguish between sets and multisets, a notation that incorporates square brackets is sometimes used: the multiset {a, a, b} can be denoted as [a, a, b].
                The cardinality of a multiset is constructed by summing up the multiplicities of all its elements. For example, in the multiset {a, a, b, b, b, c} the multiplicities of the members a, b, and c are respectively 2, 3, and 1, and therefore the cardinality of this multiset is 6.
                Nicolaas Govert de Bruijn coined the word multiset in the 1970s, according to Donald Knuth.[2]:694 However, the use of the concept for multisets predates the coinage of word multiset by many centuries. Knuth himself attributes the first study of multisets to the Indian mathematician Bhāskarāchārya, who described permutations of multisets around 1150. Knuth also lists other names that were proposed or used for this concept, including list, bunch, bag, heap, sample, weighted set, collection, and suite.
"""),
                                   EntityDataModel(title: "Dictionary",
                                                   linkWiki: "https://en.wikipedia.org/wiki/Associative_array",
                                                   type: ATDType.dictionary,
                                                   description: """
                In computer science, an associative array, map, symbol table, or dictionary is an abstract data type composed of a collection of (key, value) pairs, such that each possible key appears at most once in the collection.
                Operations associated with this data type allow:[1][2]
                the addition of a pair to the collection
                the removal of a pair from the collection
                the modification of an existing pair
                the lookup of a value associated with a particular key
                The dictionary problem is a classic computer science problem: the task of designing a data structure that maintains a set of data during 'search', 'delete', and 'insert' operations.[3] The two major solutions to the dictionary problem are a hash table or a search tree.[1][2][4][5] In some cases it is also possible to solve the problem using directly addressed arrays, binary search trees, or other more specialized structures.
                Many programming languages include associative arrays as primitive data types, and they are available in software libraries for many others. Content-addressable memory is a form of direct hardware-level support for associative arrays.
""")]
    
    var sizeArrayData: Int {
        get {
            return arrayStructData.count
        }
    }
    
    func at(index: Int)-> EntityDataProtocol {
        return arrayStructData[index]
    }
}
