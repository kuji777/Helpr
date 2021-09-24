//languageDetails
//last modified 22h43 mercredi

import SwiftUI

struct Language: View {
    var body: some View {
        HStack {
            Spacer(minLength: 35)
            VStack {
                Text("Langues parlées")
                    .font(.largeTitle)
                HStack(alignment: .bottom) {
                    FlagIcon(flag: "🇺🇸")
                    HStack {
                        languageSkill(skillIcon: "speakingIcon")
                        Spacer(minLength: 5)
                        languageSkill(skillIcon: "readingIcon")
                        Spacer(minLength: 5)
                        languageSkill(skillIcon: "writingIcon")
                    }
                }
                
                HStack(alignment: .bottom) {
                    FlagIcon(flag: "🇫🇷")
                    HStack {
                        languageSkill(skillIcon: "speakingIcon")
                        Spacer(minLength: 5)
                        languageSkill(skillIcon: "readingIcon")
                        Spacer(minLength: 5)
                        languageSkill(skillIcon: "")
                    }
                }
                
                HStack(alignment: .bottom) {
                    FlagIcon(flag: "🇨🇳")
                    HStack {
                        languageSkill(skillIcon: "speakingIcon")
                        Spacer(minLength: 5)
                        languageSkill(skillIcon: "")
                        Spacer(minLength: 5)
                        languageSkill(skillIcon: "")
                    }
                }
                
                HStack(alignment: .bottom) {
                    FlagIcon(flag: "🇷🇺")
                    HStack {
                        languageSkill(skillIcon: "")
                        Spacer(minLength: 5)
                        languageSkill(skillIcon: "readingIcon")
                        Spacer(minLength: 5)
                        languageSkill(skillIcon: "")
                    }
                }

            }
            Spacer(minLength: 35)
        }
    }
}

struct Language_Previews: PreviewProvider {
    static var previews: some View {
        Language()
    }
}

struct FlagIcon: View {
    var flag: String
    
    var body: some View {
        Text(flag).font(.system(size: 100))
    }
}

//
struct languageSkill: View {
    var skillIcon: String
    var body: some View {
        Image(skillIcon).resizable().scaledToFit()
            .frame(width: 55, height: 55)
    }
}
