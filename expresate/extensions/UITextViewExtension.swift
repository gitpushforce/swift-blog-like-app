//
//  UITextViewExtension.swift
//  expresate
//
//  Created by masaki on 2020/12/26.
//

import UIKit

extension UITextView {
    
    func addDoneButtonWithCounter(numLetras: String, target: Any, selector: Selector) {

        let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                              y: 0.0,
                                              width: UIScreen.main.bounds.size.width,
                                              height: 44.0))//1
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)//2
        let barButton2 = UIBarButtonItem(title: numLetras, style: .done, target: nil, action: nil)//3
        
        let hideKeyboardImage = UIImage(named: "keyboard")?.resize(maxWidthHeight: 25)
        let hideKeyboardButton = UIBarButtonItem(image: hideKeyboardImage, landscapeImagePhone: nil, style: .done, target: target, action: selector)

        //let barButton = UIBarButtonItem(title: title, style: .done, target: target, action: selector)//3


        toolBar.setItems([flexible, barButton2, flexible, hideKeyboardButton], animated: false)//4
        self.inputAccessoryView = toolBar//5
    }
    
    
    func addDoneButtonWithCounterBody(numLetras: String, target: Any, boldButtonStatus: Bool, boldAction: Selector, keyboardClose: Selector, iconStrings: [String]) {
        // flexible white space
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        // fixed space
        let fixed = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        fixed.width = 20.0
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                              y: 0.0,
                                              width: UIScreen.main.bounds.size.width,
                                              height: 44.0))//1
        
        var items = [UIBarButtonItem]()
        
        // bold button
        let boldImage = UIImage(named: iconStrings[0])?.resize(maxWidthHeight: 25)
        let boldUIButton = UIButton(type: .custom)
        boldUIButton.sizeToFit()
        boldUIButton.setImage(boldImage, for: .normal)
        boldUIButton.addTarget(target, action: boldAction, for: .touchUpInside)
        let boldButton = UIBarButtonItem(customView: boldUIButton)
        boldButton.isEnabled = boldButtonStatus
        boldUIButton.tag = 11
        items.append(boldButton)
        
        // fixed space
        items.append(fixed)
        
        // h1 button
        let h1Image = UIImage(named: iconStrings[1])?.resize(maxWidthHeight: 27)
        let h1UIButton = UIButton(type: .custom)
        h1UIButton.sizeToFit()
        h1UIButton.setImage(h1Image, for: .normal)
        h1UIButton.addTarget(target, action: keyboardClose, for: .touchUpInside)
        let h1Button = UIBarButtonItem(customView: h1UIButton)
        items.append(h1Button)
        
        
        items.append(flexible)
        
        // numero de letras
        let numLetras = UIBarButtonItem(title: numLetras, style: .done, target: nil, action: nil)//3
        items.append(numLetras)
        
        // let barButton = UIBarButtonItem(title: title, style: .done, target: target, action: selector1)//3
        // items.append(barButton)
        
        // button close keyboard
        let hideKeyboardImage = UIImage(named: iconStrings[2])?.resize(maxWidthHeight: 25)
        let hideKeyboardButton = UIBarButtonItem(image: hideKeyboardImage, landscapeImagePhone: nil, style: .done, target: target, action: keyboardClose)
        items.append(hideKeyboardButton)
        
        toolBar.setItems(items, animated: false)//4
        
        self.inputAccessoryView = toolBar//5
    }
}
