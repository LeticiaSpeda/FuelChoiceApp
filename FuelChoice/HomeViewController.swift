import UIKit

final class HomeViewController: UIViewController {
    
    var screen = HomeScreen()
    
    override func loadView() {
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        screen.delegate(delegate: self)
    }
}

extension HomeViewController: HomeScreenDelegate {
    func tappedStartButton() {
        let controller = CalculatorViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
