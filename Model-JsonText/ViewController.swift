//
//  ViewController.swift
//  Model-JsonText
//
//  Created by Shinichiro Kudo on 2021/02/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var items = [Food]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // cellに表示させたいitemsに、Foodモデルで定義したfoodsを代入(Jsonから変換済)
        items = foods
        // 使用するcellファイルの登録
        tableView.register(TableViewCell.nib(), forCellReuseIdentifier: TableViewCell.identifier)
        // delegateメソッドをこのファイルに記載
        tableView.delegate = self
        tableView.dataSource = self
    }


}


// TableView Funcs
    // 行の数
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    // cellの中身に関する設定
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cellを以下の仕様で再利用する(for関数のようにrowひとつひとつに代入されるイメージ)
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        
        // itemsの内の取得されたrowが持つ各プロパティをxibのUIに代入する
        cell.nameLabel.text = items[indexPath.row].name
        cell.priceLabel.text = "\(items[indexPath.row].price)円"
        // image文字列を定数に代入し取得、UIImageの引数として使用
        let iconStr = items[indexPath.row].image
        cell.iconImage.image = UIImage(named: iconStr)
        
        return cell
    }
    
    
}
