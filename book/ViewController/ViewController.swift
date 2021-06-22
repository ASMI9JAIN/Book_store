//
//  ViewController.swift
//  book
//
//  Created by ASMI iOS Dev on 21/06/21.
//

import UIKit
import CoreData
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var genre = Array<GenreUser>()
    @IBOutlet weak var genreTableView: UITableView!
    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var type1 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let g1 = GenreUser(image: "action1",text: "Action & Adventure")
        let g2 = GenreUser(image: "biography1",text: "Biography")
        let g3 = GenreUser(image: "historical1",text: "Historical")
        let g4 = GenreUser(image: "horror1",text: "Horror")
        let g5 = GenreUser(image: "humorous1",text: "Humorous")
        let g6 = GenreUser(image: "literary1",text: "Literacy")
        let g7 = GenreUser(image: "romantic",text: "Romantic")
        let g8 = GenreUser(image: "short1",text: "Short Stories")
        genre = [g1,g2,g3,g4,g5,g6,g7,g8]
        let cellnib = UINib(nibName: "specificTableViewCell", bundle: nil)
        genreTableView.register(cellnib, forCellReuseIdentifier: "specificTableViewCell")
        genreTableView.dataSource = self
        genreTableView.delegate = self
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genre.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = genreTableView.dequeueReusableCell(withIdentifier: "specificTableViewCell",for:indexPath) as! specificTableViewCell
        let user = genre[indexPath.row]
        cell.genreImage.image = UIImage(named: user.image)
        cell.genreLabel.text = user.text
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("abc")
        if indexPath.row == 0
        {
            print("Action & Adventure")
            second(type:"Action & Adventure")
        }
        if indexPath.row == 1
        {
            print("Biography")
            second(type: "Biography")
            
        }
        if indexPath.row == 2
        {
            print("historical")
            second(type: "historical")
        }
        if indexPath.row == 3
        {
            print("horror")
            second(type: "horror")
        }
        if indexPath.row == 4
        {
            print("humorous")
            second(type:"")
        }
        if indexPath.row == 5
        {
            print("literary")
            second(type:"")
        }
        if indexPath.row == 6
        {
            print("romantic")
            second(type:"")
        }
        if indexPath.row == 7
        {
            print("short Stories")
            second(type: "short Stories")
        }
        
    }
    func second(type:String) -> Void {
        let gen:String = type
        
        let secondCon:SecondViewController = self.storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondCon.type = gen
        self.present(secondCon, animated: true, completion: nil)
    }
    
    @IBAction func actionLogin(_ sender: Any) {
        let secondCon:SecondViewController = self.storyboard!.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.present(secondCon, animated: true, completion: nil)
        secondCon.addButton.isHidden = false
    }
    
}

