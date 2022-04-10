//
//  ImagesViewController.swift
//  parsingJSON
//
//  Created by Виталий Бобрик on 10.04.22.
//

import UIKit

class ImagesViewController: UIViewController {

    @IBOutlet var catImageView: UIImageView!
    @IBOutlet var dogImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        catImageView.image = UIImage(named: "cat")
        dogImageView.image = UIImage(named: "dog")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard let imageVC = segue.destination as? ViewController else {return}
        guard let button = sender as? UIButton else {return}
        imageVC.typeAnimal = button.tag == 0 ? "Cat" : "Dog"
        imageVC.animal = button.tag == 0 ? Animal.cat : Animal.dog
    }

}
