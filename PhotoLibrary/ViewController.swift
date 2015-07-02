//
//  ViewController.swift
//  PhotoLibrary
//
//  Created by Developer on 15/7/2.
//  Copyright (c) 2015年 海涛旅游. All rights reserved.
//

import UIKit
class ViewController: UIViewController,UIImagePickerControllerDelegate,UIActionSheetDelegate {
    var rightItem: UIBarButtonItem!
    @IBOutlet weak var photoView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        rightItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Camera, target: self, action: "getPhotoFromLibrary")
        self.navigationItem.rightBarButtonItem = rightItem

        // Do any additional setup after loading the view, typically from a nib.
    }
    //MARK:
    func getPhotoFromLibrary() {

        var turple = self.getSoureAvailable()
    
        
        var actionSheet = UIActionSheet(title: "选择照片来源", delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: "好的",  otherButtonTitles:"tuku","paizhao")
//        if turple.0 == 1 {
//            actionSheet.addButtonWithTitle("拍照")
//        }
//        if turple.1 == 1 {
//            actionSheet.addButtonWithTitle("图库选择")
//        }
//        if turple.2 == 1 {
//            actionSheet.addButtonWithTitle("从图片库选择")
//        }
//        actionSheet.cancelButtonIndex = 3
//        actionSheet.destructiveButtonIndex = 2
        actionSheet.showInView(self.view)
        
    }
    //MARK: 获取设备支持的资源类型
    func getSoureAvailable() -> (Int, Int, Int) {
        var a = 0,b = 0,c = 0;
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            println("支持相机")
            a = 1
        }
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            println("支持图库")
            b = 1
        }
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            println("支持图片库")
            c = 1
        }
        return (a, b, c)
    }
    func actionSheet(actionSheet: UIActionSheet, clickedButtonAtIndex buttonIndex: Int) {
        println(buttonIndex)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

