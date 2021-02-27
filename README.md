# Model-JsonText
Modelを作成しControllerに渡す
[![Image from Gyazo](https://i.gyazo.com/81b0ca529355cb2ce60b28a958ca3a10.png)](https://gyazo.com/81b0ca529355cb2ce60b28a958ca3a10)
## コード
### ViewController 
```swift
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
```

### TableViewCell
```swift
import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var iconImage: UIImageView!
    
    // cell呼び出し用のIDを設定 この値が変わることはないのでstaticを付け静的変数とする
    static let identifier = "TableViewCell"

    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

```

### FoodModel
```swift
import Foundation

struct Food: Codable {
    
    let name: String
    let price: Int
    let image: String
    
}

let jsonStr = """
    [
        { "name": "Apple",      "price": 200,   "image": "Apple" },
        { "name": "Orange",     "price": 120,   "image": "Orange" },
        { "name": "Banana",     "price": 65,    "image": "Banana" },
        { "name": "Grape",      "price": 400,   "image": "Grape" },
        { "name": "Strawberry", "price": 600,   "image": "Strawberry" },
        { "name": "Chocolate",  "price": 100,   "image": "Chocolate" },
        { "name": "Candy",      "price": 20,    "image": "Candy" },
        { "name": "Biscuit",    "price": 70,    "image": "Biscuit" },
        { "name": "Water",      "price": 100,   "image": "Water" },
        { "name": "Tea",        "price": 200,   "image": "Tea" },
        { "name": "Cola",       "price": 150,   "image": "Cola" },
        { "name": "Beer",       "price": 300,   "image": "Beer" },
        { "name": "Wine",       "price": 500,   "image": "Wine" }
    ]
"""

let jsonData = jsonStr.data(using: .utf8)  // json文字列をデータ型に変換
// 受け取ったdataをJSONDecoder()のdecodeメソッドでswiftの形式に変換(struct) 変換先は配列型なので[Food].selfとしている
let foods = try! JSONDecoder().decode([Food].self, from: jsonData!)
```
