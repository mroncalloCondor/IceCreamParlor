//
//  IngredientCollectionViewCell.swift
//  GorillaIceCreamParlor
//
//  Created by Miguel Roncallo on 1/22/20.
//  Copyright © 2020 Miguel Roncallo. All rights reserved.
//

import UIKit

class IngredientCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backgroundColoredView: UIView!
    
    @IBOutlet weak var ingredientImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    @IBOutlet weak var priceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(ingredient: Ingredient) {
        backgroundColoredView.backgroundColor = ingredient.color
        setRoundedView()
        setImage(ingredientType: ingredient.type)
        nameLabel.text = "\(ingredient.name1) \(ingredient.name2)"
        priceLabel.text = ingredient.price
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func setRoundedView() {
        backgroundColoredView.layer.cornerRadius = backgroundColoredView.frame.size.width/2
        backgroundColoredView.clipsToBounds = true
        backgroundColoredView.layer.borderColor = UIColor.clear.cgColor
        backgroundColoredView.layer.borderWidth = 1.0
    }
    
    private func setImage(ingredientType: IngredientType) {
        ingredientImage.image = UIImage(named: ingredientType.rawValue)!
    }

}
