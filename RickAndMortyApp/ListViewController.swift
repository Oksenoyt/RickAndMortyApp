//
//  ListViewController.swift
//  RickAndMortyApp
//
//  Created by Elenka on 04.09.2022.
//

import UIKit

class ListViewController: UITableViewController {

    let urlLink = "https://rickandmortyapi.com/api/character"
    var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchDataAboutCartoon(url: urlLink)
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as? CharacterViewCell else { return UITableViewCell() }
        let character = characters[indexPath.row]
        cell.configure(for: character)
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func fetchDataAboutCartoon(url: String) {
        NetworkManager.shared.fetch(Cartoon.self, from: url) { [weak self] result in
            switch result {
            case .success(let cartoon):
                let character = cartoon.results
                self?.characters = character
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
