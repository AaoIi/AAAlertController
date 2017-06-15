# AAAlertController

## Description
AAAlertController is another alternative of UIAlertController, some people would say UIAlertController already exists! but my reason to create this alert because UIAlertController still having bugs to change the tint color of the whole app at some point.<br/>
The Alert is fully optimzed to handle long entred text for title and message, and a completion block for each button pressed with different amazing kinds of animations.

## Preview Demo
<img src="https://lh6.googleusercontent.com/pHwGEyVbVLzf-CH1qbfgpaERLa4GZLpAou_xVDJsNhyVEPkI-4pxkQ=w373-h642-p-b1-c0x00999999">

## Usage ##
##### 1) import ```AAAlertController.swift``` ```And AAAlertController.xib``` And ```AAAlertInterface.swift``` into your project <br/>
#####2) Create instance of alert: ```let alertView = AAAlertInterface()``` <br/>
#####3) Show Alert:<br/><br/>   &emsp;&emsp;  3.1) With one Button:<br/>

```swift

// send title, message and button title with completion block also with your prefered animation
alertView.AAAlert("Hello", message: "AlertWithCancel", cancelButtonTitle: "Cancel", completionBlock: { () -> (Void) in
print("Cancel Pressed")
}, animationStyle: animationType.Default)

```

##### 3.2) With Two Buttons:<br/> 

// 

```swift
// send title, message and buttons title with completion block also with your prefered animation
alertView.AAAlert("Hello", message: "AlertWithCancelAndOK", okButtonTitle: "OK", okCompletionBlock: { () -> (Void) in
print("OK Pressed")
}, cancelButtonTitle: "Cancel", cancelCompletionBlock: { () -> (Void) in
print("Cancel Pressed")
}, animationStyle: animationType.Default)
```

##### 3.3) With Three Buttons:<br/> 

```swift

// send title, message and buttons title with completion block also with your prefered animation
        alertViews.AAAlert("Hello", message: "AlertWithThreeButtons", firstButtonTitle: "Share", firstButtonCompletionBlock: { () -> (Void) in
                print("Share Pressed")
            }, secondButtonTitle: "Rate", secondButtonCompletionBlock: { () -> (Void) in
                print("Rate Pressed")
            }, cancelButtonTitle: "Cancel", cancelCompletionBlock: { () -> (Void) in
                print("Cancel Pressed")
            }, animationStyle: animationType.Default)
			
```

##### 4) animationTypes:<br/> 

```swift
public enum animationType {
case Default
case Shake
case SlideDown
case SlideUp
case SlideRight
case SlideLeft
case Fade
}
```


## Requierments ##
* Swift 2.2+
* IOS 7.0+

## License ##

The MIT License (MIT)

Copyright (c) AaoIi 2016

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
