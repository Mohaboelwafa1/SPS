//
//  SVGImgProcessor.swift
//  SPS
//
//  Created by Mohammed hassan on 11/14/20.
//  Copyright © 2020 Mohammed hassan. All rights reserved.
//

import UIKit
import Kingfisher
import SVGKit

public struct SVGImgProcessor: ImageProcessor{
    public var identifier: String = "com.appidentifier.webpprocessor"
    public func process(item: ImageProcessItem, options: KingfisherParsedOptionsInfo) -> KFCrossPlatformImage? {
        switch item {
        case .image(let image):
            print("already an image")
            return image
        case .data(let data):
            let imsvg = SVGKImage(data: data)
            return imsvg?.uiImage
        }
    }
}
