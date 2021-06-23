//
//  LoginViewController.swift
//  movieApp
//
//  Created by mac on 2021/05/11.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKUser

class LoginViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginPressed(_ sender: Any) {
//        if (UserApi.isKakaoTalkLoginAvailable()) {
//            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
//                if let error = error {
//                    print(error)
//                }
//                else {
//                    print("loginWithKakaoTalk() success.")
//
//                    //do something
//                    _ = oauthToken
//                }
//            }
//        }
        
        UserApi.shared.loginWithKakaoAccount(prompts:[.Login]) {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")

                //do something
                _ = oauthToken

            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let mainTabBarController = storyboard.instantiateViewController(identifier: "tabBarcontroller")
              mainTabBarController.modalPresentationStyle = .fullScreen
              
              self.present(mainTabBarController, animated: true, completion: nil)
          }
        }
    }
    

