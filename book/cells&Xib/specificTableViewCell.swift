//
//  specificTableViewCell.swift
//  book
//
//  Created by ASMI iOS Dev on 21/06/21.
//

import UIKit

class specificTableViewCell: UITableViewCell {

    @IBOutlet weak var genreImage: UIImageView!
   // @IBOutlet weak var genreButton: UIButton!
    @IBOutlet weak var genreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
