//
//  LunchViewModel.swift
//  Pubs
//
//  Created by Do Duc on 01/10/2018.
//  Copyright © 2018 Buscu. All rights reserved.
//

import RxSwift
import RxCocoa

final class LunchViewModel {

    private let disposeBag = DisposeBag()

    let place: Observable<Place>
    let restaurants: Observable<[Restaurant]>

    let placeValue: Variable<[Restaurant]> = Variable([])
    let selectedRestaurant = PublishSubject<Restaurant>()
    init() {
        
        place = Observable<Place>.create({ subcriber in
            RestaurantLocalDataManager.fetchCurrentOption({ place in
                if let place = place {
                    subcriber.onNext(place)
                }
                subcriber.onCompleted()
            })

            return Disposables.create()
        })

        restaurants = Observable<[Restaurant]>.create({ subcriber in
            RestaurantLocalDataManager.fetchCurrentOption({ place in
                if let restaurants = place?.restaurants {
                    subcriber.onNext(restaurants)
                }
                subcriber.onCompleted()
            })

            return Disposables.create()
        })

        restaurants
            .bind(to: placeValue)
            .disposed(by: disposeBag)
    }

    func randomRestaurant() {
        guard let randomElement = placeValue.value.randomElement() else { return }
        
        selectedRestaurant.onNext(randomElement)
    }
}
