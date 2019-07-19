//
//  GalleryViewController.swift
//  nourish
//
//  Created by GWC on 7/17/19.
//  Copyright © 2019 Safiyah Lakhany. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var imageArray = [GalleryImage]()
    var images=[UIImage]()
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.

        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getImageNames()

    }
    
    func getImageNames(){
        do{
            imageArray = try context.fetch(GalleryImage.fetchRequest()) as! [GalleryImage]
        
            
            for galleryImage in imageArray {
                print(galleryImage.name!)
                
                getImage(imageName: String(galleryImage.name!))
                
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch{
            print ("Could not get imageName")
        }
    }
    
    
    func getImage(imageName: String){
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        if fileManager.fileExists(atPath: imagePath) {
            let image1=UIImage(contentsOfFile: imagePath)
            let newImage = UIImage(cgImage: (image1?.cgImage!)!, scale: (image1?.scale)!, orientation: .right)
            images.append(newImage)
            
            print("received image")
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        else {
            print("Oh no! No Image!")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "gallery", for: indexPath) as! GalleryCell
        cell.imageView1.image=images[indexPath.row]
        return cell
    }
    
    

}
