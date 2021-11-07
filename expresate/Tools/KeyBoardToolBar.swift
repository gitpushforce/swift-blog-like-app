//
//  KeyBoardToolBar.swift
//  expresate
//
//  Created by masaki on 2021/10/31.
//

import UIKit

class KeyBoardToolBar: UIToolbar {
     func getMarkdownToolbar() -> UIToolbar {
        var items = [UIBarButtonItem]()

        let todoImage = UIImage(named: "toolbarTodo")?.resize(maxWidthHeight: 27)
        let todoButton = UIBarButtonItem(image: todoImage, landscapeImagePhone: nil, style: .done, target: self, action: #selector(todoPressed))
        items.append(todoButton)

        let tagImage = UIImage(named: "toolbarTag")?.resize(maxWidthHeight: 25)
        let tagButton = UIBarButtonItem(image: tagImage, landscapeImagePhone: nil, style: .done, target: self, action: #selector(tagPressed))
        items.append(tagButton)
        

    //    let boldImage = UIImage(named: "toolbarBold")?.resize(maxWidthHeight: 21)
    //    let boldButton = UIBarButtonItem(image: boldImage, landscapeImagePhone: nil, style: .done, target: self, action: #selector(ViewController.boldPressed))
    //    items.append(boldButton)
    //
    //    let italicImage = UIImage(named: "toolbarItalic")?.resize(maxWidthHeight: 18)
    //    let italicButton = UIBarButtonItem(image: italicImage, landscapeImagePhone: nil, style: .done, target: self, action: #selector(ViewController.italicPressed))
    //    italicButton.tag = 0x03
    //    items.append(italicButton)
    //
    //    let headerImage = UIImage(named: "toolbarHeader")?.resize(maxWidthHeight: 22)
    //    let headerButton = UIBarButtonItem(image: headerImage, landscapeImagePhone: nil, style: .done, target: self, action: #selector(ViewController.headerPressed))
    //    items.append(headerButton)
    //
    //    let wikiImage = UIImage(named: "toolbarWiki")?.resize(maxWidthHeight: 25)
    //    let wikiButton = UIBarButtonItem(image: wikiImage, landscapeImagePhone: nil, style: .done, target: self, action: #selector(ViewController.wikilink))
    //    items.append(wikiButton)
    //
    //    let toolbarImage = UIImage(named: "toolbarImage")?.resize(maxWidthHeight: 26)
    //    let imageButton = UIBarButtonItem(image: toolbarImage, landscapeImagePhone: nil, style: .done, target: self, action: #selector(ViewController.insertImage))
    //    items.append(imageButton)
    //
    //    let codeBlockImage = UIImage(named: "codeBlockAsset")?.resize(maxWidthHeight: 24)
    //    let codeblockButton = UIBarButtonItem(image: codeBlockImage, landscapeImagePhone: nil, style: .done, target: self, action: #selector(ViewController.codeBlockButton))
    //    items.append(codeblockButton)
        
        
        
        
        
        
        

    //        let quoteImage = UIImage(named: "quote")?.resize(maxWidthHeight: 21)
    //        let quoteButton = UIBarButtonItem(image: quoteImage, landscapeImagePhone: nil, style: .done, target: self, action: #selector(ViewController.quotePressed))
    //        items.append(quoteButton)

    //        let orderedListImage = UIImage(named: "ordered_list")?.resize(maxWidthHeight: 25)
    //        let orderedListButton = UIBarButtonItem(image: orderedListImage, landscapeImagePhone: nil, style: .done, target: self, action: #selector(ViewController.orderedListPressed))
    //        items.append(orderedListButton)
    //
    //        let numberedListImage = UIImage(named: "numbered_list")?.resize(maxWidthHeight: 25)
    //        let numberedListButton = UIBarButtonItem(image: numberedListImage, landscapeImagePhone: nil, style: .done, target: self, action: #selector(ViewController.numberedListPressed))
    //        items.append(numberedListButton)

    //        let indentRightImage = UIImage(named: "toolbarIndentRight")?.resize(maxWidthHeight: 25)
    //        let indentButton = UIBarButtonItem(image: indentRightImage, landscapeImagePhone: nil, style: .done, target: self, action: #selector(ViewController.indentPressed))
    //        items.append(indentButton)
    //
    //        let indentLeftImage = UIImage(named: "toolbarIndentLeft")?.resize(maxWidthHeight: 25)
    //        let unindentButton = UIBarButtonItem(image: indentLeftImage, landscapeImagePhone: nil, style: .done, target: self, action: #selector(ViewController.unIndentPressed))
    //        items.append(unindentButton)

    //        let undoButton = UIBarButtonItem(image: #imageLiteral(resourceName: "toolbarImage"), landscapeImagePhone: nil, style: .done, target: self, action: #selector(ViewController.undoPressed))
    //        items.append(undoButton)

    //        let redoButton = UIBarButtonItem(image: #imageLiteral(resourceName: "redo.png"), landscapeImagePhone: nil, style: .done, target: self, action: #selector(ViewController.redoPressed))
    //        items.append(redoButton)

        var width = CGFloat(0)
        for item in items {
            if item.tag == 0x03 {
                item.width = 30
                width += 30
            } else {
                item.width = 50
                width += 50
            }
        }

        let toolBar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: width, height: 40))
        toolBar.backgroundColor = .darkGray
        toolBar.isTranslucent = false
        toolBar.setItems(items, animated: false)
        toolBar.isUserInteractionEnabled = true

        return toolBar
    }
    
    @objc func tagPressed() {
       // editArea.insertText("#")
    }
    
    @objc func todoPressed() {}
}


