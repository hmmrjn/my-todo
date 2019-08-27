//
//  CreateTodoViewController.swift
//  my-todo
//
//  Created by 浜村純 on 2019/08/20.
//  Copyright © 2019 Jun Hamamura. All rights reserved.
//

import UIKit

protocol CreateTodoViewControllerDelegate: AnyObject {
    func controller(_ controller: CreateTodoViewController,
                    didCreateTodo todo: Todo)
}

class CreateTodoViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    private var todoTitle: String? {
        didSet {
            print(todoTitle ?? "")
        }
    }
    
    lazy var createButton = UIBarButtonItem(title: "Summon",
                                                    style: .done,
                                                    target: self,
                                                    action: #selector(createTodoButtonDidTap))
    var delegate: CreateTodoViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = createButton
        
        textField.delegate = self
    }
    
    @objc func createTodoButtonDidTap() {
        if let todoTitle = todoTitle {
            delegate?.controller(self, didCreateTodo: Todo(title: todoTitle))
        }
        dismiss(animated: true, completion: nil)
    }

}

extension CreateTodoViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        todoTitle = textField.text
        return true
    }
}
