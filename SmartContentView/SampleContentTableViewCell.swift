//
//  SampleContentTableViewCell.swift
//  SmartContentView
//
//  Created by Alexander Karpov on 18.06.16.
//  Copyright © 2016 Stepic. All rights reserved.
//

import UIKit

class SampleContentTableViewCell: UITableViewCell {

    @IBOutlet weak var htmlContentView: HTMLContentView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        htmlContentView.interactionDelegate = self
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension SampleContentTableViewCell: HTMLContentViewInteractionDelegate {
    func didSelectTextView() {
        setSelected(!self.selected, animated: true)
        //TODO: Call some other delegate to notify controller about selection
    }
}
