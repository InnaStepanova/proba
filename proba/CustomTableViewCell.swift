//
//  CustomTableViewCell.swift
//  proba
//
//  Created by Инна Степанова on 11.02.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var mealId: UILabel!
    @IBOutlet var mealName: UILabel!
    @IBOutlet var imageCell: ImageView!
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func set(object: Meal) {
        self.mealId.text = object.strArea
        self.mealName.text = object.strMeal
        self.imageCell.fetchImage(from: object.strMealThumb ?? "")
    }
}
