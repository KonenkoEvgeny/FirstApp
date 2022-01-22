//
//  PhotosGaleryCollectionViewCell.swift
//  FirstApp
//
//  Created by Evgeny Konenko on 21.01.2022.
//

import UIKit

class PhotosGaleryCollectionViewCell: UICollectionViewCell {

    static func nib() -> UINib {
        return UINib(nibName: "PhotosGaleryCollectionViewCell", bundle: nil)
    }

    @IBOutlet private var backView: UIView!
    
    @IBOutlet private var photosImageView: UIImageView?
    
    func setup(with data: PhotosGaleryCellModel){
        photosImageView?.image = UIImage(named: data.photosImageName)
        backView.layer.backgroundColor = UIColor.systemTeal.cgColor

    }
    
    func clearCell(){
        photosImageView?.image = nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        clearCell()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
