//
//  TableCell.swift
//  MovieApp
//
//  Created by Victor on 27.12.2023.
//

import UIKit

class TableCell<View: Configurable>: UITableViewCell {
    private let view = View()
    private let stackView = UIStackView()
    private var didSelectHandler: (() -> Void)?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        view.update(with: nil)
    }
    
    func update(with model: View.Model, height: CGFloat? = nil, didSelectHandler: (() -> Void)? = nil) {
        view.update(with: model)
        self.didSelectHandler = didSelectHandler
        
        if let height {
            stackView.snp.remakeConstraints {
                $0.height.equalTo(height)
                $0.edges.equalToSuperview()
            }
        }
    }
    
    private func configure() {
        
        backgroundColor = .clear
        
        contentView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        stackView.addArrangedSubview(view)
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(didSelect))
        tapGR.cancelsTouchesInView = false
        addGestureRecognizer(tapGR)
    }
    
    @objc
    private func didSelect() {
        didSelectHandler?()
    }
}
