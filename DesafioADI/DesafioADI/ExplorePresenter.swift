import Foundation

final class ExplorePresenter {

    weak var view: ExploreViewProtocol?
    weak var delegate: ExplorePresenterDelegate?

    init() {
    
    }
}

extension ExplorePresenter: ExplorePresenterProtocol {

}
