//
//  Stage1QuizViewController.swift
//  JobCraftingApp
//
//  Created by 小日浦　紗和 on 2021/01/18.
//

import UIKit

class Stage1QuizViewController: UIViewController {
    
    @IBOutlet weak var quizTitleLabel: UILabel!
    @IBOutlet weak var quizTextView: UITextView!

    
    
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    
    @IBOutlet weak var nextQuizButton: UIButton!
    
    
    @IBOutlet weak var judgImageView: UIImageView!
    
    
    var csvArray: [String] = []
    
    var quizArray: [String] = []
    var quizCount = 0
    
    
    
    var quizSelect: Int!
    var quizSet = 0

    var correctCount = 0
    
    func loadCSV(fileName: String) -> [String] {
        
        
        let csvBundle = Bundle.main.path(forResource: fileName, ofType: "csv")!
        do {
            let csvData = try String(contentsOfFile: csvBundle,encoding: String.Encoding.utf8)
            let lineChange = csvData.replacingOccurrences(of: "\r", with: "\n")
            csvArray = lineChange.components(separatedBy: "\n")
            csvArray.removeLast()
            
        } catch {
            print("エラー")
        }
        return csvArray
    }
    
    
    
    
    
    
//    1問目作成
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        quizSet = delegate.quiz1set
        quizSelect = delegate.quiz1Select
        
        nextQuizButton.isEnabled = false
        nextQuizButton.isHidden = true
       
        
        
        quizCount = 0
        correctCount = 0
        
        csvArray = loadCSV(fileName: "quiz")

        
        quizArray = csvArray[quizSelect].components(separatedBy: ",")
        quizArray[0] = quizArray[0].replacingOccurrences(of: "　", with: "\n")
        quizArray[5] = quizArray[5].replacingOccurrences(of: "　", with: "\n")
       
        
        
        quizTitleLabel.text = "第\(quizCount + 1)問"
        quizTextView.text = quizArray[0]
        answerButton1.setTitle(quizArray[2], for: .normal)
        answerButton2.setTitle(quizArray[3], for: .normal)
        answerButton3.setTitle(quizArray[4], for: .normal)
        
    }
    
    

   
    

    // ボタンを押した時に呼ばれる
    @IBAction func btnAction(sender: UIButton){
        if sender.tag == Int(quizArray[1]){
            correctCount += 1
            judgImageView.image = UIImage(named: "correct")
        }else{
            judgImageView.image = UIImage(named: "incorrect")
        }
        judgImageView.isHidden = false
        answerButton1.isEnabled = false
        answerButton2.isEnabled = false
        answerButton3.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.judgImageView.isHidden = true
           
            self.correctAnswer()
        }
    }
    
    
    //正解と解説を表示する関数
    func correctAnswer(){
       
       
        quizTextView.text = quizArray[5]
       
        
        answerButton1.isHidden = true
        answerButton2.isHidden = true
        answerButton3.isHidden = true
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.nextQuizButton.isEnabled = true
            self.nextQuizButton.isHidden = false
        }
        
    }
    
    
    @IBAction func nextQuizButtonAction(_ sender: Any) {
        nextQuiz()
    }
    
    
    func nextQuiz() {
        
        nextQuizButton.isEnabled = false
        nextQuizButton.isHidden = true
      
        
        answerButton1.isHidden = false
        answerButton2.isHidden = false
        answerButton3.isHidden = false
        
        answerButton1.isEnabled = true
        answerButton2.isEnabled = true
        answerButton3.isEnabled = true
        
        quizCount += 1
        quizSelect += 1
        
        if quizCount < quizSet {
            quizArray = csvArray[quizSelect].components(separatedBy: ",")
            quizArray[0] = quizArray[0].replacingOccurrences(of: "　", with: "\n")
            quizArray[5] = quizArray[5].replacingOccurrences(of: "　", with: "\n")
            
            quizTitleLabel.text = "第\(quizCount + 1)問"
            quizTextView.text = quizArray[0]
            answerButton1.setTitle(quizArray[2], for: .normal)
            answerButton2.setTitle(quizArray[3], for: .normal)
            answerButton3.setTitle(quizArray[4], for: .normal)
        }else{
     //       スコア画面に遷移するセグエを踏む
            performSegue(withIdentifier: "toScoreVC", sender: nil)
        }
        
    }
    
    // セグエで移動する際に値を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scoreVC = segue.destination as! Stage1ScoreViewController
        scoreVC.correct = correctCount
        scoreVC.finalCheck = quizArray[6].replacingOccurrences(of: "　", with: "\n")
    }
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
