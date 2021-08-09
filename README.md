# SwinjectPropertyInjection

This library is designed to provide support for property injection for projects using `Swinject` for DI, with the new Swift property wrapper. 

The following property wrapper is supported: 
* @Injected
* @OptionalInjected 

## Basic Usage

### Add dependency
We only support Swift Package Manager for now. Add the following line to your `Package.swift`: 

```
.package(url: "https://github.com/wangkunzhen/SwinjectPropertyInjection.git", .upToNextMajor(from: "1.0.0"))
```

### Set up
Invoke the `ResolverContainer.shared.set(resolver:)` before all resolving calls. See below for an example:  
```swift
// let container = Container()
// ... 

ResolverContainer.shared.set(resolver: container)
```

### Basic Usage
This is mainly used for property injection. 

#### @Injected
```swift
class MainViewModel {
    @Injected private var manager: Manager
}
```

#### @OptionalInjected
```swift
class MainViewModel {
    @OptionalInjected private var manager: Manager?
}
```
