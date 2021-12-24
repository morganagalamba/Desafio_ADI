import Foundation

protocol ExplorePresenterDelegate: class {
    
}

protocol ExplorePresenterProtocol: class {
    var view: ExploreViewProtocol? { get set }
    var delegate: ExplorePresenterDelegate? { get set }
}

