//
//  FactsCell.swift
//  CatsFactsSacdeli
//
//  Created by Tamuna Kakhidze on 01.05.24.
//

import Foundation
import UIKit

class FactsCell: UITableViewCell {
    

    
    var factLabel = UILabel()
    var titleLabel = UILabel()
    var flagImageView = UIImageView()
    var nextButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        factLabel = configureFactLabel()
        contentView.layer.cornerRadius = 15
        contentView.backgroundColor = UIColor(named: "Color1")
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = UIColor(named: "Color2")?.cgColor
        sendSubviewToBack(contentView)
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureFactLabel() -> UILabel {
        let factLabel = UILabel()
        
        addSubview(factLabel)
        
        factLabel.textAlignment = .center
        factLabel.translatesAutoresizingMaskIntoConstraints = false
        factLabel.textColor = .black
        factLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        factLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        factLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 390).isActive = true
        factLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        factLabel.numberOfLines = 0
        
        return factLabel
    }
    

    
    func configureCell(fact: String) {
        factLabel.text = fact
    }
}
