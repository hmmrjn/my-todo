//
//  TabBarController.swift
//  my-todo
//
//  Created by 浜村純 on 2019/09/03.
//  Copyright © 2019 Jun Hamamura. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    let todoListView: TodoListViewController = {
        let todoListView = TodoListViewController()
        todoListView.tabBarItem = UITabBarItem(title: "TODO", image: UIImage(named: "baseline_list_black_48pt"), tag: 0)
        return todoListView
    }()
    
    let doneListView: DoneListViewController = {
        let doneListView = DoneListViewController()
        doneListView.tabBarItem = UITabBarItem(title: "DONE ", image: UIImage(named: "baseline_playlist_add_check_black_48pt"), tag: 1)
        return doneListView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        viewControllers = [
            UINavigationController(rootViewController: todoListView),
            UINavigationController(rootViewController: doneListView)
        ]
    }

}
