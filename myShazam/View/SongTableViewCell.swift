//
//  SongTableViewCell.swift
//  myShazam
//
//  Created by Rene Ouoba on 10/22/20.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var osImage: UIImageView!
    @IBOutlet weak var contentStackView: UIStackView!
    @IBOutlet weak var numberOfStarSlider: UISlider!
    
    var likeButtonState = false
    var likeImage: UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likeButtonTapped(_ sender: UIButton) {
        likeButtonState.toggle()

        if likeButtonState {
            likeImage = UIImage(systemName: "hand.thumbsup.fill")
        } else {
            likeImage = UIImage(systemName: "hand.thumbsup")
        }
        
        sender.setImage(likeImage, for: .normal)
    }
}
