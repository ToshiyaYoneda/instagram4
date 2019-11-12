//
//  CommentViewController.swift
//  Instagram
//
//  Created by ToshiyaYoneda on 2019/11/08.
//  Copyright © 2019 ToshiyaYoneda. All rights reserved.
//

import UIKit
import SVProgressHUD
import Firebase

class CommentViewController: UIViewController {
    
    var postData: PostData!

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBOutlet weak var commentText: UITextField!
    @IBAction func commentPost(_ sender: Any) {
        
        let comment = commentText.text
        let name = Auth.auth().currentUser?.displayName
        
            
        // コメントが入力されていない時はHUDを出して何もしない
        if comment!.isEmpty {
                SVProgressHUD.showError(withStatus: "コメントを入力して下さい")
                return
        } else {

        // 辞書を作成してFirebaseに保存する
        let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
            let postDic = ["comment": commentText.text,"commentName": name]
            postRef.updateChildValues(postDic as [AnyHashable : Any])
        
        let HVC = storyboard?.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        self.present(HVC, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
