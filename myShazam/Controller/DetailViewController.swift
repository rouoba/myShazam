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
    
    @IBOutlet weak var albumArtImage: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var osImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var likeImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        artistLabel.text = song?.artistname
        titleLabel.text = song?.tracktitle
        osImage.image = osIcon
        dateLabel.text = String((song?.date.prefix(10))!)
        likeImage.image = likeButtonImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
