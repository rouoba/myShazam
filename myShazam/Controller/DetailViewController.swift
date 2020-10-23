//
//  DetailViewController.swift
//  myShazam
//
//  Created by Rene Ouoba on 10/22/20.
//

import UIKit

class DetailViewController: UIViewController {

    var song: Song?
    
    @IBOutlet weak var albumArtImage: UIImageView!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var osNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        artistLabel.text = song?.artistname
        titleLabel.text = song?.tracktitle
        osNameLabel.text = song?.osname
        dateLabel.text = song?.date
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
