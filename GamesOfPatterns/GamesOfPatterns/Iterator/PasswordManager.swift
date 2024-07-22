//
//  PasswordManager.swift
//  GamesOfPatterns
//
//  Created by Sergey on 22.07.2024.
//

// MARK: - PasswordManagerProtocol

protocol PasswordManagerProtocol {
    var passwordTree: TreeNode { get }
    func createPreorderIterator() -> PasswordIteratorProtocol
    func createPostorderIterator() -> PasswordIteratorProtocol
    func createInorderIterator() -> PasswordIteratorProtocol
}

// MARK: - PasswordManager

final class PasswordManager: PasswordManagerProtocol {
    var passwordTree: TreeNode
    
    init(passwordTree: TreeNode) {
        self.passwordTree = passwordTree
    }
    
    func createPreorderIterator() -> PasswordIteratorProtocol {
        return PreorderIterator(manager: self)
    }
    
    func createPostorderIterator() -> PasswordIteratorProtocol {
        return PostorderIterator(manager: self)
    }
    
    func createInorderIterator() -> PasswordIteratorProtocol {
        return InorderIterator(manager: self)
    }
    
}

// MARK: - TreeNode

public class TreeNode {
    public var val: String = ""
    public var left: TreeNode?
    public var right: TreeNode?
    
    init(_ val: String) {
        self.val = val
    }
}
