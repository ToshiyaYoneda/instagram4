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
        
        let name = Auth.auth().currentUser?.displayName
        let comment: String = "\(name!): \(commentText.text!)"
        var comments: [String] = []
        
        // コメントが入力されていない時はHUDを出して何もしない
        if commentText.text!.isEmpty {
                SVProgressHUD.showError(withStatus: "コメントを入力して下さい")
                return
        } else {
           
        comments.append(comment)

        // 辞書を作成してFirebaseに保存する
            let postRef = Database.database().reference().child(Const.PostPath).child(postData.id!)
        let postDic = ["comments": [comment]]
            
        postRef.updateChildValues(postDic)

            
        self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }

}
