//
//  UIViewControllerExtensions.swift
//  Pubs
//
//  Created by Do Duc on 16/09/2018.
//  Copyright © 2018 Buscu. All rights reserved.
//

import RxSwift
import RxCocoa

extension UIViewController {
    var labels: [UILabel] {
        return view.subviews. flatMap({ $0 }).compactMap({ $0 as? UILabel })
    }

    var labelsBinding: [Binder<UIColor?>] {
        return labels.map({ $0.rx.textColor })
    }
}

class BaseViewController: UIViewController {
    var disposeBag: DisposeBag = DisposeBag()

    override func viewDidLoad() {
        themeService.rx
            .bind({ $0.textColor }, to: labelsBinding)
            .bind({ $0.backgroundColor }, to: view.rx.backgroundColor)
            .disposed(by: disposeBag)
    }
}

extension Collection {

    func recursiveFlatMap<T>() -> [T] {
        return self
    }

}
