import UIKit

class TransactionCell: UITableViewCell {
    
    let transactionLabel = UILabel()
    let amountLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        transactionLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        
        transactionLabel.font = UIFont(name: "HelveticaNeue", size: 14)
        transactionLabel.textColor = UIColor.black
        
        amountLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 16)
        amountLabel.textColor = UIColor.black
        
        contentView.addSubview(transactionLabel)
        contentView.addSubview(amountLabel)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            transactionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            transactionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            amountLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            amountLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
