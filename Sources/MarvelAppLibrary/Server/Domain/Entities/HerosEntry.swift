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
    public let data: DataClass
}

// MARK: - DataClass
public struct DataClass: Codable {
    public let offset, limit, total, count: Int
    public let results: [Hero]
}

// MARK: - Result
public struct Hero: Codable, Identifiable {
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
    
    public func getUrlImage() -> String? {
        return "\(path).\(thumbnailExtension.rawValue)"
    }
}

public enum Extension: String, Codable {
    case gif = "gif"
    case jpg = "jpg"
}

// MARK: - HerosEntryFake
public let character1 = Hero(
    id: 1009351,
    name: "Hulk",
    description: "Caught in a gamma bomb explosion while trying to save the life of a teenager, Dr. Bruce Banner was transformed into the incredibly powerful creature called the Hulk. An all too often misunderstood hero, the angrier the Hulk gets, the stronger the Hulk gets.",
    thumbnail: Thumbnail(
        path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/538615ca33ab0",
        thumbnailExtension: Extension.jpg
    )
)

public let character2 = Hero(
    id: 1009368,
    name: "Iron Man",
    description: "Wounded, captured and forced to build a weapon by his enemies, billionaire industrialist Tony Stark instead created an advanced suit of armor to save his life and escape captivity. Now with a new outlook on life, Tony uses his money and intelligence to make the world a safer, better place as Iron Man.",
    thumbnail: Thumbnail(
        path: "http://i.annihil.us/u/prod/marvel/i/mg/9/c0/527bb7b37ff55",
        thumbnailExtension: Extension.jpg
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
