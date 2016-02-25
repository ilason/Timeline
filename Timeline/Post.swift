//
//  Post.swift
//  Timeline
//
//  Created by Aaron Eliason on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

struct Post {
    let imageEndPoint: String
    let caption: String?
    let userName: String
    let comments: [Comment]
    let likes: [Like]
    var identifier: String?
    
    init(imageEndPoint: String, caption: String?, userName: String = "", comments: [Comment] = [], likes: [Like] = [], identifier: String? = nil ){
        self.imageEndPoint = imageEndPoint
        self.caption = caption
        self.userName = userName
        self.comments = comments
        self.likes = likes
        self.identifier = identifier
        
    }
}

func ==(lhs: Post, rhs: Post) -> Bool{
    return(lhs.userName == rhs.userName) && (lhs.identifier == rhs.identifier)
}