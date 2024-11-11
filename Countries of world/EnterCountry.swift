//
//  EnterCountry.swift
//  Countries of world
//
//  Created by Mamatqobilov Bobomurod on 29/07/24.
//
import UIKit
import SnapKit

class EnterCountry: UIViewController {
    
    var tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 206/255, alpha: 1)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(CountryTableViewCell.self, forCellReuseIdentifier: "CountryTableViewCell")
        return tableView
    }()
    var indexCell = 0
    var arr = [Country1]()
    var resultArr = [Country1]()
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


extension EnterCountry: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell") as! CountryTableViewCell
        let country = arr[indexCell]
        
        cell.countryView.states.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
        cell.selectionStyle = .none
                cell.countryView.translations.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
                cell.countryView.timezones.addTarget(self, action: #selector(btnClick(_:)), for: .touchUpInside)
                
        
        
        cell.countryView.dataInitName(country.name ?? "")
        cell.countryView.dataInitIso2(country.iso2 ?? "")
        cell.countryView.dataInitIso3(country.iso3 ?? "")
        cell.countryView.dataInitNumericCode(country.numeric_code ?? "")
        cell.countryView.dataInitPhoneCode(country.phone_code ?? "")
        cell.countryView.dataInitCapital(country.capital ?? "")
        cell.countryView.dataInitCurrency(country.currency ?? "")
        cell.countryView.dataInitCurrencyName(country.currency_name ?? "")
        cell.countryView.dataInitNative(country.native ?? "")
        cell.countryView.dataInitRegion(country.region ?? "")
        cell.countryView.dataInitSubregion(country.subregion ?? "")
        cell.countryView.dataInitLatitude(country.latitude ?? "")
        cell.countryView.dataInitLongitude(country.longitude ?? "")
        cell.countryView.dataInitEmoji(country.emoji ?? "")
        cell.countryView.dataInitEmojiU(country.emojiU ?? "")
        return cell
    }
    @objc func btnClick(_ sender: UIButton){
        print(sender.tag)
        if sender.tag == 100{
            let vc = TimeZonesInfo()
            navigationController?.pushViewController(vc, animated: true)
        }
    }

    
    
}

extension EnterCountry {
    
    
    func setNav() {
        
        let titleStr = "Information about countries"
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
                        let obj = Country1.init(item)
                        arr.append(obj)
                    }
                    print(arr[1].name ?? "" , "chjbdc")
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



class Country1 {
    var name: String?
    var iso3: String?
    var iso2: String?
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
    var latitude: String?
    var longitude: String?
    var emoji: String?
    var emojiU: String?
    
    
    init(_ json: [String: AnyObject]) {
        self.name = json["name"] as? String
        self.iso3 = json["iso3"] as? String
        self.iso2 = json["iso2"] as? String
        self.numeric_code = json["numeric_code"] as? String
        self.phone_code = json["phone_code"] as? String
        self.capital = json["capital"] as? String
        self.currency = json["currency"] as? String
        self.currency_name = json["currency_name"] as? String
        self.currency_symbol = json["currency_symbol"] as? String
        self.tld = json["tld"] as? String
        self.native = json["native"] as? String
        self.region = json["region"] as? String
        self.subregion = json["subregion"] as? String
        self.latitude = json["latitude"] as? String
        self.longitude = json["longitude"] as? String
        self.emoji = json["emoji"] as? String
        self.emojiU = json["emojiU"] as? String
        
        
    }
}



