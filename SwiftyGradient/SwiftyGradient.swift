//
//  SwiftyGardient.swift
//  SwiftyGardient
//
//  Created by Bilal Karim Reffas on 09.11.15.
//  Copyright © 2015 Bilal Karim Reffas. All rights reserved.
//

import UIKit

@IBDesignable class SwiftyGradient : UIView {
    
    
    /// The startColor for the Gardient
    @IBInspectable var startColor: UIColor = UIColor.whiteColor() {
        didSet{
            setupSwiftyGradient()
        }
    }
    
    /// Thet endColor for the Gardient
    @IBInspectable var endColor: UIColor = UIColor.blackColor() {
        didSet{
            setupSwiftyGradient()
        }
    }
    
    ///Draw the Gardient Horizontal
    @IBInspectable var horizontal: Bool = false {
        didSet{
            setupSwiftyGradient()
        }
    }

    ///The roundness for the corner
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet{
            setupSwiftyGradient()
        }
    }
    
    func setupSwiftyGradient() {

        let colors:Array = [startColor.CGColor,endColor.CGColor]
        gradientLayer.colors = colors
        gradientLayer.cornerRadius = cornerRadius
        self.setNeedsDisplay()
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = horizontal ?  CGPoint(x: 1, y: 0) : CGPoint(x: 0, y: 1)

        
    }
    

    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
    
    
    override class func layerClass()->AnyClass{
        return CAGradientLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSwiftyGradient()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupSwiftyGradient()
    }
}
