//
//  ListCell.swift
//  OpenMarket
//  Created by inho, Hamo, Jeremy on 2022/11/22.
//

import UIKit

class ListCell: UICollectionViewListCell {
    var listContentView: UIListContentView = UIListContentView(configuration: .cell())
    let stockLabel: UILabel = UILabel()
    var stockLabelConstraints: (stockLabelcenterY: NSLayoutConstraint,
                                stockLabelTrailing: NSLayoutConstraint)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout() {
        contentView.addSubview(listContentView)
        contentView.addSubview(stockLabel)
        listContentView.translatesAutoresizingMaskIntoConstraints = false
        stockLabel.translatesAutoresizingMaskIntoConstraints = false
        stockLabel.setContentCompressionResistancePriority(.required, for: .horizontal)
        let constraints = (stockLabelcenterY: stockLabel.centerYAnchor.constraint(equalTo: listContentView.centerYAnchor),
                           stockLabelTrailing: stockLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor))
        
        NSLayoutConstraint.activate([
            listContentView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            listContentView.trailingAnchor.constraint(lessThanOrEqualTo: stockLabel.leadingAnchor),
            listContentView.topAnchor.constraint(equalTo: contentView.topAnchor),
            listContentView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            constraints.stockLabelcenterY,
            constraints.stockLabelTrailing,
        ])
        
        stockLabelConstraints = constraints
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        super.preferredLayoutAttributesFitting(layoutAttributes)
        layoutIfNeeded()
        
        let size = self.frame.width * 0.2
        var frame = layoutAttributes.frame
        
        frame.size.height = size
        layoutAttributes.frame = frame
        
        return layoutAttributes
    }
}