//
//  Stage2TaskListViewController.swift
//  JobCraftingApp
//
//  Created by 小日浦　紗和 on 2021/01/21.
//

import UIKit




class Stage2TaskListViewController: UITableViewController,UITextFieldDelegate {
    
    class Item{
        let title: String
        var craft: String = ""
        var done: Bool = false
        
        init(title: String) {
            self.title = title
        }
        
    }

    var itemArray: [[Item]] = [[],[],[],[]]
   
    
    var sendTitle = ""
    var sendRow = 0
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1: Item = Item(title: "右上の＋から仕事のモヤモヤを追加する")
        let item2: Item = Item(title: "右下の「わたしの軸」タブから自分を見つめる")
        let item3: Item = Item(title: "モヤモヤリストをタップしてジョブクラフティングする")
        
        itemArray[0].append(item1)
        itemArray[0].append(item2)
        itemArray[0].append(item3)
        
        
        
    }
    
    

    // MARK: - Table view data source
    
    

    //見出しの数
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return 0
        }else{
            return 50
        }
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 16)
        
        switch section {

        case 1:
            label.text = "タスクの工夫で解決しよう！"
            label.backgroundColor = .red
            label.textColor = .white
        case 2:
            label.text = "認知の工夫で解決しよう！"
            label.backgroundColor = .cyan
            label.textColor = .black
        case 3:
            label.text = "人間関係の工夫で解決しよう！"
            label.backgroundColor = .yellow
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
        return itemArray[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.section][indexPath.row].title
        cell.textLabel?.font = .systemFont(ofSize: 14)
        cell.textLabel?.numberOfLines = 0
        cell.accessoryType = itemArray[indexPath.section][indexPath.row].done ? .checkmark : .none
        
        if indexPath.section == 1 || indexPath.section == 2 || indexPath.section == 3{
            cell.textLabel?.text = (cell.textLabel?.text)!  + "\n　→→工夫:" + itemArray[indexPath.section][indexPath.row].craft
        }
        
        return cell
    }
    
    
    @IBAction func addTaskButtonAction(_ sender: Any) {
        var textField = UITextField()
        let alert = UIAlertController(title: "仕事上のモヤモヤを追加", message: "仕事で困っていることや、普段何気なくやっている仕事をできるだけ具体的に書いてください", preferredStyle: .alert)
        let action = UIAlertAction(title: "リストに追加", style: .default){(action) in
            let newItem:Item = Item(title: textField.text!)
            self.itemArray[0].append(newItem)
            self.tableView.reloadData()
            
        }
        let cancelAction
                    = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addTextField{(alertTextField)in
            alertTextField.placeholder = "仕事の内容or困っていること"
            textField = alertTextField
            textField.delegate = self
            textField.returnKeyType = .done
            
        }
        
        
        alert.addAction(action)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            //            別タブで入力した3つの軸のtableviewを見ながら解決法を入力する画面（セグエで遷移）
            sendTitle = itemArray[indexPath.section][indexPath.row].title
            sendRow = indexPath.row
            
            self.performSegue(withIdentifier: "CraftingSegue", sender: self)
            
            
        }else{
//           クラフティング済みのものはチェックマーク機能
            let item = itemArray[indexPath.section][indexPath.row]
                    
                   
                    item.done = !item.done
                    
                    
                    self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as! UINavigationController
        let nextVC = nav.topViewController as! AddCraftingViewController
        nextVC.craftTitle = sendTitle
        nextVC.rowData = sendRow
    }
    
    
    
//    ジョブクラフティング画面から帰ってきた時に、押されたボタンによって行き先が変わる処理
    @IBAction func taskCraft(segue: UIStoryboardSegue){
        let crafting = segue.source as! AddCraftingViewController
        itemArray[0][crafting.rowData].craft = crafting.craftingTextField.text!
        let craftedJob: Item = itemArray[0][crafting.rowData]
        itemArray[1].append(craftedJob)
        itemArray[0].remove(at: crafting.rowData)
    }
    
    @IBAction func cognitiveCraft(segue: UIStoryboardSegue){
        let crafting = segue.source as! AddCraftingViewController
        itemArray[0][crafting.rowData].craft = crafting.craftingTextField.text!
        let craftedJob: Item = itemArray[0][crafting.rowData]
        itemArray[2].append(craftedJob)
        itemArray[0].remove(at: crafting.rowData)
    }
    
    @IBAction func relationshipCraft(segue: UIStoryboardSegue){
        let crafting = segue.source as! AddCraftingViewController
        itemArray[0][crafting.rowData].craft = crafting.craftingTextField.text!
        let craftedJob: Item = itemArray[0][crafting.rowData]
        itemArray[3].append(craftedJob)
        itemArray[0].remove(at: crafting.rowData)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
//    消去機能
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
        itemArray[indexPath.section].remove(at: indexPath.row)
            let indexPaths = [indexPath]
            tableView.deleteRows(at: indexPaths, with: .automatic)
        }
   

}
