//
//  ViewController.swift
//  JobCraftingApp
//
//  Created by 小日浦　紗和 on 2021/01/11.
//

import UIKit

private let mainTitle = [
    "Stage0: はじめに",
    "Stage1: ジョブクラフティング入門編",
    "Stage2: ジョブクラフティング実践編"
    

]


class ViewController: UIViewController {
    
    private let mainCellId = "mainCellId"
    
    
    
    
    
    @IBOutlet weak var mainTableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
        
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableView.dequeueReusableCell(withIdentifier: mainCellId, for: indexPath)
        cell.textLabel?.text = mainTitle[indexPath.row]
        cell.textLabel?.font = .systemFont(ofSize: 16)
        return cell
    }
    
    
//    画面遷移、Stage0を追加する必要あり
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
//        case 0:
//            <#code#>
        case 1:
            let storyboard = UIStoryboard.init(name: "Stage1List", bundle: nil)
            let stage1ViewController = storyboard.instantiateViewController(withIdentifier: "Stage1ListViewController")
            navigationController?.pushViewController(stage1ViewController, animated: true)
            
        case 2:
            let storyboard = UIStoryboard.init(name: "Stage2List", bundle: nil)
            let stage2ViewController = storyboard.instantiateViewController(withIdentifier: "Stage2ListViewController")
            navigationController?.pushViewController(stage2ViewController, animated: true)
            
        default:
            break
        }
        
        
       
    }
    
    
    
}

