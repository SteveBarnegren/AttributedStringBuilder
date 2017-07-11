//: [Previous](@previous)

import Foundation
import AttributedStringBuilder

UIFont.printAvailableFonts()

let builder = AttributedStringBuilder()
builder.defaultAttributes = [.alignment(.center)]

let titleAttributes: [AttributedStringBuilder.Attribute] = [
    .font(UIFont(name: "Futura-Bold", size: 40)!),
    .textColor(UIColor.white),
    .strokeColor(UIColor.magenta),
    .strokeWidth(-8),
    .kerning(5)
]

let canDoAttributes: [AttributedStringBuilder.Attribute] = [
    .font(UIFont(name: "Marker Felt", size: 30)!),
    .textColor(UIColor.orange),
    .kerning(5)
]

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

builder
    .text("ATTRIBUTED STRINGS", attributes: titleAttributes)
    .newline()
    .text("Can do", attributes: canDoAttributes)
    .newline()
    .text("AWESOME THINGS", attributes: awesomeAttributes)



builder.attributedString



//: [Next](@next)
