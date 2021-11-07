//
//  Tab3ViewController.swift
//  expresate
//
//  Created by masaki on 2020/12/13.
//

import UIKit
import CropViewController

class Tab3ViewController: UIViewController, CropViewControllerDelegate, UITextViewDelegate {
    
    var selectedRange : NSRange!
    
    let maxBody = 12000
    let maxTitle = 70
    
    var isBold : Bool = false
    var boldImage = "boldUnselected"
    
    var currentNumTitleLines = 1.0
    var numberOfCharsTyped = 0
    
    var toolBarIcons : [String] = []
    
    let scroll : UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    let content : UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    let view1 : UIView = {
        let view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.backgroundColor = UIColor(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        return view1
    }()
    
//    lazy var view2 : UIView = {
//        var view2 = UIView()
//        view2.translatesAutoresizingMaskIntoConstraints = false
//        view2.backgroundColor = UIColor(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
//        return view2
//    }()
    
//    lazy var view2_2 : UIView = {
//        var view2_2 = UIView()
//        view2_2.translatesAutoresizingMaskIntoConstraints = false
//        view2_2.backgroundColor = UIColor(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
//        return view2_2
//    }()
    
//    let view3 : UIView = {
//        let view3 = UIView()
//        view3.translatesAutoresizingMaskIntoConstraints = false
//        view3.backgroundColor = UIColor(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
//        return view3
//    }()
    
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let bottomBar : UIView = {
        let bottomBar = UIView()
        bottomBar.translatesAutoresizingMaskIntoConstraints = false
        bottomBar.backgroundColor = UIColor(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        bottomBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
        bottomBar.backgroundColor = .brown
        return bottomBar
    }()
    
    let noImage : UIImage = UIImage(systemName: "photo")!
    
    var tap: UITapGestureRecognizer?
    
    var fButton: UIButton?
    
    var constraintWithoutImage : NSLayoutConstraint?
    var constraintWithImage : NSLayoutConstraint?
    var withoutKeyboard : NSLayoutConstraint?
    
    let constanteTituloFont: CGFloat = 0.035
    let constanteContenidoFont: CGFloat = 0.025
    
    lazy var tituloTextView : UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.sizeToFit()
        textView.isScrollEnabled = false
        textView.textContainer.maximumNumberOfLines = 4
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.backgroundColor = UIColor(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        textView.tag = 50
        return textView
    }()
    
    let desarrolloTextView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.backgroundColor = UIColor(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        textView.textColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.86)
        textView.tag = 51
        return textView
    }()
    
    override func viewDidAppear(_ animated: Bool) {
       var newSafeArea = UIEdgeInsets()
       // Adjust the safe area to accommodate
       //  the width of the side view.
//       if let sideViewWidth = sideView?.bounds.size.width {
//          newSafeArea.right += sideViewWidth
//       }
       // Adjust the safe area to accommodate
       //  the height of the bottom view.
      // if let bottomViewHeight = view3.bounds.size.height {
     //     newSafeArea.bottom += bottomViewHeight
    //   }
       // Adjust the safe area insets of the
       //  embedded child view controller.
    //   let child = self.childViewControllers[0]
     //s  child.additionalSafeAreaInsets = newSafeArea
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Postear"
        
        toolBarIcons = ["boldSelected", "toolbarHeader", "keyboard"]
        viewConstraints()
//        let selectedRange = self.composeTextView.selectedTextRange
//        let selectedText : String = composeTextView.textInRange(selectedRange!)!
//        if(selectedText != "") { callAction() }
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        //selectedRange = desarrolloTextView.selectedRange
        
        tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        imageView.image = noImage
        imageView.contentMode = .scaleAspectFit
        imageView.addGestureRecognizer(tap!)
        imageView.isUserInteractionEnabled = true
        
        
        tituloTextView.delegate = self
        desarrolloTextView.delegate = self
        // titulo textView
    //    view2.addSubview(tituloTextView)
        //view2_2.addSubview(tituloTextView)
        // contenido textView
        
        
        
        
        
        //self.addToolBar(textField: desarrolloTextView, toolbar: keyBoardToolBar.getMarkdownToolbar())
        
    }
    
//    func addToolBar(textField: UITextView, toolbar: UIToolbar) {
//        let scrollFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: toolbar.frame.height)
//        let scroll = UIScrollView(frame: scrollFrame)
//        scroll.showsHorizontalScrollIndicator = false
//        scroll.contentSize = CGSize(width: toolbar.frame.width, height: toolbar.frame.height)
//        scroll.addSubview(toolbar)
//
//        let topBorder = CALayer()
//        topBorder.frame = CGRect(x: -1000, y: 0, width: 9999, height: 1)
//        scroll.layer.addSublayer(topBorder)
//
//        let isFirst = textField.isFirstResponder
//        if isFirst {
//            textField.endEditing(true)
//        }
//
//        let inputAccView = UIInputView(frame: scrollFrame, inputViewStyle: .keyboard)
//        inputAccView.addSubview(scroll)
//        textField.inputAccessoryView = scroll
//
//        if isFirst {
//            textField.becomeFirstResponder()
//        }
//    }
    
    
    @objc func tapDone(sender: Any) {
        self.view.endEditing(true)
    }
    
    @objc func boldPressed(sender: Any) {
        
        let string = NSMutableAttributedString(attributedString: desarrolloTextView.attributedText)
        //let attributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: view.frame.height * 0.027)]
        string.addAttributes(attributes, range: desarrolloTextView.selectedRange)
        
        if (isBold) {
            isBold = false
            boldImage = "boldUnselected"
        } else {
            boldImage = "boldSelected"
            isBold = true
            desarrolloTextView.attributedText = string
            desarrolloTextView.selectedRange = self.selectedRange
        }
        
        


        
        toolBarIcons = [boldImage, "toolbarHeader", "keyboard"] 
        desarrolloTextView.addDoneButtonWithCounterBody(numLetras: "\(numberOfCharsTyped)/\(maxBody)", target: self, boldButtonStatus: false, boldAction: #selector(boldPressed(sender:)), keyboardClose:  #selector(tapDone(sender:)), iconStrings: toolBarIcons)
        desarrolloTextView.reloadInputViews()
        print(isBold)
        
    }
    
    func viewConstraints () {
        view.addSubview(scroll)
        scroll.addSubview(content)
        content.addSubview(view1)
        content.addSubview(tituloTextView)
        //view3.addSubview(desarrolloTextView)
        content.addSubview(desarrolloTextView)
        view.addSubview(bottomBar)
        view.backgroundColor = .white
        
        view1.addSubview(imageView)
        
        scroll.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        // scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        //scroll.backgroundColor = .green
        
        content.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 0).isActive = true
        content.bottomAnchor.constraint(equalTo: scroll.bottomAnchor, constant: 0).isActive = true
        content.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 0).isActive = true
        content.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: 0).isActive = true
        //content.heightAnchor.constraint(equalToConstant: newSafeArea)
        //content.heightAnchor.constraint(equalToConstant: 2000).isActive = true
        content.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
        //content.backgroundColor = .gray
        
