//
//  RestaurantListNetwork.swift
//  EatDa
//
//  Created by 김나희 on 5/31/22.
//

import Foundation
import RxSwift

struct RestaurantListNetwork {
    func getRecommendRestaurantValue() -> Observable<[RestaurantListData]> {
        let apiCall = API<[RestaurantListData]>(url: APIConstants.GET_RECOMMEND_RESTAURANT, method: .get, parameters: ["page": 1])
        return apiCall.fetchWithRx()
    }
    
    func getSearchRestaurantValue(_ keyword: String, _ lastPage: Int) -> Observable<[RestaurantListData]> {
        let apiCall = API<[RestaurantListData]>(url: APIConstants.GET_SEARCH_RESTAURANT, method: .get, parameters:  ["keyword": keyword, "lastPage": lastPage])
        return apiCall.fetchWithRx()
    }
    
//    func getAroundRestaurantValue() -> Observable<[RestaurantListData]> {
//        let apiCall = API<[RestaurantListData]>(url: APIConstants.GET_AROUND_RESTAURANT, method: .get, parameters: ["page": 1])
//        return apiCall.fetchWithRx()
//    }

    func getRestaurantDetailValue(_ id: Int) -> Observable<RestaurantDetailModel> {
        let apiCall = API<RestaurantDetailModel>(url: APIConstants.GET_RESTAURANT_DETAIL + "\(id)", method: .get, parameters: [:])
        return apiCall.fetchWithRx()
    }
}
