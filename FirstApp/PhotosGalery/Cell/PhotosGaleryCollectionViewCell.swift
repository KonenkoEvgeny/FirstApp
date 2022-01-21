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

    @IBOutlet private var photosImageView: UIImageView?
    
    func setup(with data: PhotosGaleryCellModel){
        photosImageView?.image = UIImage(named: data.photosImageName)


    }
    
    func clearCell(){
        photosImageView?.image = nil
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
