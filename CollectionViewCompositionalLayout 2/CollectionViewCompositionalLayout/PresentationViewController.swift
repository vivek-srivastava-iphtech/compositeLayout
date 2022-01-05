//
//  PresentationViewController.swift
//  CollectionViewCompositionalLayout
//
//  Created by vivek shrivastwa on 04/01/22.
//

import UIKit

class PresentationViewController: UIViewController {

    //MARK: - outlet
    @IBOutlet weak var imageView: UIImageView!
    
    var image:UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let image = image{
            imageView.image = image
        }
    }
    

    @IBAction func backButtonSelected(_ sender: Any) {
        print("back button selected")
        self.dismiss(animated: true, completion: nil)
    }
}
