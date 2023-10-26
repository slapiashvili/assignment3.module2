//
//  ViewController.swift
//  assignment3.module2
//
//  Created by Salome Lapiashvili on 26.10.23.
//

import UIKit

struct Coffee {
    var productName: String
    var description: String
    var price: Double
    var image: UIImage
    var sizes: [String]
    var rating: Double
    var reviewCount: Int
}

final class ViewController: UIViewController {
    
    @IBOutlet weak var coffeeImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productSubNameLabel: UILabel!
    @IBOutlet weak var productRatingLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var priceDollarsLabel: UILabel!
    @IBOutlet weak var sizeSButton: UIButton!
    @IBOutlet weak var sizeMButton: UIButton!
    @IBOutlet weak var sizeLButton: UIButton!
    @IBOutlet weak var buyButton: UIButton!
    
    var coffee: Coffee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coffee = Coffee(productName: "Cappuccino",
                        description: "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85 ml of fresh milk",
                        price: 4.53,
                        image: UIImage(named: "Rectangle 1706") ?? UIImage(),
                        sizes: ["S", "M", "L"],
                        rating: 4.8,
                        reviewCount: 230)
        
        setup()
    }
    
    func setup() {
        guard let coffeeData = coffee else { return }
        
        coffeeImageView.image = coffeeData.image
        coffeeImageView.layer.cornerRadius = 20
        coffeeImageView.clipsToBounds = true
        
        productNameLabel.text = coffeeData.productName
        productSubNameLabel.text = "with Chocolate"
        
        productDescriptionLabel.text = coffeeData.description
        productDescriptionLabel.numberOfLines = 3
        productDescriptionLabel.lineBreakMode = .byTruncatingTail
        
        priceDollarsLabel.text = "$\(String(format: "%.2f", coffeeData.price))"
        
        productNameLabel.font = UIFont.systemFont(ofSize: 26, weight: .bold)
        productSubNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        productDescriptionLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        priceDollarsLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        productRatingLabel.text = "\(coffeeData.rating) (\(coffeeData.reviewCount))"
        
        sizeSButton.setTitle("S", for: .normal)
        sizeMButton.setTitle("M", for: .normal)
        sizeLButton.setTitle("L", for: .normal)
        
        sizeSButton.layer.cornerRadius = 15
        sizeMButton.layer.cornerRadius = 15
        sizeLButton.layer.cornerRadius = 15
        
        sizeMButton.backgroundColor = UIColor.systemOrange
        sizeSButton.backgroundColor = UIColor.clear
        sizeLButton.backgroundColor = UIColor.clear
        
        buyButton.setTitle("Buy Now", for: .normal)
        buyButton.backgroundColor = UIColor.systemOrange
        buyButton.layer.cornerRadius = 25
        buyButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    
    @IBAction func sizeSButtonTapped(_ sender: UIButton) {
        resetSizeButtonColors()
        sizeSButton.backgroundColor = UIColor.systemOrange
    }

    @IBAction func sizeMButtonTapped(_ sender: UIButton) {
        resetSizeButtonColors()
        sizeMButton.backgroundColor = UIColor.systemOrange
    }

    @IBAction func sizeLButtonTapped(_ sender: UIButton) {
        resetSizeButtonColors()
        sizeLButton.backgroundColor = UIColor.systemOrange
    }

    func resetSizeButtonColors() {
        sizeSButton.backgroundColor = UIColor.clear
        sizeMButton.backgroundColor = UIColor.clear
        sizeLButton.backgroundColor = UIColor.clear
    }
}



