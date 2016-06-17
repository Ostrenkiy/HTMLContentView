//
//  HTMLContentView.swift
//  SmartContentView
//
//  Created by Alexander Karpov on 18.06.16.
//  Copyright © 2016 Stepic. All rights reserved.
//

import UIKit
import FLKAutoLayout

/*
 A UIView subclass, which is responsible for intelligent displaying of HTML content
 */
class HTMLContentView: UIView {

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    var textView: UITextView = UITextView()
    var webView: UIWebView = UIWebView()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init() {
        self.init(frame: CGRectZero)
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func didLoad() {
        textView.scrollEnabled = false
        webView.scrollView.scrollEnabled = false
        addSubview(textView)
        addSubview(webView)
        textView.alignToView(self)
        webView.alignToView(self)
        textView.hidden = true
        webView.hidden = true
    }
    
    func loadHTMLText(htmlString: String, styles: TextStyles? = nil) {
        if TagDetectionUtil.isWebViewSupportNeeded(htmlString) {
            loadWebView(htmlString)
        } else {
            loadTextView(htmlString)
        }
    }
    
    private func loadTextView(htmlString: String) {
        if let data = htmlString.dataUsingEncoding(NSUnicodeStringEncoding) {
            do {
                let attributedString = try NSAttributedString(data: data, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
                textView.attributedText = attributedString
            }
            catch {
                //TODO: throw an exception here, or pass an error
            }
        }
    }
    
    private func loadWebView(htmlString: String) {
        webView.loadHTMLString(htmlString, baseURL: nil)
    }
}

struct TextStyles {
    
}