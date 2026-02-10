// swift-tools-version:5.6
import PackageDescription

let package = Package(
  name: "AdapterSPMTest",
  platforms: [
    .iOS(.v13)
  ],
  products: [
    .library(
      name: "AdWhaleMediationAll",
      targets: ["AdWhaleMediationAll"]
    ),
  ],
  dependencies: [
    .package(
      url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
      exact: "12.12.0"
    ),
    .package(
      url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git",
      exact: "13.5.0"
    ),
    .package(
      url: "https://github.com/Vungle/VungleAdsSDK-SwiftPackageManager.git",
      exact: "7.6.1"
    ),

    // ✅ googleads 공식 SPM 레포(자동 포함)
    .package(
      url: "https://github.com/googleads/googleads-mobile-ios-mediation-mintegral.git",
      exact: "7.7.9-release.1"
    ),
    .package(
      url: "https://github.com/googleads/googleads-mobile-ios-mediation-unity.git",
      exact: "4.16.300"
    ),
    .package(
      url: "https://github.com/googleads/googleads-mobile-ios-mediation-moloco.git",
      exact: "4.1.0-release.0"
    ),
  ],
  targets: [
    // ============================================================
    // Umbrella (All-in-One) — ✅ Pangle 제외
    // ============================================================
    .target(
      name: "AdWhaleMediationAll",
      dependencies: [
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),

        "DTExchangeAdapterTarget",
        "InMobiAdapterTarget",
        "AppLovinAdapterTarget",
        "IronSourceAdapterTarget",
        "LiftoffMonetizeAdapterTarget",

        .product(name: "MintegralAdapter", package: "googleads-mobile-ios-mediation-mintegral"),
        .product(name: "UnityAdapter", package: "googleads-mobile-ios-mediation-unity"),
        .product(name: "MolocoAdapter", package: "googleads-mobile-ios-mediation-moloco"),
      ],
      path: "Sources/AdWhaleMediationAll"
    ),

    // ============================================================
    // DT Exchange (8.4.1.0)
    // ============================================================
    .target(
      name: "DTExchangeAdapterTarget",
      dependencies: [
        .target(name: "DTExchangeAdapter"),
        .target(name: "DTExchangeSDK"),
      ],
      path: "Sources/DTExchangeAdapterTarget"
    ),
    .binaryTarget(
      name: "DTExchangeAdapter",
      url: "https://dl.google.com/googleadmobadssdk/mediation/ios/dtexchange/DTExchangeAdapter-8.4.1.0.zip",
      checksum: "eca61323542cb1fc81d92af6c665e26597976df9f8cd4d9fa4ba688ac0c92bb8"
    ),
    .binaryTarget(
      name: "DTExchangeSDK",
      url: "https://cdn2.inner-active.mobi/fmp-sdk/files/DTExchangeSDK-iOS-v8.4.1.zip",
      checksum: "b5c29cc545fe8686c76ca862eb622b909d68b1118563eb338f0e925a085c7ba1"
    ),

    // ============================================================
    // InMobi (11.0.0.0)
    // ============================================================
    .target(
      name: "InMobiAdapterTarget",
      dependencies: [
        .target(name: "InMobiAdapter"),
        .target(name: "InMobi-iOS-SDK"),
      ],
      path: "Sources/InMobiAdapterTarget"
    ),
    .binaryTarget(
      name: "InMobiAdapter",
      url: "https://dl.google.com/googleadmobadssdk/mediation/ios/inmobi/InMobiAdapter-11.0.0.0.zip",
      checksum: "ea85bb36a3568037a5cb83fbd44033fbc3185a8b85e7288c7375a45c690af2ea"
    ),
    .binaryTarget(
      name: "InMobi-iOS-SDK",
      url: "https://dl.inmobi.com/inmobi-sdk/IM/InMobi-iOS-SDK-11.0.0.zip",
      checksum: "feca177cc17ee472c736268873dc66e157484ffe6add981375b802f4dc9bc1c0"
    ),

    // ============================================================
    // AppLovin (13.5.0.0)
    // ============================================================
    .target(
      name: "AppLovinAdapterTarget",
      dependencies: [
        .target(name: "AppLovinAdapter"),
        .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
      ],
      path: "Sources/AppLovinAdapterTarget"
    ),
    .binaryTarget(
      name: "AppLovinAdapter",
      url: "https://dl.google.com/googleadmobadssdk/mediation/ios/applovin/AppLovinAdapter-13.5.0.0.zip",
      checksum: "ada88929252ffd168b83a5ef3cb1be6cbe641929ef59c12e6f95cb1a18c56cae"
    ),

    // ============================================================
    // ironSource (9.0.0.0.0)
    // ============================================================
    .target(
      name: "IronSourceAdapterTarget",
      dependencies: [
        .target(name: "IronSourceAdapter"),
        .target(name: "IronSourceSDK"),
      ],
      path: "Sources/IronSourceAdapterTarget"
    ),
    .binaryTarget(
      name: "IronSourceAdapter",
      url: "https://dl.google.com/googleadmobadssdk/mediation/ios/ironsource/IronSourceAdapter-9.0.0.0.0.zip",
      checksum: "3e709a3c154f742b14718273eeffe5756f2d38c4cde18121c080406f9c59ba8e"
    ),
    .binaryTarget(
      name: "IronSourceSDK",
      url: "https://raw.githubusercontent.com/ironsource-mobile/iOS-sdk/master/9.0.0/IronSource9.0.0.zip",
      checksum: "f3453207612eac8c9fc9e6c335e6818580d1ad203675e066725414b381d2684a"
    ),

    // ============================================================
    // Liftoff / Vungle (7.6.1.0)
    // ============================================================
    .target(
      name: "LiftoffMonetizeAdapterTarget",
      dependencies: [
        .target(name: "LiftoffMonetizeAdapter"),
        .product(name: "VungleAdsSDK", package: "VungleAdsSDK-SwiftPackageManager"),
      ],
      path: "Sources/LiftoffMonetizeAdapterTarget"
    ),
    .binaryTarget(
      name: "LiftoffMonetizeAdapter",
      url: "https://dl.google.com/googleadmobadssdk/mediation/ios/liftoffmonetize/LiftoffMonetizeAdapter-7.6.1.0.zip",
      checksum: "6092c9ded9f046ee9abd677b9135f4e9f38189afd62243dc5ecbb4478e0adc54"
    ),
  ]
)
