//
//  ViewController.swift
//  parsingJSON
//
//  Created by Виталий Бобрик on 10.04.22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var typeAnimal: String!
    
    private  var cats: [Cats] = []
    private var dogs:Dogs?
    
    var animal: Animal!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = animal.rawValue
        
        getImage()
        
    }
    
    @IBAction func updateImageButton(_ sender: UIBarButtonItem) {
        getImage()
    }
    
}

extension ViewController{
    private func getImage() {
        guard let url = URL(string: animal == .dog ? Link.dogURL.rawValue : Link.catURL.rawValue) else {return}
       
        URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data else {
                print("Error: \(error?.localizedDescription ?? "No error description")")
                return
            }
            do {
                if self.animal == .cat {
                    self.cats = try JSONDecoder().decode([Cats].self, from: data)
                } else {
                    self.dogs = try JSONDecoder().decode(Dogs.self, from: data)
                }
                self.showImage()
            } catch let error {
                print("Error decoder: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    private func showImage() {
        var url: URL
        if self.animal == .cat {
            guard let url_ = URL(string: cats.first?.url ?? "") else { return}
            url = url_
        } else {
            guard let url_ = URL(string: dogs?.message ?? "") else {return}
            url = url_
        }
       
        URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data else {
                print("Error: \(error?.localizedDescription ?? "No error description")")
                return
            }
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
            
        }.resume()
    }
    
}


