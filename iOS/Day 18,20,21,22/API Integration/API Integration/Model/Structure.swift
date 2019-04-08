//
//  Structure.swift
//  API Integration
//
//  Created by Anuranjan Bose on 08/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import Foundation

struct DataJson: Decodable {
    let format: String
    let width: Int
    let height: Int
    let filename: String
    let id: Int
    let author: String
    let author_url: String
    let post_url: String
}
