//
//  CharacterViewCell.swift
//  RickAndMortyApp
//
//  Created by Elenka on 04.09.2022.
//

import UIKit

class CharacterViewCell: UITableViewCell {

    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterPhoto: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(for character: Character) {
        characterName.text = character.name
        fetchImage(url: character.image)
    }
    
    private func fetchImage(url: String) {
        NetworkManager.shared.fetchImage(from: url) { [weak self] result in
            switch result {
            case .success(let photo):
                DispatchQueue.main.async {
                    self?.characterPhoto.image = UIImage(data: photo)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
