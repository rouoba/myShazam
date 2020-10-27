//
//  DetailViewController.swift
//  myShazam
//
//  Created by Rene Ouoba on 10/22/20.
//

import UIKit

class DetailViewController: UIViewController {

    var delegate: HomeViewController?
    var song: Song?
    var osIcon: UIImage?
    var sliderValue: Float?
    var liked: Bool?
    var likeButtonImage: UIImage?
    var cellPath: IndexPath? 
    
    
    @IBOutlet weak var albumArtImage: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var osImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var ratingSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        artistLabel.text = song?.artistname
        titleLabel.text = song?.tracktitle
        osImage.image = osIcon
        dateLabel.text = String((song?.date.prefix(10))!)
        
        likeButton.setImage(likeButtonImage, for: .normal)
        
        ratingSlider.setThumbImage(UIImage(systemName: "star"), for: .normal)
        ratingSlider.setValue(sliderValue ?? 2.0, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        guard let previousCellPath = cellPath else { return }
        
        guard let defaultImage = UIImage(systemName: "hand.thumbsup") else { return }
        delegate?.updateCollection(indexPath: previousCellPath, sliderValue: sliderValue ?? 0.0, liked: liked ?? false, likeImage: likeButtonImage ?? defaultImage)
    }
     
    @IBAction func sliderAction(_ sender: UISlider) {
        sliderValue = ratingSlider.value 
    }
    @IBAction func likeButtonAction(_ sender: UIButton) {
        liked?.toggle()
        guard let safeLiked = liked else { return }
        
        if safeLiked {
            likeButtonImage = UIImage(systemName: "hand.thumbsup.fill")
        } else {
            likeButtonImage = UIImage(systemName: "hand.thumbsup")
        }
        likeButton.setImage(likeButtonImage, for: .normal)
    }
}
