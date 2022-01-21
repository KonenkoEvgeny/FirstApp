//
//  FriendsListTableViewCell.swift
//  FirstApp
//
//  Created by Evgeny Konenko on 20.01.2022.
//

import UIKit

class FriendsListTableViewCell: UITableViewCell {
    
    static func nib() -> UINib {
        return UINib(nibName: "FriendsListTableViewCell", bundle: nil)
    }
    
    @IBOutlet private var titleLabel: UILabel?
    @IBOutlet private var contactImageView: UIImageView?
   
    func setup(with data: FriendsListCellModel) {
        titleLabel?.text = data.name + " " + data.surname
        contactImageView?.image = UIImage(named: data.imageName)
    }
    
    func clearCell (){
        titleLabel?.text = nil
        contactImageView?.image = nil
    }
    
    override func prepareForReuse(){
        super.prepareForReuse()

    }
    
//    не знаю, как запустить performSegue не из UIViewController
//    @IBAction func friendsListToPhotos(_ sender: UIButton) {
//
//        performSegue(withIdentifier: "friendsToPhotosSegue", sender: self)
//
//    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
}
