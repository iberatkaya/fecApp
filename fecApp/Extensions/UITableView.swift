import Foundation
import UIKit

extension UITableView {
    // Taken from https://stackoverflow.com/a/45157417
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = .boldSystemFont(ofSize: 16)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    // Taken from https://stackoverflow.com/a/45157417
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
