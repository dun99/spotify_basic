//
//  Contants.swift
//  ArtistList
//
//  Created by dong.thi.thu.dung on 18/10/2022.
//

import Foundation

enum Constants {
    static let BaseURL = "https://api.spotify.com/v1"
    static let token = "BQBaNi4pZ_g_ijWftkh--ICD3x6zZ--aQFHoVbuF97kZ7d-ObEu8XIdR5su-enG5-4neVZpjm24bHXhp3KCoeiRNbOnuqT_4JY7HSrony89k2wHtPXC8LiBqSUgyqt-TTLv9q2SJHPty4FD1y21ygbHQ4wlIpGe4YdZ2sUYtF9o0N5pMT5WnTOTD_kyaXO0O5GWfDlg5Wus"
    static let followingArtistURL = "\(BaseURL)/me/following?type=artist&limit=10"
    static let artistTopTracksURL = "\(BaseURL)/artists/{id}/top-tracks?market=VN"
}

