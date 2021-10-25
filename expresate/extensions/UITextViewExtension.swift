//
//  UITextViewExtension.swift
//  expresate
//
//  Created by masaki on 2020/12/26.
//

import UIKit

extension UITextView {
    
    func addDoneButtonWithCounter(title: String, numLetras: String, target: Any, selector: Selector) {
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                              y: 0.0,
                                              width: UIScreen.main.bounds.size.width,
                                              height: 44.0))//1
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)//2
        let barButton2 = UIBarButtonItem(title: numLetras, style: .done, target: nil, action: nil)//3
        
        let barButton = UIBarButtonItem(title: title, style: .done, target: target, action: selector)//3
        
        
        toolBar.setItems([flexible, barButton2, flexible, barButton], animated: false)//4
        self.inputAccessoryView = toolBar//5
    }
}
