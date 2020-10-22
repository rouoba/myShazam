//
//  ViewCell.swift
//  myShazam
//
//  Created by Rene Ouoba on 10/21/20.
//

import UIKit

class ViewCell: UITableViewCell {

    @IBOutlet weak var artist: UILabel!
    @IBOutlet weak var songTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
