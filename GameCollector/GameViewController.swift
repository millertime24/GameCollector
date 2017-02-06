//
//  GameViewController.swift
//  GameCollector
//
//  Created by Andrew on 2/3/17.
//  Copyright © 2017 Andrew. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var gameImageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func photosTapped(_ sender: AnyObject) {
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
       let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        gameImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cameraTapped(_ sender: AnyObject) {
    }
    
    @IBAction func addTapped(_ sender: AnyObject) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let game = Game(context: context)
        game.title = titleTextField.text
        game.image = UIImagePNGRepresentation(gameImageView.image!) as NSData?
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
