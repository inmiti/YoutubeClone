//
//  ChannelModel.swift
//  YoutubeClone
//
//  Created by ibautista on 26/1/24.
//

import Foundation

// MARK: - ChannelModel
struct ChannelModel: Codable {
    let kind, etag: String
    let pageInfo: PageInfo
    let items: [Item]
    
    // MARK: - PageInfo
    struct PageInfo: Codable {
        let totalResults, resultsPerPage: Int
    }
    
    // MARK: - Item
    struct Item: Codable {
        let kind, etag, id: String
        let snippet: Snippet
        let statistics: Statistics
        let brandingSettings: BrandingSettings
        
        // MARK: - Snippet
        struct Snippet: Codable {
            let title, description, publishedAt: String
            let thumbnails: Thumbnails
            let defaultLanguage: String
            let localized: Localized
            let country: String
            
            // MARK: - Localized
            struct Localized: Codable {
                let title, description: String
            }

            // MARK: - Thumbnails
            struct Thumbnails: Codable {
                let thumbnailsDefault, medium, high: Default

                enum CodingKeys: String, CodingKey {
                    case thumbnailsDefault = "default"
                    case medium, high
                }
                
                // MARK: - Default
                struct Default: Codable {
                    let url: String
                    let width, height: Int
                }
            }
        }
        
        // MARK: - Statistics
        struct Statistics: Codable {
            let viewCount, subscriberCount: String
            let hiddenSubscriberCount: Bool
            let videoCount: String
        }
        
        // MARK: - BrandingSettings
        struct BrandingSettings: Codable {
            let image: Image

            // MARK: - Image
            struct Image: Codable {
                let bannerExternalURL: String
            }
        }
    }
}
