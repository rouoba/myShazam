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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSongsList()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsList.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> ViewCell {
        guard let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ViewCell else {return ViewCell()}
        cell.artist.text = songsList[indexPath.row].artistname
        cell.songTitle.text = songsList[indexPath.row].tracktitle
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor.systemTeal
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75.0
    }
    
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
        for index in 0...list1.count-1 {
            list2.append(list1[index])
        }
    }
}
