//
//  gameView.swift
//  KardashianGame
//
//  Created by user216464 on 5/18/22.
//

import UIKit
import Kingfisher

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
    @IBOutlet weak var Game_LBL_score: UILabel!
    
    @IBOutlet weak var Game_LBL_gameCounter: UILabel!
    @IBOutlet weak var Game_view_QA: UIView!
    
    @IBOutlet weak var Game_View_image: UIView!
    var lives: Int = 3
    var gameCounter: Int = 0
    var timer = Timer();
    let imagesURL = ["https://www.biography.com/.image/t_share/MTQyMDA0NTYwNjE1OTczOTUw/gettyimages-524690236jpg.jpg", "https://static.onecms.io/wp-content/uploads/sites/20/2021/12/17/chicago-west-2.jpg", "https://akns-images.eonline.com/eol_images/Entire_Site/2022412/rs_634x1024-220512141819-634--Kendall-Jenner.jpg?fit=around%7C634:1024&output-quality=90&crop=634:1024;center,top", "https://www.hola.com/us/images/026c-13168caefd1f-f4e25ee44e18-1000/horizontal-1200/khloe-kardashian.jpg", "https://upload.wikimedia.org/wikipedia/commons/thumb/0/08/President_Trump_Meets_with_Sentencing_Commutation_Recipients_%2849624188912%29_%28cropped%29.jpg/800px-President_Trump_Meets_with_Sentencing_Commutation_Recipients_%2849624188912%29_%28cropped%29.jpg", "https://static.onecms.io/wp-content/uploads/sites/20/2022/05/14/kourtney-kardashian-2000.jpg", "https://www.hola.com/us/images/0267-11e256338a38-49bc2deb71a4-1000/horizontal-1200/tom-ford-aw20-show-arrivals.jpg", "https://upload.wikimedia.org/wikipedia/commons/6/65/Kylie_Jenner_in_2021.jpg", "https://akns-images.eonline.com/eol_images/Entire_Site/2021124/rs_1200x1200-210224081509-psalm-west-instagram-ac2.jpg?fit=around%7C1200:1200&output-quality=90&crop=1200:1200;center,top", "https://akns-images.eonline.com/eol_images/Entire_Site/2020104/rs_1200x1200-201104112159-1200-reign-emd-102820.jpg?fit=around%7C1200:1200&output-quality=90&crop=1200:1200;center,top", "https://www.rollingstone.com/wp-content/uploads/2022/04/rob-kardashian.jpg?resize=1800,1200&w=1800", "https://www.the-sun.com/wp-content/uploads/sites/6/2022/05/050dc7ee-3cab-4475-8c94-6edb52d6d1b3.jpg", "https://akns-images.eonline.com/eol_images/Entire_Site/2020127/rs_600x600-200227072221-600-stormi-webster-kylie-jenner-instagram-cjh-022620.jpg?fit=around%7C1200:1200&output-quality=90&crop=1200:1200;center,top", "https://www.lifeandstylemag.com/wp-content/uploads/2021/04/True-Thompson-Cutest-Photos-4.jpg?crop=59px%2C60px%2C984px%2C558px&resize=940%2C529&quality=86&strip=all", "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTU0OTkwNDUxOTQ5MDUzNDQ3/kanye-west-attends-the-christian-dior-show-as-part-of-the-paris-fashion-week-womenswear-fall-winter-2015-2016-on-march-6-2015-in-paris-france-photo-by-dominique-charriau-wireimage-square.jpg"]
    let answers = ["Caitlyn Jenner", "Chicago West", "Kendall Jenner", "Khloe Kardashian", "Kim Kardashian", "Kourtney Kardashian", "Kris Jenner", "Kylie Jenner", "Psalm West", "Reign Disick", "Rob Kardashian", "Scott Disick", "Stormi Webster", "True Thompson", "Kanye West"]
    let options = [0,1,2,3]
    var correctAnswerBTN: Int = Int.random(in: 0..<4)
    var score: Int = 0
    var timer2 = Timer();
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 253/255, green: 246/255, blue: 236/255, alpha: 1)
        self.Game_view_QA.backgroundColor = UIColor(red: 253/255, green: 246/255, blue: 236/255, alpha: 1)
        self.Game_View_image.backgroundColor = UIColor(red: 253/255, green: 246/255, blue: 236/255, alpha: 1)
        self.loadQuestion(self.gameCounter);
        
    }
   
    func loadQuestion(_ number: Int ){
        
        self.Game_LBL_gameCounter.text = "\(gameCounter+1)/15"
        self.correctAnswerBTN = Int.random(in: 0..<4)
        var nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14]
        if let index = nums.firstIndex(of: number){
            nums.remove(at: index)
        }
       
        let url:URL = URL(string: self.imagesURL[number])!
        self.Game_IMG_image.kf.setImage(with: url)
       
        
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
        startGame();
        
    }
    
    func startGame(){
        var counter: Int = 0
        Game_PV_progress.setProgress(0, animated: false)
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1,repeats: true , block: { [self]_ in

            counter = counter + 1
            self.Game_PV_progress.setProgress(Float(counter)/10, animated: true)
            
            if(counter == 10){
                self.timer.invalidate(); //Stops timer
                wrongAnswer();
                self.showResults(self.correctAnswerBTN);
                
            }
        })
    }
    
    func showResults(_ correctAnswerBTN : Int) {
    
        if(correctAnswerBTN == 0){
            Game_BTN_answer1.tintColor = UIColor.green
        }
        else{
            Game_BTN_answer1.tintColor = UIColor.red
            
        }
        if(correctAnswerBTN == 1){
            Game_BTN_answer2.tintColor = UIColor.green
        }
        else{
            Game_BTN_answer2.tintColor = UIColor.red
            
        }
        if(correctAnswerBTN == 2){
            Game_BTN_answer3.tintColor = UIColor.green
        }
        else{
            Game_BTN_answer3.tintColor = UIColor.red
            
        }
        if(correctAnswerBTN == 3){
            Game_BTN_answer4.tintColor = UIColor.green
        }
        else{
            Game_BTN_answer4.tintColor = UIColor.red
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.goToTheNextQuestion();
            
        }
        

    }
   
    func goToTheNextQuestion(){
        self.gameCounter += 1
        if(self.gameCounter < 15){
            self.clear();
            self.loadQuestion(self.gameCounter);
        }
        else{
            exit();
        }
    }
    func clear(){
        Game_BTN_answer1.tintColor = UIColor(red: 199/255, green: 171/255, blue: 113/255, alpha: 1)
        Game_BTN_answer2.tintColor = UIColor(red: 199/255, green: 171/255, blue: 113/255, alpha: 1)
        Game_BTN_answer3.tintColor = UIColor(red: 199/255, green: 171/255, blue: 113/255, alpha: 1)
        Game_BTN_answer4.tintColor = UIColor(red: 199/255, green: 171/255, blue: 113/255, alpha: 1)
        
    }
    
    func exit(){
        let vc = storyboard?.instantiateViewController(withIdentifier: "score") as! ScoreView
        vc.score = self.score
        present(vc, animated: true)
        
        
    }
    
    @IBAction func onClickBTN1(_ sender: UIButton) {
        self.timer.invalidate();
        showResults(correctAnswerBTN)
        if(self.correctAnswerBTN == 0){

            updateScore()
        }
        else{
            wrongAnswer();
        }
    }
    
    @IBAction func onClickBTN2(_ sender: UIButton) {
        self.timer.invalidate();
        showResults(correctAnswerBTN)
        if(self.correctAnswerBTN == 1){
            updateScore()
        }
        else{
            wrongAnswer();
        }    }
    
    @IBAction func onClickBTN3(_ sender: UIButton) {
        self.timer.invalidate();
        showResults(correctAnswerBTN)
        if(self.correctAnswerBTN == 2){
            updateScore()
        }
        else{
            wrongAnswer();
        }    }
    
    @IBAction func onClickBTN4(_ sender: UIButton) {
        self.timer.invalidate();
        showResults(correctAnswerBTN)
        if(self.correctAnswerBTN == 3){
            updateScore()
        }
        else{
            wrongAnswer();
        }    }
    
    func wrongAnswer(){
        self.lives -= 1
        if(self.lives == 2){
            self.Game_IMG_heart3.isHidden = true
        }
        if(self.lives == 1){
            self.Game_IMG_heart2.isHidden = true
        }
        if(self.lives == 0){
            self.Game_IMG_heart1.isHidden = true
        }
        if(self.lives == -1){
            exit();
        }
    }
    
    
    
    
    
    func updateScore(){
        if(self.gameCounter < 5){
            self.score += 100
        }
        if(self.gameCounter < 10 && self.gameCounter > 4){
            self.score += 150
        }
        if(self.gameCounter < 15 && self.gameCounter > 9){
            self.score += 200
        }
        self.Game_LBL_score.text = "\(score)"
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
    

