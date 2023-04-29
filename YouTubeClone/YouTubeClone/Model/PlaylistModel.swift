//
//  PlaylistModel.swift
//  YouTubeClone
//
//  Created by Miguel Angel Bric Ulloa on 27/04/23.
//

import Foundation

    // MARK: JSON Playlist Youtube
/*
 
 {
     "kind": "youtube#playlistListResponse",
     "etag": "ZJZTQWb9CffgDcTAWDcA8dYejCI",
     "nextPageToken": "CAIQAA",
     "pageInfo": {
         "totalResults": 11,
         "resultsPerPage": 2
     },
     "items": [
         {
             "kind": "youtube#playlist",
             "etag": "3XX-xkoPr8X2Lwftr5Sj_6DANns",
             "id": "PLT_OObKZ3CptOu3A6_Mv-lk7iPU_sbNq5",
             "snippet": {
                 "publishedAt": "2022-08-30T06:17:55Z",
                 "channelId": "UC_I_lCplbwIf60iUgsTE79g",
                 "title": "Shapes en SwiftUI",
                 "description": "",
                 "thumbnails": {
                     "default": {
                         "url": "https://i.ytimg.com/vi/gZGg5QP-sj4/default.jpg",
                         "width": 120,
                         "height": 90
                     },
                     "medium": {
                         "url": "https://i.ytimg.com/vi/gZGg5QP-sj4/mqdefault.jpg",
                         "width": 320,
                         "height": 180
                     },
                     "high": {
                         "url": "https://i.ytimg.com/vi/gZGg5QP-sj4/hqdefault.jpg",
                         "width": 480,
                         "height": 360
                     },
                     "standard": {
                         "url": "https://i.ytimg.com/vi/gZGg5QP-sj4/sddefault.jpg",
                         "width": 640,
                         "height": 480
                     },
                     "maxres": {
                         "url": "https://i.ytimg.com/vi/gZGg5QP-sj4/maxresdefault.jpg",
                         "width": 1280,
                         "height": 720
                     }
                 },
                 "channelTitle": "Victor Roldan Dev",
                 "localized": {
                     "title": "Shapes en SwiftUI",
                     "description": ""
                 }
             },
             "contentDetails": {
                 "itemCount": 2
             }
         },
         {
             "kind": "youtube#playlist",
             "etag": "NlNo4x4yVMuzQ5apN-h0tsli-gg",
             "id": "PLT_OObKZ3CpscUEWebc7hReP24nXjhui4",
             "snippet": {
                 "publishedAt": "2022-06-20T16:03:50Z",
                 "channelId": "UC_I_lCplbwIf60iUgsTE79g",
                 "title": "Curso de SwiftUI 4 para Principiantes",
                 "description": "Un curso de introducción a SwiftUI 4.0 donde paso por sus principales componentes y te enteres de cómo funciona este Framework.",
                 "thumbnails": {
                     "default": {
                         "url": "https://i.ytimg.com/vi/b-GYQYUQzAQ/default.jpg",
                         "width": 120,
                         "height": 90
                     },
                     "medium": {
                         "url": "https://i.ytimg.com/vi/b-GYQYUQzAQ/mqdefault.jpg",
                         "width": 320,
                         "height": 180
                     },
                     "high": {
                         "url": "https://i.ytimg.com/vi/b-GYQYUQzAQ/hqdefault.jpg",
                         "width": 480,
                         "height": 360
                     },
                     "standard": {
                         "url": "https://i.ytimg.com/vi/b-GYQYUQzAQ/sddefault.jpg",
                         "width": 640,
                         "height": 480
                     },
                     "maxres": {
                         "url": "https://i.ytimg.com/vi/b-GYQYUQzAQ/maxresdefault.jpg",
                         "width": 1280,
                         "height": 720
                     }
                 },
                 "channelTitle": "Victor Roldan Dev",
                 "localized": {
                     "title": "Curso de SwiftUI 4 para Principiantes",
                     "description": "Un curso de introducción a SwiftUI 4.0 donde paso por sus principales componentes y te enteres de cómo funciona este Framework."
                 }
             },
             "contentDetails": {
                 "itemCount": 18
             }
         }
     ]
 }
 
 */

struct PlaylistModel: Decodable {
    
    let kind: String
    let etag: String
    let nextPageToken: String
    let pageInfo: PageInfo
    let items: [Item]
    
    struct PageInfo: Decodable {
        
        let totalResults: Int
        let resultsPerPage: Int
        
    }
    
    struct Item: Decodable {
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
                let medium: Medium
                
                struct Medium: Decodable {
                    let url: String
                    let width: Int
                    let height: Int
                }
            }
            
            struct Localized: Decodable {
                let title: String
                let description: String
            }
            
        } // Snippet
        
        struct ContentDetails: Decodable {
            let itemCount: Int
        }
        
    } // Items
  
} // PlaylistModel



    // Tip
        // Multicursor: presionar [control + shift] u [option + arrastrar el cursor]
        





