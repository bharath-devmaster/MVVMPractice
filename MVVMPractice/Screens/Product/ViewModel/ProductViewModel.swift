//
//  ProductViewModel.swift
//  MVVMPractice
//
//  Created by Bharath Gaddamadugu on 10/12/24.
//

final class ProductViewModel {
    
    var products: [Product] = []
    
    var eventHandler:((_ event:Event) -> Void)? //Data Binding closure
    
    func fetchProducts(){
        self.eventHandler?(.loading)
        APIManager.shared.fetchProducts { response in
            self.eventHandler?(.stopLoading)
            switch response {
            case .success(let products):
                // Setting updated products is important.
                self.products = products
                self.eventHandler?(.dataLoaded)
//                print(products)
            case .failure(let error):
                self.eventHandler?(.error(error))
                print(error)
            }
            
        }
    }
    
    
}

extension ProductViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
