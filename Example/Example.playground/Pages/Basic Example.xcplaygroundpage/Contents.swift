//: Playground - noun: a place where people can play

import UIKit
import AttributedStringBuilder

let font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightRegular)

// Make an AttributedStringBuilder
let builder = AttributedStringBuilder()

// Set Some Default Attributes
builder.defaultAttributes = [
    .textColor(UIColor.black),
    .font(font),
    .alignment(.center),
]

// Build the string. Additional attributes can be supplied to override defaults
builder
    .text("Attributed strings can make")
    .space()
    .text("specific words", attributes: [.textColor(UIColor.red)])
    .space()
    .text("pop out")

// Display the string
builder.attributedString