//
//  TranslationModel.swift
//  EZTranslate
//
//  Created by Sana Siddiqui on 2/28/24.
//

import Foundation

struct Data: Codable {
    var translations: [Translations]?
}

struct Translations: Codable {
    var translatedText: String?
}
