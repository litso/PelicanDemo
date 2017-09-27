//
//  Pup.swift
//  PelicanDemo
//
//  Created by Robert Manson on 9/26/17.
//  Copyright © 2017 Clutter. All rights reserved.
//

import UIKit

struct Pup {
    let id: Int
    let name: String
    let photo: UIImage?
}

let pups: [Pup] = [
    Pup(id: 1, name: "Bear", photo: UIImage(named: "Bear")),
    Pup(id: 3, name: "Giant", photo: UIImage(named: "Giant")),
    Pup(id: 4, name: "Leonard", photo: UIImage(named: "Leonard")),
    Pup(id: 5, name: "Lucy", photo: UIImage(named: "Lucy")),
    Pup(id: 6, name: "Spike", photo: UIImage(named: "Spike")),
    Pup(id: 2, name: "Beetoven", photo: UIImage(named: "Beetoven"))
]
