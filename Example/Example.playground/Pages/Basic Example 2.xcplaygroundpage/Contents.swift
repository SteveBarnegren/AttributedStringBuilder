//: [Previous](@previous)
/*:
 ## Basic Example 2
 */
import Foundation
import AttributedStringBuilder
/*:
 **Make an `AttributedStringBuider` with some default attributes**
 */
let builder = AttributedStringBuilder()
builder.defaultAttributes = [
    .alignment(.center),
    .textColor(UIColor.orange),
    .font( UIFont(name: "AvenirNext-Bold", size: 30)! )
]
/*:
 **Build the string, overriding attributes as required**
 */
builder
    .text("It's ")
    .text("Easy ", attributes: [.underline(true), .textColor(UIColor.blue)])
    .text("To ", attributes: [.strokeWidth(2), .textColor(UIColor.black)])
    .text("Adjust ", attributes: [.skew(0.3), .textColor(UIColor.magenta)])
    .text("Attributes ", attributes: [.font(UIFont(name: "Baskerville-Bold", size: 30)!)])

builder.attributedString
//: [Next](@next)