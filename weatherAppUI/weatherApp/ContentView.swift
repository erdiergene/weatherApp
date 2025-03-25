//
//  ContentView.swift
//  weatherApp
//
//  Created by Erdi Ergene on 25.03.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0 // 0: Hava durumu, 1: Arama sayfası
    @State private var selectedForecastTab = 0 // 0: Saatlik, 1: Haftalık
    
    var body: some View {
        ZStack {
            // Ana içerik
            TabView(selection: $selectedTab) {
                // Ana hava durumu sayfası
                HomeView(selectedForecastTab: $selectedForecastTab)
                    .tag(0)
                
                // Arama/şehir listesi sayfası
                SearchView()
                    .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()
            
            // Tab çubuğu (navigationBar alternatifi)
            VStack {
                Spacer()
                
                ZStack {
                    // Arka plan
                    RoundedRectangle(cornerRadius: 30)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(hex: "3A3A6A"),
                                    Color(hex: "25244C")
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(height: 70)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color(hex: "7582F4").opacity(0.5), lineWidth: 0.5)
                        )
                    
                    // Tab düğmeleri
                    HStack {
                        // House ikonu (Ana sayfa)
                        Button(action: {
                            withAnimation {
                                selectedTab = 0
                            }
                        }) {
                            ZStack {
                                Color.clear
                                    .frame(width: 30, height: 30)
                                
                                Image("house")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                                    .brightness(1.0)
                                    .contrast(1.5)
                                    .colorMultiply(selectedTab == 0 ? .white : .white.opacity(0.6))
                            }
                        }
                        
                        Spacer()
                        
                        // Arama ikonu (Arama sayfası)
                        Button(action: {
                            withAnimation {
                                selectedTab = 1
                            }
                        }) {
                            Text("􀣩")
                                .font(.system(size: 22))
                                .foregroundColor(selectedTab == 1 ? .white : .white.opacity(0.6))
                        }
                    }
                    .padding(.horizontal, 50)
                    
                    // Ekle düğmesi
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [
                                        Color(hex: "F5F5F9"),
                                        Color(hex: "DADFE7")
                                    ]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                )
                            )
                            .frame(width: 50, height: 50)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 4)
                        
                        Text("􀅼")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color(hex: "48319D"))
                    }
                    .offset(y: -22)
                }
                .padding(.bottom, 5)
            }
            .ignoresSafeArea(edges: .bottom)
        }
        .ignoresSafeArea()
    }
}

// MARK: - Ana sayfa (Home View)
struct HomeView: View {
    @Binding var selectedForecastTab: Int
    
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
            
            // Arka plan görseli
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .opacity(0.15)
                .ignoresSafeArea()
                
            // Mor parıltı efektleri (Figma'daki gibi)
            Circle()
                .fill(Color(hex: "612FAB").opacity(0.5))
                .frame(width: 200, height: 200)
                .blur(radius: 90)
                .offset(x: -100, y: 80)
                
            Circle()
                .fill(Color(hex: "C427FB").opacity(0.3))
                .frame(width: 120, height: 120)
                .blur(radius: 40)
                .offset(x: 100, y: 170)
                
