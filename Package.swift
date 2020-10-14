// swift-tools-version:5.1
import PackageDescription

let package = Package(name: "AttributedStringBuilder",
                      platforms: [.macOS(.v10_14),
                                  .iOS(.v10),
                                  .tvOS(.v10)],
                      products: [.library(name: "AttributedStringBuilder",
                                          targets: ["AttributedStringBuilder"])],
                      targets: [.target(name: "AttributedStringBuilder",
                                        path: "AttributedStringBuilder/AttributedStringBuilder")],
                      swiftLanguageVersions: [.v5])
