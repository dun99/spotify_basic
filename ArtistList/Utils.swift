//
//  Utils.swift
//  ArtistList
//
//  Created by dong.thi.thu.dung on 18/10/2022.
//

import UIKit

enum Utils {
    static func formatFollowers(from: Int) -> String {
        
        let number = Double(from)
        let thousand = number / 1000
        let million = number / 1000000
        let billion = number / 1000000000
        
        if billion >= 1.0 {
            return "\(round(billion*10)/10)b"
        } else if million >= 1.0 {
            return "\(round(million*10)/10)m"
        } else if thousand >= 1.0 {
            return ("\(round(thousand*10/10))k")
        } else {
            return "\(Int(number))"
        }
    }
    
    static func secondsToHoursMinutesSeconds(_ miniseconds: Int) -> (Int, Int, Int) {
        let seconds = miniseconds/1000
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    static func printSecondsToHoursMinutesSeconds(_ seconds: Int) -> String {
        let (h, m, s) = secondsToHoursMinutesSeconds(seconds)
        if h != 0 {
            return String(format:"%i:%02i:%02i", h, m, s)
        }
        return String(format:"%i:%02i", m, s)
      }
}
