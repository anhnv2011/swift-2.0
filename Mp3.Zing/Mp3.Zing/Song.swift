//
//  Song.swift
//  Mp3.Zing
//
//  Created by anh  nguyen viet on 9/15/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import Foundation
import UIKit
struct Song
{
    var title = ""
    var artistName = ""
    var thumbnail: UIImage
    var sourceOnline = ""
    var sourceLocal = ""
    var localThumbnail = ""
    let baseThumbnail = "http://image.mp3.zdn.vn//thumb/240_240/"
    
    init(title: String, artistName: String, thumbnail: String, source: String)
    {
        self.title = title
        self.artistName = artistName
        let thumbnailURL = baseThumbnail + thumbnail
        let dataImage = NSData(contentsOf: NSURL(string: thumbnailURL)! as URL)
        self.thumbnail = UIImage(data: dataImage! as Data)!
        self.sourceOnline = source
    }
    
    init(title: String, artistName: String, localthumbnail: String, localsource: String)
    {
        self.title = title
        self.artistName = artistName
        self.localThumbnail = localthumbnail
        let dataImage = NSData(contentsOfFile: self.localThumbnail)
        self.thumbnail = UIImage(data: dataImage as! Data)!
        self.sourceLocal = localsource
    }
    
}
