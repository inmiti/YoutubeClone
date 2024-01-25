//
//  PlayListModel.swift
//  YoutubeClone
//
//  Created by ibautista on 25/1/24.
//

import Foundation

struct PlayListModel: Decodable {
    let kind: String
    let etag: String
    let pageInfo: PageInfo
    let items: [Items]
    
    struct Items: Decodable {
        let kind: String
        let etag: String
        let id: String
        let snippet: Snippet
        let contentDetails: ContentDetails
        
        struct Snippet: Decodable {
            let publishedAt: String
            let channelId: String
            let title: String
            let description: String
            let thumbnails: Thumbnails
            let channelTitle: String
            let localized: Localized
            
            struct Thumbnails: Decodable {
                let ´default´: Size
                let medium: Size
                let high: Size
                let standard: Size
                let maxres: Size
                
                struct Size: Decodable {
                    let url: String
                    let width: Int
                    let height: Int
                }
            }
            
            struct Localized: Decodable {
                let title: String
                let description: String
            }
        }
        
        struct ContentDetails: Decodable {
            let itemCount: Int
        }
    }
    
    struct PageInfo: Decodable {
        let totalResults: Int
        let resultsPerPage: Int
    }
}
