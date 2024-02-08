//
//  HomePresenter.swift
//  YoutubeClone
//
//  Created by ibautista on 8/2/24.
//

import Foundation

protocol HomeViewProtocol: AnyObject{
    func getData(list: [[Any]])
}

class HomePresenter{
    var provider : HomeProviderProtocol
    weak var delegate: HomeViewProtocol?
    
    init(delegate: HomeViewProtocol, provider: HomeProviderProtocol = HomeProvider()) {
        self.provider = provider
        self.delegate = delegate
    }
    
    func getVideos() async{
        do{
            let videos = try await provider.getVideos(searchString: "", channelId: Constants.channelId)
        } catch {
            print(error)
        }
    }
}
