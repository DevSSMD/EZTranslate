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
        languageButton.titleLabel?.font = .boldSystemFont(ofSize: 15)
        languageButton.setTitleColor(.black, for: .normal)
        languageButton.backgroundColor = .gray
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
//            languageButton.heightAnchor.constraint(equalToConstant: 60),
//            languageButton.widthAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
