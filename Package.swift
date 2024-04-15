// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "MPVKit",
    defaultLocalization: "en",
    platforms: [.macOS(.v10_15), .iOS(.v13), .tvOS(.v13)],
    products: [
        .library(
            name: "MPVKit",
            type: .static,
            targets: ["MPVKit"]
        ),
        // .library(
        //     name: "FFmpegKit",
        //     type: .static,
        //     targets: ["FFmpegKit"]
        // ),
        // .library(name: "Libavcodec", targets: ["Libavcodec"]),
        // .library(name: "Libavdevice", targets: ["Libavdevice"]),
        // .library(name: "Libavfilter", targets: ["Libavfilter"]),
        // .library(name: "Libavformat", targets: ["Libavformat"]),
        // .library(name: "Libavutil", targets: ["Libavutil"]),
        // .library(name: "Libswresample", targets: ["Libswresample"]),
        // .library(name: "Libswscale", targets: ["Libswscale"]),
        // .library(name: "Libssl", targets: ["Libssl"]),
        // .library(name: "Libcrypto", targets: ["Libcrypto"]),
        // .library(name: "Libass", targets: ["Libass"]),
        // .library(name: "Libfreetype", targets: ["Libfreetype"]),
        // .library(name: "Libfribidi", targets: ["Libfribidi"]),
        // .library(name: "Libharfbuzz", targets: ["Libharfbuzz"]),
        // .library(name: "Libuchardet", targets: ["Libuchardet"]),
        // .library(name: "Libmpv", targets: ["Libmpv"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
        .target(
            name: "MPVKit",
            dependencies: [
                "FFmpegKit", "Libuchardet", "Libmpv",
                .target(name: "Libbluray", condition: .when(platforms: [.macOS, .macCatalyst])),
                .target(name: "Libluajit", condition: .when(platforms: [.macOS])),
            ],
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreAudio"),
            ]
        ),
        .target(
            name: "FFmpegKit",
            dependencies: [
                "Libavcodec", "Libavfilter", "Libavformat", "Libavutil", "Libswresample", "Libswscale",
                "Libssl", "Libcrypto", "Libass", "Libfreetype", "Libfribidi", "Libharfbuzz",
                "MoltenVK", "Libshaderc_combined", "lcms2", "Libplacebo", "Libfontconfig", "Libdovi", "Libunibreak",
                "libsmbclient", "gmp", "nettle", "hogweed", "gnutls",
                .target(name: "Libdav1d", condition: .when(platforms: [.macOS, .iOS, .tvOS])),
//                "Libsrt",
            ],
            linkerSettings: [
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("Metal"),
                .linkedFramework("VideoToolbox"),
                .linkedLibrary("bz2"),
                .linkedLibrary("iconv"),
                .linkedLibrary("expat"),
                .linkedLibrary("resolv"),
                .linkedLibrary("xml2"),
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
            ]
        ),
        .executableTarget(
            name: "build",
            path: "Plugins/BuildFFmpeg",
            exclude:["patch"]
        ),
        .executableTarget(
            name: "mpv",
            path: "Plugins/RunCPlayer"
        ),
        .binaryTarget(
            name: "MoltenVK",
            path: "Sources/MoltenVK.xcframework"
        ),
        .binaryTarget(
            name: "Libshaderc_combined",
            path: "Sources/Libshaderc_combined.xcframework"
        ),
        .binaryTarget(
            name: "lcms2",
            path: "Sources/lcms2.xcframework"
        ),
        .binaryTarget(
            name: "Libfontconfig",
            path: "Sources/Libfontconfig.xcframework"
        ),
        .binaryTarget(
            name: "Libunibreak",
            path: "Sources/Libunibreak.xcframework"
        ),
        .binaryTarget(
            name: "Libdav1d",
            path: "Sources/Libdav1d.xcframework"
        ),
        .binaryTarget(
            name: "Libbluray",
            path: "Sources/Libbluray.xcframework"
        ),
        .binaryTarget(
            name: "Libdovi",
            path: "Sources/Libdovi.xcframework"
        ),
        .binaryTarget(
            name: "Libplacebo",
            path: "Sources/Libplacebo.xcframework"
        ),
        .binaryTarget(
            name: "Libmpv",
            path: "Sources/Libmpv.xcframework"
        ),
        .binaryTarget(
            name: "Libavcodec",
            path: "Sources/Libavcodec.xcframework"
        ),
        .binaryTarget(
            name: "Libavdevice",
            path: "Sources/Libavdevice.xcframework"
        ),
        .binaryTarget(
            name: "Libavfilter",
            path: "Sources/Libavfilter.xcframework"
        ),
        .binaryTarget(
            name: "Libavformat",
            path: "Sources/Libavformat.xcframework"
        ),
        .binaryTarget(
            name: "Libavutil",
            path: "Sources/Libavutil.xcframework"
        ),
        .binaryTarget(
            name: "Libswresample",
            path: "Sources/Libswresample.xcframework"
        ),
        .binaryTarget(
            name: "Libswscale",
            path: "Sources/Libswscale.xcframework"
        ),
        .binaryTarget(
            name: "Libssl",
            path: "Sources/Libssl.xcframework"
        ),
        .binaryTarget(
            name: "Libcrypto",
            path: "Sources/Libcrypto.xcframework"
        ),
        .binaryTarget(
            name: "Libass",
            path: "Sources/Libass.xcframework"
        ),
        .binaryTarget(
            name: "Libfreetype",
            path: "Sources/Libfreetype.xcframework"
        ),
        .binaryTarget(
            name: "Libfribidi",
            path: "Sources/Libfribidi.xcframework"
        ),
        .binaryTarget(
            name: "Libharfbuzz",
            path: "Sources/Libharfbuzz.xcframework"
        ),
        .binaryTarget(
            name: "Libuchardet",
            path: "Sources/Libuchardet.xcframework"
        ),
        .binaryTarget(
            name: "Libluajit",
            path: "Sources/Libluajit.xcframework"
        ),
        .binaryTarget(
            name: "gmp",
            path: "Sources/gmp.xcframework"
        ),
        .binaryTarget(
            name: "nettle",
            path: "Sources/nettle.xcframework"
        ),
        .binaryTarget(
            name: "hogweed",
            path: "Sources/hogweed.xcframework"
        ),
        .binaryTarget(
            name: "gnutls",
            path: "Sources/gnutls.xcframework"
        ),
        .binaryTarget(
            name: "libsmbclient",
            path: "Sources/Libsmbclient.xcframework"
        ),
//        .binaryTarget(
//            name: "Libsrt",
//            path: "Sources/Libsrt.xcframework"
//        ),
    ]
)
