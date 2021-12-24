import UIKit
import protocol Swinject.Resolver

final class ExploreCoordinator: Coordinator {

    private let resolver: Resolver
    var eventHandler: CoordinationEventHandler?

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    func start() {
        let view = resolver.resolve(ExploreViewProtocol.self)!
        view.presenter.delegate = self
    }

}

extension ExploreCoordinator: ExplorePresenterDelegate {
    
}

