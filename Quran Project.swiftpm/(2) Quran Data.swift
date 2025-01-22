import SwiftUI

struct Surah: Codable, Identifiable {
    /// Surah (chapter) number
    let id: Int
    
    /// The Arabic name of the Surah
    let nameArabic: String
    
    /// The transliterated name of the Surah
    let nameTransliteration: String
    
    /// The English translated name of the Surah
    let nameEnglish: String
    
    /// The type of Surah (e.g., "Meccan" or "Medinan")
    let type: String
    
    /// The total number of Ayahs (verses) in the Surah
    let numberOfAyahs: Int
    
    /// An array of Ayah objects representing the verses of the Surah
    var ayahs: [Ayah]
    
    enum CodingKeys: String, CodingKey {
        case id
        case nameArabic = "name"
        case nameTransliteration = "transliteration"
        case nameEnglish = "translation"
        case type
        case numberOfAyahs = "total_verses"
        case ayahs = "verses"
    }
}

struct Ayah: Codable, Identifiable {
    /// Ayah (verse) number
    let id: Int
    
    /// The Arabic text of the Ayah
    let textArabic: String
    
    /// The English translation of the Ayah
    var textEnglish: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case textArabic = "text"
        case textEnglish = "translation"
    }
}

class QuranData: ObservableObject {
    @Published var quran: [Surah] = []
    
    init() {
        loadQuranData()
    }
    
    private func loadQuranData() {
        guard let quranEnUrl = Bundle.main.url(forResource: "quran_en", withExtension: "json") else {
            print("quran_en.json file not found.")
            return
        }
        
        do {
            let quranEnData = try Data(contentsOf: quranEnUrl)
            let decodedQuran = try JSONDecoder().decode([Surah].self, from: quranEnData)
            
            DispatchQueue.main.async {
                self.quran = decodedQuran
            }
        } catch {
            print("Error loading Quran data: \(error)")
        }
    }
}
