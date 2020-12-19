//
//  WebView.swift
//  H4XOR News
//
//  Created by Shawn Williams on 10/6/20.
//

import Foundation
import WebKit
import SwiftUI

/// The Structuror for a Web view to load also the UIViewRepresentable protocal help you wrap a UIKit view in a SwiftUI view
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
        //Check if the url string does have some content
        if let safeString = urlString {
            // Creates a url from the safe string
            if let url = URL(string: safeString){
                // Create a URL request from the URL string created
                let request = URLRequest(url: url)
                // Use the uiView to load the view with the request
                uiView.load(request)
            } 
        }
    }

}
