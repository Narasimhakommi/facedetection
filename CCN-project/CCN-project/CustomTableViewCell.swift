import UIKit

class CustomTableViewCell: UITableViewCell {

    static let reuseIdentifier = "CustomTableViewCell"

    var titleLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // Create a label and add it to the cell's content view
        titleLabel = UILabel()
        titleLabel.frame = CGRect(x: 15, y: 0, width: contentView.frame.width - 30, height: contentView.frame.height)
        titleLabel.textAlignment = .left
        contentView.addSubview(titleLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}