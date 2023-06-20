//
//  SearchViewController.swift
//  MusicApplication
//
//  Created by BoMin on 2023/06/20.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate {
    private var searchBar: UISearchBar!
    private var resultLabel: UILabel!
    private var searchResults: [String] = []
    private let searchResultsKey = "SearchResults"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 검색창 생성
        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.placeholder = "검색어를 입력하세요"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchBar)
        
        // 검색창의 제약 조건 설정
        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // 검색창을 네비게이션 바로부터 여백을 주기 위한 제약 조건 설정
        let margins = view.layoutMarginsGuide
        searchBar.topAnchor.constraint(equalTo: margins.topAnchor, constant: 8).isActive = true
        
        // 결과 레이블을 표시할 레이블 생성
        resultLabel = UILabel()
        resultLabel.textAlignment = .center
        resultLabel.numberOfLines = 0  // 여러 줄 표시 가능하도록 설정
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabel)
        
        // 결과 레이블의 제약 조건 설정
        resultLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20).isActive = true
        resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        // 결과 레이블에 초기 텍스트 설정
        resultLabel.text = loadSearchResults()
        
        // 검색 결과 초기화 버튼 생성
        let resetButton = UIButton(type: .system)
        resetButton.setTitle("검색 결과 초기화", for: .normal)
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resetButton)
        
        // 검색 결과 초기화 버튼의 제약 조건 설정
        resetButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20).isActive = true
        resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    // 검색 버튼을 눌렀을 때 호출되는 메서드
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            return
        }
        
        // 검색 결과를 저장하고 업데이트
        saveSearchResult(searchText: searchText)
        resultLabel.text = loadSearchResults()
        
        // 검색어가 "Apple"인 경우에 특정 메소드 실행
        if searchText.lowercased() == "apple" {
            performCustomAction()
        }
        else if searchText.lowercased() == "ed sheeran" {
            print("Ed Sheeran")
        }
        
        // 키보드 닫기
        searchBar.resignFirstResponder()
    }
    
    // 검색 결과를 로컬에 저장
    func saveSearchResult(searchText: String) {
        // 최신 검색 결과를 배열 맨 앞에 추가
        searchResults.insert(searchText, at: 0)
        
        // 로컬에 저장 (예시로 UserDefaults 사용)
        UserDefaults.standard.set(searchResults, forKey: searchResultsKey)
    }
    
    // 저장된 검색 결과를 로드
    func loadSearchResults() -> String {
        // 로컬에서 검색 결과 로드 (예시로 UserDefaults 사용)
        if let savedResults = UserDefaults.standard.array(forKey: searchResultsKey) as? [String] {
            searchResults = savedResults
        }
        
        // 검색 결과를 줄바꿈하여 문자열로 반환
        let resultsString = searchResults.reversed().joined(separator: "\n")
        return resultsString
    }
    
    // 검색 결과 초기화 버튼 동작
    @objc func resetButtonTapped() {
        resetUserDefaults()
    }
    
    // UserDefaults 초기화
    func resetUserDefaults() {
        UserDefaults.standard.removeObject(forKey: searchResultsKey)
        searchResults.removeAll()
        resultLabel.text = loadSearchResults()
    }
    
    // 특정 메소드 실행 (주석으로 표시)
    func performCustomAction() {
        // 특정 메소드 실행하는 로직을 여기에 작성
        // 예시: print("Apple 검색어에 대한 특정 메소드 실행")
        print()
    }
}

