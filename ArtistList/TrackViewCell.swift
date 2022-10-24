//
//  TrackViewCell.swift
//  ArtistList
//
//  Created by dong.thi.thu.dung on 19/10/2022.
//

import UIKit

class TrackViewCell: UITableViewCell {
    
    private var apiService = ApiServices()
    
    @IBOutlet var imageSong: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var time: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCellValues(track: Track) {
        updateUI(name: track.name, time: track.duration_ms, images: track.album.images)
    }
    
    private func updateUI(name: String, time: Int, images: [Images]) {
        self.name.text = name
        self.time.text = "\(Utils.printSecondsToHoursMinutesSeconds(time))"
        apiService.getImageDataForm(url: URL(string: images.first!.url)!) { result in
            self.imageSong.image = result
            
        }
    }
    
}
