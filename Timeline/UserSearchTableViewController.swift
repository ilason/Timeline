//
//  UserSearchTableViewController.swift
//  Timeline
//
//  Created by Aaron Eliason on 2/23/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class UserSearchTableViewController: UITableViewController {
    @IBOutlet weak var modeSegmentedControl: UISegmentedControl!
    
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
        updateViewForMode(mode)
    }
    
    @IBAction func selectedIndexChanged(sender: AnyObject) {
        updateViewForMode(mode)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.usersDatasource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("userCell", forIndexPath: indexPath)
        
        let user = usersDatasource[indexPath.row]
        
        cell.textLabel?.text = user.username

        

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
