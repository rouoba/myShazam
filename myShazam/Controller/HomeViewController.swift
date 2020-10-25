//
//  ViewController.swift
//  myShazam
//
//  Created by Rene Ouoba on 10/21/20.
//

import UIKit

class HomeViewController: UITableViewController {

    
    var songsList: [Song] = []
    
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
        performSegue(withIdentifier: "segueToDetailView", sender: indexPath)
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> SongTableViewCell {
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SongTableViewCell else {return SongTableViewCell()}
        cell.layer.cornerRadius = 15.0
        loadDataIn(cell, atPosition: indexPath.row)
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = sender as? IndexPath else { return }
        guard let vc = segue.destination as? DetailViewController else { return }
        
        vc.song = songsList[indexPath.row]
        
        guard let currentCell = myTableView.cellForRow(at: indexPath) as? SongTableViewCell else {return}
        vc.osIcon = currentCell.osImage.image
        
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = .systemBackground
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(named: "cellBackgroundColor")
        }
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
    
    
    func loadDataIn(_ cell: SongTableViewCell ,atPosition cellPosition: Int) {
        let date = songsList[cellPosition].date
        cell.dateLabel.text = String(date.prefix(10))
        
        cell.artistLabel.text = songsList[cellPosition].artistname
        cell.titleLabel.text = songsList[cellPosition].tracktitle

        if songsList[cellPosition].osname == "Android" {
            cell.osImage.image = UIImage(named: "android")
        } else if songsList[cellPosition].osname == "IOS" {
            cell.osImage.image = UIImage(named: "apple")
        } else {
            cell.osImage.image = UIImage(named: "questionmark.circle")
        }
    }
}
