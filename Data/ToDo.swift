//
//  ToDo.swift
//  Assignment2-1
//
//  Created by Takafumi Watanabe on 2021-12-05.
//

import Foundation
import Firebase

struct ToDo {
    let ref: DatabaseReference?
    let key: String
    var title: String
    var isCompleted: Bool = false
    
    init(title: String, isCompleted: Bool = false, key: String = "") {
        self.ref = nil
        self.key = key
        self.title = title
        self.isCompleted = isCompleted
    }
    
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let title = value["title"] as? String,
            let isCompleted = value["isCompleted"] as? Bool
        else {
            return nil
        }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func toAnyObject() -> Any {
        return [
            "title": title,
            "isCompleted": isCompleted
        ]
    }
}
