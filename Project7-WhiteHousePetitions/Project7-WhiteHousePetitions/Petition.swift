//
//  Petition.swift
//  Project7-WhiteHousePetitions
//
//  Created by El Ati El Adimi, Othmane on 26/02/2021.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}

struct Petitions : Codable {
    var results: [Petition]
}
