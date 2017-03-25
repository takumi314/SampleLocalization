//
//  CustomView.swift
//  SampleLocalization
//
//  Created by NishiokaKohei on 2017/03/25.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import UIKit

class CustomView: UIView {

    // MARK; - Properties

    weak var contentView: UIView!


    // MARK: - IBOutlets

    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!


    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    class func instanceFromNib() -> CustomView? {
        return UINib(nibName: "CustomView",
                     bundle: nil).instantiate(withOwner: nil, options: nil).first as? CustomView
    }

    class func instance() -> UIView? {
        // create a view's instance from the xib file.
        // load a xib's file
        let nib = UINib(nibName: "CustomView", bundle: nil)
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? UIView else {
            return nil
        }
        
        // define a size of the View
        let bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200)
        view.bounds = bounds

        return view
    }

    func showCustomView() {
        // code
    }


    // Inherited methods

    override func awakeFromNib() {
        super.awakeFromNib()

        // ボタン表示の多言語化対応
        okButton.setTitle(NSLocalizedString("Custom.Button.OK", comment: ""), for: .normal)
        closeButton.setTitle(NSLocalizedString("Custom.Button.Close", comment: ""), for: .normal)
    }


    // MARK: - IBActions

    @IBAction func didTapOK(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    
    @IBAction func didTapClose(_ sender: UIButton) {
        self.removeFromSuperview()
    }


    // MARK: - Private methods

    internal func closeView() {
        //Animate the hide effect, you can simple use customview.hidden=YES;
        UIView.animate(withDuration: 0.2,
                       animations: {
                        self.alpha = 0
                        self.contentView.alpha = 0
        }, completion: { (finished) in
            self.contentView.removeFromSuperview()
        })
    }

    internal func hoge() {
        // code
    }

}
