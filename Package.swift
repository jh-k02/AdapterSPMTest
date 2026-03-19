// swift-tools-version:5.8
import PackageDescription

let package = Package(
  name: "AdapterSPMTest",
  platforms: [
    .iOS(.v13)
  ],
  products: [
    .library(
      name: "AdWhaleMediationAdapter",
      targets: ["AdWhaleMediationAdapter"]
    ),
  ],
  dependencies: [
    .package(
      url: "https://github.com/googleads/googleads-mobile-ios-mediation-inmobi.git",
      exact: "11.1.101"
    ),
    .package(
      url: "https://github.com/googleads/googleads-mobile-ios-mediation-liftoffmonetize.git",
      exact: "7.7.0"
    ),
    .package(
      url: "https://github.com/googleads/googleads-mobile-ios-mediation-dtexchange.git",
      exact: "8.4.401"
    ),
    .package(
      url: "https://github.com/googleads/googleads-mobile-ios-mediation-mintegral.git",
      exact: "8.0.700"
    ),
    .package(
      url: "https://github.com/googleads/googleads-mobile-ios-mediation-pangle.git",
      exact: "7.9.600"
    ),
    .package(
      url: "https://github.com/googleads/googleads-mobile-ios-mediation-unity.git",
      exact: "4.16.601"
    ),
    .package(
      url: "https://github.com/googleads/googleads-mobile-ios-mediation-ironsource.git",
      exact: "9.3.1"
    ),
    .package(
      url: "https://github.com/googleads/googleads-mobile-ios-mediation-moloco.git",
      exact: "4.3.2"
    ),
  ],
  targets: [
    .target(
      name: "AdWhaleMediationAdapter",
      dependencies: [
        .product(name: "DTExchangeAdapterTarget", package: "googleads-mobile-ios-mediation-dtexchange"),
        .product(name: "InMobiAdapterTarget", package: "googleads-mobile-ios-mediation-inmobi"),
        .product(name: "IronSourceAdapterTarget", package: "googleads-mobile-ios-mediation-ironsource"),
        .product(name: "LiftoffMonetizeAdapterTarget", package: "googleads-mobile-ios-mediation-liftoffmonetize"),
        .product(name: "MintegralAdapterTarget", package: "googleads-mobile-ios-mediation-mintegral"),
        .product(name: "PangleAdapterTarget", package: "googleads-mobile-ios-mediation-pangle"),
        .product(name: "UnityAdapterTarget", package: "googleads-mobile-ios-mediation-unity"),
        .product(name: "MolocoAdapterTarget", package: "googleads-mobile-ios-mediation-moloco"),
      ],
    ),
  ]
)