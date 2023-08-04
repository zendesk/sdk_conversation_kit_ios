// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "ZendeskSDKConversationKit",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "ZendeskSDKConversationKit",
            targets: [
                "ZendeskSDKConversationKitTargets"
            ]
        )
    ],
    dependencies: [
        .package(name: "ZendeskSDKFayeClient",
                 url: "https://github.com/zendesk/sdk_faye_client_ios",
                 from: "1.5.0"),
        .package(name: "ZendeskSDKHTTPClient",
                 url: "https://github.com/zendesk/sdk_http_client_ios",
                 from: "0.13.0"),
        .package(name: "ZendeskSDKStorage",
                 url: "https://github.com/zendesk/sdk_storage_ios",
                 from: "0.8.0"),
        .package(name: "ZendeskSDKCoreUtilities",
                 url: "https://github.com/zendesk/sdk_core_utilities_ios",
                 from: "1.5.0")
    ],
    targets: [
        .binaryTarget(
            name: "ZendeskSDKConversationKit",
            path: "ZendeskSDKConversationKit.xcframework"
        ),
        .target(name: "ZendeskSDKConversationKitTargets",
                dependencies: [
                    .target(name: "ZendeskSDKConversationKit"),
                    .product(name: "ZendeskSDKFayeClient", package: "ZendeskSDKFayeClient"),
                    .product(name: "ZendeskSDKHTTPClient", package: "ZendeskSDKHTTPClient"),
                    .product(name: "ZendeskSDKStorage", package: "ZendeskSDKStorage"),
                    .product(name: "ZendeskSDKCoreUtilities", package: "ZendeskSDKCoreUtilities")
                ],
                path: "Sources")
    ]
)
