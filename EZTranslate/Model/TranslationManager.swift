

import Foundation


struct TranslationManager {
    let baseURL = "https://translation.googleapis.com/language/translate/v2"
    let apiKey = "AIzaSyCSBNjPbN-JVoy3iCoexJZ_x3C40gq7tXo"
    
    
    public func translateText(for text: String, to targetLanguage: String, completion: @escaping (Result<String, Error>) -> Void) {
        let urlString = "\(baseURL)?key=\(apiKey)"
          guard let url = URL(string: urlString) else {
              completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
             
              return
          }

          var request = URLRequest(url: url)
          request.httpMethod = "POST"
          request.setValue("application/json", forHTTPHeaderField: "Content-Type")

          let parameters: [String: Any] = [
              "q": text,
              "target": targetLanguage
          ]

          do {
              request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
          } catch {
              completion(.failure(error))
              return
          }

          let task = URLSession.shared.dataTask(with: request) { data, response, error in
              if let error = error {
                  completion(.failure(error))
                  return
              }

              guard let data = data else {
                  completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                  return
              }

              do {
                  guard let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                      completion(.failure(NSError(domain: "Error parsing response", code: 0, userInfo: nil)))
                      return
                  }
                  
                  print(jsonResponse)

                  let model = try JSONDecoder().decode(APIResponse.self, from: data)
                  completion(.success(model.translations?.first?.translatedText ?? "no response"))
                  
              } catch {
                  completion(.failure(error))
                  print(error)
              }
          }
        
          task.resume()
      }
}
