//
//  ViewController.swift
//  myShazam
//
//  Created by Rene Ouoba on 10/21/20.
//

import UIKit

class HomeViewController: UITableViewController {

    
    var songsList: [Song] = []
//    var delegate: DetailViewController?
    
    @IBOutlet var myTableView: UITableView!
    
    
    //Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSongsList()
        self.myTableView.register(UINib(nibName: "SongTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsList.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueToDetailView", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> SongTableViewCell {
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SongTableViewCell else {return SongTableViewCell()}
        cell.dateLabel.text = songsList[indexPath.row].date
        cell.artistLabel.text = songsList[indexPath.row].artistname
        cell.titleLabel.text = songsList[indexPath.row].tracktitle
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.systemTeal
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let indexPath = sender as? IndexPath
        guard let vc = segue.destination as? DetailViewController else { return }
        //read data from cell and get ready to load it into the labels
    }
    
    //Helper functions
    func loadSongsList() {
        if let filepath = Bundle.main.path(forResource: "songsList", ofType: "json") {
            do {
                guard let jsonData = try String(contentsOfFile: filepath).data(using: .utf8) else {return}
                let myList: [Song] = try! JSONDecoder().decode([Song].self, from: jsonData)
                copySongs(from: myList, to: &songsList)
            } catch {
                print("Songs could not be loaded!")
            }
        } else {
            print("Json file not found!")
        }
    }
    
    func copySongs(from list1: [Song], to list2: inout [Song]) {
        let numberOfSongs = list1.count
        for index in 0...numberOfSongs-1 {
            list2.append(list1[numberOfSongs - 1 - index])
        }
    }
}
