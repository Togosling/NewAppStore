//
//  Service.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 17/3/23.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchApps(completion: @escaping ([Result]) -> ()) {
        
        let urlString = "https://itunes.apple.com/search?term=instagram&entity=software"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("failed to fetch Itunes Apps", error)
            }
            guard let data = data else {return}
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                completion(searchResult.results)
        
            } catch {
                print("failed to decode json", error)
            }

        }.resume()
    }
}
