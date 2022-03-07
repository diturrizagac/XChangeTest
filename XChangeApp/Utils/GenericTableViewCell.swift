//
//  GenericTableViewCell.swift
//  XChangeApp
//
//  Created by Diego Raul Iturrizaga Casas on 6/03/22.
//

import UIKit

class GenericTableViewCell: UITableViewCell {
    
    private var style: GenericCellStyle = .clickable
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontSizeToFitWidth = true
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        return label
    }()
    
    private lazy var verticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subTitleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var iconImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private lazy var arrowImageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        clipsToBounds = true
        selectionStyle = .none
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var staticConstraints: [NSLayoutConstraint] {
        var constraints = [NSLayoutConstraint]()
        switch style {
        case .clickable:
            constraints.append(contentsOf: [
                iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
                iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
                iconImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
                iconImageView.heightAnchor.constraint(equalToConstant: 50),
                iconImageView.widthAnchor.constraint(equalToConstant: 50),
            ])
            constraints.append(contentsOf: [
                verticalStackView.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 25),
                verticalStackView.trailingAnchor.constraint(equalTo: arrowImageView.leadingAnchor, constant: -10),
                verticalStackView.centerYAnchor.constraint(equalTo: iconImageView.centerYAnchor),
            ])
            constraints.append(contentsOf: [
                arrowImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
                arrowImageView.centerYAnchor.constraint(equalTo: verticalStackView.centerYAnchor),
                arrowImageView.heightAnchor.constraint(equalToConstant: 40),
                arrowImageView.widthAnchor.constraint(equalToConstant: 35),
            ])
        }
        return constraints
    }
    
    func configureCell(cellStyle: GenericCellStyle,
                       model: GenericCellModel,
                       iconImage: String = "icon_exchange",
                       arrowImage: String = "icon_right_arrow_2") {
        style = cellStyle
        setupUI()
        fillUI(title: model.title, subtitle: model.subTitle, iconImage: iconImage, arrowImage: arrowImage)
    }
    
    private func setupUI() {
        addViews()
        NSLayoutConstraint.activate(staticConstraints)
    }
    
    private func fillUI(title: String,
                        subtitle: String?,
                        iconImage: String,
                        arrowImage: String) {
        switch style {
        case .clickable:
            titleLabel.text = title
            subTitleLabel.text = subtitle
            iconImageView.image = UIImage(named: iconImage)
            arrowImageView.image = UIImage(named: arrowImage)
        }
    }
    
    private func addViews() {
        contentView.addSubview(verticalStackView)
        switch style {
        case .clickable:
            contentView.addSubview(iconImageView)
            contentView.addSubview(arrowImageView)
        }
    }
}

enum GenericCellStyle {
    case clickable
}


struct GenericCellModel {
    let title: String
    let subTitle: String?
}
