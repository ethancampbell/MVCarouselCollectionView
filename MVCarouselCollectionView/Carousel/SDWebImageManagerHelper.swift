//
//  SDWebImageManagerHelper.swift
//  MVCarouselCollectionView
//
//  Created by Andrea Bizzotto on 11/12/2014.
//  Copyright (c) 2014 Muse Visions. All rights reserved.
//

import UIKit
    
var imageLocalLoader : (imagePath : NSString, completion: (imagePath: NSString, image: UIImage?) -> ()) -> () = { (imagePath : NSString, completion: (imagePath: NSString, image: UIImage?) -> ()) in

    var image = UIImage(named:imagePath)
    completion(imagePath: imagePath, image: image)
}

var imageViewLoad: ((imageView: UIImageView, imagePath : String, completion: (newImage: Bool) -> ()) -> ()) = {
    (imageView: UIImageView, imagePath : String, completion: (newImage: Bool) -> ()) in
    
    var url = NSURL(string: imagePath)
    imageView.sd_setImageWithURL(url, completed: {
        (image : UIImage?, error: NSError?, cacheType: SDImageCacheType, imageURL: NSURL?) in

        completion(newImage: image != nil)
    })
}
