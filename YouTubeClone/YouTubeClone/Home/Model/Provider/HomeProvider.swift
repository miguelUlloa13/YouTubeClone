//
//  HomeProvider.swift
//  YouTubeClone
//
//  Created by Miguel Angel Bric Ulloa on 05/05/23.
//

import Foundation

class HomeProvider {
    func getVideos (searchString : String, channelId: String) async throws -> VideoModel{
        var queryParams : [String:String] = ["part":"snippet"]
        if !channelId.isEmpty{
            queryParams["channelId"] = channelId
        }
        if !searchString.isEmpty{
            queryParams["q"] = searchString
        }
        let requestModel = RequestModel(endpoint: .search, queryParams: queryParams)
        
        do{
            let model = try await NetworkingLayer.callNetwork(requestModel, VideoModel.self)
            return model
        }catch{
            print(error.localizedDescription)
            throw error
        }
    }
}
