import UIKit

extension UIColor {

    convenience init(hex: Int) {
        let red = CGFloat((hex & 0xff0000) >> 16)/255.0
        let green = CGFloat((hex & 0x00ff00) >> 8)/255.0
        let blue = CGFloat((hex & 0x0000ff) >> 0)/255.0
        self.init(red: red, green: green, blue: blue, alpha: 255/255)
    }

}
