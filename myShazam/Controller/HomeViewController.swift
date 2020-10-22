//
//  ViewController.swift
//  myShazam
//
//  Created by Rene Ouoba on 10/21/20.
//

import UIKit

class HomeViewController: UIViewController {

    let songList: [Song] = [
        Song(artistname: "Red Hot Chili Peppers", tracktitle: "Under The Bridge"),
        Song(artistname: "Beck", tracktitle: "Dreams"),
        Song(artistname: "Selena Gomez Feat. A$AP Rocky", tracktitle: "Good For You")
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tableView.delegate = self
//        tableView.dataSource = self
    }

}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Hello")
    }
}

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ViewCell else {return ViewCell()}

        cell.artist.text = songList[indexPath.row].artistname
        cell.songTitle.text = songList[indexPath.row].tracktitle
        return cell
    }
}
