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
