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

    private let taxKey = "taxKey"

    override func viewDidLoad() {
        super.viewDidLoad()
        includedTextField.text = "0"
        
        // UserDefaultsから消費税率を取得
        let savedTax = UserDefaults.standard.integer(forKey: taxKey)
        taxTextField.text = String(savedTax)
    }

    @IBAction func calculationButton(_ sender: Any) {
        // テキストフィールドがInt型以外なら計算結果として空文字を表示する
        guard let taxExcludedText = excludedTextField.text,
              let taxText = taxTextField.text,
              let taxExcluded = Int(taxExcludedText),
              let tax = Int(taxText) else {
                  includedTextField.text = ""
            return
        }
        
        // 税込金額を計算して表示
        let taxIncluded = taxExcluded * (tax + 100) / 100
        includedTextField.text = "\(taxIncluded)"
        
        // 消費税率を保存
        UserDefaults.standard.set(tax, forKey: taxKey)
    }
}
