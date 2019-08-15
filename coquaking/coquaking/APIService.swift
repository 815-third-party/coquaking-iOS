//
//  APIService.swift
//  coquaking
//
//  Created by CHOMINJI on 15/08/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import Foundation

protocol APIService {
    
}

extension APIService {
    static func url(_ path: String) -> URL? {
        return URL(string: "http://54.180.32.184/" + path)
    }
}


struct KingOfWeekService: APIService {
    static func getKingOfWeekList(completion: @escaping (KingOfWeeks?) -> Void) {
        guard let URL = url("api/archives/") else {
            return
        }
        
        
        URLSession.shared.dataTask(with: URL) { (data, response, error) in
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let kings = try decoder.decode(KingOfWeeks.self, from: data)
                completion(kings)
            } catch {
                print(error.localizedDescription)
                completion(nil)
            }
            }.resume()
    }
}
