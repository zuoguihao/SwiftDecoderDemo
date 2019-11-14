//
//  ViewController.swift
//  SwiftDecoderDemo
//
//  Created by 左得胜 on 2017/11/15.
//  Copyright © 2017年 左得胜. All rights reserved.
//

import UIKit
import CleanJSON

enum DataType: String {
    case systemStrict = "系统转model：字段类型严格匹配"
    case systemMyDeal = "系统转model：自行扩展处理类型不匹配情况"
    case cleanJSON = "CleanJSON转model："
}


class ViewController: UIViewController {
    // MARK: - Property
    private var dataArr: [DataType] = [
        .systemStrict,
        .systemMyDeal,
        .cleanJSON,
    ]
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
    }
    
    
    // MARK: - Action
    
    
    // MARK: - Lazy
    /// 懒加载tableView
    private lazy var tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.dataSource = self
        tv.delegate = self
        tv.estimatedRowHeight = 45
        tv.rowHeight = UITableView.automaticDimension
        tv.tableFooterView = UIView()
        
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tv
    }()
}

// MARK: - Private Method
private extension ViewController {
    func makeUI() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
        ])
    }
    
    /// 接口字段类型和model字段类型严格匹配
    func systemStrictTest() {
            let jsonData = """
    {
      "id": 1,
      "name": "测试name1",
      "cover": {
          "url": "https://www.baidu.com",
          "thumb_url": "https://www.baidu.com"
      },
      "photos": [
        {
          "id": "36499638920",
          "owner": "55126206@N07",
          "farm": 5,
          "title": "[BREATHE]-Ririko,Sayaka&Chiyoko",
          "ispublic": 1
        },
        {
          "id": "36724435032",
          "owner": "92807782@N04",
          "farm": 5,
          "ispublic": 0
        }
      ]
    }
    """.data(using: .utf8)!
            
            do {
                let model = try JSONDecoder().decode(Test1Model.self, from: jsonData)
                print(model)
            } catch {
                print(error)
            }
        }
    
    func systemMyDealTest() {
        let jsonData = """
        {
            "id": "1",
            "name": "测试name1",
            "cover": {
                "url": "https://www.baidu.com",
                "thumb_url": "https://www.baidu.com"
            },
            "photos": [
            {
            "id": "36499638920",
            "owner": "55126206@N07",
            "farm": 5,
            "title": "[BREATHE]-Ririko,Sayaka&Chiyoko",
            "ispublic": 1
            },
            {
            "id": "36724435032",
            "owner": "92807782@N04",
            "farm": "5",
            "ispublic": 0
            }
            ]
        }
        """.data(using: .utf8)!
        
        do {
            let model = try JSONDecoder().decode(Test2Model.self, from: jsonData)
            print(model)
        } catch {
            print(error)
        }
    }
    
    func cleanJSONTest() {
        let jsonData = """
        {
          "id": "1",
          "name": "测试name1",
          "sex": 2,
          "cover": {
              "url": "https://www.baidu.com",
              "thumb_url": "https://www.baidu.com"
          },
          "photos": [
            {
              "id": "36499638920",
              "owner": "55126206@N07",
              "farm": "5",
              "title": "[BREATHE]-Ririko,Sayaka&Chiyoko",
              "ispublic": 1.0
            },
            {
              "id": "36724435032",
              "owner": "92807782@N04",
              "farm": 5,
              "ispublic": 0
            }
          ]
        }
        """.data(using: .utf8)!
        
        do {
            let decoder = CleanJSONDecoder()
            decoder.valueNotFoundDecodingStrategy = .custom(CustomAdapter())
            let model = try decoder.decode(Test3Model.self, from: jsonData)
            print(model)
        } catch {
            print(error)
        }
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = dataArr[indexPath.row].rawValue
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch dataArr[indexPath.row] {
        case .systemStrict:
            systemStrictTest()
        case .systemMyDeal:
            systemMyDealTest()
        case .cleanJSON:
            cleanJSONTest()
        }
    }
    
}
