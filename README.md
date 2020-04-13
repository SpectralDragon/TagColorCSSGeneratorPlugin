# TagColorCSSGeneratorPlugin

A [Publish](https://github.com/johnsundell/publish) plugin that generates a custom tags styles for each tag name.

## Install

To install it into your [Publish](https://github.com/johnsundell/publish) package, add it as a dependency within your `Package.swift` manifest:
```swift
let package = Package(
    ...
    dependencies: [
        ...
        .package(url: "https://github.com/SpectralDragon/TagColorCSSGeneratorPlugin.git", from: "0.1.0")
    ],
    targets: [
        .target(
            ...
            dependencies: [
                ...
                "TagColorCSSGeneratorPlugin"
            ]
        )
    ]
    ...
)
```

## Usage

The plugin can be installed below  `.addMarkdownFiles()` method. 

```swift

// available tags: swiftui

Site().publish(using: [
    .addMarkdownFiles(),
    .installPlugin(
        .tagColorCSSGenerator(tagsCSSPrefix: "tag-", builder: { tag -> Color in
            return Color(hex: "#ff0000")
        })
    )
])
```

When you run your project, plugin will generate `tags.css` by default. This file will contains next css:

```css
.tag-swiftui {
    background-color: #FF00004F; // red with alpha component 0.4
    color: #FF0000FF; // red with alpha component 1
}

.tag-swiftui:hover {
    background-color: #FF00007F; // red with alpha component 0.7
}
```

### Dark mode

If you need dark color mode, just call method `adaptiveToDarkTheme(Color)` in your Color object. In generated file will contains next code:

```css
.tag-swiftui {
    background-color: #FF00004F; // red with alpha component 0.4
    color: #FF0000FF; // red with alpha component 1
}

.tag-swiftui:hover {
    background-color: #FF00007F; // red with alpha component 0.7
}

@media(prefers-color-scheme: dark) { 
    .tag-swiftui {
        background-color: #FF00004F; // red with alpha component 0.4
        color: #FF0000FF; // red with alpha component 1
    }

    .tag-swiftui:hover {
        background-color: #FF00007F; // red with alpha component 0.7
    }
}
```

## Check tags availability

Sometimes, user can mistake in tag name and `TagColorCSSGeneratorPlugin` can generate a wrong color, to avoid this problem, we add `CheckTagsAvailabilityPlugin`. The plugin check all exists tags and compare it with our own available tag list. 

```swift

// available tags: ui, lifestyle

enum AvailableTag: String, CaseIterable {
    case ui, lifestyle
}

Site().publish(using: [
    .addMarkdownFiles(),
    .checkTagsIsExists(AvailableTag.self) // will crash if tag doesn't exists in AvailableTag enum
})
```

Thank you and enjoy 💯
