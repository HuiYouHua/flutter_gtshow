//
//  FirstViewController.swift
//  Runner
//
//  Created by 华惠友 on 2020/10/29.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        ///打开Flutter页面
        HHYPlatformRouterImp.sharedRouter.open("accountPage", urlParams: ["param": "111"], exts: ["exts":"222"]) { (isFinish) in
            print("打开了Flutter页面")
        }
        

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
