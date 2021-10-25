//
//  Tab3ViewController.swift
//  expresate
//
//  Created by masaki on 2020/12/13.
//

import UIKit
import CropViewController

class Tab3ViewController: UIViewController, CropViewControllerDelegate, UITextViewDelegate {
    
    var currentNumTitleLines = 1.0
    
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
    
    lazy var view2 : UIView = {
        var view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.backgroundColor = UIColor(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        return view2
    }()
    
//    lazy var view2_2 : UIView = {
//        var view2_2 = UIView()
//        view2_2.translatesAutoresizingMaskIntoConstraints = false
//        view2_2.backgroundColor = UIColor(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
//        return view2_2
//    }()
    
    let view3 : UIView = {
        let view3 = UIView()
        view3.translatesAutoresizingMaskIntoConstraints = false
        view3.backgroundColor = UIColor(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        return view3
    }()
    
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        textView.textContainer.maximumNumberOfLines = 4
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.backgroundColor = UIColor(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        textView.tag = 50
        textView.backgroundColor = .red
        return textView
    }()
    
    let desarrolloView : UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.backgroundColor = UIColor(cgColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
        textView.textColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.86)
        textView.tag = 51
        return textView
    }()
    var numLetrasCont: String = "0/1000"
    var numLetrasTitulo: String = "0/70"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Postear"
        
        viewConstraints()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        imageView.image = noImage
        imageView.contentMode = .scaleAspectFit
        imageView.addGestureRecognizer(tap!)
        imageView.isUserInteractionEnabled = true
        
        // titulo textView
        view2.addSubview(tituloTextView)
        //view2_2.addSubview(tituloTextView)
        // contenido textView
        view3.addSubview(desarrolloView)
        
        tituloTextView.topAnchor.constraint(equalTo: view2.topAnchor, constant: 0).isActive = true
        tituloTextView.bottomAnchor.constraint(equalTo: view2.bottomAnchor, constant: 0).isActive = true
        tituloTextView.leadingAnchor.constraint(equalTo: view2.leadingAnchor, constant: 0).isActive = true
        tituloTextView.trailingAnchor.constraint(equalTo: view2.trailingAnchor, constant: 0).isActive = true
        tituloTextView.font = UIFont(name: "Arial", size: view.frame.height * constanteTituloFont)
        tituloTextView.addDoneButtonWithCounter(title: "Listo", numLetras: numLetrasTitulo, target: self, selector: #selector(tapDone(sender:)))
        tituloTextView.textColor = UIColor.init(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.30)
        tituloTextView.text = "Escribe el Título aquí..."
        tituloTextView.delegate = self
        
        desarrolloView.topAnchor.constraint(equalTo: view3.topAnchor, constant: 0).isActive = true
        desarrolloView.bottomAnchor.constraint(equalTo: view3.bottomAnchor, constant: 0).isActive = true
        desarrolloView.leadingAnchor.constraint(equalTo: view3.leadingAnchor, constant: 0).isActive = true
        desarrolloView.trailingAnchor.constraint(equalTo: view3.trailingAnchor, constant: 0).isActive = true
        desarrolloView.font = UIFont(name: "Arial", size: view.frame.height * constanteContenidoFont)
        desarrolloView.addDoneButtonWithCounter(title: "Listo", numLetras: numLetrasCont, target: self, selector: #selector(tapDone(sender:)))
        desarrolloView.delegate = self
        
    }
    
    @objc func tapDone(sender: Any) {
        self.view.endEditing(true)
    }
    
    
    func viewConstraints () {
        
        view.addSubview(scroll)
        scroll.addSubview(content)
        content.addSubview(view1)
        content.addSubview(view2)
        content.addSubview(view3)
        
        view1.addSubview(imageView)
        
        
        scroll.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        scroll.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        scroll.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        scroll.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        content.topAnchor.constraint(equalTo: scroll.topAnchor, constant: 0).isActive = true
        content.bottomAnchor.constraint(equalTo: scroll.bottomAnchor, constant: 0).isActive = true
        content.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 0).isActive = true
        content.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: 0).isActive = true
        content.heightAnchor.constraint(equalToConstant: 2000).isActive = true
        content.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 0).isActive = true
        
        view1.topAnchor.constraint(equalTo: content.safeAreaLayoutGuide.topAnchor , constant: 0).isActive = true
        view1.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 0).isActive = true
        view1.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: 0).isActive = true
        
        view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 0).isActive = true
        view2.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 0).isActive = true
        view2.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: 0).isActive = true
        view2.layer.borderWidth = 1.0
        view2.layer.borderColor = UIColor.lightGray.cgColor
        
        
        view3.topAnchor.constraint(equalTo: view2.bottomAnchor, constant: 0).isActive = true
        view3.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 0).isActive = true
        view3.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: 0).isActive = true
        withoutKeyboard = view3.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: 0)
        withoutKeyboard!.isActive = true
        
        // medidas de los heights de los views
        constraintWithoutImage = view1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        constraintWithoutImage!.isActive = true
        //view2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        view2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05 * currentNumTitleLines).isActive = true

        
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
            numLetrasTitulo = "\(numberOfChars)/70"
            //tituloView.reloadInputViews()
            tituloTextView.addDoneButtonWithCounter(title: "Listo", numLetras: numLetrasTitulo, target: self, selector: #selector(tapDone(sender:)))
            tituloTextView.reloadInputViews()
            print("\(numberOfChars)/70")
            let currentNumLines = Int(tituloTextView.contentSize.height / tituloTextView.font!.lineHeight)
            currentNumTitleLines = CGFloat (currentNumLines)
            print (currentNumTitleLines)
           
            /******************************************  TODO ******************************************/
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
            
            //view2.heightConstraint?.constant = currentNumTitleLines * 0.05
            //print (view2.heightConstraint?.constant ?? 0)
            
            //self.view2.layoutIfNeeded()
            //view2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
            //viewConstraints()

                //view2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15)
            
            return numberOfChars < 70    // 70 Limit Value
        
            
        // escritura de cuerpo
        }  else if(textView.tag == 51) {
                let newText = (desarrolloView.text as NSString).replacingCharacters(in: range, with: text)
                let numberOfChars = newText.count
                numLetrasCont = "\(numberOfChars)/1000"
                desarrolloView.addDoneButtonWithCounter(title: "Listo", numLetras: numLetrasCont, target: self, selector: #selector(tapDone(sender:)))
                desarrolloView.reloadInputViews()
                return numberOfChars < 1000    // 1000 Limit Value
        } else {
            return false
        }
    }

}
