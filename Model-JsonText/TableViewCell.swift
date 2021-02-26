//
//  TableViewCell.swift
//  Model-JsonText
//
//  Created by Shinichiro Kudo on 2021/02/26.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // cell呼び出し用のIDを設定 この値が変わることはないのでstaticを付け静的変数とする
    static let identifier = "TableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
