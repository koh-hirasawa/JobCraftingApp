//
//  AddCraftingViewController.swift
//  JobCraftingApp
//
//  Created by 小日浦　紗和 on 2021/01/21.
//

import UIKit





class AddCraftingViewController: UIViewController,UITabBarDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    var vectorArrey:[[String]] = [[],[],[]]
    
    var craftTitle = ""
    var rowData = 0
   
    @IBOutlet weak var craftTitleTextView: UITextView!
    @IBOutlet weak var craftingTextField: UITextField!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let delegate = UIApplication.shared.delegate as! AppDelegate
        vectorArrey = delegate.delVectorArray
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.craftingTextField.delegate = self
        self.craftTitleTextView.text = "「\(craftTitle)」と下の「わたしの軸」をつなげて具体的な解決策を書き出してみましょう"
        self.craftingTextField.returnKeyType = .done
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        craftingTextField.resignFirstResponder()
        return true
    }
    
    
   func numberOfSections(in tableView: UITableView) -> Int {
        
    return vectorArrey.count
    }
    
    private func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return 30
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var label = ""
        switch section {
        case 0:
            label = "わたしの動機\n仕事を通じて得たいもの・なりたい自分"
        case 1:
            label = "わたしの強み\n持っているスキル・特技"
        case 2:
            label = "わたしの情熱\n興味関心があるもの・趣味"
        default:
            break
        }
        return label
    }
    
   
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vectorArray[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShowVectorCell", for: indexPath)
        cell.textLabel?.text = vectorArray[indexPath.section][indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 12)
        cell.textLabel?.numberOfLines = 0
        return cell
    }


    @IBAction func cancelButtonAction(_ sender: Any) {
        print(rowData)
        dismiss(animated: true, completion: nil)
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
