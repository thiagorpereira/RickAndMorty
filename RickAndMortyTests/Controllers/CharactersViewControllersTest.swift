//
//  CharactersViewControllersTest.swift
//  RickAndMortyTests
//
//  Created by Thiago Pereira on 22/05/23.
//

import XCTest
@testable import RickAndMorty

final class CharactersViewControllersTest: XCTestCase {
    
    let charactersVc = CharactersViewController()
    let tableView = UITableView()
    let indexPath = IndexPath(row: 0, section: 0)
    
    // Chamado antes de cada teste
    override func setUp() {
        super.setUp()
        charactersVc.network = NetworkProtocolSpy()
        charactersVc.viewDidLoad()
        
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.identifier)
    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testViewControllerPresentation() {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        window.rootViewController = charactersVc
        
        window.makeKeyAndVisible()
        
        XCTAssertTrue(window.rootViewController === charactersVc)
        
        XCTAssertTrue(charactersVc.viewIfLoaded?.window != nil)
    }
    
    func testReturnExpectedCharacterCell() {
        let cell = charactersVc.tableView(tableView, cellForRowAt: indexPath)
        XCTAssertTrue(cell is CharacterTableViewCell)
    }
    
    func testNumberOfRowsInSection() {
        let numberOfRowsInSection = charactersVc.tableView(tableView, numberOfRowsInSection: 0)
        XCTAssertTrue(numberOfRowsInSection == 1)
    }
    
    func testHeightForRowAt() {
        let heightForRowAt = charactersVc.tableView(tableView, heightForRowAt: indexPath)
        XCTAssertTrue(heightForRowAt == 140)
    }
}
