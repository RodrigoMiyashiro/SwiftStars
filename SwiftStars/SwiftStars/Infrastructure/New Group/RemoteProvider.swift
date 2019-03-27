//
//  RemoteProvider.swift
//  SwiftStars
//
//  Created by Rodrigo Miyashiro on 25/03/19.
//  Copyright © 2019 Rodrigo Miyashiro. All rights reserved.
//

private let remoteAddress = RemoteAddress(scheme: "https",
                                              host: "api.github.com")

protocol  RemoteProvider {}

extension RemoteProvider {
    func baseRemoteAddress() -> RemoteAddress {
        return remoteAddress
    }
}
