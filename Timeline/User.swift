//
//  User.swift
//  Timeline
//
//  Created by Aaron Eliason on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct User{
    var userName: String
    var bio: String?
    var url: String?
    var identifier: String
    
    init(userName: String, bio: String? = nil, url: String? = nil, identifier: String){
        self.userName = userName
        self.bio = bio
        self.url = url
        self.identifier = identifier
    }
}
func ==(lhs: User, rhs: User) -> Bool{
    return(lhs.userName == rhs.userName) && (lhs.identifier == rhs.identifier)
    
}