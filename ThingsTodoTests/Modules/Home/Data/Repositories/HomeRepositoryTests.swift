//
//  HomeRepositoryTests.swift
//  ThingsTodoTests
//
//  Created by Vitor Bukovitz on 14/09/21.
//

import XCTest
@testable import ThingsTodo

class HomeRepositoryTests: XCTestCase {
    
    func testFetchTodosMustCallHomeUserDefaultsFetchTodos() {
        // Arrange
        let homeUserDefaults = HomeUserDefaultsDataSourceMock()
        homeUserDefaults.result = []
        let homeRepository = makeHomeRepository(homeUserDefaults: homeUserDefaults)
        let expectation = expectation(description: "wait homeRepository.fetchTodos")
        
        // Act
        homeRepository.fetchTodos { _ in
            expectation.fulfill()
        }
        
        // Assert
        wait(for: [expectation], timeout: 5)
        print(homeUserDefaults.fetchTodoCount)
        XCTAssert(homeUserDefaults.fetchTodoCount == 1)
    }
    
    weak var homeRepository: HomeRepository?
    
    override func tearDown() {
        XCTAssertNil(homeRepository)
    }

    func makeHomeRepository(homeUserDefaults: HomeUserDefaultsDataSource = HomeUserDefaultsDataSourceMock()) -> HomeRepository {
        let homeRepository = HomeRepositoryImpl(homeUserDefaultsDataSource: HomeUserDefaultsDataSourceMock())
        self.homeRepository = homeRepository
        return homeRepository
    }
    
}

class HomeUserDefaultsDataSourceMock: HomeUserDefaultsDataSource {
    
    var fetchTodoCount = 0
    var result: [Todo]?
    
    func fetchTodos(completion: ([Todo]) -> Void) {
        fetchTodoCount += 1
        guard let result = result else { return }
        completion(result)
    }
}
