//
//  AppEvents.swift
//  PelicanDemo
//
//  Created by Robert Manson on 9/26/17.
//  Copyright © 2017 Clutter. All rights reserved.
//

import Foundation
import Pelican

protocol Event: PelicanGroupable, PelicanBatchableTask {
    var name: String { get }
    var timeStamp: Date { get }
    var dictionary: [String: Any] { get }
}

// MARK: - PelicanGroupable
extension Event {
    var group: String { return "App Events" }

    static func processGroup(tasks: [PelicanBatchableTask], didComplete: @escaping ((PelicanProcessResult) -> Void)) {
        print("Batch:")
        tasks.forEach { print($0) }
        didComplete(.done)
    }
}

final class AppEvents {
    class func logEvent(_ event: Event) {
        Pelican.shared.gulp(task: event)
    }
}

struct LoginEvent: Event {
    let name = "login"
    let timeStamp: Date
    let email: String

    var dictionary: [String : Any] {
        return [
            "name": name,
            "time_stamp": timeStamp.iso8601StringWithMilliseconds,
            "email": email
        ]
    }

    init(email: String) {
        self.timeStamp = Date()
        self.email = email
    }

    static let taskType: String = String(describing: LoginEvent.self)

    init?(dictionary: [String : Any]) {
        guard let timeStamp = dictionary["time_stamp"] as? Date,
            let email = dictionary["email"] as? String else {
                return nil
        }
        self.timeStamp = timeStamp
        self.email = email
    }
}

struct PupViewed: Event {
    let name = "pup-viewed"
    let timeStamp: Date
    let pupId: Int

    var dictionary: [String : Any] {
        return [
            "name": name,
            "time_stamp": timeStamp.iso8601StringWithMilliseconds,
            "pup_id": pupId
        ]
    }

    init(pupId: Int) {
        self.timeStamp = Date()
        self.pupId = pupId
    }

    static let taskType: String = String(describing: PupViewed.self)

    init?(dictionary: [String : Any]) {
        guard let timeStamp = dictionary["time_stamp"] as? Date,
            let pupId = dictionary["pup_id"] as? Int else {
                return nil
        }
        self.timeStamp = timeStamp
        self.pupId = pupId
    }
}

struct PupAdopted: Event {
    let name = "pup-adopted"
    let timeStamp: Date
    let pupId: Int

    var dictionary: [String : Any] {
        return [
            "name": name,
            "time_stamp": timeStamp.iso8601StringWithMilliseconds,
            "pup_id": pupId
        ]
    }

    init(pupId: Int) {
        self.timeStamp = Date()
        self.pupId = pupId
    }

    static let taskType: String = String(describing: PupAdopted.self)

    init?(dictionary: [String : Any]) {
        guard let timeStamp = dictionary["time_stamp"] as? Date,
            let pupId = dictionary["pup_id"] as? Int else {
                return nil
        }
        self.timeStamp = timeStamp
        self.pupId = pupId
    }
}

fileprivate extension Date {
    var iso8601StringWithMilliseconds: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSS'Z'"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter.string(from: self)
    }
}
