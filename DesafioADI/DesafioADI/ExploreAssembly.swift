import Swinject

final class ExploreAssembly: Assembly {

    func assemble(container: Container) {
        container.autoregister(ExplorePresenterProtocol.self, initializer: ExplorePresenter.init)
            .initCompleted { (r, p) in
                p.view = r.resolve(ExploreViewProtocol.self)
        }
        container.autoregister(ExploreViewProtocol.self, initializer: ExploreViewController.init(presenter:))
    }

}

