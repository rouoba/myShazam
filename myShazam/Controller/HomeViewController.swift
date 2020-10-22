//
//  ViewController.swift
//  myShazam
//
//  Created by Rene Ouoba on 10/21/20.
//

import UIKit

class HomeViewController: UITableViewController {

    let songList: [Song] = [
        Song(artistname: "Red Hot Chili Peppers", tracktitle: "Under The Bridge"),
        Song(artistname: "Beck", tracktitle: "Dreams"),
        Song(artistname: "Selena Gomez Feat. A$AP Rocky", tracktitle: "Good For You")
    ]
    
    @IBOutlet var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songList.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row selected")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ViewCell {
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ViewCell else {return ViewCell()}
        cell.artist.text = songList[indexPath.row].artistname
        cell.songTitle.text = songList[indexPath.row].tracktitle
        return cell
    }
}
