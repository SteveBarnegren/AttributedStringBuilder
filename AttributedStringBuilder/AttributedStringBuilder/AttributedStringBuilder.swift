//
//  AttributedStringBuilder.swift
//  AttributedStringBuilder
//
//  Created by Steve Barnegren on 09/07/2017.
//  Copyright © 2017 Steve Barnegren. All rights reserved.
//

import Foundation

#if os(OSX)
    import AppKit
    public typealias UIFont = NSFont
    public typealias UIColor = NSColor
    public typealias UIImage = NSImage
#else
    import UIKit
#endif

public class AttributedStringBuilder {
    
    // MARK: - Types
    
    public enum Attribute {
        
        // String Attributes
        
        case font(UIFont)                       // NSFontAttributeName
        case paragraphStyle(NSParagraphStyle)   // NSParagraphStyleAttributeName
        case textColor(UIColor?)                // NSForegroundColorAttributeName
        case backgroundColor(UIColor?)          // NSBackgroundColorAttributeName
        case ligitures(Bool)                    // NSLigatureAttributeName
        case kerning(CGFloat)                   // NSKernAttributeName
        case strikethrough(Bool)                // NSStrikethroughStyleAttributeName
        case underline(Bool)                    // NSUnderlineStyleAttributeName
        case strokeColor(UIColor)               // NSStrokeColorAttributeName
        case strokeWidth(CGFloat)               // NSStrokeWidthAttributeName
        case shadow(NSShadow?)                  // NSShadowAttributeName
                                                // NSTextEffectAttributeName
                                                // NSAttachmentAttributeName
                                                // NSLinkAttributeName
        case baselineOffset(CGFloat)            // NSBaselineOffsetAttributeName
        case underlineColor(UIColor?)           // NSUnderlineColorAttributeName
        case strikethroughColor(UIColor?)       // NSStrikethroughColorAttributeName
        case skew(CGFloat)                      // NSObliquenessAttributeName
        case expansion(CGFloat)                 // NSExpansionAttributeName
                                                // NSWritingDirectionAttributeName
                                                // NSVerticalGlyphFormAttributeName (mac os only)
        
        // Convinience Paragraph Attributes
        
        case alignment(NSTextAlignment)
        case lineSpacing(CGFloat)
        
        var key: NSAttributedString.Key {
            return keyAndValue(for: self).0
        }
        
        var value: Any? {
            return keyAndValue(for: self).1
        }
        
        private func keyAndValue(for attribute: Attribute) -> (NSAttributedString.Key, Any?) {
            
            func configureParagraph(configure: (NSMutableParagraphStyle) -> () ) -> NSMutableParagraphStyle {
                let p = NSMutableParagraphStyle()
                configure(p)
                return p
            }
            
            switch attribute {
                
            // String Attributes
            case .font(let value):
                return (.font, value)
            case .paragraphStyle(let value):
                return (.paragraphStyle, value)
            case .textColor(let value):
                return (.foregroundColor, value)
            case .backgroundColor(let value):
                return (.backgroundColor, value)
            case .ligitures(let value):
                return (.ligature, value)
            case .kerning(let value):
                return (.kern, value)
            case .strikethrough(let value):
                return (.strikethroughStyle, value)
            case .underline(let value):
                return (.underlineStyle, value)
            case .strokeColor(let value):
                return (.strokeColor, value)
            case .strokeWidth(let value):
                return (.strokeWidth, value)
            case .shadow(let value):
                return (.shadow, value)
            case .baselineOffset(let value):
                return (.baselineOffset, value)
            case .underlineColor(let value):
                return (.underlineColor, value)
            case .strikethroughColor(let value):
                return (.strikethroughColor, value)
            case .skew(let value):
                return (.obliqueness, value)
            case .expansion(let value):
                return (.expansion, value)
                
            // Paragraph Attributes
            case .alignment(_):
                return (.paragraphStyle, nil)
            case .lineSpacing(_):
                return (.paragraphStyle, nil)
            }
        }
        
        func configureParagraphStyle(_ p: NSMutableParagraphStyle) {
            
            switch self {
            case .paragraphStyle(let value):
                p.setParagraphStyle(value)
            case .alignment(let value):
                p.alignment = value
            case .lineSpacing(let value):
                p.lineSpacing = value
            default:
                fatalError("Not a paragraph style attribute")
            }
        }
    }
    
