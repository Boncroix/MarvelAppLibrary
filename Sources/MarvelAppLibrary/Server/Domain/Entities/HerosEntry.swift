//
//  Hero.swift
//  Marvel_KC
//
//  Created by Jose Bueno Cruz on 1/5/24.
//

import Foundation

// MARK: - Hero
public struct HerosEntry: Codable {
    public let code: Int
    let data: DataClass
}

// MARK: - DataClass
public struct DataClass: Codable {
    public let offset, limit, total, count: Int
    public let results: [Hero]
}

// MARK: - Result
public struct Hero: Codable {
    public let id: Int
    public let name, description: String
    public let thumbnail: Thumbnail
}

// MARK: - Thumbnail
public struct Thumbnail: Codable {
    public let path: String
    public let thumbnailExtension: Extension

    public enum CodingKeys: String, CodingKey {
        case path
        case thumbnailExtension = "extension"
    }
}

public enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}


public let character1 = Hero(
    id: 1,
    name: "Spider-Man",
    description: "A superhero with spider-like abilities.",
    thumbnail: Thumbnail(
        path: "http://example.com/spiderman",
        thumbnailExtension: .jpg
    )
)

public let character2 = Hero(
    id: 2,
    name: "Iron Man",
    description: "A billionaire inventor in a high-tech armored suit.",
    thumbnail: Thumbnail(
        path: "http://example.com/ironman",
        thumbnailExtension: .jpg
    )
)

public let dataClass = DataClass(
    offset: 0,
    limit: 2,
    total: 2,
    count: 2,
    results: [character1, character2]
)

public let herosEntryFake = HerosEntry(
    code: 200,
    data: dataClass
)

public let listHeroFake: [Hero] = [character1, character2]
