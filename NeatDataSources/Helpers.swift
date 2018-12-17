//
//  Helpers.swift
//  NeatDataSources
//
//  Created by Pablo Villar on 12/14/18.
//  Copyright © 2018 Pablo Villar. All rights reserved.
//

import UIKit

extension UITableView {
    
    func dequeueReusableCell<T: UITableViewCell>(ofType type: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: type.identifier) as? T
    }
    
}

extension UITableViewCell {
    
    class var identifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
}

extension TimeInterval {
    
    var asDurationText: String {
        let minutes = Int(self / 60)
        let seconds = Int(self.truncatingRemainder(dividingBy: 60))
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
}

extension UIAlertController {
    
    convenience init(title: String, message: String) {
        self.init(title: title, message: message, preferredStyle: .alert)
        addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    }
    
}

extension Decodable {
    
    static func fromPlist(named name: String) -> Self? {
        guard
            let path = Bundle.main.path(forResource: "\(name).plist", ofType: nil)
            else { return nil }
        do {
            let url = URL(fileURLWithPath: path)
            let data = try Data(contentsOf: url)
            let object = try PropertyListDecoder().decode(Self.self, from: data)
            return object
        } catch {
            print(error)
            return nil
        }
    }
    
}

extension Action {
    
    static let sampleActions: [Action] = {
        return [Action(title: "Purchase", message: "Purchase this album"),
                Action(title: "Redeem", message: "Use a redeem code"),
                Action(title: "Share", message: "Share this album")]
    }()
    
}

extension UIImageView {
    
    func setImage(downloadedFrom url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
            }.resume()
    }
    
    func setImage(downloadedFromLink link: String) {
        guard let url = URL(string: link) else { return }
        setImage(downloadedFrom: url)
    }
    
}
