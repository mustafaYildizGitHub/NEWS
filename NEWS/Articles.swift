//
//  Articles.swift
//  NEWS
//
//  Created by mustafa yildiz on 8.09.2022.
//

import Foundation

struct Articles: Codable {
    let articles: [Article]
}


struct Article: Codable {
    let title: String?
    let description: String?
    let urlToImage: String?
}
