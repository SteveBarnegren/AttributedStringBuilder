//: Playground - noun: a place where people can play

import UIKit
import AttributedStringBuilder

var str = "Hello, playground"

let builder = AttributedStringBuilder()
builder.defaultFont = UIFont.systemFont(ofSize: 16, weight: UIFontWeightSemibold)
builder.defaultTextColor = UIColor.orange
builder.defaultKerning = 1
//builder.defaultBackgroundColor = UIColor.red
builder.defaultUseUnderline = true
//builder.defaultStrokeColor = UIColor.magenta
//builder.defaultStokeWidth = 1.0


builder.appendText("Hello")
builder.appendText("This is a test")

builder.attributedString