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

class ViewController: UIViewController {
    let table = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        table.frame = view.frame
        view.addSubview(table)

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
                    print(json["title"])
                }
        }
    }
}

