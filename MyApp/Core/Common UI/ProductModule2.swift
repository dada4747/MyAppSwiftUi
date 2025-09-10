struct UserDIContainer {
    let environment: AppEnvironmentType
    let baseURL: String

    func makeUserUseCase() -> UserUseCase {
        let service: UserServiceProtocol
        switch environment {
        case .mock:
            service = MockUserService()
        case .live:
            service = LiveUserService(/*baseURL: baseURL*/)
        }
        return UserUseCase(repository: UserRepositoryImpl(service: service))
    }
}

