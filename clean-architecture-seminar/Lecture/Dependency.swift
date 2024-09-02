//
//  Dependency.swift
//  clean-architecture-seminar
//
//  Created by 양재서 on 9/2/24.
//

/// A가 B를 의존한다. == A에 B가 나타난다.
class A {
    let b: B // 강한 참조: A가 B를 의존한다.
    
    init(b: B) {
        self.b = b
    }
}

class B {
    
}

class C {
    func add(b: B) { // 약한 참조: A가 B를 의존한다.
        
    }
}
