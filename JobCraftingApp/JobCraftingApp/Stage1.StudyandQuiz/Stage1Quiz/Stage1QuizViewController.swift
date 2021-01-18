//
//  Stage1QuizViewController.swift
//  JobCraftingApp
//
//  Created by 小日浦　紗和 on 2021/01/18.
//

import UIKit

class Stage1QuizViewController: UIViewController {
    
    
    @IBOutlet weak var quizTitleLabel: UILabel!
    
    var csvArray: [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        csvArray = loadCSV(fileName: "quiz")
        print(csvArray)
        
    }

    // ボタンを押した時に呼ばれる
    @IBAction func btnAction(sender: UIButton){
        print(sender.tag)
    }
    
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
