//
//  RequestModel.swift
//  YoutubeClone
//
//  Created by ibautista on 1/2/24.
//

import Foundation

struct RequestModel {
    let endpoint: Endpoints
    let queryItems: [String: String]?
    let httpMethod: HttpMethod = .GET
    let baseUrl: URLBase = .youtube
    
    func getURL() -> String{
        return baseUrl.rawValue + endpoint.rawValue
    }
}

enum Endpoints: String {
    case search = "/search"
    case channels = "/channels"
    case playlists = "/playlists"
    case playlistsItems = "/playlistItems"
    case empty = ""
}

enum HttpMethod: String {
    case GET
    case POST
}

enum URLBase: String {
    case youtube = "https://www.googleapis.com/youtube/v3"
    case google = "https://othereweb.com/v2"
}
