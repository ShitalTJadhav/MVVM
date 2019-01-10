//
//  GameListViewModelTest.swift
//  GameAppTests
//
//  Created by Tushar  Jadhav on 2018-12-12.
//  Copyright © 2018 Shital  Jadhav. All rights reserved.
//

import XCTest
@testable import MVVMDemo

class HomeFeedModelTest: XCTestCase {
    
    var viewModel : HomeFeedViewModel!
    fileprivate var service : MockNetworkService!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.service = MockNetworkService()
        self.viewModel = HomeFeedViewModel(service: self.service)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
        self.viewModel = nil
        self.service = nil
    }
    
    func testFetchWithVideoList() {
                
        // giving a service mocking
        service.homeFeed = HomeFeed(videos: [Video(id: 1, name: "Kindle training")])
        
        // expected completion to succeed
        viewModel.fetchHomeFeedData{ result in
            if !result {
                XCTAssert(false, "ViewModel should not be able to fetch with service")
            }
        }
    }

    func testFetchNoVideoList() {
        
        // giving a service mocking error during fetching games
        service.homeFeed = nil
        
        // expected completion to fail
        viewModel.fetchHomeFeedData { result in
            
            if result {
                XCTAssert(true, "ViewModel should not be able to fetch ")
            }
        }
    }
    
    func testFetchVideosWithNoService() {
        
        // giving no service to a view model
        viewModel.service = nil
        
        // expected to not be able to fetch games
        viewModel.fetchHomeFeedData { result in
            if result {
                XCTAssert(false, "ViewModel should not be able to fetch without service")
            }
        }
    }
}

fileprivate class MockNetworkService : NetworklHelper {
    
//    var shouldReturnError = false
//    var requestVideoWasCalled = false
//
//    enum MockServiceResult {
//        case Sucess(HomeFeed)
//        case Failure(String)
//    }
//
//    convenience override init() {
//        self.init(false)
//    }
//
//    init(_ shouldReturnError : Bool) {
//        self.shouldReturnError = shouldReturnError
//    }
//
//    let feedResponce :
    
//    func reset() {
//        shouldReturnError = false
//        requestVideoWasCalled = false
//    }
    
    var homeFeed : HomeFeed?
    
//    func test<T: MyProcotol>(item: T, completion: (Result<T>) -> Void) {
//        let result : Result<T> = .success(value: item)
//        completion(result)
//    }
    
//    override func fetchData<T>(urlString: String, parameter: T.Type, completion: @escaping (Result<T>) -> ()) where T : Decodable {
//
//        if let model = homeFeed {
//            let result : Result<T> = Result.success(model) as! Result<T>
//            completion(result)
//        } else {
//            completion(Result.failure("Error in fetching data"))
//        }
//    }
    
    override func fetchData<T: Decodable>(urlString: String, completion: @escaping (Result<T>) -> ()) {
        if let model = homeFeed {
            completion(Result.success(model) as! Result<T>)
        } else {
            completion(Result.failure("Error in fetching data"))
        }
    }
}
