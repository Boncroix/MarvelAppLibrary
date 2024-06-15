//
//  SeriesEntry.swift
//
//
//  Created by Jose Bueno Cruz on 9/6/24.
//

import Foundation

// MARK: - Series
public struct SeriesEntry: Codable {
    public let data: DataClassSeries
}

// MARK: - DataClass
public struct DataClassSeries: Codable {
    public let results: [Serie]
}

// MARK: - Result
public struct Serie: Codable, Identifiable, Hashable {
    public let id: Int
    public let title: String
    public let description: String?
    public let thumbnail: Thumbnail
}

// MARK: - SeriesEntryFake
public let serie1 = Serie(
    id: 38660,
    title: "Spider-Man Unlimited Infinity Comic (2023 - Present)",
    description: "An ongoing series set in the current continuity of Spider-Man comics! The Spider-Man of Earth-616 is in for a shocking surprise when he discovers that the Spot, the villain who is impossible to kill, has actually died. But how?",
    thumbnail: Thumbnail(
        path: "http://i.annihil.us/u/prod/marvel/i/mg/d/20/4bc5b8699bc8d",
        thumbnailExtension: Extension.jpg))

public let serie2 = Serie(
    id: 39076,
    title: "Jackpot (2024)",
    description: nil,
    thumbnail: Thumbnail(
        path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available",
        thumbnailExtension: Extension.jpg))


public let dataClassSeries = DataClassSeries(
    results: [serie1, serie2]
)

public let SeriesEntryFake = SeriesEntry(
    data: dataClassSeries
)

public let listSeriesFake: [Serie] = [serie1, serie2]
