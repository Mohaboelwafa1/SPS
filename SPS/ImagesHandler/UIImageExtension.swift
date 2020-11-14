//
//  UIImageExtension.swift
//  SPS
//
//  Created by Mohammed hassan on 11/14/20.
//  Copyright © 2020 Mohammed hassan. All rights reserved.
//

import UIKit
import SVGKit

extension UIImage {

    class func decodedImage(_ image: UIImage) -> UIImage? {
        guard let newImage = image.cgImage else { return nil }

        let colorspace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: nil,
                                width: newImage.width,
                                height: newImage.height,
                                bitsPerComponent: 8,
                                bytesPerRow: newImage.width * 4,
                                space: colorspace,
                                bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)

        context?.draw(newImage, in: CGRect(x: 0, y: 0, width: newImage.width, height: newImage.height))
        let drawnImage = context?.makeImage()

        if let drawnImage = drawnImage {
            return UIImage(cgImage: drawnImage)
        }

        return nil
    }

}

extension UIImageView {
    func downloadedsvg(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let receivedicon: SVGKImage = SVGKImage(data: data),
                let image = receivedicon.uiImage
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
}
