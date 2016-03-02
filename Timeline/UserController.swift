//
//  UserController.swift
//  Timeline
//
//  Created by Aaron Eliason on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
//Create a UserController model object controller that will manage and serve User objects to the rest of the application. The UserController will also handle managing followers and followed accounts//

class UserController {
    
    var currentUser: User!{
        return mockUsers()[0]
    }
    //Add a static sharedController property that will help serve our currentUser consistently through the app.
    static let sharedController = UserController()
    
    
    //Define a static function userForIdentifier that takes an identifier and completion closure with an optional User parameter.


    static func userForIdentifier(identifier: String, completion: (user: User?) -> Void) {
        
        
    }
    static func fetchAllUsers(completion:(user: [User]) -> Void) {
        completion(user: sharedController.mockUsers())
        
    }
    static func followUser(user: User, completion:(succes: Bool) -> Void) {
        completion(succes: true)
        
    }
    static func unfollowUser(user: User, completion:(success: Bool) -> Void){
        completion(success: true)
        
    }
    
    static func userFollowUser(user: User, followUser: User, completion: (follows: Bool) -> Void) {
        completion(follows: true)
    }
    
<<<<<<< Updated upstream
    static func followedbyUser(user: User, compeltion: [User]?) -> Void {
=======
    static func followedbyUser(user: User, compeltion: (followed: [User]?) -> Void) {
        compeltion(followed: sharedController.mockUsers())
>>>>>>> Stashed changes
        
    }
    
    static func authenticateUser(email: String, password: String, completion: ( success: Bool, user: User?) -> Void) {
        completion(success: true, user: sharedController.mockUsers().first!)
    }

<<<<<<< Updated upstream
    static func createUser(email: String, userName: String, password: String, bio: String?, completion: (success: Bool, user: User?) -> Void) {
        
=======
    static func createUser(email: String, userName: String, password: String, bio: String?, url: String?, completion: (success: Bool, user: User?) -> Void) {
        completion(success: true, user: sharedController.mockUsers().first!)
>>>>>>> Stashed changes
    }
    
    static func updateUser(user: User, userName: String, bio: String?, url: String?, completion:(success: Bool, user: User?) -> Void) {
        completion(success: true, user: sharedController.mockUsers().first!)
        
    }
    
    static func logOutCurrentUser(){
        
    }
    
    func mockUsers() -> [User] {
        let user1 = User(userName: "Aaron", bio: "Hey, its nice to be part of this app", url: "www.facebook.com", identifier: "aaroneliason")
    
        let user2 = User(userName: "Mared", bio: "Well.. I guess its alright", url: "www.idonthaveone.com", identifier: "maredBlakeley")
        let user3 = User(userName: "Tracy", bio: "Good job bro", url: nil, identifier: "tracyEliason")
        
        return[user1, user2, user3]
    }

}

