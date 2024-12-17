//
//  UIImageView+Extension.swift
//  MVVMPractice
//
//  Created by Bharath Gaddamadugu on 17/12/24.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(urlString: String){
        guard let url = URL.init(string: urlString) else{
            return
        }
        let resource = KF.ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
