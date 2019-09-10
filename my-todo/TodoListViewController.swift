//
//  TodoListViewController.swift
//  my-todo
//
//  Created by 浜村純 on 2019/08/20.
//  Copyright © 2019 Jun Hamamura. All rights reserved.
//

import UIKit

class TodoListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let todoManager = TodoManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "todoCell")
        tableView.dataSource = self
        tableView.delegate = self
        
        let createButton = UIBarButtonItem(barButtonSystemItem: .add,
                                           target: self,
                                           action: #selector(createTodoButtonDidTap))
        navigationItem.rightBarButtonItem = createButton
    }
    
    @objc func createTodoButtonDidTap() {
        let createView = CreateTodoViewController()
        createView.delegate = self
        present(UINavigationController(rootViewController: createView),
                animated: true,
                completion: nil)
    }

}

extension TodoListViewController: UITableViewDelegate, UITableViewDataSource {
    func  tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoManager.todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = todoManager.todoList[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
        // 全部削除可能な行にする
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let doneButton = UITableViewRowAction(style: .normal, title: "Done") { _, _ in
            tableView.beginUpdates()
            self.todoManager.markDone(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            // beginUpdate endUpdate: 画面をさわれない時間を作らない
        }
        doneButton.backgroundColor = UIColor.blue
        
        let deleteButton = UITableViewRowAction(style: .destructive, title: "Delete") { _, _ in
            tableView.beginUpdates()
            self.todoManager.markDone(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
        
        return [deleteButton, doneButton]
    }
}

extension TodoListViewController: CreateTodoViewControllerDelegate {
    func controller(_ controller: CreateTodoViewController, didCreateTodo todo: Todo) {
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: todoManager.todoList.count, section: 0)], with: .automatic)
        todoManager.add(todo: todo)
        tableView.endUpdates()
    }
}
