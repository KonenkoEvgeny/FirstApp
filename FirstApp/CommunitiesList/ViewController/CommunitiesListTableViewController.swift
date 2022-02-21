//
//  GroupsListTableViewController.swift
//  FirstApp
//
//  Created by Evgeny Konenko on 20.01.2022.
//

import UIKit

class CommunitiesListTableViewController: UITableViewController {

    var communitiesList = [CommunitiesListCellModel]()
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
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

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "friendsListTableViewCellId" , for: indexPath) as? FriendsListTableViewCell else
        {return UITableViewCell()}
//
        cell.setup(data: communitiesList[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Community"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50)
    }
    
    func isItemAlreadyInArray(group: CommunitiesListCellModel) -> Bool {
        return communitiesList.contains { sourceGroup in
            sourceGroup.communityName == group.communityName
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                communitiesList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
        }

    
    @IBAction func unwindSegueToMyGroup(segue: UIStoryboardSegue) {
        if segue.identifier == fromAllCommunitiesToCommunitiesSegue,
           let sourceVC = segue.source as? AllCommunitiesViewController,
           let selectedGroup = sourceVC.selectedGroup
        {
            if isItemAlreadyInArray(group: selectedGroup) {return}
            self.communitiesList.append(selectedGroup)
            tableView.reloadData()
        }
        }
}

private extension CommunitiesListTableViewController {
    func registerTableViewCells()
        {
            tableView.register(FriendsListTableViewCell.nib(), forCellReuseIdentifier: friendsListTableViewCellId)
        }
}
