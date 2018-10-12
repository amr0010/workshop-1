//
//  myCell.swift
//  Network_Workshop#1
//
//  Created by Amr on 10/12/18.
//  Copyright © 2018 Amr. All rights reserved.
//

import UIKit

class myCell: UITableViewCell {
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var idLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with timeline : timeLine)
    {
        textLbl.text = timeline.user

        idLbl.text = timeline.date
    }

}
