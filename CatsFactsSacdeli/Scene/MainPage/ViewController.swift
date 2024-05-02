//
//  ViewController.swift
//  CatsFactsSacdeli
//
//  Created by Tamuna Kakhidze on 01.05.24.
//

import UIKit
import NetworkServicePackage

class ViewController: UIViewController {
   
    let viewModel: ViewModel
    let mainPageView: MainPageView
    var facts: [Facts] = []
    
    init() {
        self.mainPageView = MainPageView()
        viewModel = ViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = mainPageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        viewModel.delegate = self
        viewModel.viewdidload()
    }
    
    func setUpUI() {
        let backgroundImage = UIImage(named: "Image")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImageView)
        view.sendSubviewToBack(backgroundImageView)
        mainPageView.tableView.dataSource = self
        mainPageView.tableView.delegate = self
        mainPageView.tableView.register(FactsCell.self, forCellReuseIdentifier: "FactsCell")
        title = "Boring Cat Facts"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        facts.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FactsCell") as? FactsCell
        cell?.backgroundColor = .clear
        cell?.configureCell(fact: facts[indexPath.section].fact)
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        20
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        UIView()
    }
}

extension ViewController: ViewModelDelegate {
    func catfactsFetched(_ facts: [Facts]) {
        self.facts = facts
        DispatchQueue.main.async {
            self.mainPageView.tableView.reloadData()
        }
    }
}



