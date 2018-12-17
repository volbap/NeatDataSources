//
//  AlbumInfoCell.swift
//  NeatDataSources
//
//  Created by Pablo Villar on 12/14/18.
//  Copyright © 2018 Pablo Villar. All rights reserved.
//

import UIKit

class AlbumInfoCell: UITableViewCell {

	// MARK: - Public

	func configure(with album: Album) {
		self.album = album
	}

	// MARK: - Outlets

	@IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var authorLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
	@IBOutlet private weak var coverImageView: UIImageView!

	// MARK: - Private

	private var album: Album? {
		didSet {
            guard let album = album else { return }
			titleLabel.text = album.title
            authorLabel.text = album.author
            yearLabel.text = "\(album.year)"
            coverImageView.setImage(downloadedFromLink: album.imageLink)
		}
	}
    
}
