//
//  SearchViewController.swift
//  MusicApplication
//
//  Created by BoMin on 2023/06/20.
//

//import UIKit
//
//class SearchViewController: UIViewController, UISearchBarDelegate {
//    private var searchBar: UISearchBar!
//    private var resultLabel: UILabel!
//    private var resultView: UIView!
//    private var resultView2: UIView!
//    private var searchResults: [String] = []
//    private let searchResultsKey = "SearchResults"
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // 검색창 생성
//        searchBar = UISearchBar()
//        searchBar.delegate = self
//        searchBar.placeholder = "검색어를 입력하세요"
//        searchBar.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(searchBar)
//
//        // 검색창의 제약 조건 설정
//        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//
//        // 검색창을 네비게이션 바로부터 여백을 주기 위한 제약 조건 설정
//        let margins = view.layoutMarginsGuide
//        searchBar.topAnchor.constraint(equalTo: margins.topAnchor, constant: 8).isActive = true
//
//        // 결과 레이블을 표시할 레이블 생성
//        resultLabel = UILabel()
//        resultLabel.textAlignment = .center
//        resultLabel.numberOfLines = 0  // 여러 줄 표시 가능하도록 설정
//        resultLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(resultLabel)
//
//        // 결과 레이블의 제약 조건 설정
//        resultLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20).isActive = true
//        resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//
//        // 결과 레이블에 초기 텍스트 설정
//        resultLabel.text = loadSearchResults()
//
//        // 검색 결과 초기화 버튼 생성
//        let resetButton = UIButton(type: .system)
//        resetButton.setTitle("검색 결과 초기화", for: .normal)
//        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
//        resetButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(resetButton)
//
//        // 검색 결과 초기화 버튼의 제약 조건 설정
//        resetButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20).isActive = true
//        resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//    }
//
//    // 검색 버튼을 눌렀을 때 호출되는 메서드
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let searchText = searchBar.text else {
//            return
//        }
//
//        // 검색 결과를 저장하고 업데이트
//        saveSearchResult(searchText: searchText)
//        resultLabel.text = loadSearchResults()
//
//        // 검색어가 "Apple"인 경우에 특정 메소드 실행
//        if searchText.lowercased() == "apple" {
//            performCustomAction()
//        }
//        else if searchText.lowercased() == "ed sheeran" {
//            print("Ed Sheeran")
//        }
//
//        // 키보드 닫기
//        searchBar.resignFirstResponder()
//    }
//
//    // 검색 결과를 로컬에 저장
//    func saveSearchResult(searchText: String) {
//        // 최신 검색 결과를 배열 맨 앞에 추가
//        searchResults.insert(searchText, at: 0)
//
//        // 로컬에 저장 (예시로 UserDefaults 사용)
//        UserDefaults.standard.set(searchResults, forKey: searchResultsKey)
//    }
//
//    // 저장된 검색 결과를 로드
//    func loadSearchResults() -> String {
//        // 로컬에서 검색 결과 로드 (예시로 UserDefaults 사용)
//        if let savedResults = UserDefaults.standard.array(forKey: searchResultsKey) as? [String] {
//            searchResults = savedResults
//        }
//
//        // 검색 결과를 줄바꿈하여 문자열로 반환
//        let resultsString = searchResults.reversed().joined(separator: "\n")
//        return resultsString
//    }
//
//    // 검색 결과 초기화 버튼 동작
//    @objc func resetButtonTapped() {
//        resetUserDefaults()
//    }
//
//    // UserDefaults 초기화
//    func resetUserDefaults() {
//        UserDefaults.standard.removeObject(forKey: searchResultsKey)
//        searchResults.removeAll()
//        resultLabel.text = loadSearchResults()
//    }
//
//    // 특정 메소드 실행 (주석으로 표시)
//    func performCustomAction() {
//        // 특정 메소드 실행하는 로직을 여기에 작성
//        // 예시: print("Apple 검색어에 대한 특정 메소드 실행")
//        print()
//    }
//}
//

//import UIKit
//
//class SearchViewController: UIViewController, UISearchBarDelegate {
//    private var searchBar: UISearchBar!
//    private var resultLabel: UILabel!
//    private var searchResults: [String] = []
//    private let searchResultsKey = "SearchResults"
//    private var albumImageView: UIImageView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // 검색창 생성
//        searchBar = UISearchBar()
//        searchBar.delegate = self
//        searchBar.placeholder = "검색어를 입력하세요"
//        searchBar.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(searchBar)
//
//        // 검색창의 제약 조건 설정
//        searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
//        searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//
//        // 검색창을 네비게이션 바로부터 여백을 주기 위한 제약 조건 설정
//        let margins = view.layoutMarginsGuide
//        searchBar.topAnchor.constraint(equalTo: margins.topAnchor, constant: 8).isActive = true
//
//        // 결과 레이블을 표시할 레이블 생성
//        resultLabel = UILabel()
//        resultLabel.textAlignment = .center
//        resultLabel.numberOfLines = 0  // 여러 줄 표시 가능하도록 설정
//        resultLabel.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(resultLabel)
//
//        // 결과 레이블의 제약 조건 설정
//        resultLabel.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20).isActive = true
//        resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//
//        // 결과 레이블에 초기 텍스트 설정
//        resultLabel.text = loadSearchResults()
//
//        // 검색 결과 초기화 버튼 생성
//        let resetButton = UIButton(type: .system)
//        resetButton.setTitle("검색 결과 초기화", for: .normal)
//        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
//        resetButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(resetButton)
//
//        // 검색 결과 초기화 버튼의 제약 조건 설정
//        resetButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20).isActive = true
//        resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//
//        // 앨범 표지 이미지를 표시할 이미지 뷰 생성
//        albumImageView = UIImageView()
//        albumImageView.contentMode = .scaleAspectFit
//        albumImageView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(albumImageView)
//
//        // 앨범 표지 이미지 뷰의 제약 조건 설정
//        albumImageView.topAnchor.constraint(equalTo: resetButton.bottomAnchor, constant: 20).isActive = true
//        albumImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        albumImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        albumImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//    }
//
//    // 검색 버튼을 눌렀을 때 호출되는 메서드
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        guard let searchText = searchBar.text else {
//            return
//        }
//
//        // 검색 결과를 저장하고 업데이트
//        saveSearchResult(searchText: searchText)
//        resultLabel.text = loadSearchResults()
//
//        // 앨범 표지 이미지 업데이트
//        updateAlbumImage(searchText: searchText)
//
//        // 키보드 닫기
//        searchBar.resignFirstResponder()
//    }
//
//    // 앨범 표지 이미지 업데이트
//    func updateAlbumImage(searchText: String) {
//        var albumImageName: String?
//
//        // 가수와 노래 제목에 따라 앨범 표지 이미지 파일명 설정
//        if searchText == "Ed Sheeran" {
//            albumImageName = "BadHabbits" // 앨범 표지 이미지 파일명
//        } else if searchText == "Exo" {
//            albumImageName = "LoveMeRight" // 앨범 표지 이미지 파일명
//        } else if searchText == "One Republic" {
//            albumImageName = "CountingStars" // 앨범 표지 이미지 파일명
//        } else if searchText == "Red Velvet" {
//            albumImageName = "FeelMyRhythm" // 앨범 표지 이미지 파일명
//        }
//
//        if let albumImageName = albumImageName {
//            // 앨범 표지 이미지를 이미지 뷰에 설정
//            let albumImage = UIImage(named: albumImageName)
//            albumImageView.image = albumImage
//        }
//    }
//
//    // 검색 결과를 로컬에 저장
//    func saveSearchResult(searchText: String) {
//        // 최신 검색 결과를 배열 맨 앞에 추가
//        searchResults.insert(searchText, at: 0)
//
//        // 로컬에 저장 (예시로 UserDefaults 사용)
//        UserDefaults.standard.set(searchResults, forKey: searchResultsKey)
//    }
//
//    // 저장된 검색 결과를 로드
//    func loadSearchResults() -> String {
//        // 로컬에서 검색 결과 로드 (예시로 UserDefaults 사용)
//        if let savedResults = UserDefaults.standard.array(forKey: searchResultsKey) as? [String] {
//            searchResults = savedResults
//        }
//
//        // 검색 결과를 줄바꿈하여 문자열로 반환
//        let resultsString = searchResults.reversed().joined(separator: "\n")
//        return resultsString
//    }
//
//    // 검색 결과 초기화 버튼 동작
//    @objc func resetButtonTapped() {
//        resetUserDefaults()
//    }
//
//    // UserDefaults 초기화
//    func resetUserDefaults() {
//        UserDefaults.standard.removeObject(forKey: searchResultsKey)
//        searchResults.removeAll()
//        resultLabel.text = loadSearchResults()
//    }
//}

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    private var searchBar: UISearchBar!
    private var tableView: UITableView!
    private var searchResults: [(title: String, artist: String, albumCover: String)] = []
    private var searchHistory: [String] = []
    private let searchResultsKey = "SearchResults"
    private let searchHistoryKey = "SearchHistory"
    
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
        
        // 테이블 뷰 생성
        tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        // 테이블 뷰의 제약 조건 설정
        tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        // 테이블 뷰 셀 등록
        tableView.register(SearchResultTableViewCell.self, forCellReuseIdentifier: "SearchResultCell")
        
        // 결과 데이터 초기화
        searchResults = loadSearchResults()
        searchHistory = loadSearchHistory()
    }
    
    // 검색 버튼을 눌렀을 때 호출되는 메서드
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {
            return
        }
        
        // 검색 결과 업데이트
        updateSearchResults(searchText: searchText)
        
        // 검색 기록 업데이트
        updateSearchHistory(searchText: searchText)
                
        // 키보드 닫기
        searchBar.resignFirstResponder()
    }
    
    // 검색 결과를 업데이트
    func updateSearchResults(searchText: String) {
        searchResults = filterSearchResults(searchText: searchText)
        tableView.reloadData()
    }
    
    // 검색 결과를 로드
    func loadSearchResults() -> [(title: String, artist: String, albumCover: String)] {
        return [
                    ("Bad Habits", "Ed Sheeran", "BadHabits"),
                    ("Shape Of You", "Ed Sheeran", "ShapeOfYou"),
                    ("Love Me Right", "Exo", "LoveMeRight"),
                    ("Love Shot", "Exo", "LoveShot"),
                    ("Counting Stars", "One Republic", "CountingStars"),
                    ("I Ain't Worried", "One Republic", "IAintWorried"),
                    ("Feel My Rhythm", "Red Velvet", "FeelMyRhythm"),
                    ("Psycho", "Red Velvet", "Psycho")
                ]
    }
    
    // 검색 결과 필터링
    func filterSearchResults(searchText: String) -> [(title: String, artist: String, albumCover: String)] {
        let filteredResults = loadSearchResults().filter {
            $0.title.lowercased().contains(searchText.lowercased()) || $0.artist.lowercased().contains(searchText.lowercased())
        }
        return filteredResults
    }
    
    // 검색 기록을 로드
    func loadSearchHistory() -> [String] {
        if let savedHistory = UserDefaults.standard.array(forKey: searchHistoryKey) as? [String] {
            return savedHistory
        }
        return []
    }
    
    // 검색 기록 업데이트
    func updateSearchHistory(searchText: String) {
        // 최신 검색 기록을 배열 맨 앞에 추가
        searchHistory.insert(searchText, at: 0)
        
        // 최대 5개의 검색 기록 유지
        if searchHistory.count > 5 {
            searchHistory.removeLast()
        }
        
        // 로컬에 저장 (예시로 UserDefaults 사용)
        UserDefaults.standard.set(searchHistory, forKey: searchHistoryKey)
    }
    //MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            // 검색 기록 섹션
            let historyItem = searchHistory[indexPath.row]
            handleSearchHistorySelection(historyItem)
        } else if indexPath.section == 1 {
            // 검색 결과 섹션
            let searchResult = searchResults[indexPath.row]
            handleSearchResultSelection(searchResult)
        }
        
        // 선택한 셀의 강조 표시 해제
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // 검색 기록 선택 시 동작
    func handleSearchHistorySelection(_ historyItem: String) {
        // 선택한 검색 기록에 대한 동작 수행
        // 예: 검색 기록을 다시 검색어로 설정하고 검색 수행
        
        searchBar.text = historyItem
        searchBarSearchButtonClicked(searchBar)
    }
    
    // 검색 결과 선택 시 동작
    func handleSearchResultSelection(_ searchResult: (title: String, artist: String, albumCover: String)) {
        let title = searchResult.title
        let artist = searchResult.artist
        let albumCover = searchResult.albumCover
        
        let detailsVC = MusicDetailViewController()
        detailsVC.setValues(title: title, artist: artist, albumCover: albumCover)
    
        show(detailsVC, sender: nil)
    }
    
    // MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return searchHistory.count
        } else if section == 1 {
            return searchResults.count
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath) as! SearchResultTableViewCell
        
        if indexPath.section == 0 {
            // 검색 기록 섹션
            let historyItem = searchHistory[indexPath.row]
            var albumCoverImg = historyItem
            
            if historyItem == "Red Velvet" {
                albumCoverImg = "RedVelvet"
            } else if historyItem == "Ed Sheeran" {
                albumCoverImg = "EdSheeran"
            } else if historyItem == "Exo" {
                albumCoverImg = "Exo"
            } else if historyItem == "One Republic" {
                albumCoverImg = "OneRepublic"
            } else {
                albumCoverImg = historyItem.components(separatedBy: [" ", "'"]).joined()
                print(albumCoverImg)
            }
            
            cell.configureCell(title: historyItem, artist: " ", albumCover: albumCoverImg)
        } else if indexPath.section == 1 {
            // 검색 결과 섹션
            let searchResult = searchResults[indexPath.row]
            cell.configureCell(title: searchResult.title, artist: searchResult.artist, albumCover: searchResult.albumCover)
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Search History"
        } else if section == 1 {
            return "Search Results"
        }
        return nil
    }
    
    // 검색 기록 초기화 버튼 동작
    @objc func resetButtonTapped() {
        resetUserDefaults()
        tableView.reloadData()
    }
    
    // UserDefaults 초기화
    func resetUserDefaults() {
        UserDefaults.standard.removeObject(forKey: searchResultsKey)
        UserDefaults.standard.removeObject(forKey: searchHistoryKey)
        searchResults.removeAll()
        searchHistory.removeAll()
    }
}


class SearchResultTableViewCell: UITableViewCell {
    private var albumCoverImageView: UIImageView!
    private var titleLabel: UILabel!
    private var artistLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        albumCoverImageView = UIImageView()
        albumCoverImageView.contentMode = .scaleAspectFit
        albumCoverImageView.clipsToBounds = true
        albumCoverImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(albumCoverImageView)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        artistLabel = UILabel()
        artistLabel.textColor = .systemGray
        artistLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(artistLabel)
        
        NSLayoutConstraint.activate([
            albumCoverImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            albumCoverImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            albumCoverImageView.widthAnchor.constraint(equalToConstant: 60),
            albumCoverImageView.heightAnchor.constraint(equalToConstant: 60),
            
            titleLabel.leadingAnchor.constraint(equalTo: albumCoverImageView.trailingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            artistLabel.leadingAnchor.constraint(equalTo: albumCoverImageView.trailingAnchor, constant: 10),
            artistLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            artistLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            artistLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(title: String, artist: String, albumCover: String) {
        titleLabel.text = title
        artistLabel.text = artist
        albumCoverImageView.image = UIImage(named: albumCover)
    }
}

