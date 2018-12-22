//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Nadezda Panchenko on 22/12/2018.
//  Copyright © 2018 Nadezda Panchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let controller = PhotoController()
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    @IBOutlet weak var imageDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        controller.fetchPhoto { (photo) in
            if let photo = photo {
                self.updateUI(with: photo)
            }
        }
        
    }
    
    
    func updateUI(with photoInfo: PhotoInfo) {
        
        let imageTask = URLSession.shared.dataTask(with: photoInfo.url) {
            (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image.image = image
                    self.imageDescription.text = photoInfo.description
                    self.title = photoInfo.title
                    
                    if let copyright = photoInfo.copyright {
                        self.copyrightLabel.text = copyright
                    } else {
                        self.copyrightLabel.isHidden = true
                    }
                    
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
            } else {
                print("Could not fetch image data")
            }
        }
        
        imageTask.resume()
    }

}

