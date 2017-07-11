# AttributedStringBuilder

[![Version](https://img.shields.io/cocoapods/v/AttributedStringBuilder.svg?style=flat)](http://cocoapods.org/pods/AttributedStringBuilder)
[![License](https://img.shields.io/cocoapods/l/AttributedStringBuilder.svg?style=flat)](http://cocoapods.org/pods/AttributedStringBuilder)
[![Platform](https://img.shields.io/cocoapods/p/AttributedStringBuilder.svg?style=flat)](http://cocoapods.org/pods/AttributedStringBuilder)

**AttributedStringBuilder** takes the pain out of creating *NSAttributedStrings*.

- More readable `NSAttributedString` creation
- No more faffing about with attribute dictionaries
- Easliy render images in strings
- 'Swifty' api

## Usage

### Import the AttributedStringBuilder module

```swift
import AttributedStringBuilder
```

### Creating a string

**AttributedStringBuilder** functions always return the `AttributedStringBuilder` instance that you are using, so you can write concise and readable code by chaining function calls together.

Attributes are defined using enum cases with associated values

Default attributes can be set, and overriden for selected text portions.

```swift
let builder = AttributedStringBuilder()

builder.defaultAttributes = [
    .textColor(UIColor.black),
    .font( UIFont.systemFont(ofSize: 16, weight: UIFontWeightRegular) ),
    .alignment(.center),
]

builder
    .text("Attributed strings can make")
    .space()
    .text("specific words", attributes: [.textColor(UIColor.red)])
    .space()
    .text("pop out")
    
builder.attributedString
```

![Basic Example 1](https://user-images.githubusercontent.com/6288713/28088062-749ad540-667c-11e7-8bc4-cc926a4c8da9.png)

### Another Example

By chaining method calls together, complex AttributedStrings can be created with just a few lines of code

```swift
let builder = AttributedStringBuilder()
builder.defaultAttributes = [
    .alignment(.center),
    .textColor(UIColor.orange),
    .font( UIFont(name: "AvenirNext-Bold", size: 30)! )
]

builder
    .text("It's ")
    .text("Easy ", attributes: [.underline(true), .textColor(UIColor.blue)])
    .text("To ", attributes: [.strokeWidth(2), .textColor(UIColor.black)])
    .text("Adjust ", attributes: [.skew(0.3), .textColor(UIColor.magenta)])
    .text("Attributes ", attributes: [.font(UIFont(name: "Baskerville-Bold", size: 30)!)])

builder.attributedString
```
![Basic Example 2](https://user-images.githubusercontent.com/6288713/28088068-7929295e-667c-11e7-9106-d897fe3dc12b.png)

### A More Complex Example

```swift
// Create an AttributedStringBuilder with default attributes
let builder = AttributedStringBuilder()
builder.defaultAttributes = [.alignment(.center)]

// First line attributes
let titleAttributes: [AttributedStringBuilder.Attribute] = [
    .font(UIFont(name: "Futura-Bold", size: 40)!),
    .textColor(UIColor.white),
    .strokeColor(UIColor.magenta),
    .strokeWidth(-8),
    .kerning(5)
]

// Second Line Attributes
let canDoAttributes: [AttributedStringBuilder.Attribute] = [
    .font(UIFont(name: "Marker Felt", size: 30)!),
    .textColor(UIColor.orange),
    .kerning(5)
]

// Third Line Attributes
let shadow = NSShadow()
shadow.shadowColor = UIColor.black
shadow.shadowBlurRadius = 5

let awesomeAttributes: [AttributedStringBuilder.Attribute] = [
    .font(UIFont(name: "AvenirNext-Bold", size: 40)!),
    .textColor(UIColor.yellow),
    .kerning(5),
    .shadow(shadow),
    .skew(0.3),
    .underline(true)
]

// Build the string
builder
    .text("ATTRIBUTED STRINGS", attributes: titleAttributes)
    .newline()
    .text("Can do", attributes: canDoAttributes)
    .newline()
    .text("AWESOME THINGS", attributes: awesomeAttributes)

builder.attributedString
```
![Shadow Example](https://user-images.githubusercontent.com/6288713/28088085-7e3f16d8-667c-11e7-806d-b54d8f90d0a2.png)

### Images

It's easy to render images in your strings, and to adjust the size to fit the uppercase or loowercase height of the font

```swift
let font = UIFont.systemFont(ofSize: 90)
        
let builder = AttributedStringBuilder()
builder.defaultAttributes = [
    .font(font),
    .underline(true),
    .textColor(UIColor.purple)
]
        
let image = UIImage(named: "PurpleMonster")!
        
builder
    .image(image, withSizeFittingFontUppercase: font)
    .text("Hello")
    .image(image, withSizeFittingFontLowercase: font)
```

![Images Example](https://user-images.githubusercontent.com/6288713/28088088-8117069a-667c-11e7-841d-f67c931a143a.png)

## Installation

##### CocoaPods

Add the following line to your Podfile:

```ruby
pod "AttributedStringBuilder"
```

##### Manual

Copy ```AttributedStringBuilder.swift``` in to your project

## Who?

[@SteveBarnegren](https://twitter.com/stevebarnegren)

## License

AttributedStringBuilder is available under the MIT license. See the LICENSE file for more info.
