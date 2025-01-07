//
//  GrayViewController.swift
//  secondWeek_SeSAC
//
//  Created by 박신영 on 1/7/25.
//

import UIKit

class GrayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction
    func popButtonTapped(_ sender: UIButton) {
        print(#function)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func disMissButtonTapped(_ sender: UIButton) {
        print(#function)
        dismiss(animated: true)
    }
}
