//
//  Networking.swift
//  YouTubeClone
//
//  Created by Miguel Angel Bric Ulloa on 04/05/23.
//

import Foundation

@MainActor
/// Class to make the connection to the API.
class NetworkingLayer {
    
    static func buildQueryItems(params: [String:String]) -> [URLQueryItem]{
        let items = params.map({URLQueryItem(name: $0, value: $1)})
        return items
    }
    
    /// Generic Method with type constraint.
    /// - T: Parameter must conform the Decodable protocol.
    /// - Parameters:
    ///   - requestModel: Request characteristics of RequestModel type.
    ///   - modelType: Model object that implements the decodable protocol.
    /// - Returns: If you indicate the input type, the method will identify the type of object it will return.
    static func callNetwork<T: Decodable>(_ requestModel: RequestModel, _ modelType: T.Type) async throws -> T {
        
        //Get query parameters
        var serviceUrl = URLComponents(string: requestModel.getURL())
        serviceUrl?.queryItems = buildQueryItems(params: requestModel.queryParams ?? [:])
        serviceUrl?.queryItems?.append(URLQueryItem(name: "key", value: Constants.apiKey))
        
        //Safe unwrap URL
        guard let componentURL = serviceUrl?.url else {
            throw NetworkingError.invalidURL
        }
        var request = URLRequest(url: componentURL)
        request.httpMethod = requestModel.httpMethod.rawValue
        
        do{
            // Send request
            let (data, response) = try await URLSession.shared.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else{
                // check if error happens
                throw NetworkingError.httpResponseError
            }
            
            if (httpResponse.statusCode > 299){
                // check if error happens
                throw NetworkingError.statusCodeError
            }
            
            let decoder = JSONDecoder()
            do{
                // Decode to Array of T type
                let decodeData = try decoder.decode(T.self, from: data)
                return decodeData
            }catch{
                // check if error happens when decoding
                throw NetworkingError.couldNotDecodeData
            }
            
        }catch{
            // check if error happens
            throw NetworkingError.generic
        }
        
    }
}
