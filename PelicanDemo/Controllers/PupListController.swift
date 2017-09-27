//
//  PupListController.swift
//  PelicanDemo
//
//  Created by Robert Manson on 9/26/17.
//  Copyright © 2017 Clutter. All rights reserved.
//

import UIKit

class PupListController: UITableViewController {

    var selectedPup: Pup?

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Photo Cell", for: indexPath) as? PhotoCell else {
            fatalError()
        }
        cell.cellPhoto.image = pups[indexPath.row].photo
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pup = pups[indexPath.row]
        selectedPup = pup
        AppEvents.logEvent(PupViewed(pupId: pup.id))
        performSegue(withIdentifier: "Pup Details", sender: self)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PupDetailsController {
            vc.pup = selectedPup
        }
    }
}
