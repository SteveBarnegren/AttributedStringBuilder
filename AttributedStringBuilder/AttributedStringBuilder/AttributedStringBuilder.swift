//
//  AttributedStringBuilder.swift
//  AttributedStringBuilder
//
//  Created by Steve Barnegren on 09/07/2017.
//  Copyright © 2017 Steve Barnegren. All rights reserved.
//

import Foundation

public class AttributedStringBuilder {
    
    // MARK: - Types
    
    public enum Attribute {
        
        // String Attributes
        
        case font(UIFont)                       // NSFontAttributeName
        case paragraphStyle(NSParagraphStyle)   // NSParagraphStyleAttributeName
        case textColor(UIColor?)                // NSForegroundColorAttributeName
        case backgroundColor(UIColor?)          // NSBackgroundColorAttributeName
        case ligitures(Bool)                    // NSLigatureAttributeName
        case kerning(CGFloat)                    // NSKernAttributeName
        case strikethrough(Bool)                // NSStrikethroughStyleAttributeName
        case underline(Bool)                    // NSUnderlineStyleAttributeName
        case strokeColor(UIColor)               // NSStrokeColorAttributeName
        case strokeWidth(CGFloat)                // NSStrokeWidthAttributeName
        case shadow(NSShadow?)                  // NSShadowAttributeName
                                                // NSTextEffectAttributeName
                                                // NSAttachmentAttributeName
                                                // NSLinkAttributeName
        case baselineOffset(CGFloat)             // NSBaselineOffsetAttributeName
        case underlineColor(UIColor?)           // NSUnderlineColorAttributeName
        case strikethroughColor(UIColor?)       // NSStrikethroughColorAttributeName
        case skew(CGFloat)                       // NSObliquenessAttributeName
        case expansion(CGFloat)                  // NSExpansionAttributeName
                                                // NSWritingDirectionAttributeName
                                                // NSVerticalGlyphFormAttributeName (mac os only)
        
        // Convinience Paragraph Attributes
        
        case alignment(NSTextAlignment)
        case lineSpacing(CGFloat)
        
        var key: String {
            return keyAndValue(for: self).0
        }
        
        var value: Any? {
            return keyAndValue(for: self).1
        }
        
        private func keyAndValue(for attribute: Attribute) -> (String, Any?) {
            
            func configureParagraph(configure: (NSMutableParagraphStyle) -> () ) -> NSMutableParagraphStyle {
                let p = NSMutableParagraphStyle()
                configure(p)
                return p
            }
            
            switch attribute {
                
            // String Attributes
            case .font(let value):
                return (NSFontAttributeName, value)
            case .paragraphStyle(let value):
                return (NSParagraphStyleAttributeName, value)
            case .textColor(let value):
                return (NSForegroundColorAttributeName, value)
            case .backgroundColor(let value):
                return (NSBackgroundColorAttributeName, value)
            case .ligitures(let value):
                return (NSLigatureAttributeName, value)
            case .kerning(let value):
                return (NSKernAttributeName, value)
            case .strikethrough(let value):
                return (NSStrikethroughStyleAttributeName, value)
            case .underline(let value):
                return (NSUnderlineStyleAttributeName, value)
            case .strokeColor(let value):
                return (NSStrokeColorAttributeName, value)
            case .strokeWidth(let value):
                return (NSStrokeWidthAttributeName, value)
            case .shadow(let value):
                return (NSShadowAttributeName, value)
            case .baselineOffset(let value):
                return (NSBaselineOffsetAttributeName, value)
            case .underlineColor(let value):
                return (NSUnderlineColorAttributeName, value)
            case .strikethroughColor(let value):
                return (NSStrikethroughColorAttributeName, value)
            case .skew(let value):
                return (NSObliquenessAttributeName, value)
            case .expansion(let value):
                return (NSExpansionAttributeName, value)
                
            // Paragraph Attributes
            case .alignment(_):
                return (NSParagraphStyleAttributeName, nil)
            case .lineSpacing(_):
                return (NSParagraphStyleAttributeName, nil)
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
        return self;
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
    
    // MARK: - Create attributes
    
    private func attributesDictionary(withOverrides overrides: [Attribute]) -> Dictionary<String, Any> {
        
        // NSParagraphStyle is cumulative, everything else overrides the previous
        
        var attributesDict = Dictionary<String, Any>()
        
        let paragraphStyle = NSMutableParagraphStyle()
        
        (defaultAttributes + overrides).forEach{
            
            let key = $0.key
            let value = $0.value
            
            if key == NSParagraphStyleAttributeName {
                $0.configureParagraphStyle(paragraphStyle)
            }
            else{
                attributesDict[key] = value
            }
        }
        
        attributesDict[NSParagraphStyleAttributeName] = paragraphStyle
        
        return attributesDict
    }
    
}
