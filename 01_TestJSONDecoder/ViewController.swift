//
//  ViewController.swift
//  01_TestJSONDecoder
//
//  Created by 左得胜 on 2017/11/15.
//  Copyright © 2017年 左得胜. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        test1()
//        test2()
        test3()
    }
    
    private func test3() {
        let json = """
    {
            "last_month" : {
                "oil_num" : 276.00990,
                "order_num" : 1
            },
            "last_month2" : {
                "oil_num" : "276.1",
                "order_num" : 2.0
            },
            "day" : {
                "oil_num" : null,
                "order_num" : 3
            },
            "month" : {
                "oil_num" : "测试",
                "order_num" : 4
            },
            "year" : {
                "oil_num" : "",
                "order_num" : 5
            },
            "last_year" : {
                "oil_num" : true,
                "order_num" : 6
            }
        }
    """.data(using: .utf8)!
        
        do {
            let myStruct = try JSONDecoder().decode(Test3Model.self, from: json) // decoding our data
            print(myStruct)
        } catch {
            print(error)
        }
    }
    
    private func test2() {
        let json = """
{
 "fullName": "Federico Zanetello",
 "id": 123456,
 "twitter": "http://twitter.com/zntfdr"
}
""".data(using: .utf8)! // our native (JSON) data
        
        
        do {
            let myStruct = try JSONDecoder().decode(Swifter.self, from: json) // decoding our data
            print(myStruct) // decoded!
        } catch {
            print(error)
        }
    }

    private func test1() {
        let jsonData = """
{
  "photos": {
    "page": 1,
    "pages": 13651,
    "perpage": 25,
    "total": "341263",
    "photo": [
      {
        "id": "36499638920",
        "owner": "55126206@N07",
        "secret": "7e82dee0ba",
        "server": "4346",
        "farm": 5,
        "title": "[BREATHE]-Ririko,Sayaka&Chiyoko",
        "ispublic": 1,
        "isfriend": 0,
        "isfamily": 0
      },
      {
        "id": "36724435032",
        "owner": "92807782@N04",
        "secret": "6d830d4a75",
        "server": "4354",
        "farm": 5,
        "title": "Serendipity Designs @ SWANK August 2017",
        "ispublic": 1,
        "isfriend": 0,
        "isfamily": 0
      },
      {
        "id": "36087089863",
        "owner": "152685136@N08",
        "secret": "a4a3f2fe0a",
        "server": "4365",
        "farm": 5,
        "title": "Hello Kitty Scooter",
        "ispublic": 1,
        "isfriend": 0,
        "isfamily": 0
      },
      {
        "id": "36086949593",
        "owner": "151818203@N02",
        "secret": "fc1207d373",
        "server": "4334",
        "farm": 5,
        "title": "Hip, Hip! It's Chip!",
        "ispublic": 1,
        "isfriend": 0,
        "isfamily": 0
      },
      {
        "id": "36498504410",
        "owner": "148300038@N02",
        "secret": "5c7f6ff3e1",
        "server": "4391",
        "farm": 5,
        "title": "Hello Kotti",
        "ispublic": 1,
        "isfriend": 0,
        "isfamily": 0
      }
    ]
  },
  "stat": "ok"
}
""".data(using: .utf8)!
        
        let data =  JSONDecoder().dataDecodingStrategy
        print(data)
        do {
            let flickrPhotos = try JSONDecoder().decode(FlickrImageResult.self, from: jsonData)
            print(flickrPhotos)
        } catch {
            print(error)
        }
    }

}

struct FlickrImageResult: Codable {
    let photos : FlickrPagedImageResult?
    let stat: String
}

struct FlickrPagedImageResult: Codable {
    let photo : [FlickrURLs]
    let page: Int
    let pages: Int
    let perpage: Int
    let total: String
}

struct FlickrURLs: Codable {
    let id : String
    let owner: String
    let secret: String
    let server: String
    var farm: String?
    // let title: String
    // If needed, camel-case and use CodingKeys enum
    //let ispublic: Int
    //let isfriend: Int
    //let isfamily: Int
}



