//
//  LunchViewController.swift
//  Pubs
//
//  Created by Do Duc on 16/09/2018.
//  Copyright © 2018 Buscu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

final class LunchViewController: BaseViewController {

    // MARK: - ---------------------- IBOutlets --------------------------
    //
    @IBOutlet weak var restaurantTableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!

    // MARK: - ---------------------- Public Properties --------------------------
    //

    // MARK: - ---------------------- Private Properties --------------------------
    //
    private var viewModel: LunchViewModel = LunchViewModel()

    // MARK: - ---------------------- LifeCycle Methods --------------------------
    // loadView > viewDidLoad > viewWillAppear > viewWillLayoutSubviews > viewDidLayoutSubviews > viewDidAppear

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpBinding()
    }
    
    // MARK: - ---------------------- Configuration & Init Methods --------------------------
    //

    // MARK: - ---------------------- Route Methods --------------------------
    // @IBActions, prepare(...), ...

    @IBAction func randomButtonClicked(_ sender: Any) {
        viewModel.randomRestaurant()
    }

    @IBAction func resetButtonClicked(_ sender: Any) {

    }

    @IBAction func whimButtonClicked(_ sender: Any) {

    }
    // MARK: - ---------------------- Public Methods --------------------------
    //

    // MARK: - ---------------------- Private Methods --------------------------
    //

    private func setUpBinding() {
        viewModel.restaurants
            .observeOn(MainScheduler.instance)
            .bind(to: restaurantTableView.rx.items(cellIdentifier: "restaurantCell", cellType: UITableViewCell.self)) { row, element, cell in
                cell.textLabel?.text =  "\(element.id)"
            }
            .disposed(by: disposeBag)

        viewModel.selectedRestaurant
            .bind(to: titleLabel.rx.restaurant)
            .disposed(by: disposeBag)
    }
}

extension Reactive where Base: UILabel {
    public var restaurant: Binder<Restaurant> {
        return Binder(self.base) { view, attr in
            view.text = attr.id
        }
    }
}
