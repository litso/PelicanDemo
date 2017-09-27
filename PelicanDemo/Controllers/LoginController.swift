//
//  LoginController.swift
//  PelicanDemo
//
//  Created by Robert Manson on 9/26/17.
//  Copyright © 2017 Clutter. All rights reserved.
//

import UIKit

class LoginController: UITableViewController {

    @IBOutlet weak var submitButton: UIButton!
    var email: String?
    var password: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateCompleteButton()
    }

    // Actions

    @IBAction func emailEditingDidEnd(_ sender: UITextField) {
        email = sender.text
        updateCompleteButton()
    }

    @IBAction func passwordEditingDidEnd(_ sender: UITextField) {
        password = sender.text
        updateCompleteButton()
    }
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Logged In", let email = email {
            AppEvents.logEvent(LoginEvent(email: email))
        }
    }
}

fileprivate extension LoginController {
    func updateCompleteButton() {
        guard !(email?.isEmpty ?? true), !(password?.isEmpty ?? true) else {
            submitButton.isEnabled = false
            return
        }
        submitButton.isEnabled = true
    }
}
