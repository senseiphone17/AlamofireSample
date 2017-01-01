//
//  ViewController.swift
//  AlamofireSample
//
//  Created by sensei on 2017/01/01.
//  Copyright © 2017年 sensei. All rights reserved.
//

import UIKit
import Alamofire

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
                print(response.result.value as Any)
        }
    }
}

