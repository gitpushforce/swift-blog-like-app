//
//  Tab2ViewController.swift
//  expresate
//
//  Created by masaki on 2020/12/13.
//

import UIKit

class Tab2ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Buscar"
        view.backgroundColor = .lightGray
        
        // removes badge when tapping this tab
        if let tabItems = tabBarController?.tabBar.items {
            let tabItem = tabItems[1]
            tabItem.badgeValue = nil
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
