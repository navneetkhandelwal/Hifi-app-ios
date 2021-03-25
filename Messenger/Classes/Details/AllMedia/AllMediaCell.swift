//
//  PaymentsViewController.swift
//  app
//
//  Created by Hrithik Nigam on 23/11/20.
//  Copyright © 2020 KZ. All rights reserved.

import UIKit

//-------------------------------------------------------------------------------------------------------------------------------------------------
class AllMediaCell: UICollectionViewCell {

	@IBOutlet var imageItem: UIImageView!
	@IBOutlet var imageVideo: UIImageView!

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindData(message: Message) {

		imageItem.image = nil

		if (message.type == MESSAGE_PHOTO) {
			bindPicture(message: message)
		}
		if (message.type == MESSAGE_VIDEO) {
			bindVideo(message: message)
		}
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindPicture(message: Message) {

		imageVideo.isHidden = true

		if let path = Media.pathPhoto(message.objectId) {
			imageItem.image = UIImage.image(path, size: 160)
		}
	}

	//---------------------------------------------------------------------------------------------------------------------------------------------
	func bindVideo(message: Message) {

		imageVideo.isHidden = false

		if let path = Media.pathVideo(message.objectId) {
			DispatchQueue(label: "bindVideo").async {
				let thumbnail = Video.thumbnail(path: path)
				DispatchQueue.main.async {
					self.imageItem.image = thumbnail.square(to: 160)
				}
			}
		}
	}
}
