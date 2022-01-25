//
//  CommunitiesListTableViewCell.swift
//  FirstApp
//
//  Created by Evgeny Konenko on 21.01.2022.
//

import UIKit

class CommunitiesListTableViewCell: UITableViewCell {

    static func nib() -> UINib {
        return UINib(nibName: "CommunitiesListTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet private var communityTitleLabel: UILabel?
    @IBOutlet private var communityImageView: UIImageView?
   
    func setup(data: CommunitiesListCellModel) {
        communityTitleLabel?.text = data.communityName
        communityImageView?.image = data.communityImage
        
        communityImageView?.layer.cornerRadius = 45
        backView?.layer.cornerRadius = 45
        backView?.layer.shadowColor = UIColor.black.cgColor
        backView?.layer.shadowOffset = CGSize(width: 5, height: 5)
        backView?.layer.shadowRadius = 5
        backView?.layer.shadowOpacity = 0.5
    }
    
    func clearCell (){
        communityTitleLabel?.text = nil
        communityImageView?.image = nil
    }
    
    override func prepareForReuse(){
        super.prepareForReuse()
        clearCell()

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
