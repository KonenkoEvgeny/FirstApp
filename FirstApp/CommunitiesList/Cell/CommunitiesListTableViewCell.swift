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
    
    @IBOutlet private var communityTitleLabel: UILabel?
    @IBOutlet private var communityImageView: UIImageView?
   
    func setup(with data: CommunitiesListCellModel) {
        communityTitleLabel?.text = data.communityName
        communityImageView?.image = UIImage(named: data.communityImageName)
    }
    
    func clearCell (){
        communityTitleLabel?.text = nil
        communityImageView?.image = nil
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
