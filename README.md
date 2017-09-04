# CustomModalTransition

This is simple framework for Swift or Objective-C to present your own controllers modally . 
You just need to put var into controller which you want to be presented modally, like this:

```swift
let modalTransitor = CustomModalTransition(option: .center, horizontalInsets: 20, hiewHeight: 262)
```
and set this var to transition delegate: 

```swift
let vc = SomeUIViewController.instantiateViewController(withIdentifier: "SomeID")
vc.modalPresentationStyle = .custom
vc.transitioningDelegate = vc.modalTransitor
```
There are two option available for presentation: 
* **.center** (for Objective-c: **UICustomTransitionOptionCenter**) - modal view controller will be shown in the centre of the screen 
* **.bottom** (for Objective-c: **UICustomTransitionOptionBottom**) - it will be shown in bottom of the screen.

The parameter **horizontalInsets** is responsible for insets from left and right, with bottom option it's also responsible for bottom inset.
