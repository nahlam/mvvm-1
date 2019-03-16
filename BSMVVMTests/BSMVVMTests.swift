//
//  BSMVVMTests.swift
//  BSMVVMTests
//
//  Created by Nahla Mortada on 3/16/19.
//  Copyright © 2019 Nahla Mortada. All rights reserved.
//

import XCTest
@testable import BSMVVM

class BSMVVMTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testParsingData() {
        guard let result = try? ArticlesResonse.fromJSON("Response", bundle: Bundle(for: type(of: self))) as ArticlesResonse else {
            XCTFail("Failed to load the file")
            return }
        print(result.count)
        XCTAssert(result.count == 1715, "Total count is wrong")
        XCTAssert(result.articles.count == 20, "Articles count is wrong")
    }

}

extension Decodable {
    
    static func fromJSON<T: Decodable>(_ fileName: String, fileExtension: String = "json", bundle: Bundle = .main) throws -> T {
        guard let url = bundle.url(forResource: fileName, withExtension: fileExtension) else {
            throw NSError(domain: NSURLErrorDomain, code: NSURLErrorResourceUnavailable)
        }
        
        let data = try Data(contentsOf: url)
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
