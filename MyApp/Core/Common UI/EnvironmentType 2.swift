
import SwiftUI

protocol ProductServiceProtocol {
    func fetchProducts() -> [String]
}

class MockProductService: ProductServiceProtocol {
    func fetchProducts() -> [String] {
        ["Mock Product 1", "Mock Product 2", "Mock Product 3"]
    }
}

class LiveProductService: ProductServiceProtocol {
    private let baseURL: String
    init(baseURL: String) { self.baseURL = baseURL }

    func fetchProducts() -> [String] {
        // Call your real API here using baseURL
        ["Live Product 1", "Live Product 2", "Live Product 3"]
    }
}




protocol ProductRepository {
    func getProducts() -> [String]
}

class ProductRepositoryImpl: ProductRepository {
    private let service: ProductServiceProtocol
    init(service: ProductServiceProtocol) { self.service = service }

    func getProducts() -> [String] {
        service.fetchProducts()
    }
}


class ProductUseCase {
    private let repository: ProductRepository

    init(repository: ProductRepository) { self.repository = repository }

    func execute() -> [String] {
        repository.getProducts()
    }
}


import Combine
import SwiftUI

import Combine
import SwiftUI

class ProductSearchViewModel: ObservableObject {
    @Published var products: [String] = []
    private let useCase: ProductUseCase
    private let coordinator: ProductCoordinator
    private var isLoaded = false

    init(coordinator: ProductCoordinator, useCase: ProductUseCase) {
        self.coordinator = coordinator
        self.useCase = useCase
        loadProducts()
    }

    func loadProducts() {
        guard !isLoaded else { return }
        products = useCase.execute()
        isLoaded = true
    }

    // View only triggers navigation via coordinator
    func showDetail(product: String) {
        coordinator.navigate(to: .detail(product: product))
    }
}


import SwiftUI

import SwiftUI

class ProductCoordinator: ObservableObject {
    @Published var navigationStack = NavigationPath()

    enum ProductRoute: Hashable {
        case search
        case list
        case detail(product: String)
        case buy(product: String)
        case payment
        case success
        case failed
    }

    func navigate(to route: ProductRoute) {
        navigationStack.append(route)
    }

    func goBack() {
        if !navigationStack.isEmpty { navigationStack.removeLast() }
    }
}



import SwiftUI

class ProductServiceLocator {
    static let shared = ProductServiceLocator()

    // MARK: - UseCase Factory
    private func makeProductUseCase(baseURL: String, env: AppEnvironmentType) -> ProductUseCase {
        let service: ProductServiceProtocol
        switch env {
        case .mock:
            service = MockProductService()
        case .live:
            service = LiveProductService(baseURL: baseURL)
        }
        return ProductUseCase(repository: ProductRepositoryImpl(service: service))
    }

    // MARK: - ProductSearchView Factory
    func makeProductSearchView(coordinator: ProductCoordinator, environment: AppEnvironment) -> ProductSearchView {
        let useCase = makeProductUseCase(baseURL: environment.baseURL, env: environment.current)
        let viewModel = ProductSearchViewModel(coordinator: coordinator, useCase: useCase)
        return ProductSearchView(viewModel: viewModel)
    }

    // MARK: - ProductDetailView Factory (optional)
    func makeProductDetailView(product: String) -> some View {
        ProductDetailView(product: product)
    }

    func makeProductBuyView(product: String) -> some View {
        ProductBuyView(product: product)
    }

    func makeProductPaymentView() -> some View {
        ProductPaymentView()
    }

    func makeProductSuccessView() -> some View {
        ProductSuccessView()
    }

    func makeProductFailedView() -> some View {
        ProductSuccessView()
    }
}
struct ProductSearchView: View {
    @StateObject var viewModel: ProductSearchViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("Product Search")
            List(viewModel.products, id: \.self) { product in
                Button(product) {
                    viewModel.showDetail(product: product)
                }
            }
        }
    }
}
struct ProductNavigationview: View {
    @ObservedObject var coordinator: ProductCoordinator
    @ObservedObject var environment = AppEnvironment()

    var body: some View {
        NavigationStack(path: $coordinator.navigationStack) {
            ProductServiceLocator.shared
                .makeProductSearchView(coordinator: coordinator, environment: environment)
                .navigationDestination(for: ProductCoordinator.ProductRoute.self) { route in
                    switch route {
                    case .detail(let product):
                        ProductServiceLocator.shared.makeProductDetailView(product: product)
                    case .buy(let product):
                        ProductServiceLocator.shared.makeProductBuyView(product: product)
                    case .payment:
                        ProductServiceLocator.shared.makeProductPaymentView()
                    case .success:
                        ProductServiceLocator.shared.makeProductSuccessView()
                    case .failed:
                        ProductServiceLocator.shared.makeProductFailedView()
                    default:
                        EmptyView()
                    }
                }
        }
    }
}
import SwiftUI

struct ProductDetailView: View {
    let product: String
    @ObservedObject var coordinator: ProductCoordinator

    var body: some View {
        VStack(spacing: 20) {
            Text("Product Detail: \(product)")
                .font(.title)

            HStack(spacing: 40) {
                Button("Back") {
                    coordinator.goBack()
                }
                Button("Next → Buy") {
                    coordinator.navigate(to: .buy(product: product))
                }
            }
        }
        .padding()
    }
}
import SwiftUI

struct ProductBuyView: View {
    let product: String
    @ObservedObject var coordinator: ProductCoordinator

    var body: some View {
        VStack(spacing: 20) {
            Text("Buy Product: \(product)")
                .font(.title)

            HStack(spacing: 40) {
                Button("Back") {
                    coordinator.goBack()
                }
                Button("Next → Payment") {
                    coordinator.navigate(to: .payment)
                }
            }
        }
        .padding()
    }
}
import SwiftUI

struct ProductPaymentView: View {
    @ObservedObject var coordinator: ProductCoordinator

    var body: some View {
        VStack(spacing: 20) {
            Text("Payment Screen")
                .font(.title)

            HStack(spacing: 40) {
                Button("Back") {
                    coordinator.goBack()
                }
                Button("Next → Success") {
                    coordinator.navigate(to: .success)
                }
            }
        }
        .padding()
    }
}
import SwiftUI

struct ProductSuccessView: View {
    @ObservedObject var coordinator: ProductCoordinator
    @ObservedObject var mainCoordinator: MainCoordinator // To go back to Home module

    var body: some View {
        VStack(spacing: 20) {
            Text("Purchase Successful!")
                .font(.largeTitle)
                .foregroundColor(.green)

            Button("Back to Home") {
                mainCoordinator.goToHome() // Switch module back to Home
            }
        }
        .padding()
    }
}
