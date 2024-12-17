//
//  ProductTableViewCell.swift
//  MVVMPractice
//
//  Created by Bharath Gaddamadugu on 13/12/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productBackgroundView: UIView!
    
    @IBOutlet weak var productTitle: UILabel!
    
    @IBOutlet weak var productCategory: UILabel!
    
    @IBOutlet weak var rateButton: UIButton!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var productImageView: UIImageView!
    
    
    var product:Product?{
        didSet{
            productDetailConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailConfiguration(){
        guard let product else{
            return
        }
        productTitle.text = product.title
        descriptionLabel.text = product.description
        productCategory.text = product.category
        priceLabel.text = "$\(product.price)"
        rateButton.setTitle("\(product.rating.rate)", for: .normal)
        productImageView.setImage(urlString: product.image)
        print("Bharath: \(product.title)")
    }
    
}
