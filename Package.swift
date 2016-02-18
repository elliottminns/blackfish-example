import PackageDescription

let package = Package(
    name: "BlackfishApp",
    dependencies: [
        .Package(url: "https://github.com/elliottminns/blackfish.git", majorVersion: 0),
        .Package(url: "https://github.com/elliottminns/blackfish-stencil.git",
                 majorVersion: 0)
    ]
)
