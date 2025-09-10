//
//@main
//struct MyApp: App {
//    @StateObject var coordinator = MainCoordinator()
////    AppEnvironment.shared = AppEnvironment(current: .mock)
//    var body: some Scene {
//        WindowGroup {
//            RootView(coordinator: coordinator)
//        }
//    }
//}
//
//
//struct RootView: View {
//    @ObservedObject var coordinator: MainCoordinator
//    
//    var body: some View {
//        switch coordinator.selectedModule {
//        case .home:
//            HomeView(viewModel: HomeViewModel(
//                homeCoordinator: coordinator.makeHomeCoordinator(),
//                coordinator: coordinator
//            ))
//            
//        case .user:
//            UserNavigationView(coordinator: coordinator.makeUserCoordinator() )
//        case .flight:
//            FlightNavigationView(coordinator: coordinator.makeFlightCoordinator() )
//        case .product:
//            ProductNavigationView(coordinator: coordinator.makeProductCoordinator())
//        }
//    }
//}
//
//
//class AppCoordinator: ObservableObject {
//    @Published var selectedModule: MainModule = .home
//    private var environment = AppEnvironment.shared
//
//    enum MainModule: Hashable {
//        case home
//        case user
//        case flight
//        case product
//    }
//    init(environment: AppEnvironment = .shared) {
//        self.environment = environment
//    }
//    private var productContainer: ProductDIContainer {
//           ProductDIContainer(
//               environment: environment.current,
//               baseURL: environment.baseURL
//           )
//       }
//    private var flightContainer: FlightDIContainer {
//        FlightDIContainer(
//            environment: environment.current,
//            baseURL: environment.baseURL
//        )
//    }
//    func goToModule(_ module: MainModule) {
//        selectedModule = module
//    }
//    
//    func goToHome() {
//        selectedModule = .home
//    }
//    // Factory methods instead of keeping lazy vars
//    func makeProductCoordinator() -> ProductCoordinator {
//        ProductCoordinator(parent: self, container: productContainer)
//    }
//    
//    func makeUserCoordinator() -> UserModuleCoordinator {
//        UserModuleCoordinator( parent: self)
//    }
//    
//    func makeFlightCoordinator() -> FlightCoordinator {
//        FlightCoordinator(parent: self, container: flightContainer)
//    }
//    
//    func makeHomeCoordinator() -> HomeModuleCoordinator {
//        HomeModuleCoordinator()
//    }
//
//}
//struct AppEnvironment {
//    let current: AppEnvironmentType
//
//    var baseURL: String {
//        current.baseURL
//    }
//
//    static let shared = AppEnvironment(current: .mock)
//}
//
//enum AppEnvironmentType {
//    case mock
//    case live
//
//    var baseURL: String {
//        switch self {
//        case .mock: return "https://mock.api"
//        case .live: return "https://live.api"
//        }
//    }
//}
//
//struct ProductDIContainer {
//    let environment: AppEnvironmentType
//    let baseURL: String
//
//    func makeProductUseCase() -> ProductUseCase {
//        let service: ProductServiceProtocol = (environment == .mock)
//            ? MockProductService()
//            : LiveProductService(baseURL: baseURL)
//
//        return ProductUseCase(repository: ProductRepositoryImpl(service: service))
//    }
//}
//class ProductCoordinator: ObservableObject {
//    @Published var navigationStack = NavigationPath()
//    weak var parent: MainCoordinator?
//    private let container: ProductDIContainer
//
//    enum ProductRoute: Hashable {
//        case detail(product: String)
//        case buy(product: String)
//        case payment
//        case success
//    }
//
//    init(parent: MainCoordinator?, container: ProductDIContainer) {
//        self.parent = parent
//        self.container = container
//    }
//
////    func navigate(to route: Any) {
////        guard let route = route as? ProductRoute else { return }
////        navigationStack.append(route)
////    }
//    func navigate(to route: ProductRoute) {
//         navigationStack.append(route)
//     }
//    func goBack() {
//        if !navigationStack.isEmpty { navigationStack.removeLast() }
//    }
//
//    func goToHome() {
//        parent?.goToHome()
//    }
//
//    func resetToHome() {
//        navigationStack = NavigationPath()
//        parent?.goToHome()
//    }
//
//    func makeProductSearchViewModel() -> ProductSearchViewModel {
//        ProductSearchViewModel(coordinator: self, useCase: container.makeProductUseCase())
//    }
//
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
//struct ProductNavigationView: View {
//    @ObservedObject var coordinator: ProductCoordinator
//
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
//class LiveProductService: ProductServiceProtocol {
// 
//    private let baseURL: String
//    init(baseURL: String) { self.baseURL = baseURL }
//    
//    func fetchProducts() -> AnyPublisher<[String], Error> {
//        // Call your real API here using baseURL asynchronously
//        // For demonstration, simulate network delay
//        return Just(["Live Product 1", "Live Product 2", "Live Product 3"])
//            .delay(for: .seconds(2), scheduler: RunLoop.main)
////            .mapError({ error in
////                return AppError.network($0)
////            })
//            .setFailureType(to: Error.self)
//            .eraseToAnyPublisher()
//    }
//}
//enum AppError: Error {
//    case network(URLError)
//    case unknown
//}
//
//
//struct FlightDIContainer {
//    let environment: AppEnvironmentType
//    let baseURL: String
//
//    func makeFlightUseCase() -> FlightUseCase {
//        let service: FlightServiceProtocol
//        switch environment {
//        case .mock:
//            service = MockFlightService()
//        case .live:
//            service = LiveFlightService(/*baseURL: baseURL*/)
//        }
//        return FlightUseCase(repository: FlightRepositoryImpl(service: service))
//    }
//}
//
//class FlightCoordinator: ObservableObject {
//    @Published var navigationStack = NavigationPath()
//    weak var parent: MainCoordinator?
//    private let container: FlightDIContainer
//    
//    enum FlightRoute: Hashable {
//        case search
//        case list(searchData: [String])
//        case detail(selectedFlight: String)
//        case book(selectedFlight: String)
//        case success
//        case failed
//    }
//    
//    
//    init(parent: MainCoordinator?, container: FlightDIContainer) {
//        self.parent = parent
//        self.container = container
//    }
//    
//    func navigate(to route: FlightRoute) {
//        navigationStack.append(route)
//    }
//    
//    func goBack() {
//        if !navigationStack.isEmpty { navigationStack.removeLast() }
//    }
//    
//    func goToHome() {
//        parent?.goToHome()
//    }
//    func resetToHome() {
//        navigationStack = NavigationPath()
//        parent?.goToHome()
//    }
//    
//    func makeFlightSearchViewModel() -> FlightSearchViewModel {
//        let useCase = container.makeFlightUseCase()
//        return FlightSearchViewModel(coordinator: self, useCase: useCase)
//    }
//    
//    func makeFlightListViewModel(searchData: [String]) -> FlightListViewModel {
//        FlightListViewModel(coordinator: self, searchResults: searchData)
//    }
//}
//struct FlightNavigationView: View {
//    @StateObject var coordinator: FlightCoordinator
//
//    var body: some View {
//        NavigationStack(path: $coordinator.navigationStack) {
//            FlightSearchView(viewModel: coordinator.makeFlightSearchViewModel())                .navigationDestination(for: FlightCoordinator.FlightRoute.self) { route in
//                    switch route {
//                    case .search:
//                        FlightSearchView(viewModel: coordinator.makeFlightSearchViewModel())
//                    case .list(let searchData):
//                        
//                        FlightListView(viewModel: coordinator.makeFlightListViewModel(searchData: searchData))
//                    case .detail(let selectedFlight):
//                        FlightDetailView(viewModel: FlightDetailViewModel(coordinator: coordinator, selectedFlight: selectedFlight))
//                    case .book(let selectedFlight):
//                        FlightBookView(viewModel: FlightBookViewModel(coordinator: coordinator, selectedFlight: selectedFlight))
//                    case .success:
//                        FlightSuccessView(viewModel: FlightSuccessViewModel(coordinator: coordinator))
//                    case .failed:
//                        FlightFailedView(viewModel: FlightFailedViewModel(coordinator: coordinator))
//                    }
//                }
//        }
//    }
//}
///*
//                    [App Start]
//                        ↓
//                     [MyApp]
//                        ↓
//                    [RootView]
//                        ↓
//                  [MainCoordinator] ─ AppEnvironment (shared .mock / .live)
//                        ↓
//              ProductNavigationView
//                        ↓
//                ProductCoordinator
//                        └── ProductDIContainer → ProductUseCase → ProductRepository → ProductService (Mock / Live)
//
// 
// 
//HomeViewNavigation
//   ↓
//HomeModuleCoordinator
//   ↓
//(HomeDIContainer to be added later)
// 
// 
//├── UserNavigationView ← UserModuleCoordinator → (UserDIContainer to be added later)
//├── FlightNavigationView ← FlightCoordinator
//│        └── FlightDIContainer → FlightUseCase → FlightRepository → FlightService (Mock / Live)
//│
//└── ProductNavigationView ← ProductCoordinator
//      └── ProductDIContainer → ProductUseCase → ProductRepository → ProductService (Mock / Live)
//
//[Flow of DI]
//- AppEnvironment defines environment (mock/live + baseURL)
//- DIContainers (ProductDIContainer, FlightDIContainer) take AppEnvironment
//- DIContainer builds UseCase and Service layer injection
//- Coordinator uses DIContainer to create ViewModels
//- ViewModels used by Views
//
//[Services]
//- ProductServiceProtocol (MockProductService / LiveProductService)
//- FlightServiceProtocol (MockFlightService / LiveFlightService)*/
