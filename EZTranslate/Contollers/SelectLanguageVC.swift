

import UIKit

class SelectLanguageVC: UIViewController {

    let layout = UICollectionViewFlowLayout()
    var collectionView: UICollectionView!
    let titleLabel = UILabel()
    let languages = [
        "English": "en",
        "Spanish": "es",
        "French": "fr",
        "German": "de",
        "Italian": "it",
        "Portuguese": "pt",
        "Dutch": "n1",
        "Russian": "ru",
        "Japanese": "ja",
        "Korean": "ko",
        "Hindi": "hi",
        "Bengali": "bn",
        "Urdu": "ur",
        "Turkish": "tr",
        "Greek": "el",
        "Thai": "th",
        "Vietnamese": "vi"
    ]
    
    
    let colorsArray: [UIColor] = [.red, .cyan, .yellow, .purple,]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        titleLabel.text = "Select Language"
        titleLabel.textColor = .black 
        titleLabel.font = .preferredFont(forTextStyle: .headline)
        titleLabel.textAlignment = .center
        
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 1 // Adjust the spacing between buttons horizontally
        layout.minimumLineSpacing = 20 // Adjust the spacing between rows vertically
        layout.itemSize = CGSize(width: 100, height: 80) // Adjust the width of each button
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        
        collectionView.register(LanguagesButtonCell.self, forCellWithReuseIdentifier: "LanguagesButtonCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        view.addSubview(titleLabel)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
        
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
           
        
        ])
    }
}

//MARK: - Collection View Methods
extension SelectLanguageVC: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return languages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LanguagesButtonCell", for: indexPath) as? LanguagesButtonCell
        else {
            fatalError("unable to dequeue cell")
        }
        
        let language = Array(languages.keys)[indexPath.item]
        cell.languageButton.setTitle(language, for: .normal)
        cell.languageButton.addTarget(self, action: #selector(languagePicked), for: .touchUpInside)
        cell.languageButton.backgroundColor = colorsArray[indexPath.item % colorsArray.count]
        
        return cell
    }
    

    
    @objc func languagePicked(_ sender: UIButton){
        guard let selectedLanguage = sender.currentTitle, let languageCode = languages[selectedLanguage] else {return}
        
        
    }

}
