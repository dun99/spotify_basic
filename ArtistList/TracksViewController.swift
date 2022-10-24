//
//  TracksViewController.swift
//  ArtistList
//
//  Created by dong.thi.thu.dung on 19/10/2022.
//

import UIKit

class TracksViewController: UIViewController {
    
    var songsData = [Track]()
    var id: String = ""
    private var apiService = ApiServices()

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        apiService.fetchingApiData(for: TrackListData.self, URL: "\(Constants.BaseURL)/artists/\(id)/top-tracks?market=VN") { result in
            self.songsData = result.tracks
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
//        self.navigationController?.navigationBar.setTitleVerticalPositionAdjustment(for: .default)
    }
}

extension TracksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        songsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! TrackViewCell
        let track = Track(id: songsData[indexPath.row].id, name: songsData[indexPath.row].name, album: songsData[indexPath.row].album, duration_ms: songsData[indexPath.row].duration_ms)
        
        cell.setCellValues(track: track)
        return cell
    }
}
