//
//  CreateTodoViewController.swift
//  my-todo
//
//  Created by 浜村純 on 2019/08/20.
//  Copyright © 2019 Jun Hamamura. All rights reserved.
//

import UIKit

class CreateTodoViewController: UIViewController {
    
    lazy var createButton = UIBarButtonItem(title: "Summon",
                                                    style: .done,
                                                    target: self,
                                                    action: #selector(createTodoButtonDidTap))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = createButton
    }
    
    @objc func createTodoButtonDidTap() {
        dismiss(animated: true, completion: nil)
    }

}
