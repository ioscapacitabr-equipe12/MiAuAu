import SwiftUI

struct Vaccine: Identifiable {
    let id = UUID()
    let name: String
    let date: Date
    let detalhes: String
}
    struct VaccineScreen: View {
        var
        let petName: String = "Lili"
        let petInfo: String = "Fêmea - Raça: Pittbull - 5 anos"
        
        let vaccines = [
            Vaccine(name: "Antirrábica", date: Date(), detalhes: "30/05 - Dose única"),
            Vaccine(name: "V9", date: Date(), detalhes: "1 Dose aplicada"),
            
        ]
    }

}
