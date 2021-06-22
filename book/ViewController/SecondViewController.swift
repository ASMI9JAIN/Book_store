//
//  SecondViewController.swift
//  book
//
//  Created by ASMI iOS Dev on 21/06/21
//

import UIKit
import CoreData
class SecondViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    @IBOutlet weak var bookTableView: UITableView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    
    var bookArray:[NSManagedObject]  = []
    var type:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        genreLabel.text = type
        addButton.isHidden = true
        //get CoreData container
          let apDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
      //get context layer  obj
          let context:NSManagedObjectContext = apDel.persistentContainer.viewContext
          
          //get all data of BookData entity
          let fetchRequest:NSFetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "BookData")
          
          do{
            bookArray = try context.fetch(fetchRequest) as! [NSManagedObject]
              print(bookArray)
              
          }catch{
              print("fetch error", error)
          }
          
        bookTableView.dataSource = self
        bookTableView.delegate = self
        let cellnib = UINib(nibName: "GenreTableViewCell", bundle: nil)
        bookTableView.register(cellnib, forCellReuseIdentifier: "GenreTableViewCell")
        
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = bookTableView.dequeueReusableCell(withIdentifier: "GenreTableViewCell",for:indexPath) as! GenreTableViewCell
        
        let bk:BookData = bookArray[indexPath.row] as! BookData
        if (bk.genre == type){
            print("success")
            cell.typeLabel.text = bk.genre
            cell.writterLabel.text = bk.writter
            cell.titleLabel.text = bk.title
            cell.imageView?.image = getImage(date: bk.bookImage!)
            return cell
        }
        cell.typeLabel.text = ""
        cell.writterLabel.text = ""
        cell.titleLabel.text = ""
        cell.imageView?.image = nil
        cell.genreLabel.text = ""
        
        return cell
        //cell.imageView?.alpha = 0.4
        //cell.bookDisplay.image = bk.bookImage
        
    }
    
    func getImage(date: Data) -> UIImage {
        return  UIImage(data: date)!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let bk:BookData = bookArray[indexPath.row] as! BookData
        
        
         let details:DetailViewController = self.storyboard!.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
              details.title1 = bk.title!
              details.writter1 = bk.writter!
              details.genre1 = bk.genre!
            self.present(details, animated: true, completion: nil)
         
        
    }
    
    @IBAction func actionAdd(_ sender: Any)
    {
        let addCon:AddViewController = self.storyboard!.instantiateViewController(withIdentifier: "AddViewController") as! AddViewController
        self.present(addCon, animated: true, completion: nil)
    }
    
}
        
        /*
 let alert = UIAlertController(title: "abc", message: "", preferredStyle: UIAlertController.Style.alert)
 let deleteAction = UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler: {
     (action:UIAlertAction?) in
      
     //get context layer
     let apDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate

     let context:NSManagedObjectContext = apDel.persistentContainer.viewContext
     
     do{
         context.delete(bk)
         try context.save()
         self.bookArray.remove(at: indexPath.row)
         self.bookTableView.reloadData()
         
     }catch{
         print("delete error")
     }
     })
 //--------------------
 alert.addAction(deleteAction)
 
 let okAction=UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
 alert.addAction(okAction)
 self.present(alert, animated: true, completion: nil)
         let alert = UIAlertController(title: "abc", message: "", preferredStyle: UIAlertController.Style.alert)
         let deleteAction = UIAlertAction(title: "Delete", style: UIAlertAction.Style.destructive, handler: {
             (action:UIAlertAction?) in
              
             //get context layer
             let apDel:AppDelegate = UIApplication.shared.delegate as! AppDelegate
     
             let context:NSManagedObjectContext = apDel.persistentContainer.viewContext
             
             do{
                 context.delete(bk)
                 try context.save()
                 self.bookArray.remove(at: indexPath.row)
                 self.bookTableView.reloadData()
                 
             }catch{
                 print("delete error")
             }
             })
         //--------------------
         alert.addAction(deleteAction)
         
         let okAction=UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
         alert.addAction(okAction)
         self.present(alert, animated: true, completion: nil)
         */
        /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


