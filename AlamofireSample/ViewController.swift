//
//  ViewController.swift
//  AlamofireSample
//
//  Created by sensei on 2017/01/01.
//  Copyright © 2017年 sensei. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource {

    let table = UITableView()
    var articles: [[String: String?]] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        table.frame = view.frame
        view.addSubview(table)
        table.dataSource = self

        getArticles()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func getArticles() {
        Alamofire.request("https://qiita.com/api/v2/items")
            .responseJSON { response in
                guard let object = response.result.value else { return }
                
                let json = JSON(object)
                
                json.forEach { (_, json) in
                    let article: [String: String?] = [
                        "title": json["title"].string,
                        "userId": json["user"]["id"].string
                    ] // 1つの記事を表す辞書型を作る
                    self.articles.append(article)
                }
                self.table.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell") // Subtitleのあるセルを生成
        let article = articles[indexPath.row] // 行数番目の記事を取得
        cell.textLabel?.text = article["title"]! // 記事のタイトルをtextLabelにセット
        cell.detailTextLabel?.text = article["userId"]!
        return cell // cellを返す
    }
}

