//
//  DefaultRepoProvider.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 25/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

class DefaultRepoProvider: RepositoriesProvider, RemoteProvider {
    private let client: HTTPClient
    
    init(client: HTTPClient) {
        self.client = client
    }
    
    func repositories(page: Int) throws -> ListRepo? {
        let path = "/search/repositories"
        let url = self.baseRemoteAddress().appendedPath(path)
        let parameters = ["q": "language:swift",
                          "sort": "stars",
                          "page": "\(page)",
                          "per_page": "20"]
        
        guard let listRepo: ListRepo = try self.client.get(url, with: parameters) else {
            throw RepositoriesProviderError.errorObtainingRepositories
        }
        
        return listRepo
    }
}
