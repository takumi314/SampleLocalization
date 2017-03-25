//
//  ViewController.swift
//  SampleLocalization
//
//  Created by NishiokaKohei on 2017/03/24.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    // MARK: - Properties

    // IBOutlets

    @IBOutlet private weak var mainTitleLabel: UILabel!
    @IBOutlet private weak var alertButton: UIButton!
    @IBOutlet private weak var customViewButton: UIButton!

    // Inherited methods

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

//        mainTitleLabel.text = NSLocalizedString("Main.Label.Title", tableName: nil, bundle: Bundle.main, value: "", comment: "")
        mainTitleLabel.text = NSLocalizedString("Main.Label.Title", comment: "")
        alertButton.setTitle(NSLocalizedString("Main.Button.ShowAlert", comment: ""), for: .normal)
        customViewButton.setTitle(NSLocalizedString("Main.Button.OpenCustonView", comment: ""), for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - IBActions

    @IBAction func didTapShowAlert(_ sender: UIButton) {
        showAlert()
    }

    @IBAction func didTapOpenCutomView(_ sender: UIButton) {
        openCustomView()
    }

    // MARK: - Private methods

    private func doSomething() {
        // code
    }

    private func openCustomView() {
        guard let view = CustomView.instance() else {
            return
        }

        view.backgroundColor = UIColor.orange
        self.view.layoutSubviews()

        UIView.animate(withDuration: 0.5,
                       animations: {
                        self.view.addSubview(view)
                    })

    }

    private func showAlert() {
        let alert = UIAlertController.init(title: NSLocalizedString("Main.Alert.Title", comment: ""),
                                           message: NSLocalizedString("Main.Alert.Massage1", comment: ""),
                                           preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("Main.Alert.OK", comment: ""),
                                     style: .default,
                                     handler: nil)
        let cancelAction = UIAlertAction(title: NSLocalizedString("Main.Alert.Cancel", comment: ""),
                                         style: .cancel,
                                         handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }

}

