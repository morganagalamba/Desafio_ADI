import UIKit

final class ExploreViewController: UIViewController {
    var presenter: ExplorePresenterProtocol

    init(presenter: ExplorePresenterProtocol) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Storyboards are incompatible with truth and beauty.")
    }
}

extension ExploreViewController: ExploreViewProtocol {

}
