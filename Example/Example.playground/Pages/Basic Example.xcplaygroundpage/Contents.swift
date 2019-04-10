/*: 
 ## Basic Example
 */
import UIKit
import AttributedStringBuilder
/*:
 **Make an `AttributedStringBuider`**
 */
let builder = AttributedStringBuilder()
/*:
 **Set some default attributes**
 */
builder.defaultAttributes = [
    .textColor(UIColor.black),
    .font( UIFont.systemFont(ofSize: 16, weight: .regular) ),
    .alignment(.center),
]
/*:
 **Build the string. Additional attributes can be supplied to override defaults**
 */
builder
    .text("Attributed strings can make")
    .space()
    .text("specific words", attributes: [.textColor(UIColor.red)])
    .space()
    .text("pop out")

/*:
 **Retrive the string by calling `builder.attributedString`**
 */
builder.attributedString
//: [Next](@next)
