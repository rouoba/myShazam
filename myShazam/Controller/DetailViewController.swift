//
//  DetailViewController.swift
//  myShazam
//
//  Created by Rene Ouoba on 10/22/20.
//

import UIKit

class DetailViewController: UIViewController {

    var song: Song?
    var osIcon: UIImage?
    var likeButtonImage: UIImage?
    var sliderValue: Float?
    
    @IBOutlet weak var albumArtImage: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var osImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeImage: UIImageView!
    @IBOutlet weak var ratingSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        artistLabel.text = song?.artistname
        titleLabel.text = song?.tracktitle
        osImage.image = osIcon
        dateLabel.text = String((song?.date.prefix(10))!)
        likeImage.image = likeButtonImage
        
        ratingSlider.setThumbImage(UIImage(systemName: "star"), for: .normal)
        ratingSlider.setValue(sliderValue ?? 2.0, animated: true)
    }
    
}
