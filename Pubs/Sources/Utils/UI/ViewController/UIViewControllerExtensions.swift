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
        return view.getAllSubviews() as [UILabel]
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

extension UIView {

    class func getAllSubviews<T: UIView>(view: UIView) -> [T] {
        return view.subviews.flatMap { subView -> [T] in
            var result = getAllSubviews(view: subView) as [T]
            if let view = subView as? T {
                result.append(view)
            }
            return result
        }
    }

    func getAllSubviews<T: UIView>() -> [T] {
        return UIView.getAllSubviews(view: self) as [T]
    }
}
