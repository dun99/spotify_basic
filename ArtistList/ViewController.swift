//
//  ViewController.swift
//  ArtistList
//
//  Created by dong.thi.thu.dung on 16/10/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var artistsData = [Artist]()
    private var apiService = ApiServices()
    
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var spinner: UIActivityIndicatorView!
    
    
//    var shouldStartActivityIndicator : Bool = false
//    func startAnimating() {
//        shouldStartActivityIndicator = true
//        DispatchQueue.main.asyncAfter(deadline: .now() + 10.0) {
//            if self.shouldStartActivityIndicator {
//                self.spinner.startAnimating()
//            }
//        }
//
//    }
//    func stopAnimating() {
//        shouldStartActivityIndicator = false
//        self.spinner.stopAnimating()
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.startAnimating()
        fetchData()
    }
    
    func fetchData() {
        self.spinner.startAnimating()
        apiService.fetchingApiData(for: ArtistListData.self, URL: Constants.followingArtistURL) { result in
            self.artistsData = result.artists.items
            self.spinner.stopAnimating()
            sleep(2)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func reloadData(_ sender: Any) {
        artistsData = [Artist]()
        fetchData()
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ArtistViewCell
        let artist = Artist(id: artistsData[indexPath.row].id, name: artistsData[indexPath.row].name, followers: artistsData[indexPath.row].followers, images: artistsData[indexPath.row].images)
        cell.setCellValues(artist: artist)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "Tracks") as? TracksViewController
        vc?.id = artistsData[indexPath.row].id
        navigationController?.pushViewController(vc!, animated: true)
    }
}

