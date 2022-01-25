//
//  FriendsListTableViewCell.swift
//  FirstApp
//
//  Created by Evgeny Konenko on 20.01.2022.
//

import UIKit

@IBDesignable class FriendsListTableViewCell: UITableViewCell {
    
    static func nib() -> UINib {
        return UINib(nibName: "FriendsListTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contactImageView: UIImageView!
   
    func clearCell (){
        titleLabel?.text = nil
        contactImageView?.image = nil
    }
    
    override func prepareForReuse(){
        super.prepareForReuse()
        clearCell()

    }
    
    func setup(friend: FriendsListCellModel) {
        contactImageView.image = friend.avatar
        titleLabel.text = friend.name + " " + friend.surname
 
        contactImageView?.layer.cornerRadius = contactImageView.frame.width/2
        backView?.layer.cornerRadius = contactImageView.frame.width/2
        backView?.layer.shadowColor = UIColor.black.cgColor
        backView?.layer.shadowOffset = CGSize(width: 5, height: 5)
        backView?.layer.shadowRadius = 5
        backView?.layer.shadowOpacity = 0.5
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
}
