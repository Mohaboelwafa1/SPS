//
//  ImageDownloader.swift
//  SPS
//
//  Created by Mohammed hassan on 11/14/20.
//  Copyright © 2020 Mohammed hassan. All rights reserved.
//
import Kingfisher

class ImageDownloader{
    static func downloadImage(url : String, imageview : UIImageView) {
        let url = URL(string: url)
        let processor = DownsamplingImageProcessor(size: imageview.bounds.size)
        imageview.kf.indicatorType = .activity
        imageview.kf.setImage(
            with: url,
            placeholder: R.image.countryPlaceHolder(),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
    }

}
