
import UIKit


extension UIViewController {
    
     func isSafeArea() -> Bool{
        if #available(iOS 11.0, *) {
            if UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0.0 > 0.0 {
                return true
            } else {
               return false
            }
        } else {
            return false
        }
        
    }
    
}
