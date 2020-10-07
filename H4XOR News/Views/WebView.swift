//
//  WebView.swift
//  H4XOR News
//
//  Created by Shawn Williams on 10/6/20.
//

import Foundation
import WebKit
import SwiftUI

/// The Structuror for a Web view to load
struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    /// Makes a Web View in the ios app
    /// - Parameter context: The context of the webview
    /// - Returns: the web view that is returned
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    /// Updates the web view with the url string to load
    /// - Parameters:
    ///   - uiView: The webview
    ///   - context: context description
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString){
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }

}
