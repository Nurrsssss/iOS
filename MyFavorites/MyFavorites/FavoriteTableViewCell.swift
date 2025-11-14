//
//  FavoriteTableViewCell.swift
//  MyFavorites
//
//  Created by Nursultan Tolegen on 14.11.2025.
//

import UIKit

/// Custom table view cell displaying favorite items with image, title, subtitle, and review
class FavoriteTableViewCell: UITableViewCell {
    
    // MARK: - Constants
    
    static let reuseIdentifier = "FavoriteTableViewCell"
    
    // MARK: - UI Components
    
    private let itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.backgroundColor = .systemGray5
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .secondaryLabel
        label.numberOfLines = 1
        return label
    }()
    
    private let reviewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .label
        label.numberOfLines = 0 // Multi-line support
        return label
    }()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Methods
    
    private func setupUI() {
        // Configure cell appearance
        backgroundColor = .clear
        selectionStyle = .none
        
        // Style content view with rounded corners
        contentView.backgroundColor = .secondarySystemGroupedBackground
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        
        // Add subviews
        contentView.addSubview(itemImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(reviewLabel)
        
        // Set content hugging priorities
        // Title and subtitle should hug their content tightly
        titleLabel.setContentHuggingPriority(.required, for: .vertical)
        subtitleLabel.setContentHuggingPriority(.required, for: .vertical)
        // Review label can expand to fill available space
        reviewLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
        
        // Set compression resistance priorities
        // All labels should resist compression
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        subtitleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        reviewLabel.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // Image View Constraints
            // Fixed size: 80x80 points, positioned at leading edge with 16pt margin
            itemImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            itemImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            itemImageView.widthAnchor.constraint(equalToConstant: 80),
            itemImageView.heightAnchor.constraint(equalToConstant: 80),
            // Image bottom should not exceed content view bottom
            itemImageView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -12),
            
            // Title Label Constraints
            // Leading edge aligned with image trailing edge + 12pt spacing
            titleLabel.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: itemImageView.topAnchor),
            
            // Subtitle Label Constraints
            // Same horizontal constraints as title, positioned below title
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            
            // Review Label Constraints
            // Same horizontal constraints, positioned below subtitle with 8pt spacing
            reviewLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            reviewLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            reviewLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 8),
            // Review label bottom margin ensures proper spacing
            reviewLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -12)
        ])
    }
    
    // MARK: - Configuration
    
    /// Configures the cell with a favorite item
    /// - Parameter item: The FavoriteItem to display
    func configure(with item: FavoriteItem) {
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        reviewLabel.text = item.review
        
        // Load image: Try asset catalog first, then SF Symbols
        if let image = UIImage(named: item.imageName) {
            // Image from asset catalog
            itemImageView.image = image
            itemImageView.tintColor = nil
            itemImageView.contentMode = .scaleAspectFill
        } else if let image = UIImage(systemName: item.imageName) {
            // SF Symbol fallback
            itemImageView.image = image
            itemImageView.tintColor = .systemBlue
            itemImageView.contentMode = .scaleAspectFit
        } else {
            // Default fallback
            itemImageView.image = UIImage(systemName: "photo")
            itemImageView.tintColor = .systemGray
            itemImageView.contentMode = .scaleAspectFit
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        // Clear all content before reuse
        itemImageView.image = nil
        titleLabel.text = nil
        subtitleLabel.text = nil
        reviewLabel.text = nil
    }
}
