//
//  FriendsListTableViewController.swift
//  FirstApp
//
//  Created by Evgeny Konenko on 20.01.2022.
//

import UIKit

class FriendsListTableViewController: UITableViewController {
  
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
            let nameLetter = String(item.surname.prefix(1)).lowercased()
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
        if segue.identifier == friendsToPhotosSegue,
           let destinationVC = segue.destination as? PhotosGaleryCollectionViewController,
        let friend = sender as? FriendsListCellModel {
            destinationVC.photosGalery = friend.photos
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return arrayLetter(sourceArray: contactList).count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayByLetter(sourceArray: contactList, letter: arrayLetter(sourceArray: contactList)[section]).count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: friendsListTableViewCellId , for: indexPath) as? FriendsListTableViewCell else
            {return UITableViewCell()}
        
        cell.setup(friend: arrayByLetter(sourceArray: contactList, letter: arrayLetter(sourceArray: contactList)[indexPath.section])[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let a = indexPath.section
        let b = indexPath.row
        var friendId = 0
        if a == 0 && b == 0 {friendId = 0}
        if a == 1 && b == 0 {friendId = 1}
        if a == 1 && b == 1 {friendId = 2}
        if a == 2 && b == 0 {friendId = 3}
// Просто номером строки решить не удалось, создал костыль на 4 друга. Из-за разного количества секций:
//        override func numberOfSections(in tableView: UITableView) -> Int {
//        return arrayLetter(sourceArray: contactList).count
//    }
//        print(indexPath)
//        print(contactList[friendId])
        performSegue(withIdentifier: friendsToPhotosSegue, sender: contactList[friendId])
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrayLetter(sourceArray: contactList)[section].uppercased()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
}

private extension FriendsListTableViewController {
    func registerTableViewCells() {
        tableView.register(UINib(nibName: friendsListTableViewCell, bundle: nil), forCellReuseIdentifier: friendsListTableViewCellId)
    }
}
