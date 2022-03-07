//
//  FiatExchangeEntity.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import UIKit

struct ExchangeRateEntity: Codable {
    let documentation: String
    let lastUpdateUtc: String
    let baseCode: String
    var conversionRates: [String:Double]
    
    enum CodingKeys: String, CodingKey {
        case documentation
        case lastUpdateUtc = "time_last_update_utc"
        case baseCode = "base_code"
        case conversionRates = "conversion_rates"
    }
}
