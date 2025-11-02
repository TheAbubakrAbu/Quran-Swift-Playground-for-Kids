import SwiftUI

struct AyahsView: View {
    @EnvironmentObject var quranData: QuranData
    
    let surah: Surah
    
    var body: some View {
        List {
            if surah.id == 1 || surah.id == 9 {
                HStack {
                    Spacer()
                    
                    Text("أَعُوذُ بِٱللَّهِ مِنَ ٱلشَّيْطَانِ ٱلرَّجِيمِ")
                        .font(.custom("KFGQPCUthmanicScriptHAFS", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize))
                        .padding(.vertical)
                    
                    Spacer()
                }
                .multilineTextAlignment(.center)
            } else {
                HStack {
                    Spacer()
                    
                    Text("بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ")
                        .font(.custom("KFGQPCUthmanicScriptHAFS", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize))
                        .padding(.vertical)
                    
                    Spacer()
                }
                .multilineTextAlignment(.center)
            }
            
            ForEach(surah.ayahs) { ayah in
                AyahRow(surah: surah, ayah: ayah)
            }
        }
        // You can edit this too.
        // Try changing it where you can see the Surah's Arabic name or English translation!
        .navigationTitle("\(surah.id) - \(surah.nameTransliteration)")
    }
}

struct AyahRow: View {
    @EnvironmentObject var quranData: QuranData
    
    var surah: Surah
    var ayah: Ayah
    
    var body: some View {
        // This is what each Ayah will look like.
        // Use ayah.id to show the verse number
        // Copy and paste Text(ayah.textEnglish) to show the English translation.
        /* Use:
         .font(.custom("KFGQPCUthmanicScriptHAFS", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)) or something similar for Arabic
         // You can also use .foregroundColor to change the color of the text, like .foregroundColor(.blue).
         */
        
        VStack(spacing: 20) {
            Text(String(ayah.id))
                .foregroundColor(.accentColor)
            
            Text(ayah.textArabic)
                .font(.custom("KFGQPCUthmanicScriptHAFS", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize))
                .frame(maxWidth: .infinity, alignment: .trailing)
                .multilineTextAlignment(.trailing)
            
            Text(ayah.textEnglish)
        }
        .padding(.vertical)
        .fixedSize(horizontal: false, vertical: true)
    }
}
