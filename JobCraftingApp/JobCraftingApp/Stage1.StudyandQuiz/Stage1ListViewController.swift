//
//  Stage1ListViewController.swift
//  JobCraftingApp
//
//  Created by 小日浦　紗和 on 2021/01/17.
//

import UIKit

private let stage1Menu = [
     ["1-1-1 ジョブクラフティングって何？"/*定義、効果、注意点（悪いJC）*/,"1-1-2 ジョブクラフティングの3つの分類","1-1-3 ジョブクラフティングの3つの軸"],
    ["モデルケース1","モデルケース2","モデルケース3","モデルケース4","モデルケース5","モデルケース6","モデルケース7","モデルケース8","モデルケース9","モデルケース10"]
]





class  Stage1ListViewController: UIViewController {

    
    private let stage1ListCellId = "stage1ListCellId"
    
    
    
    @IBOutlet weak var stage1ListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stage1ListTableView.delegate = self
        stage1ListTableView.dataSource = self
        
        
        
    }
}


extension Stage1ListViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return stage1Menu.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.text = "1-1 ジョブクラフティングを知ろう"
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 18)
        label.backgroundColor = .lightGray
        label.textColor = .white
        
        if section == 1{
            label.text = "1-2 モデルで練習してみよう"
        }
        
        return label
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stage1Menu[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = stage1ListTableView.dequeueReusableCell(withIdentifier: stage1ListCellId, for: indexPath)
        cell.textLabel?.text = stage1Menu[indexPath.section][indexPath.row]
        
        return cell
    }
    
    
//    タップされたらクイズ画面に移動する処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Stage1Quiz", bundle: nil)
        let stage1QuizViewController = storyboard.instantiateViewController(withIdentifier: "Stage1QuizViewController")
        navigationController?.pushViewController(stage1QuizViewController, animated: true)
    }
    
    
    
    
}



