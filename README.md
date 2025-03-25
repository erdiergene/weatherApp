# Weather App (Hava Durumu Uygulaması)

Modern ve kullanıcı dostu bir hava durumu uygulaması. SwiftUI ile geliştirilmiş bu uygulama, şık bir arayüz ve pratik kullanım özellikleri sunmaktadır.

## Özellikler

- **Akıcı Kullanıcı Arayüzü**: Modern ve sezgisel bir arayüz ile kolay kullanım
- **Detaylı Hava Durumu Bilgisi**: Sıcaklık, yağış olasılığı, rüzgar durumu gibi ayrıntılı bilgiler
- **Çoklu Tahmin Görünümü**: Saatlik ve haftalık hava durumu tahminleri arasında kolay geçiş
- **Şehir Yönetimi**: Şehir arama, ekleme ve yönetme özellikleri
- **Görsel Hava Durumu İkonları**: Her hava durumu için özel tasarlanmış görsel ikonlar

## Ekran Görüntüleri

- Ana Hava Durumu Ekranı
- Şehir Arama ve Yönetim Ekranı

## Proje Yapısı

```
weatherApp/
├── ContentView.swift        # Ana arayüz bileşenleri
├── SearchView.swift         # Şehir arama ve listeleme arayüzü
├── Assets.xcassets/         # Görsel ve renkler
│   ├── house.imageset/      # Ev ikonu
│   ├── background.imageset/ # Arka plan
│   ├── moon_cloud_rain.imageset/  # Hava durumu ikonu
│   └── ...                  # Diğer görsel varlıklar
└── weatherAppUI/            # Uygulama arayüz bileşenleri
    ├── AppDelegate.swift    # Uygulama yaşam döngüsü
    ├── SceneDelegate.swift  # Sahne yönetimi
    └── Info.plist           # Uygulama yapılandırması
```

## Kullanılan Teknolojiler

- **SwiftUI**: Modern bildirim temelli UI çerçevesi
- **Swift 5.9**: Son Swift versiyonu
- **Xcode 15+**: Geliştirme ortamı

## Kurulum ve Çalıştırma

1. Projeyi klonlayın:
   ```bash
   git clone https://github.com/erdiergene/weatherApp.git
   ```

2. Xcode'da `weatherApp.xcodeproj` dosyasını açın.

3. Projeyi bir iOS simulatör veya gerçek cihaz üzerinde çalıştırın.

## Geliştirme

Bu uygulama SwiftUI kullanılarak iOS 15+ için geliştirilmiştir. Figma tasarımı temel alınarak oluşturulmuştur.

## İletişim

Sorular ve öneriler için: [erdiergene@gmail.com](mailto:erdiergene@gmail.com)