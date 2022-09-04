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
        fetchEpisods()
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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

extension ListViewController {
    private func fetchEpisods() {
        guard let url = URL(string: urlLink) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "Nothing")
                return
            }
            
            do {
                let cartoon = try JSONDecoder().decode(Cartoon.self, from: data)
                DispatchQueue.main.async {
                    self.characters = cartoon.results
                    self.tableView.reloadData()
                    print(self.characters.count)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
