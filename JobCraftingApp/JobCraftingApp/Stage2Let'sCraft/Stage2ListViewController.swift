//
//  Stage2ListViewController.swift
//  JobCraftingApp
//
//  Created by 小日浦　紗和 on 2021/01/18.
//

import UIKit

private let stage2Menu = ["使い方","ジョブクラフティングをやってみよう！"]

class  Stage2ListViewController: UIViewController {
    
    private let stage2ListCellId = "stage2ListCellId"
    
    @IBOutlet weak var stage2ListTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stage2ListTableView.delegate = self
        stage2ListTableView.dataSource = self
        
    }
}

extension Stage2ListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stage2Menu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = stage2ListTableView.dequeueReusableCell(withIdentifier: stage2ListCellId, for:indexPath)
        cell.textLabel?.text = stage2Menu[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            self.performSegue(withIdentifier: "craftRuleSegue", sender: self)
        case 1:
            let storyboard = UIStoryboard.init(name: "Stage2Craft", bundle: nil)
            let stage2CraftViewController = storyboard.instantiateViewController(withIdentifier: "tabBar") as! UITabBarController
            navigationController?.pushViewController(stage2CraftViewController, animated: true)
            
            
        default:
            break
        }
    }
    
}
