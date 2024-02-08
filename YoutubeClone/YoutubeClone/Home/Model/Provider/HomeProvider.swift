//
//  HomeProvider.swift
//  YoutubeClone
//
//  Created by ibautista on 6/2/24.
//

import Foundation

protocol HomeProviderProtocol{
    func getVideos(searchString: String, channelId: String) async throws -> VideoModel
}
class HomeProvider: HomeProviderProtocol{
    //upload
    func getVideos(searchString: String, channelId: String) async throws -> VideoModel {
        var queryParams : [String:String] = ["part": "snippet"]
        if !channelId.isEmpty{
            queryParams["channelId"] = channelId
        }
        if !searchString.isEmpty{
            queryParams["q"] = searchString
        }
        
        let requestModel = RequestModel(endpoint: .search, queryItems: queryParams)
        do{
            let model = try await ServiceLayer.callService(requestModel, _modelType: VideoModel.self)
            return model
        } catch {
            print(error)
            throw error 
        }
    }
    
    func getChannel(channelId: String) async throws -> ChannelModel {
        let queryParams : [String:String] = ["part": "snippet,statistics,brandingSettings",
                                             "id": channelId]
        
        let requestModel = RequestModel(endpoint: .channels, queryItems: queryParams)
        
        do{
            let model = try await ServiceLayer.callService(requestModel, _modelType: ChannelModel.self)
            return model
        } catch {
            print(error)
            throw error
        }
    }
    
    func getPlaylists(channelId: String) async throws -> PlayListModel {
        let queryParams : [String:String] = ["part": "snippet,contentDetails",
                                             "channelId": channelId]
        
        let requestModel = RequestModel(endpoint: .playlists, queryItems: queryParams)
        
        do{
            let model = try await ServiceLayer.callService(requestModel, _modelType: PlayListModel.self)
            return model
        } catch {
            print(error)
            throw error
        }
    }
    
    func getPlaylistsItems(playlistId: String) async throws -> PlaylistItemsModel {
        let queryParams : [String:String] = ["part": "snippet,id,contentDetails",
                                             "playlistId": playlistId]
        
        let requestModel = RequestModel(endpoint: .playlistsItems, queryItems: queryParams)
        
        do{
            let model = try await ServiceLayer.callService(requestModel, _modelType: PlaylistItemsModel.self)
            return model
        } catch {
            print(error)
            throw error
        }
    }
}

//class HomeProviderMock: HomeProviderProtocol{
//    func getVideos(searchString: String, channelId: String) async throws -> VideoModel {
//    //Consultar mocks
//    }
//}
