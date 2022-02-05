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
    
    @IBOutlet weak var avatarFriendView: AvatarsView!
    @IBOutlet weak var titleLabel: UILabel!
   
    func clearCell (){
        titleLabel?.text = nil
        avatarFriendView.avatarImage.image = nil
    }
    
    override func prepareForReuse(){
        super.prepareForReuse()
        clearCell()

    }
    
    func setup(friend: FriendsListCellModel) {
        titleLabel.text = friend.name + " " + friend.surname
        avatarFriendView.avatarImage.image = friend.avatar
    }
    
    func setup(data: CommunitiesListCellModel) {
        titleLabel.text = data.communityName
        avatarFriendView.avatarImage.image = data.communityImage
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }
    
}
