import UIKit
import InstantSearchVoiceOverlay
    

class TranslateViewController: UIViewController {
    let microphone = UIButton()
    let inputTextLabel = UILabel()
    let voiceOverlay = VoiceOverlayController()
    var spokenText = ""
    let translationManager = TranslationManager()

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
                self.translationManager.translateText(for: self.spokenText, from: "en", to: "es") { result in
                                        switch result {
                                        case .success(let translatedText):
                                            print("Translated text: \(translatedText)")
                                            // Do something with the translated text
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
        view.addSubview(inputTextLabel)
        view.addSubview(microphone)
        
        inputTextLabel.backgroundColor = .systemBackground
        inputTextLabel.numberOfLines = 0
        inputTextLabel.layer.cornerRadius = 30
        inputTextLabel.clipsToBounds = true
        inputTextLabel.textAlignment = .center
        inputTextLabel.textColor = .label

        
        microphone.setTitle("Translate", for: .normal)
        microphone.setTitleColor(.black, for: .normal)
        microphone.backgroundColor = .cyan
        microphone.addTarget(self, action: #selector(microphoneTapped), for: .touchUpInside)
    }
    
    func configureConstraints(){
        inputTextLabel.translatesAutoresizingMaskIntoConstraints = false
        microphone.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonWidth: CGFloat = 120
        let buttonHeight: CGFloat = 80
        let buttonX = (view.bounds.width - buttonWidth) / 2
        let buttonY = (view.bounds.height - buttonHeight) / 2

        microphone.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)

        NSLayoutConstraint.activate([
            inputTextLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            inputTextLabel.heightAnchor.constraint(equalToConstant: 200),
            inputTextLabel.widthAnchor.constraint(equalToConstant: 100),
            inputTextLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            inputTextLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30)
        ])
    }
}

