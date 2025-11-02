import SwiftUI

@main
struct QuranApp: App {
    @StateObject private var quranData = QuranData()
    
    func registerCustomFonts() {
        if let uthmaniFontURL = Bundle.main.url(forResource: "Uthmani", withExtension: "otf") {
            CTFontManagerRegisterFontsForURL(uthmaniFontURL as CFURL, CTFontManagerScope.process, nil)
        }
    }
    
    init() {
        registerCustomFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            SurahsView()
                .environmentObject(quranData)
        }
    }
}
