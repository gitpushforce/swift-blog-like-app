//
//  ViewController.swift
//  expresate
//
//  Created by masaki on 2020/12/13.
//

import UIKit

class ViewController: UIViewController {

    private let button : UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 52))
        button.setTitle("Log In", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        view.addSubview(button)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.center = view.center
    }
    
    let tabBarVC = UITabBarController()

    @objc func didTapButton() {
        
        
        let vc1 = UINavigationController(rootViewController: Tab1ViewController())
        let vc2 = UINavigationController(rootViewController: Tab2ViewController())
        let vc3 = UINavigationController(rootViewController: Tab3ViewController())
        let vc4 = UINavigationController(rootViewController: Tab4ViewController())
        let vc5 = UINavigationController(rootViewController: Tab5ViewController())
        
        vc1.title = "Inicio"
        vc2.title = "Buscar"
        vc3.title = "Postear"
        vc4.title = "Alertas"
        vc5.title = "Ajustes"
        
        tabBarVC.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        
        guard let items = tabBarVC.tabBar.items else {
            return
        }
        
        let images = ["house", "magnifyingglass", "square.and.pencil", "bell", "gear"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: images[x])
        }
        
        items[1].badgeValue = "3"
        
        
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC,animated: true)
    }
    
    
}


