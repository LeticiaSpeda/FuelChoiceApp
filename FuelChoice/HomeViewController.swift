import UIKit

final class HomeViewController: UIViewController {
    
    var screen = HomeScreen()
    
    override func loadView() {
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen.delegate(delegate: self)
    }
}

extension HomeViewController: HomeScreenDelegate {
    func tappedStartButton() {
        print("ok")
    }
    
    
}
