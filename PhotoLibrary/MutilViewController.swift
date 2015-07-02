//
//  MutilViewController.swift
//  PhotoLibrary
//
//  Created by Developer on 15/7/2.
//  Copyright (c) 2015年 海涛旅游. All rights reserved.
//

import UIKit
import AssetsLibrary
class MutilViewController: ViewController {
    var mediaArray: NSMutableArray?
    override func viewDidLoad() {
        super.viewDidLoad()
        var rightItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Camera, target: self, action: "getPhotosFromLibrary")
        self.navigationItem.rightBarButtonItem = rightItem
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func getPhotosFromLibrary() {
        var assetsLibrary = ALAssetsLibrary()
        mediaArray = NSMutableArray()
        
        assetsLibrary.enumerateGroupsWithTypes(ALAssetsGroupType(ALAssetsGroupSavedPhotos),
            usingBlock: {
                group, stop in
                if group != nil {
                    self.mediaArray?.addObject(group)
                    group.enumerateAssetsUsingBlock({
                        asset, index, stop in
                        // ...
                        if asset != nil {
                            print(asset)
                        }
                    })
                }
            },
            failureBlock: {
                myerror in
                println("error occurred: \(myerror.localizedDescription)")
        })
        
        
        
    }
}
