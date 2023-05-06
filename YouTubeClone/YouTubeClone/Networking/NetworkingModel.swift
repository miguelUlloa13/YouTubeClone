//
//  NetworkingModel.swift
//  YouTubeClone
//
//  Created by Miguel Angel Bric Ulloa on 04/05/23.
//

import Foundation

/// Characteristics of the request to the service.
struct RequestModel {
    
    let endpoint: Endpoints
    var queryParams: [String:String]?
    let httpMethod: HttpMethod = .GET
    var urlBase: URLBase = .youtube
    
    /// Configure the type of request.
    /// 1. GET: Retrieves data from a server to the specified resource.
    /// 2. POST: Sends data to the server or create or update a resource.
    enum HttpMethod: String {
        case GET
        case POST
    }
    
    enum Endpoints: String {
        case empty = ""
        case search = "/search"
    }
    
    /// Web service endpoint URL
    enum URLBase: String {
        case youtube = "https://youtube.googleapis.com/youtube/v3"
        case google = ""
    }
    
    /// Rtrieves the full URL
    /// - Returns: Full URL
    func getURL() -> String {
        return urlBase.rawValue + endpoint.rawValue
    }
    
}
