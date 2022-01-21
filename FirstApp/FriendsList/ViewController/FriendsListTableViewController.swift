//
//  FriendsListTableViewController.swift
//  FirstApp
//
//  Created by Evgeny Konenko on 20.01.2022.
//

import UIKit

class FriendsListTableViewController: UITableViewController {

    let image = UIImage(named: "1")
    var contactList: [FriendsListCellModel] = [.init(name: "Vladimir", surname: "Putin", imageName: "putin_avatar"), .init(name: "Angela", surname: "Merkel", imageName: "merkel_avatar"), .init(name: "Emmanuel", surname: "Macron", imageName: "macron_avatar")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCells()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        MARK: example how to use different type cell
//        if indexPath.row == 0 {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "testId", for: indexPath)
//            cell.textLabel?.text = name
//            cell.textLabel?.backgroundColor = .green
//            return cell
//        } else {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsListTableViewCellId", for: indexPath) as! FriendsListTableViewCell
        cell.setup(with: contactList[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Friend"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath, "🍏🍏🍏🍏🍏")
    }
    
//    override func performSegue(withIdentifier identifier: String, sender: Any?) {
//        <#code#>
//    }
}

private extension FriendsListTableViewController {
    func registerTableViewCells() {
        // For nib
        tableView.register(FriendsListTableViewCell.nib(), forCellReuseIdentifier: "FriendsListTableViewCellId")
        // For default and custom(code) cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "testId")
    }
}
