//
//  PupDetailsController.swift
//  PelicanDemo
//
//  Created by Robert Manson on 9/26/17.
//  Copyright © 2017 Clutter. All rights reserved.
//

import UIKit

class PupDetailsController: UIViewController {
    var pup: Pup!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = pup.photo
        navigationItem.title = pup.name
    }

    @IBAction func adoptPressed(_ sender: Any) {
        AppEvents.logEvent(PupAdopted(pupId: pup.id))
        navigationController?.popViewController(animated: true)
    }
}
