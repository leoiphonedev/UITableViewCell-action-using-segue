//
//  DetailVC.swift
//  UITableViewCell action using segue
//
//  Created by Aman Aggarwal on 09/06/18.
//  Copyright © 2018 Aman Aggarwal. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var lblAppleProduct: UILabel!
    
    var product: AppleProducts?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        lblAppleProduct.text = "\((product?.productName)!) comes under the category \((product?.productCategory)!)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
