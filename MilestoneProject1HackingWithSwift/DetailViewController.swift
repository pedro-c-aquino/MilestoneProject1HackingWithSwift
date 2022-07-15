//
//  DetailViewController.swift
//  MilestoneProject1HackingWithSwift
//
//  Created by user208023 on 7/15/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var flagImage: UIImageView!
    var selectedImage: String?
    var flags: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedImage = selectedImage {
            title = selectedImage
            flagImage.image = UIImage(named: selectedImage)
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        }
    }
    
    @objc func shareTapped() {
        
        guard let image = flagImage.image?.jpegData(compressionQuality: 0.8) else { return }
        
        let vc = UIActivityViewController(activityItems: [image, selectedImage!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
