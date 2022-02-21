//
//  NewsTableViewCell.swift
//  FirstApp
//
//  Created by Evgeny Konenko on 02.02.2022.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var newsTextLabel: UILabel!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
    
    
    func setup (news: NewsModel){
        newsTextLabel.text = news.newsText
        newsImageView.image = news.newsImage
        avatarImage.image = news.avatarImage
        titleLabel.text = news.titleLabel
        subtitleLabel.text = news.subtitleLabel
    }
    
    func clearCell (){
        newsTextLabel?.text = nil
        newsImageView?.image = nil
    }
    
    override func prepareForReuse(){
        super.prepareForReuse()
        clearCell()

    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
