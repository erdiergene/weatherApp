//
//  SearchView.swift
//  weatherApp
//
//  Created by Erdi Ergene on 25.03.2025.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    
    var body: some View {
        ZStack {
            // Arkaplan
            LinearGradient(
                gradient: Gradient(colors: [
                    Color(hex: "2E335A"),
                    Color(hex: "1C1B33")
                ]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            // Mor parıltı efektleri
            Circle()
                .fill(Color(hex: "612FAB").opacity(0.5))
                .frame(width: 250, height: 250)
                .blur(radius: 195)
                .offset(x: -100, y: -180)
                
            Circle()
                .fill(Color(hex: "612FAB").opacity(0.5))
                .frame(width: 250, height: 250)
                .blur(radius: 200)
                .offset(x: 150, y: 200)
            
            VStack(spacing: 0) {
                // Üst gezinme çubuğu
                HStack {
                    HStack(spacing: 5) {
                        Text("􀆉")
                            .font(.system(size: 23))
                            .foregroundColor(.white.opacity(0.6))
                            
                        Text("Weather")
                            .font(.system(size: 28))
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Text("􀍡")
                        .font(.system(size: 28))
                        .foregroundColor(.white.opacity(0.6))
                }
                .padding(.horizontal, 16)
                .padding(.top, 50)
                .padding(.bottom, 8)
                
                // Arama alanı
                HStack {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 17))
                        .foregroundColor(.white.opacity(0.6))
                    
                    TextField("Search for a city or airport", text: $searchText)
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                        .accentColor(.white)
                }
                .padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(hex: "2E335A"))
                        .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 4)
                )
                .padding(.horizontal, 16)
                .padding(.bottom, 20)
                
                // Şehir kartları
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 20) {
                        ForEach(cityData) { city in
                            CityWeatherCard(cityData: city)
                        }
                        
                        // Boş yer tutucu
                        ZStack {
                            RoundedRectangle(cornerRadius: 24)
                                .fill(
                                    LinearGradient(
                                        gradient: Gradient(colors: [
                                            Color(hex: "5936B4"),
                                            Color(hex: "362A84")
                                        ]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .frame(height: 164)
                                .opacity(0.3)
                            
                            VStack {
                                Text("+")
                                    .font(.system(size: 40, weight: .light))
                                    .foregroundColor(.white.opacity(0.7))
                                
                                Text("Add new location")
                                    .font(.system(size: 18))
                                    .foregroundColor(.white.opacity(0.7))
                            }
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 100) // Tab bar için alan
                }
            }
        }
    }
}

// MARK: - CityWeatherCard
struct CityWeatherCard: View {
    let cityData: CityData
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Arka plan
            RoundedRectangle(cornerRadius: 24)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(hex: "5936B4"),
                            Color(hex: "362A84")
                        ]),
                        startPoint: .leading,
                        endPoint: .trailing
                    )
                )
                .frame(height: 164)
            
            HStack {
                // Sol taraf: Şehir ve sıcaklık bilgileri
                VStack(alignment: .leading, spacing: 5) {
                    Text(cityData.temperature)
                        .font(.system(size: 64))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                    
                    Text(cityData.weatherType)
                        .font(.system(size: 13))
                        .foregroundColor(.white)
                        .padding(.bottom, 10)
                    
                    Text("H:\(cityData.highTemp)  L:\(cityData.lowTemp)")
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.6))
                    
                    Text(cityData.location)
                        .font(.system(size: 13))
                        .foregroundColor(.white.opacity(0.6))
                }
                .padding(.leading, 20)
                .padding(.vertical, 15)
                
                Spacer()
                
                // Sağ taraf: Hava durumu simgesi
                Image(cityData.weatherIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding(.trailing, 10)
            }
        }
    }
}

// MARK: - Veri Modeli
struct CityData: Identifiable {
    let id = UUID()
    let location: String
    let temperature: String
    let weatherType: String
    let highTemp: String
    let lowTemp: String
    let weatherIcon: String
}

// MARK: - Örnek Veri
extension SearchView {
    var cityData: [CityData] {
        [
            CityData(
                location: "Montreal, Canada",
                temperature: "19°",
                weatherType: "Mid Rain",
                highTemp: "24°",
                lowTemp: "18°",
                weatherIcon: "moon_cloud_rain"
            ),
            CityData(
                location: "Toronto, Canada",
                temperature: "20°",
                weatherType: "Fast Wind",
                highTemp: "21°",
                lowTemp: "19°",
                weatherIcon: "moon_cloud_wind"
            ),
            CityData(
                location: "Tokyo, Japon",
                temperature: "13°",
                weatherType: "Showers",
                highTemp: "16°",
                lowTemp: "8°",
                weatherIcon: "sun_cloud_angled_rain"
            ),
            CityData(
                location: "Tennessee, United States",
                temperature: "23°",
                weatherType: "Tornado",
                highTemp: "26°",
                lowTemp: "16°",
                weatherIcon: "tornado"
            ),
            CityData(
                location: "Singapore, Singapore",
                temperature: "31°",
                weatherType: "Partly Cloudy",
                highTemp: "36°",
                lowTemp: "26°",
                weatherIcon: "sun_cloud_rain"
            ),
            CityData(
                location: "Taipei, Taiwan",
                temperature: "23°",
                weatherType: "Tornado",
                highTemp: "26°",
                lowTemp: "16°",
                weatherIcon: "moon_cloud_rain"
            )
        ]
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}