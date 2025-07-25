import SwiftUI

struct Vaccine: Identifiable {
    let id = UUID()
    let name: String
    let date: Date
    let detalhes: String
}

struct AnimalProfileView: View {
    let petName = "Lili"
    let petTipo = "Cão"
    let petGenero = "Fêmea"
    let petRaca = "Pittbull"
    let petAnos = "5 anos"

    let vaccines = [
        Vaccine(name: "Antirrábica", date: Date(), detalhes: "Dose única"),
        Vaccine(name: "V9", date: Date(), detalhes: "1 Dose aplicada"),
        Vaccine(name: "V4", date: Date(), detalhes: "2 Doses aplicadas")
    ]

    var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                // BANNER COM COR DE FUNDO
                ZStack(alignment: .bottomLeading) {
                    Rectangle()
                        .fill(Color.orange)
                        .frame(height: 200)
                        .cornerRadius(12)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(petName)
                            .font(.system(size: 32, weight: .bold))
                            .foregroundColor(.white)

                        HStack(spacing: 16) {
                            InfoBadge(icon: "pawprint", text: petTipo)
                            InfoBadge(icon: "arrow.left.arrow.right", text: petGenero)
                            InfoBadge(icon: "heart", text: petAnos)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }

                // SEÇÃO SOBRE
                VStack(alignment: .leading, spacing: 10) {
                    Text("Sobre")
                        .font(.title2)
                        .bold()
                        .padding(.top, 20)
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 30)
                    InfoRow(label: "Idade", value: " anos")
                    InfoRow(label: "Tipo", value: petTipo)
                    InfoRow(label: "Gênero", value: petGenero)
                VStack(alignment: .leading) {
                    Text("Histórico de Vacinas")
                        .font(.title2)
                        .bold()
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)

                    ForEach(vaccines) { vaccine in
                        VaccineCard(vaccine: vaccine)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 5)
                    }
                }
            }
        }
    }
}

struct VaccineCard: View {
    let vaccine: Vaccine

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            VStack {
                ZStack {
                    Circle()
                        .fill(Color.blue.opacity(0.2))
                        .frame(width: 40, height: 40)
                    Image(systemName: "syringe.fill")
                        .foregroundColor(.blue)
                        .font(.system(size: 16))
                }
                Text(vaccine.date, format: .dateTime.day().month(.abbreviated))
                    .font(.caption2)
                    .foregroundColor(.gray)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(vaccine.name)
                    .font(.headline)
                Text(vaccine.detalhes)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(vaccine.date, style: .relative)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(12)
        .background(Color.white.opacity(0.8))
        .cornerRadius(12)
    }
}

struct infoRow: View {
    let icon: String
    let title: String
    let value: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundColor(.blue)
                .frame(width: 20)
            Text(title)
                .foregroundColor(.secondary)
                .frame(width: 100, alignment: .leading)
            Text(value)
                .bold()
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

struct InfoBadge: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: icon)
                .font(.system(size: 12))
            Text(text)
                .font(.system(size: 14, weight: .medium))
        }
        .foregroundColor(.white)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(Color.black.opacity(0.4))
        .cornerRadius(20)
    }
}

struct AnimalProfileView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalProfileView()
    }
}
