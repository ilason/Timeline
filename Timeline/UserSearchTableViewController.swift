//
//  UserSearchTableViewController.swift
//  Timeline
//
//  Created by Aaron Eliason on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

<<<<<<< Updated upstream
class UserSearchTableViewController: UITableViewController {
    @IBOutlet weak var modeSegmentedControl: UISegmentedControl!
=======
class UserSearchTableViewController: UITableViewController, UISearchResultsUpdating {
>>>>>>> Stashed changes
    
    var usersDatasource: [User] = []
    
    enum ViewMode: Int {
        case Friends
        case All
        
        func users ( completion:( users: [User]?) -> Void) {
            switch self {
            case .Friends:
                UserController.followedByUser(UserController.sharedController.currentUser, completion: { (followed) -> Void in
                    completion(users: followed)
                })
            case .All:
                UserController.fetchAllUsers({ (users) -> Void in
                    completion(users: users)
                })
            }
        }
    }
    var mode: ViewMode {
        return ViewMode(rawValue: modeSegmentedControl.selectedSegmentIndex)!
        
    }
    
    func updateViewForMode(mode: ViewMode) {
        mode.users { (users) -> Void in
            if let users = users {
                self.usersDatasource = users
            } else{
                self.usersDatasource = []
            }
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
<<<<<<< Updated upstream
        updateViewForMode(mode)
    }
    
    @IBAction func selectedIndexChanged(sender: AnyObject) {
        updateViewForMode(mode)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
=======

     updateViewBasedOnMode(mode)
        setUpSearchController()
    }

    @IBAction func selectedIndexChanged(sender: AnyObject) {
>>>>>>> Stashed changes
    }
    
    
    func updateViewBasedOnMode(mode: ViewMode) {
        mode.users { (users) -> Void in
            if let users = users {
                self.usersDataSource = users
            } else {
                self.usersDataSource = []
            }
            
            self.tableView.reloadData()
        }
    }
<<<<<<< Updated upstream

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.usersDatasource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("userCell", forIndexPath: indexPath)
        
        let user = usersDatasource[indexPath.row]
        
        cell.textLabel?.text = user.username

        
=======
    
    //MARK: - Search Controller
    
    func setUpSearchController() {
        let resultsController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("userSearchResults")
        searchController = UISearchController(searchResultsController: resultsController)
        searchController.searchResultsUpdater = self
        searchController.searchBar.sizeToFit()
        searchController.hidesNavigationBarDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        
        definesPresentationContext = true
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        let searchTerm = searchController.searchBar.text!.lowercaseString
        
        let resultsViewController = searchController.searchResultsController as! UserSearchResultsTableViewController
        
        resultsViewController.usersResultsDataSource = self.usersDataSource.filter({$0.userName.lowercaseString.containsString(searchTerm)})
        resultsViewController.tableView.reloadData()
    }
  

    @IBOutlet weak var modeSegmentedControl: UISegmentedControl!
    var searchController: UISearchController!
    var usersDataSource: [User] = []
    var mode: ViewMode {
        get {
            return ViewMode(rawValue: modeSegmentedControl.selectedSegmentIndex)!
        }
    }
    
    //Add functionality to the ViewMode that you can use to fetch the correct set of User objects. We will use this in our updateViewForMode to set the usersDataSource array with either friends, or all users
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return usersDataSource.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("userCell", forIndexPath: indexPath)
>>>>>>> Stashed changes

        let user = usersDataSource[indexPath.row]
        
        cell.textLabel?.text = user.userName
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let sender = sender as! UITableViewCell
        
        var selectedUser: User
        // if we get an index path from the search results controller use that userDataSource
        // else, use self.userDataSource
        
        if let indexPath = (searchController.searchResultsController as? UserSearchResultsTableViewController)?.tableView.indexPathForCell(sender){
            
            let userDataSource = (searchController.searchResultsController as! UserSearchResultsTableViewController).usersResultsDataSource
            
            selectedUser = usersDataSource[indexPath.row]
        } else {
            let indexPath = tableView.indexPathForCell(sender)!
            selectedUser = self.usersDataSource[indexPath.row]
        }
        let destinationViewController = segue.destinationViewController as! ProfileViewController
        destinationViewController.user = selectedUser
    
    }


}














