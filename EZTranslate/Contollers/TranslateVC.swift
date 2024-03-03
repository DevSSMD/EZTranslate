import UIKit
import InstantSearchVoiceOverlay
    

class TranslateViewController: UIViewController {
    let microphone = UIButton()
    let inputTextLabel = UILabel()
    let translatedTextLabel = UILabel()
    let titleLabel = UILabel()
    
    let voiceOverlay = VoiceOverlayController()
    var spokenText = ""
    let translationManager = TranslationManager()
    var selectedLanguage = ""


    override func viewDidLoad() {
        super.viewDidLoad()
    
        view.backgroundColor = .systemYellow
        configureUI()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureConstraints()
    }
    
    @objc func microphoneTapped(){
        voiceOverlay.start(on: self) { text, final, _ in
            self.spokenText = ""
            if final {
                self.spokenText = text
                self.inputTextLabel.text = self.spokenText
                self.translationManager.translateText(for: self.spokenText, to: self.selectedLanguage) { result in
                                        switch result {
                                            
                                        case .success(let translatedText):
                                            print("Translated text: \(translatedText)")

                                        case .failure(let error):
                                            print("Error on translateVC translating text: \(error)")
                                        }
                                    }
                
            } else {
                print("in progress \(text)")
            }
        } errorHandler: { error in
            if let error = error {
                print("Error with speech recognition \(error)")
            }
        }
    }
    
    func configureUI(){
        view.addSubview(titleLabel)
        view.addSubview(inputTextLabel)
        view.addSubview(microphone)
        view.addSubview(translatedTextLabel)
        
        titleLabel.text = "Translate"
        titleLabel.textColor = .label
        titleLabel.font = .preferredFont(forTextStyle: .headline)
        titleLabel.textAlignment = .center
        
        inputTextLabel.backgroundColor = .systemBackground
        inputTextLabel.numberOfLines = 0
        inputTextLabel.layer.cornerRadius = 30
        inputTextLabel.clipsToBounds = true
        inputTextLabel.textAlignment = .center
        inputTextLabel.textColor = .label
        
        microphone.backgroundColor = .clear
        microphone.setImage(UIImage(named: "mic3"), for: .normal)
        microphone.imageView?.contentMode = .scaleAspectFit
        microphone.addTarget(self, action: #selector(microphoneTapped), for: .touchUpInside)
        
        translatedTextLabel.backgroundColor = .systemBackground
        translatedTextLabel.numberOfLines = 0
        translatedTextLabel.layer.cornerRadius = 30
        translatedTextLabel.clipsToBounds = true
        translatedTextLabel.textAlignment = .center
        translatedTextLabel.textColor = .label
    }
    
    func configureConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        inputTextLabel.translatesAutoresizingMaskIntoConstraints = false
        microphone.translatesAutoresizingMaskIntoConstraints = false
        translatedTextLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonWidth: CGFloat = 120
        let buttonHeight: CGFloat = 120
        let buttonX = (view.bounds.width - buttonWidth) / 2
        let buttonY = (view.bounds.height - buttonHeight) / 2
        microphone.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            inputTextLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            inputTextLabel.heightAnchor.constraint(equalToConstant: 100),
            inputTextLabel.widthAnchor.constraint(equalToConstant: 100),
            inputTextLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            inputTextLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
        
            translatedTextLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            translatedTextLabel.heightAnchor.constraint(equalToConstant: 100),
            translatedTextLabel.widthAnchor.constraint(equalToConstant: 100),
            translatedTextLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            translatedTextLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30)
        
        
        ])
    }
}

//MARK: - Translation Delegate Methods
extension TranslateViewController: LanguageDelegate {
    func didSelectLanguage(_ languageCode: String?) {
        if let languageCode = languageCode {
            selectedLanguage = languageCode
            print(selectedLanguage)
        } else {
            print("failed")
        }
    }
}
