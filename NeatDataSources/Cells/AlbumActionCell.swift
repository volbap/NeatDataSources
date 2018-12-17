//
//  AlbumActionCell.swift
//  NeatDataSources
//
//  Created by Pablo Villar on 12/14/18.
//  Copyright © 2018 Pablo Villar. All rights reserved.
//

import UIKit

class AlbumActionCell: UITableViewCell {

	// MARK: - Public

	func configure(with action: Action) {
		self.action = action
	}

	// MARK: - Outlets

	@IBOutlet private weak var titleLabel: UILabel!

	// MARK: - Private

	private var action: Action? {
		didSet {
			titleLabel.text = action?.title
		}
	}
    
}
