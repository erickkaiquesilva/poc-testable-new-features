import ProjectDescription

let project = Project(
    name: "UIComponents",
    targets: [
        .target(
            name: "UIComponents",
            destinations: .iOS,
            product: .app,
            bundleId: "com.br.app.UIComponents",
            infoPlist: .default,
            sources: ["UIComponents/Files/**"],
            resources: ["UIComponents/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "UIComponentsTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.br.app.UIComponentsTests",
            infoPlist: .default,
            sources: ["UIComponents/Tests/**"],
            resources: [],
            dependencies: [.target(name: "UIComponents")]
        ),
    ]
)
