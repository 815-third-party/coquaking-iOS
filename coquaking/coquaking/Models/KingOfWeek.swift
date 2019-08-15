//
//  KingOfWeek.swift
//  coquaking
//
//  Created by CHOMINJI on 15/08/2019.
//  Copyright © 2019 cmindy. All rights reserved.
//

import Foundation

typealias KingOfWeeks = [KingOfWeek]
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



/**
 [
 {
 "category": "TEXT",
 "first": {
 "id": 18,
 "slackId": "U7J8WA6RH",
 "name": "Brian",
 "thumbnail": "https://avatars.slack-edge.com/2018-06-05/376542501830_68909525a972145adb5a_512.jpg"
 },
 "second": {
 "id": 4,
 "slackId": "U75J67NMV",
 "name": "JK",
 "thumbnail": "https://avatars.slack-edge.com/2018-09-21/440403526613_0b94bf9f88a177e18ef8_512.png"
 },
 "third": {
 "id": 62,
 "slackId": "U9HQY3J2V",
 "name": "Sarah",
 "thumbnail": "https://avatars.slack-edge.com/2019-05-11/634189333015_9d5f0f61e24f3dc235a1_512.png"
 }
 },
 {
 "category": "REACTION",
 "first": {
 "id": 23,
 "slackId": "UHEC7JQU8",
 "name": "도미닉",
 "thumbnail": "https://avatars.slack-edge.com/2019-04-01/592792711792_7c24780eaed6cd5d71fb_512.png"
 },
 "second": {
 "id": 94,
 "slackId": "UCPAK2S00",
 "name": "Hngfu",
 "thumbnail": "https://avatars.slack-edge.com/2018-09-10/432269700085_0a786f0010943795a9f3_512.jpg"
 },
 "third": {
 "id": 148,
 "slackId": "UHHSJ17T9",
 "name": "Snow",
 "thumbnail": "https://avatars.slack-edge.com/2019-04-01/592755954448_22b47f73d1beafc6dde1_512.png"
 }
 }
 ]
 **/
