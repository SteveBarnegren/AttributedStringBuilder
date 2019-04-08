import Foundation
import UIKit

public extension UIFont {
    
    static func printAvailableFonts() {
        
        for familyName:String in UIFont.familyNames {
            print("Family Name: \(familyName)")
            for fontName:String in UIFont.fontNames(forFamilyName: familyName) {
                print("--Font Name: \(fontName)")
            }
        }
    }
    
    
    
}
