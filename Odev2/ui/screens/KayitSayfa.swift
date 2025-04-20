//
//  KayitSayfa.swift
//  Odev2
//
//  Created by Şakir Yılmaz ÖĞÜT on 20.04.2025.
//

import UIKit

class KayitSayfa: UIViewController {
    @IBOutlet weak var tfYapilacak: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonKaydet(_ sender: UIButton) {
        if let yapilacak = tfYapilacak.text {
            kaydet(name: yapilacak)
        }
    }
    
    func kaydet(name: String) {
        print("Yapılacak Kaydet: \(name)")
    }
}
