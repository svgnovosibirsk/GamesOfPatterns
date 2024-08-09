//
//  Strategy.swift
//  GamesOfPatterns
//
//  Created by Sergey on 09.08.2024.
//

protocol ITranslationStrategy {
    func translate() -> String
}

final class RussianTranslationStrategy: ITranslationStrategy {
    func translate() -> String {
        "Привет Мир!"
    }
}

final class SpanishTranslationStrategy: ITranslationStrategy {
    func translate() -> String {
        "Hola el Mundo!"
    }
}

final class EnglishTranslationStrategy: ITranslationStrategy {
    func translate() -> String {
        "Hello World!"
    }
}


final class Translator {
    var strategy: ITranslationStrategy
    
    init(strategy: ITranslationStrategy) {
        self.strategy = strategy
    }
    
    func setStrategy(strategy: ITranslationStrategy) {
        self.strategy = strategy
    }
    
    func translate() -> String {
        strategy.translate()
    }
}
