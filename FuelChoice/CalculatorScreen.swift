import UIKit

protocol CalculatorScreenDelegate: AnyObject {
    func tappedCalculateButton()
    func tappedBackButton()
}

final class CalculatorScreen: UIView, ViewCode {
    
    weak var delegate: CalculatorScreenDelegate?
    
    private lazy var backgoundImage: UIImageView = {
        let image = UIImageView()
        image.image = .backgroundCalculate
        image.enableViewCode()
        return image
    }()
    
    private lazy var logoAppImage: UIImageView = {
        let image = UIImageView()
        image.image = .logoHome
        image.contentMode = .scaleAspectFit
        image.enableViewCode()
        return image
    }()
    
    private lazy var ethanolPriceTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .gray
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.placeholder = "Preço do Álcool"
        tf.textColor = .black
        return tf
    }()
    
    private lazy var gasPriceTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .gray
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        tf.placeholder = "Preço da Gasolina0"
        tf.textColor = .black
        return tf
    }()
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calcular", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.backgroundColor = .gray
        button.enableViewCode()
        button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(.botãoBack, for: .normal)
        button.enableViewCode()
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    @objc func tappedCalculateButton() {
        delegate?.tappedCalculateButton()
    }
    
    @objc func tappedBackButton() {
        delegate?.tappedBackButton()
    }
    
    func delegate (delegate: CalculatorScreenDelegate?) {
        self.delegate = delegate
    }
    
    func setupHierarchy() {
        addSubview(backgoundImage)
        addSubview(logoAppImage)
        addSubview(ethanolPriceTextField)
        addSubview(gasPriceTextField)
        addSubview(calculateButton)
        addSubview(backButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgoundImage.topAnchor.constraint(equalTo: topAnchor),
            backgoundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgoundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgoundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            logoAppImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            logoAppImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            logoAppImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 20),
            
            ethanolPriceTextField.topAnchor.constraint(equalTo: logoAppImage.bottomAnchor, constant:
                                                        200),
            ethanolPriceTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            ethanolPriceTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            ethanolPriceTextField.heightAnchor.constraint(equalToConstant: 45),
            
            gasPriceTextField.topAnchor.constraint(equalTo: ethanolPriceTextField.bottomAnchor, constant:
                                                    10),
            gasPriceTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            gasPriceTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            gasPriceTextField.heightAnchor.constraint(equalToConstant: 45),
            
            calculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant:-135),
            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            calculateButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}
