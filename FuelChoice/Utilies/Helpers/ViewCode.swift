protocol ViewCode {
    func commonInit()
    func setupHierarchy()
    func setupConstraints()
    func setupStyle()
    func setupAction()
}

extension ViewCode {
    func commonInit() {
        setupHierarchy()
        setupConstraints()
        setupStyle()
        setupAction()
    }
    
    func setupStyle(){}
    func setupAction(){}
}
