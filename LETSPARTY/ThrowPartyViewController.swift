//
//  ThrowPartyViewController.swift
//  LETSPARTY
//
//  Created by LinLin Ding on 10/14/16.
//  Copyright © 2016 LinLin Ding. All rights reserved.
//

import UIKit

class ThrowPartyViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate
 {
    let upLoadImgUrl:String="http://localhost:3000/uploadpic"
    let throwPartyUrl:String="http://localhost:3000/throwParty"
    
    
    @IBOutlet weak var PartyName: UITextField!
    @IBOutlet weak var PartyHolder: UITextField!
    @IBOutlet weak var PartyPlace: UITextField!
    @IBOutlet weak var PartyTime: UITextField!
    @IBOutlet weak var PartySize: UITextField!
    
    
    @IBOutlet weak var photoImageView: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //select a photo from local
    @IBAction func SelectPhotoTapped(_ sender: AnyObject)
    {
        let myPickerController=UIImagePickerController()
        myPickerController.delegate=self
        myPickerController.sourceType=UIImagePickerControllerSourceType.photoLibrary
        present(myPickerController, animated: false,completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        photoImageView.image=image
        self.dismiss(animated: true,completion:nil)
        
    }
    
    @IBAction func UploadPhotoTapped(_ sender: AnyObject)
    {
        print("upload button has been clicked")
        let upLoad=UploadImage()
        upLoad.ImageUploadRequest(upLoadImgUrl, partyName: PartyName.text!, partyHolder: PartyHolder.text!, partyImg: photoImageView)
        
        ThrowNewParyTapped()
    }
    
    func ThrowNewParyTapped()
    {
        let name: String=PartyName.text!
        let holder: String=PartyHolder.text!
        let place: String=PartyPlace.text!
        let time: String=PartyTime.text!
        let size: String=PartySize.text!
        let picture: String=PartyName.text!+".jpg"
        
        let upLoadMap=["name":name,"holder":holder,"place":place,"ptime":time,
            "size":size,"picture":picture]
       
        var throwParty=NetworkClass().UploadRequest(url: throwPartyUrl, uploadMap: upLoadMap,callback: {(response)->Void in
        
            
        let title = "Throw Party"
        let message = response
            print(message!)
            
        DispatchQueue.main.async(execute: { () -> Void in
            
            let alert = UIAlertController(title: title, message: message, preferredStyle:  .alert)
            let action = UIAlertAction(title: "OK",style: .default,handler: nil)
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
            
        })

        })
    }
    

}
