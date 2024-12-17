//
//  ProductListViewController.swift
//  MVVMPractice
//
//  Created by Bharath Gaddamadugu on 10/12/24.
//

import UIKit

class ProductListViewController: UIViewController {
    @IBOutlet weak var productTableview: UITableView!

    private var viewModel = ProductViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        productTableview.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        configuration()
        productTableview.dataSource = self
    }

}

extension ProductListViewController {
    
    func configuration(){
        initViewModel()
        observeEvent()
    }
    
    func initViewModel(){
        viewModel.fetchProducts()
    }
    
    // Data binding event Observe
    func observeEvent() {
        viewModel.eventHandler = { [weak self] event in
            
            guard let self else {
                return
            }
            
            switch event {
            case .loading:
                print("Loading.....")
            case .stopLoading:
                print("stop Loading...")
            case .dataLoaded:
                print("Data Loaded")
                print(self.viewModel.products)
                DispatchQueue.main.async {
                    self.productTableview.reloadData()
                }
            case .error(let error):
                print(error)
            }
            
        }
    }
}

extension ProductListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as? ProductTableViewCell else {
            return UITableViewCell()
        }
        let product = viewModel.products[indexPath.row]
        cell.product = product
        print(cell)
        return cell
    }
}
