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
    var heightUpdateBlock : (Void->Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        htmlContentView.interactionDelegate = self
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        htmlContentView.interactionDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension SampleContentTableViewCell: HTMLContentViewInteractionDelegate {
    func shouldUpdateSize() {
        setNeedsUpdateConstraints()
        updateConstraintsIfNeeded()
        setNeedsLayout()
        layoutIfNeeded()
//        setNeedsLayout()
//        layoutIfNeeded()
        heightUpdateBlock?()
    }
}
