import UIKit
import InstantSearchVoiceOverlay
    

class TranslateViewController: UIViewController {
    let microphone =  UIButton()
    let voiceOverlay = VoiceOverlayController()
    var spokenText = ""
    let translationManager = TranslationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        
        microphone.setTitle("Translate", for: .normal)
        microphone.setTitleColor(.black, for: .normal)
        microphone.backgroundColor = .cyan
        microphone.addTarget(self, action: #selector(microphoneTapped), for: .touchUpInside)
        
        view.addSubview(microphone)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        microphone.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonWidth: CGFloat = 120
        let buttonHeight: CGFloat = 80
        let buttonX = (view.bounds.width - buttonWidth) / 2
        let buttonY = (view.bounds.height - buttonHeight) / 2

        microphone.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight)

    }
    
    @objc func microphoneTapped(){
        voiceOverlay.start(on: self) { text, final, _ in
            if final {
                self.spokenText = text
                print(self.spokenText)
                self.translationManager.translateText(for: self.spokenText, targetLanguage: "en") { result in
                                    switch result {
                                    case .success(let translatedText):
                                        print("Translated text: \(translatedText)")
                                        // Do something with the translated text
                                    case .failure(let error):
                                        print("Error translating text: \(error)")
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

}

