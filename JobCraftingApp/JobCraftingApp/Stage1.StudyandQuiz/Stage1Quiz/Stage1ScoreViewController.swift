//
//  Stage1ScoreViewController.swift
//  JobCraftingApp
//
//  Created by 小日浦　紗和 on 2021/01/18.
//

import UIKit

class Stage1ScoreViewController: UIViewController {
    
    var correct = 0
    var finalCheck = ""
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var finalTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        if correct == 4 {
            scoreLabel.text = "全問正解！　\n\n クリア！"
        }else{
            scoreLabel.text = "\(correct)問正解!"
        }
        
        finalTextView.text = finalCheck
        
        
        
    }
    

    @IBAction func toMenuButton(_ sender: Any) {
        
        

        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
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
