//
//  OfferResults.swift
//  electroBestBuy
//
//  Created by Zain Lakhani on 2020-07-14.
//  Copyright © 2020 Arif Lakhani. All rights reserved.
//

import Foundation

struct offerResults: Decodable {
    let offers:[offers]
    let total_count:Int
}

struct offers: Decodable {
    let all_prices:[all_prices]
    let total_price:Float
    let offer_id:Int
}

struct all_prices: Decodable {
    let unit_discount_price:Float
}

var allSKU:[Int]?
