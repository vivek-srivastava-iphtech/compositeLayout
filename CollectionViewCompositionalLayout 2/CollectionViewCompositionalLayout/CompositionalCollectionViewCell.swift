//
//  CompositionalCollectionViewCell.swift
//  CollectionViewCompositionalLayout
//
//  Created by vivek shrivastwa on 03/01/22.
//

import UIKit

class CompositionalCollectionViewCell: UICollectionViewCell {
    
    //MARK: - cellIdentifier
    static let identifier = "compositionalLayoutCell"
    
    //imageView
    public let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    
    //MARK: - functions
    
    //init function
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //subviewLayout
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    
    func setImageData(index: Int){
        imageView.layer.cornerRadius = Constants.shared.ImageCornerRadius
        imageView.image = Constants.shared.images[index]
    }
    
}
