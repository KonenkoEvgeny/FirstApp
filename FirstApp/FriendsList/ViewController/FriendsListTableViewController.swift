//
//  FriendsListTableViewController.swift
//  FirstApp
//
//  Created by Evgeny Konenko on 20.01.2022.
//

import UIKit

class FriendsListTableViewController: UITableViewController {

//    let image = UIImage(named: "1")
//    var contactList: [FriendsListCellModel] = [.init(name: "Vladimir", surname: "Putin", imageName: "putin_avatar"), .init(name: "Angela", surname: "Merkel", imageName: "merkel_avatar"), .init(name: "Emmanuel", surname: "Macron", imageName: "macron_avatar")]
    
    let FriendsListTableViewCellId = "FriendsListTableViewCellId"
    let friendsToPhotosSegue = "friendsToPhotosSegue"
    var contactList = [FriendsListCellModel]()
    
    func fillContactList(){
        let friend1 = FriendsListCellModel(name: "Vladimir", surname: "Putin", avatar: UIImage(named: "putin_avatar")!, photos:[ UIImage(named: "rus_1")!, UIImage(named: "rus_2")!, UIImage(named: "rus_3")!])
        let friend2 = FriendsListCellModel(name: "Angela", surname: "Merkel", avatar: UIImage(named: "merkel_avatar")!, photos:[ UIImage(named: "ger_1")!, UIImage(named: "ger_2")!, UIImage(named: "ger_3")!])
        let friend3 = FriendsListCellModel(name: "Emmanuel", surname: "Macron", avatar: UIImage(named: "macron_avatar")!, photos:[ UIImage(named: "fra_1")!, UIImage(named: "fra_2")!, UIImage(named: "fra_3")!])
        let friend4 = FriendsListCellModel(name: "Si", surname: "Jinping", avatar: UIImage(named: "jinping_avatar")!, photos:[ UIImage(named: "chi_1")!, UIImage(named: "chi_2")!, UIImage(named: "chi_3")!])
        
        contactList.append(friend1)
        contactList.append(friend2)
        contactList.append(friend3)
        contactList.append(friend4)
    }
    
    func arrayLetter(sourceArray: [FriendsListCellModel]) -> [String] {
        var resultArray = [String]()
        for item in sourceArray {
            let nameLetter = String(item.surname.prefix(1))
            if !resultArray.contains(nameLetter.lowercased()) {
                resultArray.append(nameLetter.lowercased())
            }
        }
        return resultArray
    }
    
    func arrayByLetter(sourceArray: [FriendsListCellModel], letter: String) -> [FriendsListCellModel] {
        var resultArray = [FriendsListCellModel]()
        for item in sourceArray {
            let nameLetter = String(item.name.prefix(1)).lowercased()
            if nameLetter == letter.lowercased() {
                resultArray.append(item)
            }
        }
        return resultArray
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillContactList()
        registerTableViewCells()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == friendsToPhotosSegue {}
        
        // дописать источник данных для галереи
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return arrayLetter(sourceArray: contactList).count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayByLetter(sourceArray: contactList, letter: arrayLetter(sourceArray: contactList)[section]).count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendsListTableViewCellId, for: indexPath) as? FriendsListTableViewCell else {
            return UITableViewCell()
        }
        cell.setup(friend: arrayByLetter(sourceArray: contactList, letter: arrayLetter(sourceArray: contactList)[indexPath.section])[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath, "🍏🍏🍏🍏🍏")
        performSegue(withIdentifier: friendsToPhotosSegue, sender: contactList[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayLetter(sourceArray: contactList)[section].uppercased()
    }
    
}

private extension FriendsListTableViewController {
    func registerTableViewCells() {
        // For nib
        tableView.register(FriendsListTableViewCell.nib(), forCellReuseIdentifier: FriendsListTableViewCellId)
    }
}
