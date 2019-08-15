//
//  Ranks.swift
//  coquaking
//
//  Created by CHOMINJI on 15/08/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import Foundation

/***
[
    {
        "category": "TEXT",
        "first": {
            "id": 1,
            "slackId": "USLACKBOT",
            "name": "Slackbot",
            "thumbnail": "https://a.slack-edge.com/16510/img/slackbot_512.png"
        },
        "second": {
            "id": 3,
            "slackId": "U74KKLB0D",
            "name": "Honux",
            "thumbnail": "https://avatars.slack-edge.com/2018-04-25/352675040515_4f2767985e3d263e871b_512.png"
        }
    },
    {
        "category": "TEXT",
        "first": {
            "id": 1,
            "slackId": "USLACKBOT",
            "name": "Slackbot",
            "thumbnail": "https://a.slack-edge.com/16510/img/slackbot_512.png"
        },
        "second": {
            "id": 3,
            "slackId": "U74KKLB0D",
            "name": "Honux",
            "thumbnail": "https://avatars.slack-edge.com/2018-04-25/352675040515_4f2767985e3d263e871b_512.png"
        }
    }
]
***/


struct KingOfWeek: Codable {
    let category: String
    let first, second, third: Rank
}

struct Rank: Codable {
    let id: Int
    let slackID, name: String
    let thumbnail: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case slackID = "slackId"
        case name, thumbnail
    }
}

typealias KingOfWeeks = [KingOfWeek]
