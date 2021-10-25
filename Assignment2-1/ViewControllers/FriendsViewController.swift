//
//  FriendsViewController.swift
//  Assignment2-1
//
//  Created by Takafumi Watanabe on 2021-10-22.
//

import UIKit

class FriendsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        title = "Friends"
        
        tableView.register(FriendsCell.self, forCellReuseIdentifier: "cell")

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FriendsCell
        cell.label.text = "there is one cell \(indexPath.row)"
        return cell
    }

}
