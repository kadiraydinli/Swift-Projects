//
//  FeedViewController.swift
//  InstagramClone
//
//  Created by Kadir Aydınlı on 15.12.2022.
//

import UIKit
import FirebaseFirestore
import SDWebImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var userEmailArray = [String]()
    var userCommentArray = [String]()
    var likeArray = [Int]()
    var userImageArray = [String]()
    var documentIDArray = [String]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        getDataFromFirestore()
    }
    
    func alertModal(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    func getDataFromFirestore() {
        let firestoreDb = Firestore.firestore()
        
        firestoreDb.collection("Posts").order(by: "date", descending: true).addSnapshotListener { snapshot, error in
            if error != nil {
                self.alertModal(title: "Error", message: error?.localizedDescription ?? "Error firebase")
            } else {
                if snapshot?.isEmpty != nil {
                    self.userEmailArray.removeAll(keepingCapacity: false)
                    self.userImageArray.removeAll(keepingCapacity: false)
                    self.userCommentArray.removeAll(keepingCapacity: false)
                    self.likeArray.removeAll(keepingCapacity: false)
                    self.documentIDArray.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        self.documentIDArray.append(documentID)
                        
                        if let postedBy = document.get("postedBy") as? String {
                            self.userEmailArray.append(postedBy)
                        }
                        
                        if let comment = document.get("comment") as? String {
                            self.userCommentArray.append(comment)
                        }
                        
                        if let likes = document.get("likes") as? Int {
                            self.likeArray.append(likes)
                        }
                        
                        if let image = document.get("image") as? String {
                            self.userImageArray.append(image)
                        }
                    }
                    
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.userEmailText.text = userEmailArray[indexPath.row]
        cell.userCommentText.text = userCommentArray[indexPath.row]
        cell.likeCountText.text = String(likeArray[indexPath.row])
        cell.userImageView.sd_setImage(with: URL(string: userImageArray[indexPath.row]))
        cell.documentIDText.text = documentIDArray[indexPath.row]
        return cell
    }

}
