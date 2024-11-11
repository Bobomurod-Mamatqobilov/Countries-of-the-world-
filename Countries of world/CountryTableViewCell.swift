//
//  CountryTableViewCell.swift
//  Countries of world
//
//  Created by Mamatqobilov Bobomurod on 28/07/24.
//

import UIKit

class CountryTableViewCell: UITableViewCell{
    
    
    let countryView = CountryInfo()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.addSubview(countryView)
        
        countryView.snp.makeConstraints {make in
            make.bottom.equalTo(0)
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
