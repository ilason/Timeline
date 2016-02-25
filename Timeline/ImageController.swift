//
//  ImageController.swift
//  Timeline
//
//  Created by Aaron Eliason on 2/24/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import UIKit

class ImageController{
    static func uploadImage(image: UIImage, completion: (identifier: String) -> Void) {
        // We use an identifier for the image instead of a URL because we are uploading to Firebase. If we were uploading to Amazon S3 or other cloud service, we would probably return a URL instead of identifier.
    }
    static func imageForIdentifier(identifier: String, completion: (image: UIImage?) -> Void) {
        
    }
}