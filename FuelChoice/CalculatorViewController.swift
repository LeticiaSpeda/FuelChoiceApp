import UIKit

final class CalculatorViewController: UIViewController {
    var screen = CalculatorScreen()
    
    override func loadView() {
        super.loadView()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen.delegate(delegate: self)
    }
}

extension CalculatorViewController: CalculatorScreenDelegate {
    func tappedCalculateButton() {
        print("calculou")
    }
    
    func tappedBackButton() {
        print("voltou")
    }
    
    
}
