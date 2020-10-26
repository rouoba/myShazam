//
//  Song.swift
//  myShazam
//
//  Created by Rene Ouoba on 10/21/20.
//

import Foundation

struct Song: Decodable {
    var date: String
    var artistname: String
    var tracktitle: String
    var osname: String?
}
