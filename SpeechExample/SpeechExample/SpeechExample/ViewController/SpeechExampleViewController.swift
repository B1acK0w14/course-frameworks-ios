//
//  SpeechExampleViewController.swift
//  SpeechExample
//
//  Created by David Penagos on 7/04/20.
//  Copyright © 2020 David Penagos. All rights reserved.
//

import UIKit
import Speech

class SpeechExampleViewController: UIViewController {
    
    //MARK: - Properties
    private lazy var speechExampleView: SpeechExampleView = {
        let view = SpeechExampleView(delegate: self)
        return view
    }()
    
    let speechRec = SFSpeechRecognizer(locale: Locale.current)
    var buffRecognizer: SFSpeechAudioBufferRecognitionRequest?
    var voiceProcessor = AVAudioEngine()

    //MARK: - Init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        speechRec?.delegate = self
        SFSpeechRecognizer.requestAuthorization { (authorization) in
            var enableButton = false
            switch(authorization) {
            case .authorized:
                enableButton = true
            case .notDetermined:
                enableButton = false
            case .denied:
                enableButton = false
            case .restricted:
                enableButton = false
            @unknown default:
                fatalError()
            }
            
            OperationQueue.main.addOperation {
                self.speechExampleView.speechExampleButton.isEnabled = enableButton
            }
        }
    }
    
    override func loadView() {
        super.loadView()
        self.view = speechExampleView
    }
    
    //MARK: - Functions
    func startRecording() {
            
    }
}

extension SpeechExampleViewController: SpeechExampleDelegate {
    func startRecognizeVoice() {
        if voiceProcessor.isRunning {
            voiceProcessor.stop()
            buffRecognizer?.endAudio()
            speechExampleView.speechExampleButton.isEnabled = false
            speechExampleView.speechExampleButton.setTitle("Start", for: .normal)
        } else {
            startRecording()
            speechExampleView.speechExampleButton.setTitle("Stop", for: .normal)
        }
    }
}

extension SpeechExampleViewController: SFSpeechRecognizerDelegate {
    
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        speechExampleView.speechExampleButton.isEnabled = (available) ? true : false
    }
}

