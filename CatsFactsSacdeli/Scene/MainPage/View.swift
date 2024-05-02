import UIKit

class MainPageView: UIView {
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: topAnchor, constant: 18).isActive = true
        tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 3).isActive = true
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 21).isActive = true
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -27).isActive = true
        tableView.rowHeight = 90
        tableView.backgroundColor = .clear
    }
    
}


