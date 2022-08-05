//
//  NewsSampleTests.swift
//  NewsSampleTests
//
//  Created by Alchemist on 11/08/2021.
//  Copyright © 2021 CircleHub. All rights reserved.
//

@testable import NewsSample
import XCTest

class NewsSampleTests: XCTestCase {
    var sut: CountryPickerPresenter?
    var mockView: CountryPickerViewController?
    var mockInteractor: CountryPickerInteractor?
    var mockRouter: CountryPickerRouter?
    /* We need to do a lot of setup here to make sure all
     out dependcies are loaded before the tests are run.*/
    // swiftlint:disable force_cast
    // swiftlint:disable force_unwrapping

    override func setUp() {
        mockView = CountryPickerViewController()
        mockInteractor = CountryPickerInteractor()
        mockRouter = CountryPickerRouter()
        sut = CountryPickerPresenter(view: mockView!,
                                     interactor: mockInteractor!,
                                     router: mockRouter!)
        mockView!.presenter = sut
        mockInteractor!.presenter = sut
        mockRouter!.viewController = mockView
        super.setUp()
    }

    override func tearDown() {
        sut = nil
        mockView = nil
        mockInteractor = nil
        mockRouter = nil
        super.tearDown()
    }

    func test_fake_function() {
        XCTAssertTrue(sut?.numberOfItems() == CountriesISO3166.allCases.count)
    }
}
