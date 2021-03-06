//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Mateus Silva on 21/06/22.
//

import Foundation


struct Constants {
    static let API_KEY = "23748a67a5513767754e0bc9b49c1c54"
    static let baseURL = "https://api.themoviedb.org"
}

class APICAller {
    static let shared = APICAller()

    
    func getTrendingMovies(completion: @escaping (String) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/all/day?api_key=\(Constants.API_KEY)") else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            do {
//                let result = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
//                print(result)
                print(data)
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                print(results)
                
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
