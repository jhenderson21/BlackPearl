//
//  CircularImageView.swift
//  BlackPearl
//
//  Created by Jasen on 6/1/17.
//  Copyright © 2017 otter. All rights reserved.
//
import UIKit


@IBDesignable
class CircularImageView: UIView {
    
    
    var backgroundLayer: CAShapeLayer!
    @IBInspectable var backgroundLayerColor: UIColor = otterGreyColor
    @IBInspectable var lineWidth: CGFloat = 1.0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setBackgroundLayer()
        setBackgroundImageLayer()
        setImage()
    }
    
    func setBackgroundLayer() {
        
        if backgroundLayer == nil {
            backgroundLayer = CAShapeLayer()
            layer.addSublayer(backgroundLayer)
            let rect = bounds.insetBy(dx: lineWidth / 2.0, dy: lineWidth / 2.0)
            let path = UIBezierPath(ovalIn: rect)
            backgroundLayer.path = path.cgPath
            backgroundLayer.lineWidth = lineWidth
            backgroundLayer.fillColor = backgroundLayerColor.cgColor
        }
        
        backgroundLayer.frame = layer.bounds
    }
    
    
    var imageLayer: CALayer!
    @IBInspectable var image: UIImage?
    
    func setBackgroundImageLayer() {
        
        if imageLayer == nil {
            let mask = CAShapeLayer()
            let dx = lineWidth + 3.0
            let path = UIBezierPath(ovalIn: self.bounds.insetBy(dx: dx, dy: dx))
            mask.fillColor = UIColor.black.cgColor
            mask.path = path.cgPath
            mask.frame = self.bounds
            layer.addSublayer(mask)
            imageLayer = CAShapeLayer()
            imageLayer.frame = self.bounds
            imageLayer.mask = mask
            imageLayer.contentsGravity = kCAGravityResizeAspectFill
            layer.addSublayer(imageLayer)
        }
        
    }
    
    var userImage: UIImage?
    
    func setImage() {
        if imageLayer != nil {
            if let userPic = userImage {
                imageLayer.contents = userPic.cgImage
            } else {
                if let pic = image {
                    imageLayer.contents = pic.cgImage
                }
            }
        }
        
    }
    
    
    
}
