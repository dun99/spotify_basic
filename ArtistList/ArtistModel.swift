//
//  ArtistModel.swift
//  ArtistList
//
//  Created by dong.thi.thu.dung on 16/10/2022.
//

import Foundation

struct Artist: Decodable {
    let id: String
    let name: String
    let followers: Followers
    let images: [Images]
}

struct ArtistListData: Decodable {
    let artists: ItemsData
}

struct Followers: Decodable {
    let total: Int
}

struct ItemsData: Decodable {
    let items: [Artist]
}

struct Images: Codable {
    let url: String
}

struct Track: Decodable {
    let id: String
    let name: String
    let album: AlbumImage
    let duration_ms: Int
}

struct TrackListData: Decodable {
    let tracks: [Track]
}

struct AlbumImage: Decodable {
    let images: [Images]
}
