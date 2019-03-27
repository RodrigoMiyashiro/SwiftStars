//
//  DefaultObtainRepositoriesExecutorExecutor.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 25/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

import Foundation

class DefaultObtainRepositoriesExecutor: ObtainRepositoriesExecutor, RepositoriesReceiver {
    let semaphoro = DispatchSemaphore(value: 0)
    
    private var isSuccess = false
    private var obtainedRepositories: ListRepo?
    
    func obtainDisplayableRepositories(page: Int) throws -> ListRepo {
        let clientHTTP = DefaultHTTPClient()
        let provider = DefaultRepoProvider(client: clientHTTP)
        let obtainRepositories = ObtainRepositories(provider: provider, receiver: self)
        
        obtainRepositories.execute(with: page)
        
        self.semaphoro.wait()
        
        guard let obtainedRepos = self.obtainedRepositories, self.isSuccess else {
            throw ObtainRepositoriesExecutorError.errorObtainingRepositories
        }
        
        return obtainedRepos
    }
    
    func receiveRepositories(_ listRepo: ListRepo?) {
        self.obtainedRepositories = listRepo
        
        self.resumeExecution(success: true)
    }
    
    func handleErrorObtainingRepositories() {
        self.resumeExecution(success: false)
    }
    
    private func resumeExecution(success: Bool) {
        self.isSuccess = success
        self.semaphoro.signal()
    }
}
