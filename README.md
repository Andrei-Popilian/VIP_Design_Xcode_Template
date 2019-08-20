# VIP Xcode Templates
VIP design pattern (Clean Swift by Uncle Bob)

This is a modification of Clean Swift Templates (http://clean-swift.com)

To learn more about Clean Swift and the VIP cycle, read:

http://clean-swift.com/clean-swift-ios-architecture


### Table of Contents
 1. [Installation](#installation)
 2. [Problems, Suggestions, Pull Requests?](#problems-suggestions-pull-requests)

## Installation

* Before starting to use VIP Templates, please make sure you have the following protocols (adding some constraints to our implementation):
* You can either create by yourself or copy them from the **Architecture** folder inside the templates folder. (Soon will be added to the templates as checkmarks)
    * Factorable.swift
    * VIPArchitecture.swift


#### Factorable.swift
```swift
import UIKit

struct AppInjector {}

protocol Injectable {}

protocol Factorable {

    associatedtype DisplayLogic
    associatedtype DataSource
    associatedtype Interactor
    associatedtype Presenter
    associatedtype Router

    func makeInteractor(viewController: DisplayLogic?, dataSource: DataSource) -> Interactor
    func makePresenter(_ viewController: DisplayLogic?) -> Presenter
    func makeRouter(viewController: UIViewController?) -> Router
}

protocol MainViewFactorable {
    
    associatedtype MainView
    
    func makeMainView() -> MainView
}
```

#### VIPArchitecture.swift
```swift
import UIKit

protocol Interactable {
    
    associatedtype Factory: Factorable
    associatedtype DataSource: DataSourceable
    associatedtype DisplayLogic
    
    init(factory: Factory, viewController: DisplayLogic?, dataSource: DataSource)
}

protocol Presentable {
    
    associatedtype DisplayLogic
    
    init(_ viewController: DisplayLogic?)
}

protocol Displayable where Self: UIViewController  {
    
    associatedtype Factory: Factorable
    associatedtype DataSource: DataSourceable
    associatedtype View: UIView
    
    init(factory: Factory, mainView: View, dataSource: DataSource)
}

protocol DataSourceable {}

protocol Routeable {
    
    init(_ viewController: UIViewController?)
}
```


### Install Templates
* To install the templates, use the terminal and go to VIP Templates Folder (where the Makefile script is) and run the following command:
```bash
make install_templates
```

### Uninstall Templates
* To uninstall the templates, use the terminal and go to VIP Templates Folder (where the Makefile script is) and run the following command:
```bash
make uninstall_templates
```

## How To

### Add Dependency Injection or Not

* Current supported dependency injection designs: **Factory

* To add dependency injection support you must check the **"Add Factory Dependency Injection"** on Scene Template as follows:
<img width="729" alt="Screen Shot 2019-08-20 at 3 19 23 PM" src="https://user-images.githubusercontent.com/45980382/63352584-afc9e900-c361-11e9-8131-88e4084bb2eb.png">


## Problems, Suggestions, Pull Requests?
Please open a [new Issue here](https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template/issues/new) if you run into a problem specific to those templates, have a feature request, find a better implementation, or want to share a comment.

Pull requests are encouraged and greatly appreciated! Please try to maintain consistency with the existing code style. If you're considering taking on significant changes or additions to the project, please communicate in advance by opening a new Issue. This allows everyone to get onboard with upcoming changes, ensures that changes align with the project's design philosophy, and avoids duplicated work.
