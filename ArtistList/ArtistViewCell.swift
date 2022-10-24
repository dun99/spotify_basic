//
//  ArtistViewCell.swift
//  ArtistList
//
//  Created by dong.thi.thu.dung on 16/10/2022.
//

import UIKit

class ArtistViewCell: UITableViewCell {
    
    private var apiService = ApiServices()
    
    @IBOutlet var avatar: UIImageView!
    @IBOutlet var name: UILabel!
    @IBOutlet var followers: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatar.layer.masksToBounds = true
        avatar.layer.cornerRadius = avatar.bounds.width / 2
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCellValues(artist: Artist) {
        updateUI(name: artist.name, followers: artist.followers, images: artist.images)
    }
    
    private func updateUI(name: String, followers: Followers, images: [Images]) {
        self.name.text = name
        let formatedFollowers = Utils.formatFollowers(from: followers.total)
        self.followers.text = "\(formatedFollowers) folllowers"
        apiService.getImageDataForm(url: URL(string: images.first!.url)!) { result in
            self.avatar.image = result
            
        }
    }
    
    
}
