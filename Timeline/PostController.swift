//
//  PostController.swift
//  Timeline
//
//  Created by Aaron Eliason on 2/24/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class PostController {
    static func fetchTimeLineForUser(user: User, completion: (posts: [Post]?) -> Void) {
        
    }
    static func addPost(image: UIImage, caption: String?, completion: (success: Bool, post: Post?) ->Void) {
        
    }
    static func postFromIdentifier(identifier: String, completion:(post: Post?) -> Void){
        
    }
    static func postsForUser(user: User, completion: (posts: [Post]?) -> Void) {
        
    }
    static func deletePost(post: Post) {
        
    }
    static func addCommentWithTextToPost(text: String, post: Post, completion: (success: Bool, post: Post?) -> Void){
        
    }
    static func deleteComment(comment: Comment, completion: ( success: Bool, post: Post?) -> Void) {
        
    }
    static func addLikeToPost(post: Post, completion: (success: Bool, post: Post?) -> Void) {
        
    }
    static func deleteLike(like: Like, completion:(success: Bool, post: Post?) -> Void) {
        
    }
    static func orderPosts( posts: [Post]) -> [Post] {
        return []
    }
    
        static func mockPosts() -> [Post] {
    
            let sampleImageIdentifier = "-K1l4125TYvKMc7rcp5e"
    
            let like1 = Like(userName: "darth", postIdentifier: "1234")
            let like2 = Like(userName: "look", postIdentifier: "4566")
            let like3 = Like(userName: "em0r0r", postIdentifier: "43212")
    
            let comment1 = Comment(userName: "ob1kenob", text: "use the force", postIdentifier: "1234")
            let comment2 = Comment(userName: "darth", text: "join the dark side", postIdentifier: "4566")
    
            let post1 = Post(imageEndPoint: sampleImageIdentifier, caption: "Nice shot!", comments: [comment1, comment2], likes: [like1, like2, like3])
            let post2 = Post(imageEndPoint: sampleImageIdentifier, caption: "Great lookin' kids!")
            let post3 = Post(imageEndPoint: sampleImageIdentifier, caption: "Love the way she looks when she smiles like that.")
    
            return [post1, post2, post3]
        }
    
}