            VStack(spacing: 0) {
                // Üst bilgi ve ana hava durumu
                VStack(spacing: 0) {
                    Text("Montreal")
                        .font(.system(size: 34))
                        .fontWeight(.regular)
                        .foregroundColor(.white)
                        .padding(.bottom, 5)
                    
                    Text("19°")
                        .font(.system(size: 96, weight: .thin))
                        .foregroundColor(.white)
                        .padding(.bottom, -10)
                    
                    Text("Mostly Clear\nH:24°   L:18°")
                        .font(.system(size: 20, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                }
                .padding(.top, 50)
                .padding(.bottom, 30)
                
                // Yarı saydam modal görünüm
                VStack(spacing: 15) {
                    // Segment kontrol
                    HStack {
                        Button(action: {
                            withAnimation {
                                selectedForecastTab = 0
                            }
                        }) {
                            Text("Hourly Forecast")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(selectedForecastTab == 0 ? .white : .white.opacity(0.6))
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation {
                                selectedForecastTab = 1
                            }
                        }) {
                            Text("Weekly Forecast")
                                .font(.system(size: 15, weight: .semibold))
                                .foregroundColor(selectedForecastTab == 1 ? .white : .white.opacity(0.6))
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 10)
                    
                    // Çizgi
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.white.opacity(0.3))
                    
                    // Gösterge
                    ZStack(alignment: selectedForecastTab == 0 ? .leading : .trailing) {
                        Rectangle()
                            .frame(height: 3)
                            .foregroundColor(.clear)
                        
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width / 2, height: 3)
                            .foregroundColor(.white)
                    }
                    .animation(.spring, value: selectedForecastTab)
                    
                    // Tab içeriği
                    TabView(selection: $selectedForecastTab) {
                        // Saatlik tahmin
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(hourlyData) { hour in
                                    HourlyForecastView(data: hour, isNow: hour.hour == "Now")
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                        }
                        .tag(0)
                        
                        // Haftalık tahmin
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(weeklyData) { day in
                                    WeeklyForecastView(data: day)
                                }
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 5)
                        }
                        .tag(1)
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: 350)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 44)
                            .fill(Color(hex: "2E335A").opacity(0.7))
                            .blur(radius: 0.5)
                            
                        // Çok hafif oval parıltılar
                        Circle()
                            .fill(Color(hex: "E0D9FF").opacity(0.05))
                            .frame(width: 80, height: 80)
                            .blur(radius: 10)
                            .offset(x: 120, y: -40)
                        
                        Circle()
                            .fill(Color(hex: "612FAB").opacity(0.05))
                            .frame(width: 60, height: 60)
                            .blur(radius: 8)
                            .offset(x: -110, y: 60)
                    }
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 44)
                        .stroke(Color.white.opacity(0.2), lineWidth: 1)
                )
            }
        }
    }
    
    // MARK: - Veri
    var hourlyData: [HourlyData] {
        [
            HourlyData(hour: "Now", temperature: 19, image: "moon_cloud_rain", rainChance: nil),
            HourlyData(hour: "12 AM", temperature: 19, image: "moon_cloud_rain", rainChance: 30),
            HourlyData(hour: "1 AM", temperature: 19, image: "moon_cloud_rain", rainChance: nil),
            HourlyData(hour: "2 AM", temperature: 18, image: "moon_cloud_wind", rainChance: nil),
            HourlyData(hour: "3 AM", temperature: 19, image: "moon_cloud_rain", rainChance: nil),
            HourlyData(hour: "4 AM", temperature: 19, image: "moon_cloud_rain", rainChance: nil),
            HourlyData(hour: "5 AM", temperature: 19, image: "moon_cloud_rain", rainChance: nil),
            HourlyData(hour: "6 AM", temperature: 19, image: "moon_cloud_rain", rainChance: nil)
        ]
    }
    
    var weeklyData: [WeeklyData] {
        [
            WeeklyData(day: "MON", temperature: 20, image: "sun_cloud_rain", rainChance: 30, isToday: false),
            WeeklyData(day: "TUE", temperature: 21, image: "sun_cloud_rain", rainChance: nil, isToday: true),
            WeeklyData(day: "WED", temperature: 18, image: "sun_cloud_angled_rain", rainChance: 100, isToday: false),
            WeeklyData(day: "THU", temperature: 20, image: "sun_cloud_angled_rain", rainChance: 50, isToday: false),
            WeeklyData(day: "FRI", temperature: 22, image: "sun_cloud_rain", rainChance: nil, isToday: false),
            WeeklyData(day: "SAT", temperature: 24, image: "sun_cloud_angled_rain", rainChance: nil, isToday: false),
            WeeklyData(day: "SUN", temperature: 23, image: "sun_cloud_rain", rainChance: nil, isToday: false)
        ]
    }
}

// MARK: - HourlyForecastView
struct HourlyForecastView: View {
    let data: HourlyData
    let isNow: Bool
    
    var body: some View {
        VStack(spacing: 12) {
            Text(data.hour)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)
            
            VStack(spacing: 4) {
                if let rainChance = data.rainChance {
                    Text("\(rainChance)%")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(Color(hex: "40CBD8"))
                }
                
                if let image = data.image {
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 28, height: 28)
                }
            }
            
            Text("\(data.temperature)°")
                .font(.system(size: 20))
                .foregroundColor(.white)
        }
        .frame(width: 60)
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(isNow ? Color(hex: "48319D") : Color(hex: "48319D").opacity(0.2))
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(
                            isNow ? Color.white.opacity(0.5) : Color.white.opacity(0.2),
                            lineWidth: 1
                        )
                )
        )
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 3, y: 3)
    }
}

// MARK: - WeeklyForecastView
struct WeeklyForecastView: View {
    let data: WeeklyData
    
    var body: some View {
        VStack(spacing: 12) {
            Text(data.day)
                .font(.system(size: 15, weight: .semibold))
                .foregroundColor(.white)
            
            VStack(spacing: 4) {
                if let rainChance = data.rainChance {
                    Text("\(rainChance)%")
                        .font(.system(size: 13, weight: .semibold))
                        .foregroundColor(Color(hex: "40CBD8"))
                }
                
                if let image = data.image {
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 28, height: 28)
                }
            }
            
            Text("\(data.temperature)°")
                .font(.system(size: 20))
                .foregroundColor(.white)
        }
        .frame(width: 60)
        .padding(.vertical, 12)
        .padding(.horizontal, 8)
        .background(
            RoundedRectangle(cornerRadius: 30)
                .fill(data.isToday ? Color(hex: "48319D") : Color(hex: "48319D").opacity(0.2))
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .stroke(
                            data.isToday ? Color.white.opacity(0.5) : Color.white.opacity(0.2),
                            lineWidth: 1
                        )
                )
        )
        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 3, y: 3)
    }
}

// MARK: - Veri Modelleri
struct HourlyData: Identifiable {
    let id = UUID()
    let hour: String
    let temperature: Int
    let image: String?
    let rainChance: Int?
}

struct WeeklyData: Identifiable {
    let id = UUID()
    let day: String
    let temperature: Int
    let image: String?
    let rainChance: Int?
    let isToday: Bool
}

// MARK: - Renk Yardımcısı
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}