    // MARK: - Properties

    private var masterAttributedString = NSMutableAttributedString()
    
    public var attributedString: NSAttributedString {
        return masterAttributedString
    }
    
    // MARK: - Defaults
    
    public var defaultAttributes = [Attribute]()
    
    public func clearDefaultAttributes() {
        defaultAttributes.removeAll()
    }
    
    // MARK: - Text
    
    public init() {}
    
    @discardableResult public func text(_ string: String, attributes: [Attribute] = []) -> AttributedStringBuilder {
        
        let attributes = attributesDictionary(withOverrides: attributes)
        let attributedString = NSAttributedString(string: string, attributes: attributes)
        masterAttributedString.append(attributedString)
        return self
    }
    
    @discardableResult public func attributedText(_ attributedString: NSAttributedString) -> AttributedStringBuilder {
        
        masterAttributedString.append(attributedString)
        return self
    }
    
    @discardableResult public func spaces(_ number: Int, attributes: [Attribute] = []) -> AttributedStringBuilder {
        
        (0..<number).forEach{ _ in
            space(attributes: attributes)
        }
        
        return self
    }
    
    @discardableResult public func space(attributes: [Attribute] = []) -> AttributedStringBuilder {
        return text(" ", attributes: attributes)
    }
    
    @discardableResult public func newlines(_ number: Int, attributes: [Attribute] = []) -> AttributedStringBuilder {
        
        (0..<number).forEach{ _ in
            newline(attributes: attributes)
        }
        
        return self
    }
    
    @discardableResult public func newline(attributes: [Attribute] = []) -> AttributedStringBuilder {
        return text("\n", attributes: attributes)
    }
    
    @discardableResult public func tabs(_ number: Int, attributes: [Attribute] = []) -> AttributedStringBuilder {
        
        (0..<number).forEach{ _ in
            tab(attributes: attributes)
        }
        
        return self
    }
    
    @discardableResult public func tab(attributes: [Attribute] = []) -> AttributedStringBuilder {
        return text("\t", attributes: attributes)
    }
    
    // MARK: - Images
    
    @discardableResult public func image(_ anImage: UIImage) -> AttributedStringBuilder {
                
        let attachment = NSTextAttachment()
        attachment.image = anImage
        let attachmentString = NSAttributedString(attachment: attachment)
        masterAttributedString.append(attachmentString)
        
        return self
    }
    
    @discardableResult public func image(_ anImage: UIImage, width: CGFloat) -> AttributedStringBuilder {
        
        let ratio = anImage.size.height / anImage.size.width
        let size = CGSize(width: width, height: width * ratio)
        return image(anImage, size:size)
    }
    
    @discardableResult public func image(_ anImage: UIImage, height: CGFloat) -> AttributedStringBuilder {
        
        let ratio = anImage.size.width / anImage.size.height
        let size = CGSize(width: height * ratio, height: height)
        return image(anImage, size:size)
    }
    
    @discardableResult public func image(_ anImage: UIImage, size: CGSize) -> AttributedStringBuilder {
        
        let attachment = NSTextAttachment()
        attachment.image = anImage
        attachment.bounds = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let attachmentString = NSAttributedString(attachment: attachment)
        masterAttributedString.append(attachmentString)
        
        return self
    }
    
    @discardableResult public func image(_ anImage: UIImage, withSizeFittingFontUppercase font: UIFont) -> AttributedStringBuilder {
        
        let height = font.capHeight
        return image(anImage, height: height)
    }
    
    @discardableResult public func image(_ anImage: UIImage, withSizeFittingFontLowercase font: UIFont) -> AttributedStringBuilder {
        
        let height = font.xHeight
        return image(anImage, height: height)
    }
    
    // MARK: - Create attributes
    
    private func attributesDictionary(withOverrides overrides: [Attribute]) -> Dictionary<NSAttributedString.Key, Any> {
        
        // NSParagraphStyle is cumulative, everything else overrides the previous
        
        var attributesDict = Dictionary<NSAttributedString.Key, Any>()
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        (defaultAttributes + overrides).forEach{
            
            let key = $0.key
            let value = $0.value
                        
            if key == .paragraphStyle {
                $0.configureParagraphStyle(paragraphStyle)
            }
            else{
                attributesDict[key] = value
            }
        }
        
        attributesDict[.paragraphStyle] = paragraphStyle
        
        return attributesDict
    }
    
}
