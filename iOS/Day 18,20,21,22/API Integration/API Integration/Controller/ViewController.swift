//
//  ViewController.swift
//  API Integration
//
//  Created by Anuranjan Bose on 08/04/19.
//  Copyright © 2019 Anuranjan Bose. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var arrayJson = [DataJson]() //Hold data for retreived data
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib.init(nibName: "PhotoCollectionViewCell", bundle: nil)
        photoCollectionView.register(nib, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        
        fetchData()
    }
    
    func fetchData() {
        let url = URL(string: "https://picsum.photos/list")
        URLSession.shared.dataTask(with: url!) {
            (data, response, error) in
            do {
                if error == nil {
                    self.arrayJson = try JSONDecoder().decode([DataJson].self, from: data!)
                    DispatchQueue.main.async {
                        self.photoCollectionView.reloadData()
                    }
                }
            } catch {
                print("error in fetching data")
            }
        }.resume()
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayJson.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        let imageURL = "https://picsum.photos/120/120?image=\(indexPath.row)"
        
        guard let url = URL(string: imageURL) else {
            return cell
        }
        UIImage.loadFrom(url: url) { image in
            if let image = image {
            cell.fetchImage(image: image)
            }
        }
        
        cell.fetchAuthorName(authorName: arrayJson[indexPath.row].author)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let detail : ImagePresenterViewController =  storyBoard.instantiateViewController(withIdentifier: "ImagePresenterViewController") as! ImagePresenterViewController
        
        detail.openURL = arrayJson[indexPath.row].author_url
        let imageurl = "https://picsum.photos/300/400?image=\(arrayJson[indexPath.row].id+1)"
        guard let url = URL(string: imageurl) else
        {
            return
        }
        UIImage.loadFrom(url: url) { image in
            detail.imageView.image = image
        }
        self.navigationController?.pushViewController(detail, animated: true)
    }
}


extension UIImage {
    
    public static func loadFrom(url: URL, completion: @escaping (_ image: UIImage?) -> ()) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
    
}
