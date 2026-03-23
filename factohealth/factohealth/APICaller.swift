//
//  APICaller.swift
//  factohealth
//
//  Created by Nishanth S Shastry on 03/03/25.
//

import Foundation

final class APICaller{
    static let shared = APICaller()
    
    struct Constants {
        static let healthheadlinesURL = URL(string: "https://newsapi.org/v2/top-headlines?category=health&country=us&apiKey=76f3264ed12f4cbca4d9775960208528")
        static let searchUrlstring = "https://newsapi.org/v2/everything?sortBy=popularity&apiKey=76f3264ed12f4cbca4d9775960208528&q="
    }
    
    private init(){}
    
    public func getTopStories(completion: @escaping (Result<[Article], Error>) -> Void) {
        guard let url = Constants.healthheadlinesURL else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
//                    print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
    public func search(with query: String, completion: @escaping (Result<[Article], Error>) -> Void) {
        guard !query.trimmingCharacters(in: .whitespaces).isEmpty else {
            return
        }
        
        let urlString = Constants.searchUrlstring + query
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            else if let data = data {
                do {
                    let result = try JSONDecoder().decode(APIResponse.self, from: data)
//                    print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
}

struct APIResponse: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let source: Source?
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
}

struct Source: Codable {
    let name: String?
}
