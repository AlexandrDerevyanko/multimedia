//
//  VideoTableViewCell.swift
//  Multimedia
//
//  Created by Aleksandr Derevyanko on 08.03.2023.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    private let videoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        videoLabel.text = nil
    }
    
    func setup(videoName: String) {
        self.videoLabel.text = videoName
    }
    
    private func setupUI() {
        addSubview(videoLabel)
        setupCoonstraints()
    }
    
    private func setupCoonstraints() {
        NSLayoutConstraint.activate([
            videoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            videoLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
