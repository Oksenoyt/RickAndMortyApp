//
//  CharacterViewCell.swift
//  RickAndMortyApp
//
//  Created by Elenka on 04.09.2022.
//

import UIKit

class CharacterViewCell: UITableViewCell {

    @IBOutlet weak var characterName: UILabel!
    
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
    }

}
