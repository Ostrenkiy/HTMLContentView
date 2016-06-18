//
//  ViewController.swift
//  SmartContentView
//
//  Created by Alexander Karpov on 17.06.16.
//  Copyright © 2016 Stepic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let strings : [String] = [
        "I am a small simple string",
        "image: <img src=\"https://pp.vk.me/c628325/v628325621/42534/zJ5CCe3Uvx0.jpg\">",
        "I am a small simple string 2",
        "I am a small simple string 3",
        "I am a small simple string 4",
        "I am a small simple string 5",
        "I am a small simple string 6",
        "I am a small simple string 7",
        "Here is a string with a simple tag <b>bold</b>",
        "Link to something <a href=\"http://google.com\">interesting</a>",
        "This link may be automatically detected http://google.com",
        "Simple LaTeX here: $x*x=x^2$",
        "Long long long long long long long long long long long long long long long long long long long long long  long long long long long line",
        "Big LaTeX formula: $\\lim_{x\\to 0}{\\frac{e^x-1}{2x}}\\overset{\\left[\\frac{0}{0}\\right]}{\\underset{\\mathrm{H}}{=}}\\lim_{x\\to 0}{\\frac{e^x}{2}}={\\frac{1}{2}}$"
    ]
    
    var cellForRow = [Int: UITableViewCell]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44.0

        tableView.registerNib(UINib(nibName: "SampleContentTableViewCell", bundle: nil), forCellReuseIdentifier: "SampleContentTableViewCell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}

extension ViewController : UITableViewDelegate {
}

extension ViewController : UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return strings.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = cellForRow[indexPath.row] {
            return cell
        } else {
            let cell = NSBundle.mainBundle().loadNibNamed("SampleContentTableViewCell", owner: self, options: nil)[0] as! SampleContentTableViewCell
            //SampleContentTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "SampleContentTableViewCell")
        
            cell.heightUpdateBlock = {
                [weak self] in
                dispatch_async(dispatch_get_main_queue(), {
                    print("height update block for cell \(indexPath.row)")
                    self?.tableView.beginUpdates()
                    self?.tableView.endUpdates()
//                self?.tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
                })

            }
            
            cell.htmlContentView.htmlText = strings[indexPath.row]
            cellForRow[indexPath.row] = cell
            return cell
        }
        
    }
}
