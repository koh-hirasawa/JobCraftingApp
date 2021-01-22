//
//  Stage2VectorListViewController.swift
//  JobCraftingApp
//
//  Created by 小日浦　紗和 on 2021/01/21.
//

import UIKit



var vectorArray:[[String]] = [[],[],[]]

var item1 = "例：新しい人間関係を広げていきたい"
var item2 = "例：ちょっとしたスキマ時間に見たニュースを覚えていることが多い"
var item3 = "例：司令塔タイプが主人公のサッカー漫画が好き"

class Stage2VectorListViewController: UITableViewController, UITextFieldDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if item1 != "" {
            vectorArray[0].append(item1)
            vectorArray[1].append(item2)
            vectorArray[2].append(item3)
        }
        
        
        
        item1 = ""
        item2 = ""
        item3 = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.delVectorArray = vectorArray
    }

    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return vectorArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        
        switch section {
        case 0:
            label.text = "わたしの動機\n仕事を通じて得たいもの・なりたい自分"
            label.backgroundColor = .brown
            label.textColor = .white

        case 1:
            label.text = "わたしの強み\n持っているスキル・特技"
            label.backgroundColor = .blue
            label.textColor = .white
        case 2:
            label.text = "わたしの熱意\n興味関心があるもの・趣味"
            label.backgroundColor = .orange
            label.textColor = .black
        

        default:
            break
        }
        
        return label
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vectorArray[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VectorCell", for: indexPath)
        cell.textLabel?.text = vectorArray[indexPath.section][indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 14)
        cell.textLabel?.numberOfLines = 0
        return cell
    }

   
    
    
    @IBAction func addVectorButtonAction(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController(title: "あなたの動機、強み、熱意を入力", message: "仕事で得たいものや、生かしたいスキル、仕事関係なく興味関心があるものを書き出しましょう　\nできるだけ具体的に書くことが大切です", preferredStyle: .alert)
        let motiveAction = UIAlertAction(title: "わたしの動機に追加", style: .default){(action) in
            let newvector = textField.text!
            vectorArray[0].append(newvector)
            self.tableView.reloadData()
            
        }
        
        let strengthAction = UIAlertAction(title: "わたしの強みに追加", style: .default){(action) in
            let newvector = textField.text!
            vectorArray[1].append(newvector)
            self.tableView.reloadData()
            
        }
        
        let passionAction = UIAlertAction(title: "わたしの熱意に追加", style: .default){(action) in
            let newvector = textField.text!
            vectorArray[2].append(newvector)
            self.tableView.reloadData()
            
        }
        let cancelAction
                    = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addTextField{(alertTextField)in
            alertTextField.placeholder = "関係なさそうなことでも書き出すことがコツです"
            textField = alertTextField
            textField.returnKeyType = .done
        }
        alert.addAction(motiveAction)
        alert.addAction(strengthAction)
        alert.addAction(passionAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
        
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
        vectorArray[indexPath.section].remove(at: indexPath.row)
            let indexPaths = [indexPath]
            tableView.deleteRows(at: indexPaths, with: .automatic)
        }
   


}
