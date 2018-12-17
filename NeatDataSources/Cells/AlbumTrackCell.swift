//
//  AlbumTrackCell.swift
//  NeatDataSources
//
//  Created by Pablo Villar on 12/14/18.
//  Copyright © 2018 Pablo Villar. All rights reserved.
//

import UIKit

class AlbumTrackCell: UITableViewCell {

	// MARK: - Public

    func configure(with track: Track, number: Int) {
		self.track = track
        self.number = number
        updateUI()
	}

	// MARK: - Outlets

    @IBOutlet weak var numberLabel: UILabel!
	@IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
	@IBOutlet weak var durationLabel: UILabel!

	// MARK: - Private

	private var track: Track!
    private var number: Int = 0
    
    private func updateUI() {
        numberLabel.text = "\(number)."
        titleLabel.text = track.title
        authorLabel.text = track.author
        durationLabel.text = track.duration.asDurationText
    }
    
}
