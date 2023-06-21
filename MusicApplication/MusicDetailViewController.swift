//
//  MusicDetailViewController.swift
//  MusicApplication
//
//  Created by BoMin on 2023/06/21.
//

import UIKit

class MusicDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var albumCoverImageView: UIImageView!
    
    var playButton: UIButton!
    
    var musicTitle = ""
    var artist = ""
    var albumCover = ""
    var isPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        playButton = UIButton()
        playButton.setImage(UIImage(named:"play"), for: .normal)
        playButton.translatesAutoresizingMaskIntoConstraints = false
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        view.addSubview(playButton)
        playButton.topAnchor.constraint(equalTo: albumCoverImageView.bottomAnchor, constant: 50).isActive = true
        playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.titleLabel.text = self.musicTitle
        self.artistLabel.text = self.artist
        self.albumCoverImageView.image = UIImage(named: self.albumCover)
    }
    
    func setValues(title: String, artist: String, albumCover: String) {
        self.musicTitle = title
        self.artist = artist
        self.albumCover = albumCover
    }
    
    @objc func playButtonTapped() {
        
        if isPlaying == false {
            isPlaying = true
            self.playButton.setImage(UIImage(named:"pause"), for: .normal)
        } else {
            isPlaying = false
            self.playButton.setImage(UIImage(named:"play"), for: .normal)
        }
        print(isPlaying)
    }


}
