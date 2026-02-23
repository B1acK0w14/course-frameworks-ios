//
//  ShoppingAppServices.swift
//  ShoppingApp
//
//  Created by David Penagos on 12/02/26.
//

import Foundation

struct ShoppingAppPlaceholder: Codable, Identifiable {
    let userId: Int
    let id: Int
    var title: String
    var completed: Bool
}

class ShoppingAppServices {
    
    func callShoppingService(completion: @escaping (Result<[ShoppingAppPlaceholder], Error>) -> Void) {
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos")!) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let data = data {
                do {
                    let dataDecoded = try JSONDecoder().decode([ShoppingAppPlaceholder].self, from: data)
                    completion(.success(dataDecoded))
                } catch {
                    completion(.failure(error))
                }
                
            }
        }.resume()
    }
}
