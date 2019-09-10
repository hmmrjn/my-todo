//
//  TodoManager.swift
//  my-todo
//
//  Created by 浜村純 on 2019/09/10.
//  Copyright © 2019 Jun Hamamura. All rights reserved.
//

import Foundation



class TodoManager {
    static let shared = TodoManager()
    
    private(set) var todoList: [Todo] = []
    private(set) var doneList: [Todo] = []
    
    private init(){}
    
    func add(todo: Todo){
        todoList.append(todo)
    }
    
    func markDone(at index: Int) {
        guard index < todoList.count else {
            return
        }
        
        doneList.append(todoList[index])
        todoList.remove(at: index)
    }
    
    func markDone(todo: Todo) {
        guard todoList.contains(todo) else {
            return
        }
        
        doneList.append(todo)
        todoList.removeAll { item in
            return item == todo
        } // $0 == todo is also ok
    }
    
    func remove(at index: Int) {
        guard index < todoList.count else {
            return
        }
        
        todoList.remove(at: index)
    }
    
    func remove(todo: Todo) {
        guard todoList.contains(todo) else {
            return
        }
        
        todoList.removeAll { item in
            return item == todo
        } // $0 == todo is also ok
    }
    
}
