# VIP Xcode Templates
VIP design pattern (Clean Swift by Uncle Bob)

To learn more about Clean Swift and the VIP cycle, please read:

http://clean-swift.com/clean-swift-ios-architecture


![VIP](https://user-images.githubusercontent.com/45980382/70925551-b294cc00-202b-11ea-8bbe-5603ccc08607.png)



### Table of Contents
 1. [Installation](#installation)
 2. [Problems, Suggestions, Pull Requests?](#problems-suggestions-pull-requests)

## Installation

* Download the repository and use the following commands:

### Install Templates
* To install the templates, use the terminal and go to "VIPSwift" Folder (where the Makefile script is) and run the following command:
```bash
make install_templates
```

### Uninstall Templates
* To uninstall the templates, use the terminal and go to "VIPSwift" Folder (where the Makefile script is) and run the following command:
```bash
make uninstall_templates
```

## How To

* Once installed you should be able to see 2 more templates inside Xcode:
<img width="726" alt="Screenshot 2019-12-16 at 16 54 24" src="https://user-images.githubusercontent.com/45980382/70923940-05b94f80-2029-11ea-9557-1988ef88c056.png">

### Scene Template

<img width="722" alt="Screenshot 2019-12-16 at 16 57 15" src="https://user-images.githubusercontent.com/45980382/70924102-45803700-2029-11ea-97a9-578ac8276fee.png">

* Give a scene name and it should autogenerate all the files needed: ViewController, Interactor, Presenter, Router, View and Model

* **Additions**: With or without Dependecy Injection
<img width="294" alt="Screenshot 2019-12-16 at 17 30 58" src="https://user-images.githubusercontent.com/45980382/70924475-d6efa900-2029-11ea-9bc4-d0bbd9ff0a61.png">

* Factory Dependency Injection will add 1 more file **(SceneName)Factorable**, and the entire implementation will support **Factory** Dependecy Injection pattern

* For more details about the implementation or unit tests, please check the sample project inside repository **SampleVIPSwift/SampleVIPSwift.xcodeproj**

 
 ### Unit Tests Template
 
 * Will create 4 Unit Test files, representing tests for each component: ViewController, Interactor, Presenter, Router
 
 <img width="719" alt="Screenshot 2019-12-16 at 16 58 49" src="https://user-images.githubusercontent.com/45980382/70924696-41a0e480-202a-11ea-9d86-fa25a361e930.png">


## Problems, Suggestions, Pull Requests?
Please open a [new Issue here](https://github.com/Andrei-Popilian/VIP_Design_Xcode_Template/issues/new) if you run into a problem specific to those templates, have a feature request, find a better implementation, or want to share a comment.

Pull requests are encouraged and greatly appreciated! Please try to maintain consistency with the existing code style. If you're considering taking on significant changes or additions to the project, please communicate in advance by opening a new Issue. This allows everyone to get onboard with upcoming changes, ensures that changes align with the project's design philosophy, and avoids duplicated work.
