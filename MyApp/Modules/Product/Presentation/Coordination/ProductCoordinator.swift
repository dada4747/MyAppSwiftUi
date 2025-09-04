//
//  ProductCoordinator.swift
//  MyApp
//
//  Created by Rahul on 05/09/25.
//
import SwiftUI


class ProductCoordinator: ObservableObject {
    @Published var navigationStack = NavigationPath()
    weak var parent: MainCoordinator?
    private let container: ProductDIContainer

    enum ProductRoute: Hashable {
        case detail(product: String)
        case buy(product: String)
        case payment
        case success
    }
//    init(parent: MainCoordinator?) {
//        self.parent = parent
//    }
    init(parent: MainCoordinator?, container: ProductDIContainer) {
        self.parent = parent
        self.container = container
    }

    func navigate(to route: ProductRoute) {
        navigationStack.append(route)
    }
    
    func goBack() {
        if !navigationStack.isEmpty { navigationStack.removeLast() }
    }
    func goToHome(){
        parent?.goToHome()
    }
    func resetToHome() {
        navigationStack = NavigationPath()
        parent?.goToHome()
    }
//    /*@MainActor*/ func makeProductSearchViewModel() -> ProductSearchViewModel {
//        let useCase = ProductServiceLocator.shared.makeProductUseCase(
//            baseURL: parent?.environment.baseURL ?? "",
//            env: parent?.environment.current ?? .mock
//        )
//        return ProductSearchViewModel(coordinator: self, useCase: useCase)
//    }
    func makeProductSearchViewModel() -> ProductSearchViewModel {
          let useCase = container.makeProductUseCase()
          return ProductSearchViewModel(coordinator: self, useCase: useCase)
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
