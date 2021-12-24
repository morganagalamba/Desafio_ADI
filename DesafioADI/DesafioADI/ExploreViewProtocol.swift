import UIKit

protocol ExploreViewProtocol: class, ViewControllerProtocol {
    var presenter: ExplorePresenterProtocol { get set }
}
