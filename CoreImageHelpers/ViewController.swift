//
//  ViewController.swift
//  CoreImageHelpers
//
//  Created by Simon Gladman on 09/01/2016.
//  Copyright © 2016 Simon Gladman. All rights reserved.
//

import UIKit

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

