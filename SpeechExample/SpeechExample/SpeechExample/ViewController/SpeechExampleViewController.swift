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
    var audioProcessor = AVAudioEngine()
    var voiceRecognizer: SFSpeechRecognitionTask?

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
                fatalError("ERROR!")
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
        //ANNOTATION - For recording voice
        if voiceRecognizer != nil {
            voiceRecognizer?.cancel()
            voiceRecognizer = nil
        }
        
        //ANNOTATION: - Create session of audio
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.record)
            try audioSession.setMode(.measurement)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            fatalError("ERROR!")
        }
        
        buffRecognizer = SFSpeechAudioBufferRecognitionRequest()
        let record = audioProcessor.inputNode
        guard let recognizer = buffRecognizer else {fatalError("ERROR!")}
        recognizer.shouldReportPartialResults = true
        
        //ANNOTATION: - If recognizing data, need to process
        voiceRecognizer = speechRec?.recognitionTask(with: recognizer, resultHandler: { (result, error) in
            var finish = false
            
            if result != nil {
                self.speechExampleView.speechExampleTextView.text = result?.bestTranscription.formattedString
                finish = (result?.isFinal)!
            }
            
            if (error != nil) || finish {
                self.audioProcessor.stop()
                record.removeTap(onBus: 0)
                self.buffRecognizer = nil
                self.voiceRecognizer = nil
                self.speechExampleView.speechExampleButton.isEnabled = true
            }
        })
        
        //ANNOTATION: - Processing audio buffer
        let recording = record.outputFormat(forBus: 0)
        record.installTap(onBus: 0, bufferSize: 1024, format: recording) { (buffer, when) in
            self.buffRecognizer?.append(buffer)
        }
        
        //ANNOTATION: - Start processing audio
        audioProcessor.prepare()
        do {
            try audioProcessor.start()
        } catch {
            fatalError("ERROR!")
        }
    }
}

extension SpeechExampleViewController: SpeechExampleDelegate {
    func startRecognizeVoice() {
        if audioProcessor.isRunning {
            audioProcessor.stop()
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

