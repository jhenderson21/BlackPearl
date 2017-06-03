import UIKit

@IBDesignable

class TargetBehaviorButton: UIButton {
    
    @IBInspectable var fillColor: UIColor = targetColor
    @IBInspectable var isTargetButton: Bool = true
    
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 10)
        fillColor.setFill()
        path.fill()
}
}


class ReplacementBehaviorButton: UIButton {
    
    
    @IBInspectable var isTargetButton: Bool = true
    
    
    @IBInspectable var fillColor: UIColor = replacementColor
    
    
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 10)
        fillColor.setFill()
        path.fill()
}
}

class addButtons: UIButton {
    
    @IBInspectable var fillColor: UIColor = otterGreyColor
    @IBInspectable var isTargetButton: Bool = true
    
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(roundedRect: rect, cornerRadius: 10)
        fillColor.setFill()
        path.fill()
}
}
