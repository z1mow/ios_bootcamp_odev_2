//
//  DetaySayfa.swift
//  Odev2
//
//  Created by Şakir Yılmaz ÖĞÜT on 20.04.2025.
//

import UIKit

class DetaySayfa: UIViewController {

    @IBOutlet weak var tfYapilacak: UITextField!
    
    var toDo: ToDos?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let tempToDo = toDo {
            tfYapilacak.text = tempToDo.name
        }
    }
    
    @IBAction func buttonGuncelle(_ sender: UIButton) {
        if let yapilacak = tfYapilacak.text, let tempToDo = toDo {
            guncelle(id: tempToDo.id!, name: yapilacak)
        }
        
        func guncelle(id: Int, name: String) {
            print("Yapılacak Güncelle : \(id) - \(name)")
        }
        
    }
    
}
