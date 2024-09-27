//
//  ViewController.swift
//  TestUIKitApp
//
//  Created by t&a on 2024/09/19.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var image7: UIImageView!
    @IBOutlet var textField: UITextField!
    @IBOutlet var textView: UITextView!
    
    private var cancellables = Set<AnyCancellable>()
    
    @IBAction func taped() {
        scrollCenterPosition()
    }

    
    /// スクロール領域内の入力ボックスを画面中央に持ってくる
    private func scrollCenterPosition() {
            
        guard let activeField = textField else { return }
        guard let scrollView = scrollView else { return }
        
        // activeFieldのフレームを取得
        let fieldFrame = activeField.frame
        
        // スクロールビューのサイズを取得
        let scrollViewWidth = scrollView.bounds.size.width
        let scrollViewHeight = scrollView.bounds.size.height

        // 画面の中心座標Yを計算
        let centerY = (scrollViewHeight - fieldFrame.height) / 2

        // fieldFrame.origin.y　→ 対象Viewの上端座標Y
        // centerY　→ 画面(スクロールビュー)の中心座標Y
        // fieldFrame.height / 2　→ 対象Viewの中心座標Y
        let scrollPoint = CGPoint(x: 0, y: fieldFrame.origin.y - centerY + fieldFrame.height / 2)

        scrollView.setContentOffset(scrollPoint, animated: true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
