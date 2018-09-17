//
//  PubViewController.swift
//  Pubs
//
//  Created by Do Duc on 16/09/2018.
//  Copyright © 2018 Buscu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PubViewController: UIViewController {

    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!

    @IBOutlet weak var themeSwitch: UISwitch!

    var disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        themeService.rx
            .bind({ $0.secondaryTextColor }, to: secondaryLabel.rx.textColor)
            .bind({ $0.textColor }, to: primaryLabel.rx.textColor)
            .bind({ $0.backgroundColor }, to: view.rx.backgroundColor)            
            .disposed(by: disposeBag)

        let themeSwitchVariation = themeSwitch.rx
            .value
            .observeOn(MainScheduler.instance)
            .share(replay: 1)

        themeSwitchVariation.bind { (value) in
            themeService.set(value ? .dark : .light)
        }.disposed(by: disposeBag)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
