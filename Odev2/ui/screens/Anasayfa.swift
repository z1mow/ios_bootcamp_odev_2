//
//  Anasayfa.swift
//  Odev2
//
//  Created by Şakir Yılmaz ÖĞÜT on 18.04.2025.
//

import UIKit

class Anasayfa: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var toDosTableView: UITableView!
    var toDoListesi = [ToDos]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        toDosTableView.delegate = self
        toDosTableView.dataSource = self
        
        let t1 = ToDos(id: 1, name: "Ödev 2'yi Yap")
        let t2 = ToDos(id: 2, name: "Bootcamp'i Başarıyla Tamamla")
        let t3 = ToDos(id: 3, name: "İş Bul")
        toDoListesi.append(t1)
        toDoListesi.append(t2)
        toDoListesi.append(t3)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let toDo = sender as? ToDos {
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.toDo = toDo
            }
        }
    }

}

extension Anasayfa: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Yapılacak Ara: \(searchText)")
    }
}

extension Anasayfa: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let hucre = tableView.dequeueReusableCell(withIdentifier: "toDosHucre") as! ToDosHucre
        
        let toDo = toDoListesi[indexPath.row]
        hucre.toDoLabel.text = toDo.name
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDoListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: toDo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

