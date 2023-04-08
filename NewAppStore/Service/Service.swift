//
//  Service.swift
//  NewAppStore
//
//  Created by Тагай Абдылдаев on 17/3/23.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchSearchApps(searchItem: String, completion: @escaping (SearchResult) -> ()) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchItem)&entity=software"
        fetchGenericJsonData(urlString: urlString, completion: completion)
    }
    
    func fetchTopFree(completion: @escaping (AppGroup) -> ()) {
        
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"
        fetchGenericJsonData(urlString: urlString, completion: completion)    }
    
    func fetchTopPaid(completion: @escaping (AppGroup) -> ()) {
        
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-paid/50/apps.json"
        fetchGenericJsonData(urlString: urlString, completion: completion)
    }
        
    func fetchSocialApp(completion: @escaping ([SocialApp]) -> ()) {
                
        fetchGenericJsonData(urlString: "https://api.letsbuildthatapp.com/appstore/social", completion: completion)
    }
    
    func fetchSearchApp(urlString: String, completion: @escaping (SearchResult)->()) {
        fetchGenericJsonData(urlString: urlString, completion: completion)
    }
    
    //MARK: Generic
    
    func fetchGenericJsonData<T:Decodable> (urlString: String, completion: @escaping (T) -> ()) {
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("failed to fetch Itunes Apps", error)
            }
            guard let data = data else {return}
            
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completion(result)
        
            } catch {
                print("failed to decode json", error)
            }

        }.resume()
    }
    
}
