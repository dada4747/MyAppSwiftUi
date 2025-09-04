//import SwiftUI
//struct AppDIContainer {
//    let environment: AppEnvironmentType
//    let baseURL: String
//    
//    func makeProductUseCase() -> ProductUseCase {
//        let service: ProductServiceProtocol
//        switch environment {
//        case .mock:
//            service = MockProductService()
//        case .live:
//            service = LiveProductService(baseURL: baseURL)
//        }
//        return ProductUseCase(repository: ProductRepositoryImpl(service: service))
//    }
//}
//
////class MainCoordinator: ObservableObject {
////    @Published var selectedModule: MainModule = .home
////    @Published var environment = AppEnvironment()
////    
////    enum MainModule: Hashable {
////        case home
////        case user
////        case flight
////        case product
////    }
////    private var container: AppDIContainer {
////           AppDIContainer(
////               environment: environment.current,
////               baseURL: environment.baseURL
////           )
////       }
////    func goToModule(_ module: MainModule) {
////        selectedModule = module
////    }
////    
////    func goToHome() {
////        selectedModule = .home
////    }
////    // Factory methods instead of keeping lazy vars
////    func makeProductCoordinator() -> ProductCoordinator {
////        ProductCoordinator(parent: self, container: container)
////    }
////    
////    func makeUserCoordinator() -> UserModuleCoordinator {
////        UserModuleCoordinator( parent: self)
////    }
////    
////    func makeFlightCoordinator() -> FlightCoordinator {
////        FlightCoordinator(parent: self)
////    }
////    
////    func makeHomeCoordinator() -> HomeModuleCoordinator {
////        HomeModuleCoordinator()
////    }
////
////}
//
//
//
//
//protocol ProductServiceProtocol {
//    func fetchProducts() async throws -> [String]
//}
//
//class MockProductService: ProductServiceProtocol {
//    func fetchProducts() async throws -> [String] {
//        // Simulate network delay
//        try await Task.sleep(nanoseconds: 300_000_000)
//        return ["Mock Product 1", "Mock Product 2", "Mock Product 3"]
//    }
//}
//
//class LiveProductService: ProductServiceProtocol {
//    private let baseURL: String
//    init(baseURL: String) { self.baseURL = baseURL }
//    
//    func fetchProducts() async throws -> [String] {
//        // Call your real API here using baseURL asynchronously
//        // For demonstration, simulate network delay
//        try await Task.sleep(nanoseconds: 500_000_000)
//        return ["Live Product 1", "Live Product 2", "Live Product 3"]
//    }
//}
//
//protocol ProductRepository {
//    func getProducts() async throws -> [String]
//}
//
//class ProductRepositoryImpl: ProductRepository {
//    private let service: ProductServiceProtocol
//    init(service: ProductServiceProtocol) { self.service = service }
//    
//    func getProducts() async throws -> [String] {
//        try await service.fetchProducts()
//    }
//}
//
//class ProductUseCase {
//    private let repository: ProductRepository
//    
//    init(repository: ProductRepository) { self.repository = repository }
//    
//    func execute() async throws -> [String] {
//        try await repository.getProducts()
//    }
//}
//
////@MainActor
//class ProductSearchViewModel: ObservableObject {
//    @Published var products: [String] = []
//    @Published var isLoading: Bool = false
//    @Published var errorMessage: String? = nil
//    
//    private let useCase: ProductUseCase
//    private let coordinator: ProductCoordinator
//    
//    init(coordinator: ProductCoordinator, useCase: ProductUseCase) {
//        self.coordinator = coordinator
//        self.useCase = useCase
//    }
//    
//    func loadProducts() async {
//        guard !isLoading else { return }
//        isLoading = true
//        errorMessage = nil
//        do {
//            let fetchedProducts = try await useCase.execute()
//            products = fetchedProducts
//        } catch {
//            errorMessage = error.localizedDescription
//            products = []
//        }
//        isLoading = false
//    }
//    
//    // View only triggers navigation via coordinator
//    func showDetail(product: String) {
//        coordinator.navigate(to: .detail(product: product))
//    }
//}
//
//class ProductCoordinator: ObservableObject {
//    @Published var navigationStack = NavigationPath()
//    weak var parent: MainCoordinator?
//    private let container: AppDIContainer
//
//    enum ProductRoute: Hashable {
//        case detail(product: String)
//        case buy(product: String)
//        case payment
//        case success
//    }
////    init(parent: MainCoordinator?) {
////        self.parent = parent
////    }
//    init(parent: MainCoordinator?, container: AppDIContainer) {
//        self.parent = parent
//        self.container = container
//    }
//
//    func navigate(to route: ProductRoute) {
//        navigationStack.append(route)
//    }
//    
//    func goBack() {
//        if !navigationStack.isEmpty { navigationStack.removeLast() }
//    }
//    func goToHome(){
//        parent?.goToHome()
//    }
//    func resetToHome() {
//        navigationStack = NavigationPath()
//        parent?.goToHome()
//    }
////    /*@MainActor*/ func makeProductSearchViewModel() -> ProductSearchViewModel {
////        let useCase = ProductServiceLocator.shared.makeProductUseCase(
////            baseURL: parent?.environment.baseURL ?? "",
////            env: parent?.environment.current ?? .mock
////        )
////        return ProductSearchViewModel(coordinator: self, useCase: useCase)
////    }
//    func makeProductSearchViewModel() -> ProductSearchViewModel {
//          let useCase = container.makeProductUseCase()
//          return ProductSearchViewModel(coordinator: self, useCase: useCase)
//      }
//    func makeProductDetailViewModel(product: String) -> ProductDetailViewModel {
//        ProductDetailViewModel(product: product, coordinator: self)
//    }
//    
//    func makeProductBuyViewModel(product: String) ->  ProductBuyViewModel {
//        ProductBuyViewModel(product: product, coordinator: self)
//    }
//    
//    func makeProductPaymentViewModel() -> ProductPaymentViewModel {
//        ProductPaymentViewModel(coordinator: self)
//    }
//    
//    func makeProductSuccessViewModel() -> ProductSuccessViewModel {
//        ProductSuccessViewModel(coordinator: self)
//    }
//}
//
//
//struct ProductNavigationView: View {
//    @ObservedObject var coordinator: ProductCoordinator
//    var body: some View {
//        NavigationStack(path: $coordinator.navigationStack) {
//            ProductSearchView(viewModel: coordinator.makeProductSearchViewModel())
//                .navigationDestination(for: ProductCoordinator.ProductRoute.self) { route in
//                    switch route {
//                    case .detail(let product):
//                        ProductDetailView(viewModel: coordinator.makeProductDetailViewModel(product: product))
//                    case .buy(let product):
//                        ProductBuyView(viewModel: coordinator.makeProductBuyViewModel(product: product))
//                    case .payment:
//                        ProductPaymentView(viewModel: coordinator.makeProductPaymentViewModel())
//                    case .success:
//                        ProductSuccessView(viewModel: coordinator.makeProductSuccessViewModel())
//                    }
//                }
//        }
//    }
//}
//
//
//struct ProductSearchView: View {
//    @StateObject var viewModel: ProductSearchViewModel
//    
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Product Search")
//            
//            if viewModel.isLoading {
//                ProgressView()
//            } else if let error = viewModel.errorMessage {
//                Text("Error: \(error)")
//                    .foregroundColor(.red)
//            } else {
//                List(viewModel.products, id: \.self) { product in
//                    Button(product) {
//                        viewModel.showDetail(product: product)
//                    }
//                }
//            }
//        }
//        .task {
//            await viewModel.loadProducts()
//        }
//    }
//}
//
//
//struct ProductBuyView: View {
//    @StateObject var viewModel: ProductBuyViewModel
//    
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Buy Product: \(viewModel.product)")
//                .font(.title)
//            
//            HStack(spacing: 40) {
//                Button("Back") {
//                    viewModel.goBack()
//                }
//                Button("Next → Payment") {
//                    viewModel.goToPayment()
//                }
//            }
//        }
//        .padding()
//    }
//}
//
//struct ProductPaymentView: View {
//    @StateObject var viewModel: ProductPaymentViewModel
//    
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Payment Screen")
//                .font(.title)
//            
//            HStack(spacing: 40) {
//                Button("Back") {
//                    viewModel.goBack()
//                }
//                Button("Next → Success") {
//                    viewModel.goToSuccess()
//                }
//            }
//        }
//        .padding()
//    }
//}
//
//struct ProductSuccessView: View {
//    @StateObject var viewModel: ProductSuccessViewModel
//    
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Purchase Successful!")
//                .font(.largeTitle)
//                .foregroundColor(.green)
//            
//            Button("Back to Home") {
//                viewModel.backToHome() // Switch module back to Home
//            }
//        }
//        .padding()
//    }
//}
//
//class ProductDetailViewModel: ObservableObject {
//    private let coordinator: ProductCoordinator
//    let product: String
//    
//    init(product: String, coordinator: ProductCoordinator) {
//        self.coordinator = coordinator
//        self.product = product
//    }
//    
//    func goBack() {
//        coordinator.goBack()
//    }
//    
//    func goToBuy() {
//        coordinator.navigate(to: .buy(product: product))
//    }
//}
//
//class ProductBuyViewModel: ObservableObject {
//    private let coordinator: ProductCoordinator
//    let product: String
//    
//    init(product: String, coordinator: ProductCoordinator) {
//        self.coordinator = coordinator
//        self.product = product
//    }
//    
//    func goBack() {
//        coordinator.goBack()
//    }
//    
//    func goToPayment() {
//        coordinator.navigate(to: .payment)
//    }
//}
//
//class ProductPaymentViewModel: ObservableObject {
//    private let coordinator: ProductCoordinator
//    
//    init(coordinator: ProductCoordinator) {
//        self.coordinator = coordinator
//    }
//    
//    func goBack() {
//        coordinator.goBack()
//    }
//    
//    func goToSuccess() {
//        coordinator.navigate(to: .success)
//    }
//    
//}
//
//class ProductSuccessViewModel: ObservableObject {
//    private let coordinator: ProductCoordinator
//    
//    init(coordinator: ProductCoordinator) {
//        self.coordinator = coordinator
//    }
//    
//    func backToHome() {
//        coordinator.resetToHome()
//    }
//}
//
//struct ProductDetailView: View {
//    @StateObject var viewModel: ProductDetailViewModel
//    
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("Product Detail: \(viewModel.product)")
//                .font(.title)
//            
//            HStack(spacing: 40) {
//                Button("Back") { viewModel.goBack() }
//                Button("Next → Buy") { viewModel.goToBuy() }
//            }
//        }
//        .padding()
//    }
//}
