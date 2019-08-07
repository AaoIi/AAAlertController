# FMAlertController

## Description
FMAlertController is another alternative of UIAlertController, some people would say UIAlertController already exists! but my reason to create this alert because UIAlertController still having bugs to change the tint color of the whole app at some point.<br/>
The Alert is fully optimzed to handle long entred text for title and message, and a completion block for each button pressed with different amazing kinds of animations.

## Preview Demo
<img src="https://github.com/AaoIi/FMAlertController/blob/master/demo1.gif?raw=true">

## Installation

### CocoaPods
[CocoaPods][] is a dependency manager for Cocoa projects. To install FMAlertController with CocoaPods:

1. Make sure CocoaPods is [installed][CocoaPods Installation].

2. Update your Podfile to include the following:

``` ruby
use_frameworks!
pod 'FMAlertController'
```

3. Run `pod install`.

[CocoaPods]: https://cocoapods.org
[CocoaPods Installation]: https://guides.cocoapods.org/using/getting-started.html#getting-started

4. In your code import FMAlertController like so:
`import FMAlertController`

## Usage ##
##### 1) import FMAlertController <br/>
##### 2) Show Alert:<br/><br/> 2.1) with single Button:<br/>

```swift
// send title, message and button title with completion block also with your prefered animation
FMAlertController.show("Hello", message: "AlertWithCancel", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
print("Cancel Pressed")
}, animationStyle: .default)
```

##### 2.2) with double Buttons:<br/> 

```swift
// send title, message and button title with completion block also with your prefered animation
FMAlertController.show("Hello", message: "AlertWithCancelAndOK", firstButtonTitle: "OK", firstActionCompletion: { () -> (Void) in
print("OK Pressed")
}, cancelButtonTitle: "Cancel", cancelCompletionBlock: { () -> (Void) in
print("Cancel Pressed")
}, animationStyle: .default)
```

##### 2.3) with triple Buttons:<br/> 

```swift
// send title, message and button title with completion block also with your prefered animation
FMAlertController.show("Hello", message: "AlertWithThreeButtons", firstButtonTitle: "Share", firstButtonCompletionBlock: { () -> (Void) in
print("Share Pressed")
}, secondButtonTitle: "Rate", secondButtonCompletionBlock: { () -> (Void) in
print("Rate Pressed")
}, cancelButtonTitle: "Cancel", cancelCompletionBlock: { () -> (Void) in
print("Cancel Pressed")
}, animationStyle: .default)
```

##### 4) animationTypes:<br/> 

```swift
public enum animationType{
case `default`
case shake
case slideDown
case slideUp
case slideRight
case slideLeft
case fade
}
```

## Requierments ##
* Swift 5.0+
* IOS 8.0+

## License ##

The MIT License (MIT)

Copyright (c) AaoIi 2016

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
