import UIKit

protocol HomeScreenDelegate: AnyObject {
    func tappedStartButton()
}

final class HomeScreen: UIView, ViewCode {
     weak var delegate: HomeScreenDelegate?
    
    private lazy var backgroudImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = .imageHome
        image.isUserInteractionEnabled = false
        image.enableViewCode()
        return image
    }()
    
    private lazy var logoAppImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = .logo
        image.enableViewCode()
        return image
    }()
    
    private lazy var starButton: UIButton = {
        let button = UIButton()
        button.setTitle("Começar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = .backgroundMain
        button.enableViewCode()
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    @objc func handleStartButton() {
        delegate?.tappedStartButton()
    }
    
    func delegate(delegate: HomeScreenDelegate?) {
        self.delegate = delegate
    }
    
    func setupAction() {
        starButton.addTarget(self, action: #selector(handleStartButton), for: .touchUpInside)
    }
    
    func setupHierarchy() {
        addSubview(backgroudImageView)
        addSubview(logoAppImageView)
        addSubview(starButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroudImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroudImageView.leftAnchor.constraint(equalTo: leftAnchor),
            backgroudImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroudImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logoAppImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor , constant: 104),
            logoAppImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoAppImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            starButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -125),
            starButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            starButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            starButton.heightAnchor.constraint(equalToConstant: 44)
            
        ])
    }
}
