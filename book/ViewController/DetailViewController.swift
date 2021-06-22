//
//  DetailViewController.swift
//  book
//
//  Created by ASMI iOS Dev on 21/06/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleField: UILabel!
    @IBOutlet weak var writterField: UILabel!
    @IBOutlet weak var descpLabel: UILabel!
    @IBOutlet weak var reviewLabel: UILabel!
    @IBOutlet weak var commentsLabel: UITextField!
    @IBOutlet var favImage:UIImageView!
    
    var title1:String = ""
    var writter1:String = ""
    var description1:String = ""
    var genre1:String = ""
    var image1:String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        favImage.image = UIImage(named: "Uncoloured")
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        favImage.isUserInteractionEnabled = true
        favImage.addGestureRecognizer(tapGestureRecognizer)
        titleField.text = title1
        writterField.text = writter1
        
        
        // Do any additional setup after loading the view.
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        let imgview = tapGestureRecognizer.view
        tappedImage.image=UIImage(named: "Coloured")
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
