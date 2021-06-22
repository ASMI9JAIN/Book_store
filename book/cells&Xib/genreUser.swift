//
//  genreUser.swift
//  book
//
//  Created by ASMI iOS Dev on 21/06/21.
//

import Foundation
class GenreUser{
    var image:String = ""
    var text:String = ""
    init(image:String,text:String){
        self.image = image
        self.text = text
    }
    
}
class BookType{
    var image:String = ""
    var title:String = ""
    var writterName:String = ""
    init(image:String,Title:String,writterName:String){
        self.image = image
        self.title = Title
        self.writterName = writterName
    }
}
