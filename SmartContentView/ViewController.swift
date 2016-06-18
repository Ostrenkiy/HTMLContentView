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
        "Here is a string with a simple tag <b>bold</b>",
        "Link to something <a href=\"http://google.com\">interesting</a>",
        "This link may be automatically detected http://google.com"
    ]
    
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
        let cell = tableView.dequeueReusableCellWithIdentifier("SampleContentTableViewCell") as! SampleContentTableViewCell
        
        cell.htmlContentView.loadHTMLText(strings[indexPath.row])
        return cell
    }
}
