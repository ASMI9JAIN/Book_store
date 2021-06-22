//
//  AddViewController.swift
//  book
//
//  Created by ASMI iOS Dev on 21/06/21.
//

import UIKit
import CoreData

class AddViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var genreSegment: UISegmentedControl!
    @IBOutlet weak var writtenText: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRcognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRcognizer)
        // Do any additional setup after loading the view.
    }
    @objc func imageTapped(tapGestureRecognizer:UITapGestureRecognizer)
    {
        let alert = UIAlertController.init(title: "Choose", message: "Upload  picture!", preferredStyle: UIAlertController.Style.alert)
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertAction.Style.default, handler:{
            (action:UIAlertAction)
            in
            var imageController = UIImagePickerController()
            imageController.sourceType = UIImagePickerController.SourceType.camera
            imageController.isEditing = true
            imageController.delegate = self
            self.present(imageController, animated: true, completion: nil)
        })
            alert.addAction(cameraAction)
        let galleryAction = UIAlertAction (title: "Gallery", style: UIAlertAction.Style.default, handler:{ (action:UIAlertAction)
            in
            var imageController = UIImagePickerController()
            imageController.sourceType = UIImagePickerController.SourceType.photoLibrary
            imageController.isEditing = true
            imageController.delegate = self
            self.present(imageController , animated: true , completion:nil)
        })
        alert.addAction(galleryAction)
        self.present(alert, animated: true, completion: nil)
    }
        
        //let tappedImage = tapGestureRecognizer.view as! UIImageView
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
        {
            print(info)
            
            let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            imageView.image = selectedImage
            picker.dismiss(animated: true, completion: nil)
            saveSelectedImage(img:selectedImage)
            
        }
        func saveSelectedImage(img:UIImage)
        {
            //find path of document directory of your app
            let pathArray:[String] = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
            //give a name to file to save image
            let imagePath:String = pathArray[0] + "/mypic.png"
            // get binary data of selected Image
            let imageData = img.pngData()
            // save binary data at image path
            let fm:FileManager = FileManager.default
            
            fm.createFile(atPath: imagePath, contents: imageData, attributes: nil)
             print("File saved")
            
            print(pathArray)
        }
    
    @IBAction func actionSave(_ sender: Any)
    {
        let image1 = imageView.image
        let title = titleText!.text!
        let desp = descriptionText!.text!
        let written = writtenText!.text!
        
        var type = ""
        if (genreSegment.selectedSegmentIndex == 0){
          type = "Horror"
        }
        if(genreSegment.selectedSegmentIndex == 1){
            type = "Action"
        }
        if(genreSegment.selectedSegmentIndex == 2){
            type = "humorous"
        }
        if(genreSegment.selectedSegmentIndex == 3){
            type = "Romantic"
        }
        if(genreSegment.selectedSegmentIndex == 4){
            type = "Biography"
        }
        if(genreSegment.selectedSegmentIndex == 5){
            type = "Historic"
        }
        
        //get ref of AppDelegate
        let apDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
       //get top layer of CoreData
        let context:NSManagedObjectContext = apDel.persistentContainer.viewContext
        //create empty of Book Data entity and fill with data
        let book:BookData = NSEntityDescription.insertNewObject(forEntityName: "BookData", into: context) as! BookData
            //BookData(context: context)
        book.bookImage = image1!.pngData()
        book.genre = type
        book.title = title
        book.writter = written
        book.dscp = desp
 //save object in store
        do{
                try context.save()
                print("data saved")
            titleText!.text = ""
            descriptionText!.text = ""
            writtenText.text = ""
            imageView.image = nil
            
        }catch{
            print("save error",error)
        }
        
    }
   
}
        
        
        /*
       
        
        
        
        
        
        emp.name = name
        emp.emp_id = Int32(id)
        emp.gender=gender
        emp.department=dept
        emp.salary=salary
        
        //save object in store
        do{
                try context.save()
                print("data saved")
            nameField!.text=""
            salaryField!.text = ""
            genderField.text=""
            empIDField!.text=""
            
        }catch{
            print("save error",error)
        }
 */
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


