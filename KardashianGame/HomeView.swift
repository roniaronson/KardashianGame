//
//  ViewController.swift
//  KardashianGame
//
//  Created by user216464 on 5/18/22.
//
import UIKit

class HomeView: UIViewController {

    @IBOutlet weak var Home_BTN_play: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 253/255, green: 246/255, blue: 236/255, alpha: 1)
        self.Home_BTN_play.tintColor = UIColor(red: 199/255, green: 171/255, blue: 113/255, alpha: 1)
        // Do any additional setup after loading the view.
    }
    @IBAction func start(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "game") as! GameView
        present(vc, animated: true)
        
    
    }

}



