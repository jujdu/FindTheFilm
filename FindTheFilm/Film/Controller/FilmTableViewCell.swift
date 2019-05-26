//
//  FilmViewCell.swift
//  FindTheFilm
//
//  Created by Michael Sidoruk on 23/05/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class FilmTableViewCell: UITableViewCell {
    
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
