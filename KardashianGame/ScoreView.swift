//
//  ScoreView.swift
//  KardashianGame
//
//  Created by user216464 on 5/22/22.
//

import UIKit

class ScoreView: UIViewController {
    
    @IBOutlet weak var Score_LBL_score: UILabel!
    
    @IBOutlet weak var Score_IMG_star1: UIImageView!
    
    @IBOutlet weak var Score_IMG_star2: UIImageView!
    
    @IBOutlet weak var Score_IMG_star3: UIImageView!
    
    @IBOutlet weak var Score_IMG_star4: UIImageView!
    
    @IBOutlet weak var Score_IMG_star5: UIImageView!
    
    
    
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 253/255, green: 246/255, blue: 236/255, alpha: 1)
        updateScoreLBL();
        updateStars();
    }
    
    func updateScoreLBL(){
        self.Score_LBL_score.text = "\(score)"
    }
    
    func updateStars(){
        self.Score_IMG_star1.isHidden = true
        self.Score_IMG_star2.isHidden = true
        self.Score_IMG_star3.isHidden = true
        self.Score_IMG_star4.isHidden = true
        self.Score_IMG_star5.isHidden = true
        if(self.score > 0){
            self.Score_IMG_star1.isHidden = false
        }
        if(self.score > 370 ){
            self.Score_IMG_star2.isHidden = false
        }
        if(self.score > 740){
            self.Score_IMG_star3.isHidden = false
        }
        if(self.score > 1110){
            self.Score_IMG_star4.isHidden = false
        }
        if(self.score > 1480){
            self.Score_IMG_star5.isHidden = false
        }
    }
    
    @IBAction func TryAgain(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "game") as! GameView
        present(vc, animated: true)
        
    }
    


}
