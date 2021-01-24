//
//  Stage1ListViewController.swift
//  JobCraftingApp
//
//  Created by 小日浦　紗和 on 2021/01/17.
//

import UIKit

//各章のタイトルを先に定義
private let stage1Menu = [
     ["ジョブクラフティングって何？","ジョブクラフティングの3つの実践方法","ジョブクラフティングの「自分の3つの軸」"],
    ["モデルケース1","モデルケース2","モデルケース3"]
]





class  Stage1ListViewController: UIViewController {

    
    private let stage1ListCellId = "stage1ListCellId"
    
    
    //ストーリーボードと紐付け
    @IBOutlet weak var stage1ListTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stage1ListTableView.delegate = self
        stage1ListTableView.dataSource = self
        
        
        
    }
}

//セルの設定
extension Stage1ListViewController: UITableViewDelegate,UITableViewDataSource{
    
    //見出しの数
    func numberOfSections(in tableView: UITableView) -> Int {
        return stage1Menu.count
    }
    
    //見出しの表示設定
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
    
    
    //セルの大きさ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stage1Menu[section].count
    }
    
    
    
    //セルに最初に設定した章タイトルを入れる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = stage1ListTableView.dequeueReusableCell(withIdentifier: stage1ListCellId, for: indexPath)
        cell.textLabel?.text = stage1Menu[indexPath.section][indexPath.row]
        
        return cell
    }
    
    
//    タップされたらタイトルに応じたクイズ画面に移動する処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        //移動先ストーリーボードとコントロールビューの呼び出し
        let storyboard = UIStoryboard.init(name: "Stage1Quiz", bundle: nil)
        let stage1QuizViewController = storyboard.instantiateViewController(withIdentifier: "Stage1QuizViewController")
        
        //移動先コントロールビューに「押されたセルから計算した問題番号」を受け渡し
        let delegate = UIApplication.shared.delegate as! AppDelegate
        delegate.quiz1set = 4 - indexPath.section
        delegate.quiz1Select =  (indexPath.section) * 12 + (indexPath.row) * (delegate.quiz1set)
        
        
        //画面遷移、上の１行はモーダル遷移をフルスクリーンにするもの
        stage1QuizViewController.modalPresentationStyle = .fullScreen
        self.present(stage1QuizViewController, animated: true, completion: nil)
    }
    
    
    
    
}



