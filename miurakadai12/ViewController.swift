//
//  ViewController.swift
//  miurakadai12
//
//  Created by 三浦貴文 on 2023/07/04.
//

import UIKit

class ViewController: UIViewController {

    // アウトレットの作成
    @IBOutlet private weak var excludedTextField: UITextField!
    @IBOutlet private weak var taxTextField: UITextField!
    @IBOutlet private weak var includedTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        includedTextField.text = String(0)
        
        // UserDefaultsから消費税率を取得
        let savedTax = UserDefaults.standard.integer(forKey: "taxKey")
        taxTextField.text = String(savedTax)
    }

    @IBAction func calculationButton(_ sender: Any) {
        // テキストフィールドがInt型以外なら計算結果は空文字を返す
        guard let taxexcText = excludedTextField.text,
              let taxText = taxTextField.text,
              let taxexc = Int(taxexcText),
              let tax = Int(taxText) else {
                  includedTextField.text = ""
            return
        }
        
        // 税込金額を計算して表示
        let taxinc = taxexc * (tax + 100) / 100
        includedTextField.text = "\(taxinc)"
        
        // 消費税率を保存
        UserDefaults.standard.set(tax, forKey: "taxKey")
    }
}
