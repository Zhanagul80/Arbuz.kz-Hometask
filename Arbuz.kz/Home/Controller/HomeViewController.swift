//
//  HomeViewController.swift
//  Arbuz.kz
//
//  Created by Zhanagul on 28.05.2022.
//

import UIKit

final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    private let identifier = String(describing: ArbuzRowCell.self)
    private var array: [[ArbuzModel]] = [
        [ArbuzModel(id: 0, weight: 20, status: .ripe),
         ArbuzModel(id: 1,weight: 15, status: .ripe),
         ArbuzModel(id: 2,weight: 8, status: .alreadyTaken),
         ArbuzModel(id: 3,weight: 12, status: .unripe),
         ArbuzModel(id: 4,weight: 13, status: .ripe)],
        [ArbuzModel(id: 5,weight: 14, status: .alreadyTaken),
         ArbuzModel(id: 6,weight: 7, status: .unripe),
         ArbuzModel(id: 7,weight: 10, status: .alreadyTaken),
         ArbuzModel(id: 8,weight: 10, status: .unripe),
         ArbuzModel(id: 9,weight: 11, status: .ripe)],
        [ArbuzModel(id: 10,weight: 10, status: .alreadyTaken),
         ArbuzModel(id: 11,weight: 11, status: .ripe),
         ArbuzModel(id: 12,weight: 7, status: .alreadyTaken),
         ArbuzModel(id: 13,weight: 8, status: .unripe),
         ArbuzModel(id: 14,weight: 9, status: .unripe)],
        [ArbuzModel(id: 15,weight: 9, status: .unripe),
         ArbuzModel(id: 16,weight: 10, status: .ripe),
         ArbuzModel(id: 17,weight: 11, status: .alreadyTaken),
         ArbuzModel(id: 18,weight: 12, status: .unripe),
         ArbuzModel(id: 19,weight: 13, status: .ripe)],
        [ArbuzModel(id: 20,weight: 14, status: .alreadyTaken),
         ArbuzModel(id: 21,weight: 11, status: .ripe),
         ArbuzModel(id: 22,weight: 10, status: .ripe),
         ArbuzModel(id: 23,weight: 15, status: .ripe),
         ArbuzModel(id: 24,weight: 10, status: .unripe)],
    ]
    
    private var selectedArbuzList: [ArbuzModel] = []
    private var selectedRow: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailsViewController else { return }
        detailVC.models = selectedArbuzList
    }
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cell = cell as? ArbuzRowCell {
            cell.delegate = self
        }
    }
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! ArbuzRowCell
        cell.configure(with: array[indexPath.row])
        return cell
    }
}
// MARK: - ArbuzRowCellDelegate

extension HomeViewController: ArbuzRowCellDelegate {
    
    func onArbuzDidSelected(with model: ArbuzModel) {
        for row in array {
            if let arbuz = row.first(where: { $0 == model }) {
                selectedArbuzList.append(arbuz)
                print("Selected Arbuz: \(selectedArbuzList)")
            }
        }
    }
}

// MARK: - Actions

private extension HomeViewController {
    
    @IBAction func didTapAddButton(_ sender: UIButton) {
        performSegue(withIdentifier: "detailsVC", sender: self)
    }
}

// MARK: - Private Extension

private extension HomeViewController {
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: identifier, bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
}
