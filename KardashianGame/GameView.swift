//
//  gameView.swift
//  KardashianGame
//
//  Created by user216464 on 5/18/22.
//

import UIKit

class GameView: UIViewController {

    @IBOutlet weak var Game_PV_progress: UIProgressView!
    @IBOutlet weak var Game_IMG_heart1: UIImageView!
    @IBOutlet weak var Game_IMG_heart2: UIImageView!
    @IBOutlet weak var Game_IMG_heart3: UIImageView!
    @IBOutlet weak var Game_IMG_image: UIImageView!
    @IBOutlet weak var Game_BTN_answer1: UIButton!
    @IBOutlet weak var Game_BTN_answer2: UIButton!
    @IBOutlet weak var Game_BTN_answer3: UIButton!
    @IBOutlet weak var Game_BTN_answer4: UIButton!
    
    
    var lives: Int = 3
    var gameCounter: Int = 0
    var timer = Timer();
    let images = [#imageLiteral(resourceName: "caitlyn"), #imageLiteral(resourceName: "chicago"), #imageLiteral(resourceName: "kendall"), #imageLiteral(resourceName: "khloe"), #imageLiteral(resourceName: "kim"), #imageLiteral(resourceName: "kourtney"), #imageLiteral(resourceName: "kris"), #imageLiteral(resourceName: "kylie"), #imageLiteral(resourceName: "psalm"), #imageLiteral(resourceName: "reign"), #imageLiteral(resourceName: "rob"), #imageLiteral(resourceName: "scott"), #imageLiteral(resourceName: "stormi"), #imageLiteral(resourceName: "true"), #imageLiteral(resourceName: "ye")]
    let answers = ["Caitlyn Jenner", "Chicago West", "Kendall Jenner", "Khloe Kardashian", "Kim Kardashian", "Kourtney Kardashian", "Kris Jenner", "Kylie Jenner", "Psalm West", "Reign Disick", "Rob Kardashian", "Scott Disick", "Stormi Webster", "True Thompson", "Kanye West"]
    let options = [0,1,2,3]

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.timer = Timer.scheduledTimer(withTimeInterval: 2,repeats: true , block: {_ in
            self.loadQuestion(self.gameCounter);
            self.gameCounter += 1
            
            if self.gameCounter == 15{
                self.timer.invalidate(); //Stops timer
                
            }
        })
    }
    
    func loadQuestion(_ number: Int ){
        
        var nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]
        if let index = nums.firstIndex(of: number){
            nums.remove(at: index)
        }
        
        Game_IMG_image.image = images[number]
        var correctAnswerBTN: Int = Int.random(in: 0..<4)
        
        if(correctAnswerBTN == 0){
            Game_BTN_answer1.setTitle(answers[number], for: .normal)
        }
        else{
            var ran: Int = 0
            ran = nums.randomElement()!
            Game_BTN_answer1.setTitle(answers[ran], for: .normal)
            if let index = nums.firstIndex(of: ran){
                nums.remove(at: index)
            }
        }
        if(correctAnswerBTN == 1){
            Game_BTN_answer2.setTitle(answers[number], for: .normal)
        }
        else{
            var ran: Int = 0
            ran = nums.randomElement()!
            Game_BTN_answer2.setTitle(answers[ran], for: .normal)
            if let index = nums.firstIndex(of: ran){
                nums.remove(at: index)
            }
        }
        if(correctAnswerBTN == 2){
            Game_BTN_answer3.setTitle(answers[number], for: .normal)
        }
        else{
            var ran: Int = 0
            ran = nums.randomElement()!
            Game_BTN_answer3.setTitle(answers[ran], for: .normal)
            if let index = nums.firstIndex(of: ran){
                nums.remove(at: index)
            }
        }
        if(correctAnswerBTN == 3){
            Game_BTN_answer4.setTitle(answers[number], for: .normal)
        }
        else{
            var ran: Int = 0
            ran = nums.randomElement()!
            Game_BTN_answer4.setTitle(answers[ran], for: .normal)
            if let index = nums.firstIndex(of: ran){
                nums.remove(at: index)
            }
        }
    }
}
