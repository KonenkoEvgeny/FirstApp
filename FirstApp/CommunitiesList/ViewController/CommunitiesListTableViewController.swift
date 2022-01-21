//
//  GroupsListTableViewController.swift
//  FirstApp
//
//  Created by Evgeny Konenko on 20.01.2022.
//

import UIKit

class CommunitiesListTableViewController: UITableViewController {

    let image = UIImage(named: "1")
    var communitiesList: [CommunitiesListCellModel] = [.init(communityName: "Vladimir", communityImageName: "putin_avatar"), .init(communityName: "Angela", communityImageName: "merkel_avatar"), .init(communityName: "Emmanuel", communityImageName: "macron_avatar")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerTableViewCells()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return communitiesList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CommunitiesListTableViewCellId", for: indexPath) as! CommunitiesListTableViewCell
        cell.setup(with: communitiesList[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Community"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath, "🍏🍏🍏🍏🍏")
    }
    
//    override func performSegue(withIdentifier identifier: String, sender: Any?) {
//        <#code#>
//    }
}

private extension CommunitiesListTableViewController {
    func registerTableViewCells() {
        // For nib
        tableView.register(CommunitiesListTableViewCell.nib(), forCellReuseIdentifier: "CommunitiesListTableViewCellId")
        // For default and custom(code) cell
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "testId")
    }
}
