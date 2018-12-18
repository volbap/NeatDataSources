//
//  ViewController.swift
//  NeatDataSources
//
//  Created by Pablo Villar on 12/14/18.
//  Copyright © 2018 Pablo Villar. All rights reserved.
//

import UIKit

class AlbumViewController: UIViewController {
    
    // MARK: - Public
    
    func configure(with album: Album, actions: [Action]) {
        self.album = album
        self.actions = actions
        tableView.reloadData()
    }

    // MARK: - Outlets
    
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Private
    
    private var album: Album = Album.fromPlist(named: "SampleAlbum")!
    private var actions: [Action] = Action.sampleActions
    
    private func perform(_ action: Action) {
        let alert = UIAlertController(title: action.title, message: action.message)
        present(alert, animated: true)
    }
    
}

extension AlbumViewController: UITableViewDataSource, UITableViewDelegate {
    
    private enum Section: Int, CaseIterable { case albumInfo, tracks, actions }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Section.allCases.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section)! {
        case .albumInfo: return 1
        case .tracks: return album.tracks.count
        case .actions: return actions.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch Section(rawValue: indexPath.section)! {
        case .albumInfo: return albumInfoCell()
        case .tracks: return trackCell(forRow: indexPath.row)
        case .actions: return actionCell(forRow: indexPath.row)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch Section(rawValue: indexPath.section)! {
        case .albumInfo: break
        case .tracks: break
        case .actions:
            tableView.deselectRow(at: indexPath, animated: true)
            perform(actions[indexPath.row])
        }
    }
    
    // MARK: - Cells
    
    private func albumInfoCell() -> AlbumInfoCell {
        let cell = tableView.dequeueReusableCell(ofType: AlbumInfoCell.self)!
        cell.configure(with: album)
        return cell
    }
    
    private func trackCell(forRow row: Int) -> AlbumTrackCell {
        let cell = tableView.dequeueReusableCell(ofType: AlbumTrackCell.self)!
        cell.configure(with: album.tracks[row], number: row + 1)
        let leftMargin: CGFloat = (row == album.tracks.count - 1) ? 0 : 16
        cell.separatorInset = UIEdgeInsets(top: 0, left: leftMargin, bottom: 0, right: 0)
        return cell
    }
    
    private func actionCell(forRow row: Int) -> AlbumActionCell {
        let cell = tableView.dequeueReusableCell(ofType: AlbumActionCell.self)!
        cell.configure(with: actions[row])
        return cell
    }
    
}
