//
//  PlaylistItemsModel.swift
//  YoutubeClone
//
//  Created by ibautista on 26/1/24.
//

import Foundation

// MARK: - PlaylistItemsModel
struct PlaylistItemsModel: Decodable {
    let kind, etag: String
    let items: [PlaylistItems]
    let pageInfo: PageInfo
    
    // MARK: - Item
    struct PlaylistItems: Decodable {
        let kind, etag, id: String
        let snippet: VideoModel.Item.Snippet
    }
    
    // MARK: - PageInfo
    struct PageInfo: Decodable {
        let totalResults, resultsPerPage: Int
    }
}
