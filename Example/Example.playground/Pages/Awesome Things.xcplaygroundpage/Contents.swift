//: [Previous](@previous)
/*:
 ## A more fancy example
 */
import Foundation
import AttributedStringBuilder
/*:
 **Make an `AttributedStringBuider` and set default alignment**
 */
let builder = AttributedStringBuilder()
builder.defaultAttributes = [.alignment(.center)]
/*:
 **Attributes for the first line**
 */
let titleAttributes: [AttributedStringBuilder.Attribute] = [
    .font(UIFont(name: "Futura-Bold", size: 40)!),
    .textColor(UIColor.white),
    .strokeColor(UIColor.magenta),
    .strokeWidth(-8),
    .kerning(5)
]
/*:
 **Attributes for the second line**
 */
let canDoAttributes: [AttributedStringBuilder.Attribute] = [
    .font(UIFont(name: "Marker Felt", size: 30)!),
    .textColor(UIColor.orange),
    .kerning(5)
]
/*:
 **Attributes for the third line**
 */
let shadow = NSShadow()
shadow.shadowColor = UIColor.black
shadow.shadowBlurRadius = 5

let awesomeAttributes: [AttributedStringBuilder.Attribute] = [
    .font(UIFont(name: "AvenirNext-Bold", size: 40)!),
    .textColor(UIColor.yellow),
    .kerning(5),
    .shadow(shadow),
    .skew(0.3)
]
/*:
 **Build the string**
 */
builder
    .text("ATTRIBUTED STRINGS", attributes: titleAttributes)
    .newline()
    .text("Can do", attributes: canDoAttributes)
    .newline()
    .text("AWESOME THINGS", attributes: awesomeAttributes)

builder.attributedString
//: [Next](@next)
