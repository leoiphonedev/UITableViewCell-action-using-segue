//
//  ViewController.swift
//  UITableViewCell action using segue
//
//  Created by Aman Aggarwal on 09/06/18.
//  Copyright © 2018 Aman Aggarwal. All rights reserved.
//

import UIKit

class AppleProducts {
    var productName: String?
    var productCategory: String?

    init(prName:String, prCategory:String) {
        self.productName = prName
        self.productCategory = prCategory
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tblAppleProducts: UITableView!
    
    var productArray = [AppleProducts]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let macBook = AppleProducts(prName: "MackBook pro", prCategory: "Laptop")
        productArray.append(macBook)
        let macBookAir = AppleProducts(prName: "MackBook air", prCategory: "Laptop")
        productArray.append(macBookAir)
        let iMac = AppleProducts(prName: "iMac", prCategory: "Desktop")
        productArray.append(iMac)
        let iPhone = AppleProducts(prName: "iPhone", prCategory: "Mobile")
        productArray.append(iPhone)
        let iPad = AppleProducts(prName: "iPad", prCategory: "Mobile")
        productArray.append(iPad)
        
        tblAppleProducts.dataSource = self
        tblAppleProducts.delegate = self

    }
    
    
    //MARK:- UITableView methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "productstable")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "productstable")
        }
        
        cell?.textLabel?.text = productArray[indexPath.row].productName
        cell?.detailTextLabel?.text = productArray[indexPath.row].productCategory
        
        return cell!
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showdetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailVC {
            destination.product = productArray[(tblAppleProducts.indexPathForSelectedRow?.row)!]
            tblAppleProducts.deselectRow(at: tblAppleProducts.indexPathForSelectedRow!, animated: true)

        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

