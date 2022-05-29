//
//  DetailsViewController.swift
//  Arbuz.kz
//
//  Created by Zhanagul on 28.05.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var intoSlicesSwitch: UISwitch!
    @IBOutlet private weak var tableView: UITableView!
    
    var models: [ArbuzModel] = []
    
    private let identifier = String(describing: OrderTableViewCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        print(models)
    }
    
    @IBAction func didTapMakePaymentButton(_ sender: UIButton) {
        performSegue(withIdentifier: "showOrder", sender: self)
    }
}

extension DetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! OrderTableViewCell
        cell.configure(with: models[indexPath.row])
        return cell
    }
}

// MARK: - Private

private extension DetailsViewController {
    
    func setupTableView() {
        tableView.dataSource = self
        let nib = UINib(nibName: identifier, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
}
