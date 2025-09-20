//
//  WWDCTableViewCell.swift
//  DeveloperApp
//
//  Created by 황석현 on 9/19/25.
//

import UIKit

class WWDCTableViewCell: UITableViewCell {
    
    static let identifier = "WWDCTableViewCell"
    
    private let thumbnailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play.fill"), for: .normal)
        button.tintColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(thumbnailImage)
        contentView.addSubview(playButton)
        contentView.addSubview(titleLabel)
        
        setupConstraints()
        configure()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            thumbnailImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            thumbnailImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            thumbnailImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            thumbnailImage.heightAnchor.constraint(equalToConstant: 180),
            
            playButton.trailingAnchor.constraint(equalTo: thumbnailImage.trailingAnchor, constant: -8),
            playButton.bottomAnchor.constraint(equalTo: thumbnailImage.bottomAnchor, constant: -8),
            playButton.widthAnchor.constraint(equalToConstant: 36),
            playButton.heightAnchor.constraint(equalToConstant: 36),
            
            titleLabel.topAnchor.constraint(equalTo: thumbnailImage.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configure() {
        thumbnailImage.image = UIImage(systemName: "photo")
        titleLabel.text = "Testing \(Int.random(in: 1...10))"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
