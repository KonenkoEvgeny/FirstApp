//
//  AllCommunitiesViewController.swift
//  FirstApp
//
//  Created by Evgeny Konenko on 24.01.2022.
//

import UIKit

class AllCommunitiesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let communitiesListTableViewCellId = "CommunitiesListTableViewCellId"
    
    var allCommunities = [CommunitiesListCellModel]()
    let fromAllCommunitiesToCommunitiesSegue = "fromAllCommunitiesToCommunitiesSegue"

    var selectedGroup: CommunitiesListCellModel?
    
    func fill() {
        let community1 = CommunitiesListCellModel(communityName: "Books", communityImage: UIImage(named: "books_1")!)
        let community2 = CommunitiesListCellModel(communityName: "Films", communityImage: UIImage(named: "films_1")!)
        let community3 = CommunitiesListCellModel(communityName: "Spicy food", communityImage: UIImage(named: "spicy_food_1")!)
        allCommunities.append(community1)
        allCommunities.append(community2)
        allCommunities.append(community3)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fill()
        registerTableViewCells()
        
        tableView.delegate = self
        tableView.dataSource = self
    }


}

private extension AllCommunitiesViewController {
    func registerTableViewCells()
    {
        tableView.register(CommunitiesListTableViewCell.nib(), forCellReuseIdentifier: communitiesListTableViewCellId)
    }
}

extension AllCommunitiesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allCommunities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: communitiesListTableViewCellId, for: indexPath) as? CommunitiesListTableViewCell else {return UITableViewCell()}
        cell.setup(data: allCommunities[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedGroup = allCommunities[indexPath.row]
        performSegue(withIdentifier: fromAllCommunitiesToCommunitiesSegue, sender: nil)
        print ("performSegue fromAllCommunitiesToCommunitiesSegue")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
}
