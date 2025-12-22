// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "AdapterSPMTest",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // 테스트용: 의존성 묶음 라이브러리
        .library(
            name: "AdapterSPMTest",
            targets: ["AdapterSPMTest"]
        )
    ],
    dependencies: [
        // 1. Google Mobile Ads SDK (AdMob)
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
            exact: "12.6.0"
        ),

        // 2. AppLovin Mediation Adapter (commit pin)
        .package(
            url: "https://github.com/googleads/googleads-mobile-ios-mediation-applovin.git",
            revision: "0bd2371f11814aed0354c912f0361df3b49c505c"
        ),

        // 3. InMobi Mediation Adapter (commit pin)
        .package(
            url: "https://github.com/googleads/googleads-mobile-ios-mediation-inmobi.git",
            revision: "2bb1f7330da5c2ced96267800866490e8a78511d"
        )
    ],
    targets: [
        .target(
            name: "AdapterSPMTest",
            dependencies: [
                // AdMob
                .product(
                    name: "GoogleMobileAds",
                    package: "swift-package-manager-google-mobile-ads"
                ),

                // AppLovin Adapter
                .product(
                    name: "GoogleMobileAdsMediationAppLovin",
                    package: "googleads-mobile-ios-mediation-applovin"
                ),

                // InMobi Adapter
                .product(
                    name: "GoogleMobileAdsMediationInMobi",
                    package: "googleads-mobile-ios-mediation-inmobi"
                )
            ]
        )
    ]
)
