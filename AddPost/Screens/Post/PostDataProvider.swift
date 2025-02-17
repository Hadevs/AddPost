//
//  PostDataProvider.swift
//  AddPost
//
//  Created by Vladislav on 15.01.2022.
//

import Foundation

protocol PostDataProvidable {
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func setPosts(posts: [PostModel])
    func getPost(by indexPath: IndexPath) -> PostModel
}

class PostDataProvider: PostDataProvidable {
    
    typealias Model = PostModel
    private var models: [PostModel] = []

    //Applying protocol finctions
    func setPosts(posts: [PostModel]) {
        self.models = posts
        print(models.count)
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        models.count
    }
    
    func getPost(by indexPath: IndexPath) -> PostModel {
        return models[indexPath.row]
    }
}
