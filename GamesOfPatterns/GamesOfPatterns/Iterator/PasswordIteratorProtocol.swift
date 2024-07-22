//
//  PasswordIterator.swift
//  GamesOfPatterns
//
//  Created by Sergey on 22.07.2024.
//

// MARK: - PasswordIteratorProtocol

protocol PasswordIteratorProtocol {
    func traverse() -> String
}

// MARK: - InorderIterator

final class InorderIterator: PasswordIteratorProtocol {
    let manager: PasswordManagerProtocol
    
    init(manager: PasswordManagerProtocol) {
        self.manager = manager
    }
    
    func traverse() -> String {
        var result = ""
        
        func dfs(_ root: TreeNode?) {
            guard let root = root else { return }
            dfs(root.left)
            result.append(root.val)
            dfs(root.right)
        }
        
        dfs(manager.passwordTree)
        
        return result
    }
}

// MARK: - PreorderIterator

final class PreorderIterator: PasswordIteratorProtocol {
    let manager: PasswordManagerProtocol
    
    init(manager: PasswordManagerProtocol) {
        self.manager = manager
    }
    
    func traverse() -> String {
        var result = ""
        
        func dfs(_ root: TreeNode?) {
            guard let root = root else { return }
            result.append(root.val)
            dfs(root.left)
            dfs(root.right)
        }
        
        dfs(manager.passwordTree)
        
        return result
    }
}


// MARK: - PostorderIterator

final class PostorderIterator: PasswordIteratorProtocol {
    let manager: PasswordManagerProtocol
    
    init(manager: PasswordManagerProtocol) {
        self.manager = manager
    }
    
    func traverse() -> String {
        var result = ""
        
        func dfs(_ root: TreeNode?) {
            guard let root = root else { return }
            dfs(root.left)
            dfs(root.right)
            result.append(root.val)
        }
        
        dfs(manager.passwordTree)
        
        return result
    }
}