        view1.topAnchor.constraint(equalTo: content.safeAreaLayoutGuide.topAnchor , constant: 0).isActive = true
        view1.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 0).isActive = true
        view1.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: 0).isActive = true
        
        tituloTextView.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 0).isActive = true
        tituloTextView.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 0).isActive = true
        tituloTextView.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: 0).isActive = true
        tituloTextView.layer.borderWidth = 1.0
        tituloTextView.font = UIFont(name: "Arial", size: view.frame.height * constanteTituloFont)
        tituloTextView.addDoneButtonWithCounter(numLetras: "0/\(maxTitle)", target: self, selector: #selector(tapDone(sender:)))
        tituloTextView.textColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.30)
        tituloTextView.text = "Escribe el Título aquí..."
        tituloTextView.backgroundColor = .cyan
        
//        view3.topAnchor.constraint(equalTo: tituloTextView.bottomAnchor, constant: 0).isActive = true
//        view3.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 0).isActive = true
//        view3.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: 0).isActive = true
        
        desarrolloTextView.topAnchor.constraint(equalTo: tituloTextView.bottomAnchor, constant: 0).isActive = true
        //desarrolloTextView.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: 0).isActive = true
        desarrolloTextView.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 0).isActive = true
        desarrolloTextView.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: 0).isActive = true
        desarrolloTextView.font = UIFont(name: "Arial", size: view.frame.height * constanteContenidoFont)
        desarrolloTextView.backgroundColor = .yellow
        desarrolloTextView.addDoneButtonWithCounterBody(numLetras: "0/\(maxBody)", target: self, boldButtonStatus: false, boldAction: #selector(boldPressed(sender:)), keyboardClose:  #selector(tapDone(sender:)), iconStrings: toolBarIcons)
        desarrolloTextView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        bottomBar.topAnchor.constraint(equalTo: scroll.bottomAnchor, constant: 0).isActive = true
        bottomBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        bottomBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        bottomBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
        bottomBar.backgroundColor = .red
        
        withoutKeyboard = desarrolloTextView.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: 0)
        withoutKeyboard!.isActive = true
        
        // medidas de los heights de los views
        constraintWithoutImage = view1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        constraintWithoutImage!.isActive = true
        
        // imageView
        imageView.topAnchor.constraint(equalTo: view1.topAnchor, constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view1.bottomAnchor, constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: view1.leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: view1.trailingAnchor, constant: 0).isActive = true
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        present(vc,animated: true)
    }
    
    // PlaceHolder en UITextView START
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Escribe el Título aquí..." {
            self.tituloTextView.text = ""
            self.tituloTextView.textColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.86)

        }
        textView.becomeFirstResponder()
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {

        if textView.text == "" {
            self.tituloTextView.text = "Escribe el Título aquí..."
            self.tituloTextView.textColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.30)
        }
        self.tituloTextView.resignFirstResponder()
    }
    // PlaceHolder en UITextView END
    
    func presentCropViewController(selectedImage: UIImage) {
      let cropViewController = CropViewController(image: selectedImage)
      cropViewController.delegate = self
        // esconde la opcion de escoger las medidas de la foto
        cropViewController.aspectRatioPickerButtonHidden = true
        cropViewController.aspectRatioLockEnabled = true
        cropViewController.aspectRatioPreset = .preset16x9
        cropViewController.doneButtonTitle = "Aplicar"
        cropViewController.cancelButtonTitle = "Cancelar"
      present(cropViewController, animated: true, completion: nil)
    }
    
    func cropViewController(_ cropViewController: CropViewController, didCropToImage image: UIImage, withRect cropRect: CGRect, angle: Int) {
        
        constraintWithoutImage?.isActive = false
        imageView.image = image

        // obteniendo el ratio
        let ratio = CGFloat(image.size.width / image.size.height)
        
        // resizing the image to fit the parent view (not fitting the parent view to the image) (siempre teniendo en cuenta el ratio)
        let newImageSize = CGRect(x: 0, y: 0,width: view1.bounds.width, height: view1.bounds.width / ratio)
        image.draw(in: newImageSize)
        
        // el nuevo height del view
        let height = view1.frame.width / ratio
        constraintWithImage = view1.heightAnchor.constraint(equalToConstant: height)
        constraintWithImage?.isActive = true
        
        // removiendo el floating button (hay q remover, pq al cambiar foto sin borrarla primero anyadiria otro floating sobre el otro)
        let floatingButtonWithTag = view1.viewWithTag(100)
        floatingButtonWithTag?.removeFromSuperview()
        // anyadiendo floating button
        fButton = floatingButton()
        view1.addSubview(fButton!)
        
        cropViewController.dismiss(animated: true, completion: nil)
    }
    
    
    // esconde el keyboard cuando se toca fuera de el
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // sube el view cuando el keyboard esta presente
    @objc func handleKeyboardNotification(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                //withoutKeyboard!.isActive = false
                //view3.bottomAnchor.constraint(equalTo: view.bottomAnchor , constant: -1 * keyboardSize.height) .isActive = true
                //self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
}

