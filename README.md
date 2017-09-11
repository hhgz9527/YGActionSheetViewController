# YGActionSheetViewController

[![CI Status](http://img.shields.io/travis/hhgz9527/YGActionSheetViewController.svg?style=flat)](https://travis-ci.org/hhgz9527/YGActionSheetViewController)
[![Version](https://img.shields.io/cocoapods/v/YGActionSheetViewController.svg?style=flat)](http://cocoapods.org/pods/YGActionSheetViewController)
[![License](https://img.shields.io/cocoapods/l/YGActionSheetViewController.svg?style=flat)](http://cocoapods.org/pods/YGActionSheetViewController)
[![Platform](https://img.shields.io/cocoapods/p/YGActionSheetViewController.svg?style=flat)](http://cocoapods.org/pods/YGActionSheetViewController)

## Example

![image](https://github.com/hhgz9527/YGActionSheetViewController/blob/master/image.gif?raw=true)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 8.0, Swift 3.2

## Installation

To install it, simply add the following line to your Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/hhgz9527/YGUI.git'
pod 'YGActionSheetViewController'
```

## Usage
```
let vc = YGActionSheetViewController()
vc.text = ["1", "2"]
vc.action = { status in
  switch status {
    case .index(row: let row):
  case .cancel:
    debugPrint("cancel")
  }
}
vc.modalPresentationStyle = .overFullScreen
self.present(vc, animated: false, completion: nil)
```

## Author

hhgz9527, gaoyu.dreamer@gmail.com

## License

YGActionSheetViewController is available under the MIT license. See the LICENSE file for more info.
