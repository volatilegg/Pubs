//
//  SettingsViewController.swift
//  Pubs
//
//  Created by Do Duc on 24/09/2018.
//  Copyright © 2018 Buscu. All rights reserved.
//

import UIKit
import RxSwift

final class SettingsViewController: BaseViewController {

    // MARK: - ---------------------- IBOutlets --------------------------
    //
    @IBOutlet private weak var themeSwitch: UISwitch!

    // MARK: - ---------------------- Public Properties --------------------------
    //

    // MARK: - ---------------------- Private Properties --------------------------
    //

    // MARK: - ---------------------- LifeCycle Methods --------------------------
    // loadView > viewDidLoad > viewWillAppear > viewWillLayoutSubviews > viewDidLayoutSubviews > viewDidAppear
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //setupThemeService()
    }

    // MARK: - ---------------------- Configuration & Init Methods --------------------------
    //

    // MARK: - ---------------------- Route Methods --------------------------
    // @IBActions, prepare(...), ...

    // MARK: - ---------------------- Public Methods --------------------------
    //

    // MARK: - ---------------------- Private Methods --------------------------
    //

    private func setupThemeService() {
        let themeSwitchVariation = themeSwitch.rx
            .value
            .observeOn(MainScheduler.instance)
            .share(replay: 1)

        themeSwitchVariation.bind { (value) in
            themeService.set(value ? .dark : .light)
            }.disposed(by: disposeBag)
    }
}
