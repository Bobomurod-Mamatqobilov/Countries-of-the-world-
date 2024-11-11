//
//  CountryInfo.swift
//  Countries of world
//
//  Created by Mamatqobilov Bobomurod on 29/07/24.
//
import UIKit
import SnapKit

class CountryInfo: UIView {
    
    let name = UILabel()
    let iso3 = UILabel()
    let iso2 = UILabel()
    let numeric_code = UILabel()
    let phone_code = UILabel()
    let capital = UILabel()
    let currency = UILabel()
    let currency_name = UILabel()
    let tld = UILabel()
    let native = UILabel()
    let region = UILabel()
    let subregion = UILabel()
    let timezones = UIButton()
    let translations = UIButton()
    let latitude = UILabel()
    let subrlongitudeegion = UILabel()
    let emoji = UILabel()
    let emojiU = UILabel()
    let states = UIButton()
   
    override init(frame: CGRect){
        super.init(frame: frame)
        
        name.text = ""
        addSubview(name)
        
        iso3.text = ""
        addSubview(iso3)
        
        iso2.text = ""
        addSubview(iso2)
        
        numeric_code.text = ""
        addSubview(numeric_code)
        
        phone_code.text = ""
        addSubview(phone_code)
        
        capital.text = ""
        addSubview(capital)
        
        currency.text = ""
        addSubview(currency)
        
        currency_name.text = ""
        addSubview(currency_name)
        
        tld.text = ""
        addSubview(tld)
        
        native.text = ""
        addSubview(native)
        
        region.text = ""
        addSubview(region)
        
        subregion.text = ""
        addSubview(subregion)
        
        timezones.setTitle("Timezones", for: .normal)
        timezones.tag = 100
//        timezones.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        timezones.setTitleColor(UIColor.blue, for: .normal)
        timezones.titleLabel?.textAlignment = .left
        addSubview(timezones)
        
        translations.setTitle("Translations", for: .normal)
        translations.tag = 101
        translations.setTitleColor(UIColor.blue, for: .normal)
        translations.titleLabel?.textAlignment = .left
//        translations.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        addSubview(translations)
        
        latitude.text = ""
        addSubview(latitude)
        
        subrlongitudeegion.text = ""
        addSubview(subrlongitudeegion)
        
        emoji.text = ""
        emoji.textAlignment = .center
        emoji.font = .systemFont(ofSize: 200)
        addSubview(emoji)
        
        emojiU.text = ""
        addSubview(emojiU)
        
        states.setTitle("States", for: .normal)
        states.tag = 102
        states.setTitleColor(UIColor.blue, for: .normal)
        states.titleLabel?.textAlignment = .left
//        states.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        addSubview(states)
        

        emoji.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(200)
        }

        name.snp.makeConstraints { make in
            make.top.equalTo(emoji.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }

        iso2.snp.makeConstraints { make in
            make.top.equalTo(name.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }

        iso3.snp.makeConstraints { make in
            make.top.equalTo(iso2.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }

        numeric_code.snp.makeConstraints { make in
            make.top.equalTo(iso3.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }

        phone_code.snp.makeConstraints { make in
            make.top.equalTo(numeric_code.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }

        capital.snp.makeConstraints { make in
            make.top.equalTo(phone_code.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }

        currency.snp.makeConstraints { make in
            make.top.equalTo(capital.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }

        currency_name.snp.makeConstraints { make in
            make.top.equalTo(currency.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }

        tld.snp.makeConstraints { make in
            make.top.equalTo(currency_name.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }

        native.snp.makeConstraints { make in
            make.top.equalTo(tld.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }

        region.snp.makeConstraints { make in
            make.top.equalTo(native.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }

        subregion.snp.makeConstraints { make in
            make.top.equalTo(region.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }

        timezones.snp.makeConstraints { make in
            make.top.equalTo(subregion.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.greaterThanOrEqualTo(timezones.snp.left).offset(30)
            make.height.equalTo(30)
        }

        translations.snp.makeConstraints { make in
            make.top.equalTo(timezones.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.greaterThanOrEqualTo(translations.snp.left).offset(30)
            make.height.equalTo(30)
        }

        latitude.snp.makeConstraints { make in
            make.top.equalTo(translations.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }

        subrlongitudeegion.snp.makeConstraints { make in
            make.top.equalTo(latitude.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }

        emojiU.snp.makeConstraints { make in
            make.top.equalTo(subrlongitudeegion.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }

        states.snp.makeConstraints { make in
            make.top.equalTo(emojiU.snp.bottom).offset(5)
            make.left.equalToSuperview().offset(10)
            make.right.greaterThanOrEqualTo(timezones.snp.left).offset(30)
            make.height.equalTo(30)
            make.bottom.equalTo(0)
        }



    }
    func dataInitName(_ name: String) {
        self.name.text = "Name of country: \(name)"
    }

    func dataInitIso2(_ iso2: String) {
        self.iso2.text = "ISO2: \(iso2)"
    }

    func dataInitIso3(_ iso3: String) {
        self.iso3.text = "ISO3: \(iso3)"
    }

    func dataInitNumericCode(_ numericCode: String) {
        self.numeric_code.text = "numeric_code: \(numericCode)"
    }

    func dataInitPhoneCode(_ phoneCode: String) {
        self.phone_code.text = "phone_code: \(phoneCode)"
    }

    func dataInitCapital(_ capital: String) {
        self.capital.text = "capital: \(capital)"
    }

    func dataInitCurrency(_ currency: String) {
        self.currency.text = "currency: \(currency)"
    }

    func dataInitCurrencyName(_ currencyName: String) {
        self.currency_name.text = "currency_name: \(currencyName)"
    }

    func dataInitNative(_ native: String) {
        self.native.text = "native: \(native)"
    }

    func dataInitRegion(_ region: String) {
        self.region.text = "region: \(region)"
    }

    func dataInitSubregion(_ subregion: String) {
        self.subregion.text = "subregion: \(subregion)"
    }

    func dataInitLatitude(_ latitude: String) {
        self.latitude.text = "latitude: \(latitude)"
    }

    func dataInitLongitude(_ longitude: String) {
        self.subrlongitudeegion.text = "subrlongitudeegion: \(longitude)"
    }

    func dataInitEmoji(_ emoji: String) {
        self.emoji.text = "\(emoji)"
    }

    func dataInitEmojiU(_ emojiU: String) {
        self.emojiU.text = "emojiU: \(emojiU)"
    }
    
    

    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


