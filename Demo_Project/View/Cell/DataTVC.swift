//
//  DataTVC.swift
//  Demo_Project
//
//  Created by Shubham Ramani on 03/05/24.
//

import UIKit

class DataTVC: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data:Post){
        titleLabel.text = "\(data.id). \(data.title)"
        descriptionTitleLabel.text = data.body
    }
    
}
