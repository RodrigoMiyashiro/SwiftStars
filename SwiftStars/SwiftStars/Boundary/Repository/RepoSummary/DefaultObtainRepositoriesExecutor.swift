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
    
    func obtainDisplayableRepositories(page: Int, completion:@escaping(ListRepo?, Error?) -> Void) {
        let clientHTTP = DefaultHTTPClient()
        let provider = DefaultRepoProvider(client: clientHTTP)
        let obtainRepositories = ObtainRepositories(provider: provider, receiver: self)
        
        DispatchQueue.global().async {
            obtainRepositories.execute(with: page)
            self.semaphoro.wait()
            
            DispatchQueue.main.async {
                if let obtainedRepos = self.obtainedRepositories, self.isSuccess {
                    completion(obtainedRepos, nil)
                }
                else {
                    completion(nil, ObtainRepositoriesExecutorError.errorObtainingRepositories)
                }
            }
        }
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
