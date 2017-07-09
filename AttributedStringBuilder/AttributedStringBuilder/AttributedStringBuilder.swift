//
//  AttributedStringBuilder.swift
//  AttributedStringBuilder
//
//  Created by Steve Barnegren on 09/07/2017.
//  Copyright © 2017 Steve Barnegren. All rights reserved.
//

import Foundation

public class AttributedStringBuilder {
    


    private var masterAttributedString = NSMutableAttributedString()
    
    public var attributedString: NSAttributedString {
        return masterAttributedString
    }
    
    // MARK: - Defaults
    
    public var defaultFont = UIFont.systemFont(ofSize: 12, weight: UIFontWeightMedium)
    public var defaultTextColor = UIColor.darkText
    public var defaultBackgroundColor: UIColor? = nil
    public var defaultKerning = 1.0
    public var defaultUseStrikethrough = false
    public var defaultUseUnderline = false
    public var defaultStrokeColor: UIColor? = nil
    public var defaultStokeWidth = 0.0
    
    
    // MARK: - Methods
    
    public init() {}
    
    public func appendText(_ text: String) {
        
        let attributes = makeAttributes()
        let string = NSAttributedString(string: text, attributes: attributes)
        masterAttributedString.append(string)
    }
    
    // MARK: - Create attributes
    
    private func makeAttributes(withOverrides overrides: Dictionary<String, Any>) -> Dictionary<String, Any> {
        
        var attributes = makeAttributes()
        
        overrides.keys.forEach{
            attributes[$0] = overrides[$0]
        }
        
        return attributes
    }
    
    private func makeAttributes() -> Dictionary<String, Any> {
        
        var attributes = Dictionary<String, Any>()
        
        // NSFontAttributeName
        attributes[NSFontAttributeName] = defaultFont
        
        // NSParagraphStyleAttributeName
        
        // NSForegroundColorAttributeName
        attributes[NSForegroundColorAttributeName] = defaultTextColor
        
        // NSBackgroundColorAttributeName
        if let backgroundColor = defaultBackgroundColor {
            attributes[NSBackgroundColorAttributeName] = backgroundColor
        }
        
        // NSLigatureAttributeName
        
        // NSKernAttributeName
        attributes[NSKernAttributeName] = defaultKerning
        
        // NSStrikethroughStyleAttributeName
        attributes[NSStrikethroughStyleAttributeName] = defaultUseStrikethrough
        
        // NSUnderlineStyleAttributeName
        attributes[NSUnderlineStyleAttributeName] = defaultUseUnderline
        
        // NSStrokeColorAttributeName
        if let strokeColor = defaultStrokeColor {
            attributes[NSStrokeColorAttributeName] = strokeColor
        }
        
        // NSStrokeWidthAttributeName
        attributes[NSStrokeWidthAttributeName] = defaultStokeWidth
        
        // NSShadowAttributeName
        
        // NSTextEffectAttributeName
        
        // NSAttachmentAttributeName
        
        // NSLinkAttributeName
        
        // NSBaselineOffsetAttributeName
        
        // NSUnderlineColorAttributeName
        
        // NSStrikethroughColorAttributeName
        
        // NSObliquenessAttributeName
        
        // NSExpansionAttributeName
        
        // NSWritingDirectionAttributeName
        
        // NSVerticalGlyphFormAttributeName
        
        return attributes
    }
    
    
    
    
    
    
    
}
