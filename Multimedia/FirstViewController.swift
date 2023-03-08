//
//  ViewController.swift
//  Multimedia
//
//  Created by Aleksandr Derevyanko on 08.03.2023.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var trackNumber = 0
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var trackName: UILabel = {
        let label = UILabel()
        label.text = tracks[trackNumber].trackName
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let playButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play.circle"), for: [])
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let stopButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "stop.circle"), for: [])
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nextTrackButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "forward.circle"), for: [])
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let previousTrackButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "backward.circle"), for: [])
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addTargets()
        playCurrentTrack()
    }
    
    private func playCurrentTrack() {
        do {
            player = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: tracks[trackNumber].trackName, ofType: tracks[trackNumber].trackType)!))
            player.prepareToPlay()
        }
        catch {
            print(error)
        }
    }
    
    private func setupUI() {
        view.backgroundColor = .cyan
        view.addSubview(stackView)
        view.addSubview(trackName)
        stackView.addArrangedSubview(previousTrackButton)
        stackView.addArrangedSubview(playButton)
        stackView.addArrangedSubview(stopButton)
        stackView.addArrangedSubview(nextTrackButton)
        setupConstraints()
    }
    
    private func addTargets() {
        playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(stopButtonPressed), for: .touchUpInside)
        nextTrackButton.addTarget(self, action: #selector(nextButtonPressed), for: .touchUpInside)
        previousTrackButton.addTarget(self, action: #selector(previousButtonPressed), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            trackName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            trackName.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func playButtonPressed() {
        if player.isPlaying {
            player.stop()
            playButton.setImage(UIImage(systemName: "play.circle"), for: [])
        } else {
            player.play()
            playButton.setImage(UIImage(systemName: "pause.circle"), for: [])
        }
    }
    
    @objc private func stopButtonPressed() {
        player.stop()
        player.currentTime = 0
        playButton.setImage(UIImage(systemName: "play.circle"), for: [])
    }
    
    @objc private func nextButtonPressed() {
        if trackNumber >= tracks.count - 1 {
            trackNumber = 0
            playCurrentTrack()
            player.play()
            playButton.setImage(UIImage(systemName: "pause.circle"), for: [])
            trackName.text = tracks[trackNumber].trackName
        } else {
            trackNumber += 1
            playCurrentTrack()
            player.play()
            playButton.setImage(UIImage(systemName: "pause.circle"), for: [])
            trackName.text = tracks[trackNumber].trackName
        }
    }
    
    @objc private func previousButtonPressed() {
        if trackNumber < 1 {
            trackNumber = tracks.count - 1
            playCurrentTrack()
            player.play()
            playButton.setImage(UIImage(systemName: "pause.circle"), for: [])
            trackName.text = tracks[trackNumber].trackName
        } else {
            trackNumber -= 1
            playCurrentTrack()
            player.play()
            playButton.setImage(UIImage(systemName: "pause.circle"), for: [])
            trackName.text = tracks[trackNumber].trackName
        }
    }
}
