//
//  LanguagesButtonCell.swift
//  EZTranslate
//
//  Created by Sana Siddiqui on 2/27/24.
//

import UIKit


class LanguagesButtonCell: UICollectionViewCell {
    let languageButton: UIButton = {
        let languageButton = UIButton(type: .system)
        languageButton.titleLabel?.font = .preferredFont(forTextStyle: .title3)
        languageButton.titleLabel?.adjustsFontSizeToFitWidth = true
        languageButton.titleLabel?.font = .systemFont(ofSize: 15)
        languageButton.setTitleColor(.black, for: .normal)
        languageButton.layer.cornerRadius = 10
       
        return languageButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(languageButton)
        languageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            languageButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            languageButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 5),
            languageButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5),
            languageButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
