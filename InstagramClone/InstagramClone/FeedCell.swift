//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Kadir Aydınlı on 18.12.2022.
//

import UIKit
import FirebaseFirestore

class FeedCell: UITableViewCell {

    @IBOutlet weak var documentIDText: UILabel!
    @IBOutlet weak var likeCountText: UILabel!
    @IBOutlet weak var userCommentText: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userEmailText: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likeButton(_ sender: Any) {
        let firestore = Firestore.firestore()
        
        if let likeCount = Int(likeCountText.text!) {
            let likeStore = ["likes": likeCount + 1]
            
            firestore.collection("Posts").document(documentIDText.text!).setData(likeStore, merge: true)
        }
    }
}
