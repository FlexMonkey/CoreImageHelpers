# CoreImageHelpers
_Syntactic sugar for displaying CIImage using OpenGL and grabbing CIImages from iOS cameras_

## Introduction

`CoreImageHelpers` contains two classes to wrap up all the boilerplate code required for:

* `ImageView` for displaying `CIImage` instances with OpenGL and skipping the extra `UIImage` step
* `CameraCaptureHelper` for grabbing a series of `CIImage` instances from either the front or back camera.
 
## Implementation

The project contains a demonstration that applies a Crystallize filter to the camera feed and displays full screen. The code is super simple:

```swift
class ViewController: UIViewController, CameraCaptureHelperDelegate
{
    let imageView = ImageView()

    let cameraCaptureHelper = CameraCaptureHelper(cameraPosition: .Front)
    
    let crystallize = CIFilter(name: "CICrystallize",
        withInputParameters: [kCIInputRadiusKey: 30])!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
     
        view.addSubview(imageView)

        cameraCaptureHelper.delegate = self
    }
    
    override func viewDidLayoutSubviews()
    {
        imageView.frame = view.bounds.insetBy(dx: 50, dy: 50)
    }

    
    func newCameraImage(cameraCaptureHelper: CameraCaptureHelper, image: CIImage)
    {
        crystallize.setValue(image, forKey: kCIInputImageKey)
        
        imageView.image = crystallize.outputImage
    }
}
```

## Installation

Simply copy one or both of `ImageView` and `CameraCaptureHelper`

## Further Information

This project is a companion to my upcoming book, _Core Image for Swift_, follow me on Twitter where I am [@FlexMonkey](https://twitter.com/FlexMonkey) to keep up to date with developments!


