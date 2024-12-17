//
//  APIManager.swift
//  MVVMPractice
//
//  Created by Bharath Gaddamadugu on 16/11/24.

import UIKit

enum DataError: Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case network(_ error: Error?)
}

final class APIManager {
    static let shared = APIManager()
    private init(){
        
    }
    // Result<Success, Failure>  is predefined by swift check in jump to definition.
    func fetchProducts(completion:@escaping (Result<[Product], DataError>) -> Void){
        guard let url = URL(string: Constants.API.productURL)else{
            return
        }
        
        //Background task
        URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data, error == nil else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200...299 ~= response.statusCode else{
                completion(.failure(.invalidResponse))
                return
            }
            
            // JSONDecoder() - decoding model
            do {
                let products = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(products))
            }catch{
                completion(.failure(.network(error)))
            }
            
        }.resume()// this background task switches to other queue, to resume task resume is called.
        
    }
    
}
