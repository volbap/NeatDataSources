//
//  Album.swift
//  NeatDataSources
//
//  Created by Pablo Villar on 12/14/18.
//  Copyright © 2018 Pablo Villar. All rights reserved.
//

import Foundation

struct Album: Codable {
    let author: String
    let title: String
    let year: Int
    let imageLink: String
    let tracks: [Track]
}
