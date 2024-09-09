import UIKit

class HomeViewController: UIViewController {
    
    // Profile Section
    private let profileContainerView = UIView()
    private let profileImageView = UILabel() // Changed from UIImageView to UILabel to display initials
    private let welcomeLabel = UILabel()
    private let nameLabel = UILabel()
    
    // Balance Section
    private let balanceContainerView = UIView()
    private let balanceLabel = UILabel()
    
    // Recent Transactions Section
    private let transactionsLabel = UILabel()
    private let transactionsTableView = UITableView()
    
    private let transactions: [(amount: String, card: String)] = [
        (amount: "-200 EGP", card: "Visa ending in 1234"),
        (amount: "+500 EGP", card: "MasterCard ending in 5678"),
        (amount: "-150 EGP", card: "Visa ending in 1234")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        
        // Profile Container View
        profileContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(profileContainerView)
        
        // Profile Image
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.backgroundColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1.0)
        profileImageView.layer.cornerRadius = 24
        profileImageView.clipsToBounds = true
        profileImageView.text = "AD"
        profileImageView.textAlignment = .center
        profileImageView.font = UIFont(name: "Inter", size: 20)?.withWeight(.semibold)
        profileImageView.textColor = UIColor(red: 0.54, green: 0.53, blue: 0.53, alpha: 1.0)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileContainerView.addSubview(profileImageView)
        
        // Welcome Label
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "Welcome back, "
        welcomeLabel.font = UIFont(name: "Inter", size: 14)
        welcomeLabel.textColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0)
        profileContainerView.addSubview(welcomeLabel)
        
        // Name Label
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "Asmaa Dosuky"
        nameLabel.font = UIFont(name: "Inter", size: 16)?.withWeight(.medium)
        nameLabel.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1.0)
        profileContainerView.addSubview(nameLabel)
        
        // Balance Container View
        balanceContainerView.translatesAutoresizingMaskIntoConstraints = false
        balanceContainerView.backgroundColor = UIColor(red: 0.53, green: 0.12, blue: 0.21, alpha: 1.0)
        balanceContainerView.layer.cornerRadius = 8
        view.addSubview(balanceContainerView)
        
        // Balance Label
        balanceLabel.translatesAutoresizingMaskIntoConstraints = false
        balanceLabel.text = "Current Balance: 500 EGP"
        balanceLabel.font = UIFont(name: "Inter", size: 16)
        balanceLabel.textColor = .white
        balanceContainerView.addSubview(balanceLabel)
        
        // Recent Transactions
        transactionsLabel.translatesAutoresizingMaskIntoConstraints = false
        transactionsLabel.text = "Recent Transactions"
        transactionsLabel.font = UIFont(name: "Inter", size: 18)?.withWeight(.medium)
        transactionsLabel.textColor = UIColor(red: 0.14, green: 0.13, blue: 0.12, alpha: 1.0)
        view.addSubview(transactionsLabel)
        
        transactionsTableView.translatesAutoresizingMaskIntoConstraints = false
        transactionsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "TransactionCell")
        transactionsTableView.dataSource = self
        view.addSubview(transactionsTableView)
        
        // Constraints
        NSLayoutConstraint.activate([
            // Profile Container View
            profileContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profileContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            profileContainerView.heightAnchor.constraint(equalToConstant: 49),
            
            // Profile Image
            profileImageView.leadingAnchor.constraint(equalTo: profileContainerView.leadingAnchor),
            profileImageView.centerYAnchor.constraint(equalTo: profileContainerView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 48),
            profileImageView.heightAnchor.constraint(equalToConstant: 48),
            
            // Welcome Label
            welcomeLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            welcomeLabel.topAnchor.constraint(equalTo: profileContainerView.topAnchor),
            
            // Name Label
            nameLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 4),
            
            // Balance Container View
            balanceContainerView.topAnchor.constraint(equalTo: profileContainerView.bottomAnchor, constant: 20),
            balanceContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            balanceContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            balanceContainerView.heightAnchor.constraint(equalToConstant: 123),
            
            // Balance Label
            balanceLabel.centerXAnchor.constraint(equalTo: balanceContainerView.centerXAnchor),
            balanceLabel.centerYAnchor.constraint(equalTo: balanceContainerView.centerYAnchor),
            
            // Recent Transactions Label
            transactionsLabel.topAnchor.constraint(equalTo: balanceContainerView.bottomAnchor, constant: 20),
            transactionsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            // Transactions TableView
            transactionsTableView.topAnchor.constraint(equalTo: transactionsLabel.bottomAnchor, constant: 10),
            transactionsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            transactionsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            transactionsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransactionCell", for: indexPath)
        let transaction = transactions[indexPath.row]
        cell.textLabel?.text = "\(transaction.amount) using \(transaction.card)"
        return cell
    }
}
