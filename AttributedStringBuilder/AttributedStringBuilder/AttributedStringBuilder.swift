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
        case font(UIFont)                   // NSFontAttributeName
                                            // NSParagraphStyleAttributeName
        case textColor(UIColor?)            // NSForegroundColorAttributeName
        case backgroundColor(UIColor?)      // NSBackgroundColorAttributeName
        case ligitures(Bool)                // NSLigatureAttributeName
        case kerning(Double)                // NSKernAttributeName
        case strikethrough(Bool)            // NSStrikethroughStyleAttributeName
        case underline(Bool)                // NSUnderlineStyleAttributeName
        case strokeColor(UIColor)           // NSStrokeColorAttributeName
        case strokeWidth(Double)            // NSStrokeWidthAttributeName
        case shadow(NSShadow?)              // NSShadowAttributeName
                                            // NSTextEffectAttributeName
                                            // NSAttachmentAttributeName
                                            // NSLinkAttributeName
        case baselineOffset(Double)         // NSBaselineOffsetAttributeName
        case underlineColor(UIColor?)       // NSUnderlineColorAttributeName
        case strikethroughColor(UIColor?)   // NSStrikethroughColorAttributeName
        case skew(Double)                   // NSObliquenessAttributeName
        case expansion(Double)              // NSExpansionAttributeName
                                            // NSWritingDirectionAttributeName
                                            // NSVerticalGlyphFormAttributeName (mac os only)
        
        var key: String {
            return keyAndValue(for: self).0
        }
        
        var value: Any? {
            return keyAndValue(for: self).1
        }
        
        private func keyAndValue(for attribute: Attribute) -> (String, Any?) {
            
            switch attribute {
            case .font(let value):
                return (NSFontAttributeName, value)
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
    
//    public func text(_ string: String) -> AttributedStringBuilder {
//        
//        return text(string, attributes: [])
//    }
    
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
        
        var attributesDict = Dictionary<String, Any>()
        
        (defaultAttributes + overrides).forEach{
            attributesDict[$0.key] = $0.value
        }
        
        return attributesDict
    }
    
}