extension Tab3ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage {
            picker.dismiss(animated: true, completion: nil)
            presentCropViewController(selectedImage: image)
        }
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func floatingButton() -> UIButton {
        let tacho = UIImage(systemName: "trash.fill")
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 10, y: 10, width: 50  , height: 50)
        //btn.setTitle("Borrar", for: .normal)
        btn.setImage(tacho, for: .normal)
        btn.tintColor = UIColor(cgColor: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
        btn.layer.cornerRadius = 25
        btn.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        btn.layer.borderWidth = 2.0
        btn.contentVerticalAlignment = .fill
        btn.contentHorizontalAlignment = .fill
        btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        btn.tag = 100 // para identificar el boton, para poder removerlo
        
        btn.addTarget(self,action: #selector(removeImage), for: .touchUpInside)
        
        return btn
    }
    
    @objc func removeImage() {
        imageView.image = noImage
        constraintWithImage?.isActive = false
        constraintWithoutImage?.isActive = true
        
        // removiendo el floating button
        let floatingButtonWithTag = view1.viewWithTag(100)
        floatingButtonWithTag?.removeFromSuperview()
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // escritura de titulo
        if (textView.tag == 50) {
            let newText = (tituloTextView.text as NSString).replacingCharacters(in: range, with: text)
            let numberOfChars = newText.count
            tituloTextView.addDoneButtonWithCounter(numLetras: "\(numberOfChars)/\(maxTitle)", target: self, selector: #selector(tapDone(sender:)))
            tituloTextView.reloadInputViews()
            print("\(numberOfChars)/\(maxTitle)")
            let currentNumLines = Int(tituloTextView.contentSize.height / tituloTextView.font!.lineHeight)
            currentNumTitleLines = CGFloat (currentNumLines)
            print (currentNumTitleLines)
           
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
            
    
            
            return numberOfChars < maxTitle    // Limit Value
        
            
        // escritura de cuerpo
        }  else if(textView.tag == 51) {
                let newText = (desarrolloTextView.text as NSString).replacingCharacters(in: range, with: text)
                
            //  change attributes to selected range START
            selectedRange = textView.selectedRange
            print("range: \(textView.selectedRange)")
            
            
            // ******************TODO *************************
            let string = NSMutableAttributedString(attributedString: textView.attributedText)
            
            if (isBold) {
                let attributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: view.frame.height * 0.027)]
                string.addAttributes(attributes, range: textView.selectedRange)
                textView.attributedText = string
                textView.selectedRange = self.selectedRange
            }
//            let string = NSMutableAttributedString(attributedString:
//            textView.attributedText)
//            let attributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
//               string.addAttributes(attributes, range: textView.selectedRange)
//            textView.attributedText = string
//            textView.selectedRange = self.selectedRange
            // change attributes to selected range END
            
            // ******************TODO END *************************
            
//            numberOfCharsTyped = newText.count
//                desarrolloTextView.addDoneButtonWithCounterBody(numLetras: "\(numberOfCharsTyped)/\(maxBody)", target: self,  boldButtonStatus: false, boldAction: #selector(boldPressed(sender:)), keyboardClose:  #selector(tapDone(sender:)), iconStrings: toolBarIcons)
//                desarrolloTextView.reloadInputViews()
                return numberOfCharsTyped < maxBody    // max letters value
        } else {
            return false
        }
    }
    
    func textViewDidChangeSelection(_ textView: UITextView) {
        
        if let textRange = textView.selectedTextRange {
            desarrolloTextView.addDoneButtonWithCounterBody(numLetras: "\(numberOfCharsTyped)/\(maxBody)", target: self, boldButtonStatus: true, boldAction: #selector(boldPressed(sender:)), keyboardClose:  #selector(tapDone(sender:)), iconStrings: toolBarIcons)
            
            let selectedText = textView.text(in: textRange)
            let bold = textView.typingAttributes
            print (bold)
            // ...
        } else {
            desarrolloTextView.addDoneButtonWithCounterBody(numLetras: "\(numberOfCharsTyped)/\(maxBody)", target: self, boldButtonStatus: false, boldAction: #selector(boldPressed(sender:)), keyboardClose:  #selector(tapDone(sender:)), iconStrings: toolBarIcons)
        }
        desarrolloTextView.reloadInputViews()
    }

}
