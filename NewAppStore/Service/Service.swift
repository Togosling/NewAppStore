//
//  Service.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 17/3/23.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchSearchApps(searchItem: String, completion: @escaping ([Result]) -> ()) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchItem)&entity=software"
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
    
    func fetchTopFree(completion: @escaping (AppGroup) -> ()) {
        
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"
        fetch(urlString: urlString, completion: completion)
    }
    
    func fetchTopPaid(completion: @escaping (AppGroup) -> ()) {
        
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/50/apps.json"
        fetch(urlString: urlString, completion: completion)
    }
    
    //MARK: Helper
    
    func fetch(urlString: String, completion: @escaping (AppGroup)-> ()) {
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("failed to fetch Itunes Apps", error)
            }
            guard let data = data else {return}
            
            do {
                let result = try JSONDecoder().decode(AppGroup.self, from: data)
                completion(result)
        
            } catch {
                print("failed to decode json", error)
            }

        }.resume()
    }
    
}
