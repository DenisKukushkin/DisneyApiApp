//
//  TableViewCell.swift
//  DisneyApiApp
//
//  Created by Denis Kukushkin on 07.12.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroImageView: UIImageView! {
        didSet {
            heroImageView.contentMode = .scaleAspectFit
            heroImageView.clipsToBounds = true
            heroImageView.layer.cornerRadius = heroImageView.frame.height / 2
            heroImageView.backgroundColor = .gray
        }
    }
    
    
    func configure(with disneyHero: DisneyHero?) {
        heroNameLabel.text = disneyHero?.name
        DispatchQueue.global().async {
            guard let imageData = ImageManager.shared.fetchImage(from: disneyHero?.imageUrl) else { return }
            DispatchQueue.main.async {
                self.heroImageView.image = UIImage(data: imageData)
            }
            
        }
    }
}



