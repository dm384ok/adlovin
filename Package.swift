// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ADLovinSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ADLovinSDK",
            targets: ["ADLovinSDK"]),
    ],

    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "11.5.0"),
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git",   exact: "12.5.0"),
        
        .package(
                    url: "https://github.com/facebook/facebook-ios-sdk.git", exact: "17.0.0"),
                
                .package(
                    url: "https://github.com/airbnb/lottie-ios", exact: "4.4.3"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ADLovinSDK",
            dependencies: [
                
                .target(name: "ADLovin"),
                .target(name: "UnityAds"),
                
                    .product(name: "Lottie", package: "lottie-ios"),
                                   
                                   .product(name: "FacebookCore", package: "facebook-ios-sdk"),
                                   .product(name: "FacebookAEM", package: "facebook-ios-sdk"),
                                   .product(name: "FacebookBasics", package: "facebook-ios-sdk"),
                
                    .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                    .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),

                
            ],   publicHeadersPath:"include"
        ),
        
        .binaryTarget(
            name: "ADLovin",
            path: "./ADLovin.xcframework"),
        
        .binaryTarget(
            name: "UnityAds",
            path: "./UnityAds.xcframework"),

    ],
    swiftLanguageVersions: [.v5]
)
