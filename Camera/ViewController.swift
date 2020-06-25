//
//  ViewController.swift
//  Camera
//
//  Created by everis on 25-06-20.
//  Copyright © 2020 everis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var selectedImageTag = 0
    
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addTapGestures()
    }

    func addTapGestures() {
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(tappedImage))
        image1.addGestureRecognizer(tap1)
        image1.tag = 1
        
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(tappedImage))
        image2.addGestureRecognizer(tap2)
        image2.tag = 2
        
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(tappedImage))
        image3.addGestureRecognizer(tap3)
        image3.tag = 3
        
    }

    
    
    
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func tappedImage(_ sender: UITapGestureRecognizer) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
         
            if let view = sender.view {
                selectedImageTag = view.tag
            }
            
            // Setup and present default
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Dismiss the view controller
        picker.dismiss(animated: true, completion: nil)
        
//        let image = info[UIImagePickerController] as! UIImage
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
        switch selectedImageTag {
        case 1:
            image1.image = image
        case 2:
            image2.image = image
        case 3:
            image3.image = image
        default:
            break
        }
        
    }
    
    /*
         (<#parameters#>) -> <#return type#> {
             <#function body#>
         }
    */
}

