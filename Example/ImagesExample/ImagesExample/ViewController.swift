//
//  ViewController.swift
//  ImagesExample
//
//  Created by Steven Barnegren on 11/07/2017.
//  Copyright © 2017 SteveBarnegren. All rights reserved.
//

import UIKit
import AttributedStringBuilder

/*
 Currently NSTextAttachment crashes playgrounds, which is why the image examples are in this app
 */

class ViewController: UIViewController {
    
    @IBOutlet weak fileprivate var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let font = UIFont.systemFont(ofSize: 90)
        
        let builder = AttributedStringBuilder()
        builder.defaultAttributes = [
            .font(font),
            .underline(.single),
            .textColor(UIColor.purple)
        ]
        
        let image = UIImage(named: "PurpleMonster")!
        
        builder
            .image(image, withSizeFittingFontUppercase: font)
            .text("Hello")
            .image(image, withSizeFittingFontLowercase: font)
        
        label.attributedText = builder.attributedString 
    }


}

