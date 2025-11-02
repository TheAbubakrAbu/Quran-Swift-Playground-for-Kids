import SwiftUI

struct SurahsView: View {
    @EnvironmentObject var quranData: QuranData
    
    var body: some View {
        NavigationView {
            List {
                ForEach(quranData.quran) { surah in
                    NavigationLink(destination: AyahsView(surah: surah)) {
                        SurahRow(surah: surah)
                    }
                }
            }
            // You can edit this if you would like.
            // Try changing "Quran" to something else, like "Surahs" or "Al-Quran"!
            .navigationTitle("Quran")
        }
    }
}

struct SurahRow: View {
    var surah: Surah
    
    var body: some View {
        // This is what each Surah is going to look like in the main screen.
        // Use surah attributes like surah.nameEnglish, surah.nameArabic, etc.
        // For example, you can write:
        // Text(surah.nameEnglish) to show the English name of the Surah.
        // You can also try adding more, like the number of Ayahs:
        // Text("Ayahs: \(surah.numberOfAyahs)")
        
        VStack {
            HStack {
                Text("Ayahs: \(surah.numberOfAyahs)")
                    .foregroundColor(.secondary)
                
                Spacer()
                
                Text(
                    "\(surah.nameArabic) - \(surah.id)"
                )
                .foregroundColor(.accentColor)
            }
            
            HStack {
                Text(surah.nameEnglish)
                
                Spacer()
                
                Text(
                    "\(surah.nameTransliteration) - \(surah.id)"
                )
            }
        }
    }
}
