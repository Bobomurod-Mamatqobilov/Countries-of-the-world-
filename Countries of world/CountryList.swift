//
//  ViewController.swift
//  Countries of world
//
//  Created by Mamatqobilov Bobomurod on 28/07/24.
//

import UIKit
import SnapKit

class CountryList: UIViewController {
    
    let searchBar = UISearchBar()
    var isSerachTapped = false
    var textDidChange = ""
    
    var tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .singleLine
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    var arr = [Country]()
    var resultArr = [Country]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        tableView.delegate = self
        tableView.dataSource = self
        setNav()
        parse()
        setUpSeachBar()
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.bottom.right.equalTo(0)
        }
    }
    func setUpSeachBar(){
        searchBar.sizeToFit()
        searchBar.endEditing(true)
        searchBar.searchTextField.backgroundColor = .white
        searchBar.searchTextField.textColor = .black
        searchBar.placeholder = " write city name"
        searchBar.searchTextField.leftView?.tintColor = .black
        self.searchBar.delegate = self
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Search"
        navigationController?.navigationBar.barStyle = .default
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(seachTapped))
//        showSearchBarButton(shouldShow: true)
    }
    @objc func seachTapped(_ sender: UIBarButtonItem){
        navigationItem.titleView = searchBar
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelTapped))
    }
    @objc func cancelTapped(_ sender: UIBarButtonItem){
        navigationItem.titleView = nil
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(seachTapped))
    }
    func getResult(_ str: String) -> [Country] {
        var resArr = [Country]()
        
//        let index = str.count - 1
//        
//        if str.count == 1 {
//            resArr = arr.filter({
//             $0.name?.range(of: str, options: .caseInsensitive) != nil
//            })
//        } else if str.count > 1{
//            resArr = resArr.filter({
//                $0.name?.range(of: str.index, options: .caseInsensitive) != nil
//            })
//        } else if str.count < 1 {
//            resArr = arr
//        }else{
//            resArr.self
//        }
        resArr = arr.filter({
         $0.name?.range(of: str, options: .caseInsensitive) != nil
        })
        
        return resArr
    }
//    func countryArr(){
//        for country in arr{
//            countryyArr.append(country.name)
//        }
//    }
}

extension CountryList: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Did: ", searchBar.text ?? "")
        let str = searchBar.text ?? ""
        isSerachTapped = true
        resultArr = getResult(str)
        if searchBar.text == ""{
            isSerachTapped = false
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        print("Should: ", searchBar.text ?? "", text ?? "", self.searchBar.text ?? "")
        
        return true
    }
}


extension CountryList: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSerachTapped{
            return resultArr.count
        }else{
            return arr.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UITableViewCell
        if isSerachTapped{
            parse()
        }else{
            cell.textLabel?.text = "\(arr[indexPath.row].id ?? 0). \(arr[indexPath.row].name ?? "")"
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // should rewrite the code
        if isSerachTapped {
            let vc = EnterCountry()
            vc.indexCell = (resultArr[indexPath.row].id ?? 0)-1
            print(vc.indexCell, " index cell")
            navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = EnterCountry()
            vc.indexCell = indexPath.row
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension CountryList {
    
    
    func setNav() {
        
        let titleStr = "Countries"
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
                        let obj = Country.init(item)
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



class Country {
    var id: Int?
    var name: String?
    var iso3: String?
    var iso32: String?
    var numeric_code: String?
    var phone_code: String?
    var capital: String?
    var currency: String?
    var currency_name: String?
    var currency_symbol: String?
    var tld: String?
    var native: String?
    var region: String?
    var subregion: String?
    var timezones: [TimeZone] = []
    var translations: Translation?
    var latitude: String?
    var longitude: String?
    var emoji: String?
    var emojiU: String?
    var states: [State] = []
    
    
    init(_ json: [String: AnyObject]) {
        self.id = json["id"] as? Int
        self.name = json["name"] as? String
        
        if let timeArr = json["timezones"] as? [[String:AnyObject]] {
            for item in timeArr {
                timezones.append(TimeZone(item))
            }
        }
        if let myDict = json["translations"] as? [String:AnyObject] {
            translations = Translation.init(myDict)
        }
        if let arr = json["states"] as? [[String:AnyObject]] {
            for item in arr {
                states.append(State(item))
            }
        }
    }
}


class TimeZone {
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


class Translation {
    var br: String?
    var pt: String?
    var fr: String?
    
    init(_ json: [String: AnyObject]) {
        self.br = json["br"] as? String
        self.pt = json["pt"] as? String
        self.fr = json["fr"] as? String
    }
}

class State {
    var id: Int?
    var name: String?
    var state_code: String?
    var latitude: String?
    var longitude: String?
    var cities: [City] = []
    
    
    init(_ json: [String: AnyObject]) {
        self.id = json["id"] as? Int
        self.name = json["name"] as? String
        self.state_code = json["state_code"] as? String
        self.latitude = json["latitude"] as? String
        self.longitude = json["longitude"] as? String
        if let arr = json["cities"] as? [[String: AnyObject]] {
            for item in arr {
                cities.append(City(item))
            }
        }
    }
}

class City {
    var id: Int?
    var name: String?
    var latitude: String?
    var longitude: String?
    
    init(_ json: [String: AnyObject]) {
        self.id = json["id"] as? Int
        self.name = json["name"] as? String
        self.latitude = json["latitude"] as? String
        self.longitude = json["longitude"] as? String
    }
}

class CountrySearch{
    var name: String?
    
    init(_ json: [String: AnyObject]) {
        self.name = json["name"] as? String
    }
}

