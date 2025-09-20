//
//  WWDCTabViewController.swift
//  DeveloperApp
//
//  Created by 황석현 on 9/19/25.
//

import UIKit

class WWDCTabViewController: UIViewController {
    
    private var highlights: AppleHLS?
    private var contentsTable: UITableView = {
        let table = UITableView()
        table.register(WWDCTableViewCell.self, forCellReuseIdentifier: WWDCTableViewCell.identifier)
        return table
    }()
    private var sampleView: SampleView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        title = "WWDC"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        sampleView = SampleView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 250))
        contentsTable.tableHeaderView = sampleView
        
        view.addSubview(contentsTable)
        contentsTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentsTable.topAnchor.constraint(equalTo: view.topAnchor),
            contentsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            contentsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            contentsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        contentsTable.delegate = self
        contentsTable.dataSource = self
    }
    
}

extension WWDCTabViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return WWDCTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        20
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

class SampleView: UIView {
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "person.fill")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample Title"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample Description"
        label.font = UIFont.preferredFont(forTextStyle: .body)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [heroImageView, titleLabel, descriptionLabel].forEach {
            addSubview($0)
        }
        applyConstraints()
    }
    
    private func applyConstraints() {
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.gray.withAlphaComponent(0.6)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundView)
        
        bringSubviewToFront(titleLabel)
        bringSubviewToFront(descriptionLabel)
        
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -8)
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

#Preview{
    TabBarViewController()
}
