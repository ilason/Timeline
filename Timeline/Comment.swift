//
//  Comment.swift
//  Timeline
//
//  Created by Aaron Eliason on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Comment {
    
    var userName: String
    var text: String
    var postIdentifier: String
    var identifier: String?
    
    init(userName: String, text: String, postIdentifier: String, identifier: String? = nil){
        self.userName = userName
        self.text = text
        self.postIdentifier = postIdentifier
        self.identifier = identifier
    }
}

func ==(lhs: Comment, rhs: Comment) -> Bool{
    
    return(lhs.userName == rhs.userName) && (lhs.identifier == rhs.identifier)
}