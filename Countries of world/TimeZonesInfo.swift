//
//  TimeZonesInfo.swift
//  Countries of world
//
//  Created by Mamatqobilov Bobomurod on 31/07/24.
//

import UIKit
import SnapKit

class TimeZonesInfo: UIViewController {
    
    var tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 206/255, alpha: 1)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    var indexCell = 0
    var arr = [CountryTimezones]()
    var resultArr = [CountryTimezones]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        tableView.delegate = self
        tableView.dataSource = self
        setNav()
        parse()
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.bottom.right.equalTo(0)
        }
    }
    
    
    
}


extension TimeZonesInfo: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        cell.textLabel?.text = "zoneName: \(arr[0]) \n gmtOffset: \(arr[1])"
        return cell
    }

    
    
}

extension TimeZonesInfo {
    
    
    func setNav() {
        
        let titleStr = "timeZOnes"
        let font1 = UIFont(name: "Noteworthy Bold", size: 23) ?? .systemFont(ofSize: 23)
        let shadow1 = NSShadow()
        shadow1.shadowColor = UIColor.white
        shadow1.shadowBlurRadius = 2
        
        let titleAttr: [NSAttributedString.Key : Any] = [.font : font1, .foregroundColor: UIColor.orange]
        let attributedStr = NSMutableAttributedString(string: titleStr, attributes: titleAttr) // NSAttributedString(string: titleStr, attributes: titleAttr)
        
        let titleLabel = UILabel()
        titleLabel.attributedText = attributedStr
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.navigationItem.titleView = titleLabel
        
        titleLabel.frame = CGRect(x: 220, y: 120, width: 200, height: 70)
        view.addSubview(titleLabel)
        
    }
    @objc func leftMenuClicked(_ sender: UIBarButtonItem){
        print("Left tapped!!")
    }
    
    func parse(){
        guard let path =  Bundle.main.path(forResource: "country", ofType: "json") else {return}
        let url = URL(fileURLWithPath: path)
        if let data = try? Data(contentsOf: url){
            do{
                if let json = try JSONSerialization.jsonObject(with: data) as? [[String:AnyObject]]{
                    for item in json{
                        let obj = CountryTimezones.init(item)
                        arr.append(obj)
                    }
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
            catch let error as NSError{
                print(error)
            }
        }
            
    }
}

class CountryTimezones {
    
    var timezones: [TimeZone1] = []
    
    
    
    init(_ json: [String: AnyObject]) {
        if let timeArr = json["timezones"] as? [[String:AnyObject]] {
            for item in timeArr {
                timezones.append(TimeZone1(item))
            }
        }
    }
}


class TimeZone1 {
    var zoneName: String?
    var gmtOffset: Int?
    var gmtOffsetName: String?
    var abbreviation: String?
    var tzName: String?
    
    init(_ json: [String:AnyObject]) {
        self.zoneName = json["zoneName"] as? String
        self.gmtOffset = json["gmtOffset"] as? Int
        self.gmtOffsetName = json["gmtOffsetName"] as? String
        self.abbreviation = json["abbreviation"] as? String
        self.tzName = json["tzName"] as? String
    }
}
