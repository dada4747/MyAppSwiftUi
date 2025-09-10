////
////  ProductCoordinator.swift
////  MyApp
////
////  Created by Rahul on 05/09/25.
////
import SwiftUI

class ProductCoordinator: ObservableObject {
    @Published var navigationStack = NavigationPath()
    weak var parent: AppCoordinator?
    private let container: ProductDIContainer

    enum ProductRoute: Hashable {
        case detail(product: String)
        case buy(product: String)
        case payment
        case success
    }

    init(parent: AppCoordinator?, container: ProductDIContainer) {
        self.parent = parent
        self.container = container
    }

//    func navigate(to route: Any) {
//        guard let route = route as? ProductRoute else { return }
//        navigationStack.append(route)
//    }
    func navigate(to route: ProductRoute) {
         navigationStack.append(route)
     }
    func goBack() {
        if !navigationStack.isEmpty { navigationStack.removeLast() }
    }

    func goToHome() {
        parent?.goToHome()
    }

    func resetToHome() {
        navigationStack = NavigationPath()
        parent?.goToHome()
    }

    func makeProductSearchViewModel() -> ProductSearchViewModel {
        ProductSearchViewModel(coordinator: self, useCase: container.makeProductUseCase())
    }

    func makeProductDetailViewModel(product: String) -> ProductDetailViewModel {
        ProductDetailViewModel(product: product, coordinator: self)
    }

    func makeProductBuyViewModel(product: String) ->  ProductBuyViewModel {
        ProductBuyViewModel(product: product, coordinator: self)
    }

    func makeProductPaymentViewModel() -> ProductPaymentViewModel {
        ProductPaymentViewModel(coordinator: self)
    }

    func makeProductSuccessViewModel() -> ProductSuccessViewModel {
        ProductSuccessViewModel(coordinator: self)
    }
}
