//
//  FXViewController.swift
//  AudioKitSynthOne
//
//  Created by Matthew Fecher on 7/26/17.
//  Copyright © 2017 AudioKit. All rights reserved.
//

import UIKit

class FXViewController: UpdatableViewController {
    
    @IBOutlet weak var lfo1Cutoff: RadioButton!
    @IBOutlet weak var lfo1OscMorph: RadioButton!
    @IBOutlet weak var lfo1OscMix: RadioButton!
    @IBOutlet weak var lfo1Pitch: RadioButton!
    @IBOutlet weak var lfo1Detune: RadioButton!
    @IBOutlet weak var lfo1FmMod: RadioButton!
    
    @IBOutlet weak var lfo2Rez: RadioButton!
    @IBOutlet weak var lfo2OscMorph: RadioButton!
    @IBOutlet weak var lfo2OscMix: RadioButton!
    @IBOutlet weak var lfo2Pitch: RadioButton!
    @IBOutlet weak var lfo2Detune: RadioButton!
    @IBOutlet weak var lfo2FmMod: RadioButton!
    
    @IBOutlet weak var lfo1Amp: Knob!
    @IBOutlet weak var lfo1Rate: Knob!
    
    @IBOutlet weak var lfo2Amp: Knob!
    @IBOutlet weak var lfo2Rate: Knob!
    
    @IBOutlet weak var bitCrush: Knob!
    @IBOutlet weak var sampleRate: Knob!
    
    @IBOutlet weak var autoPanToggle: ToggleButton!
    @IBOutlet weak var autoPanRate: Knob!
    
    @IBOutlet weak var reverbSize: Knob!
    @IBOutlet weak var reverbLowCut: Knob!
    @IBOutlet weak var reverbMix: Knob!
    @IBOutlet weak var reverbToggle: ToggleButton!
    
    @IBOutlet weak var delayTime: Knob!
    @IBOutlet weak var delayFeedback: Knob!
    @IBOutlet weak var delayMix: Knob!
    @IBOutlet weak var delayToggle: ToggleButton!
    
    var lfo1Group : [RadioButton] = []
    var lfo2Group : [RadioButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup LFO Radio Buttons
        lfo1Group = [lfo1Cutoff, lfo1OscMorph, lfo1OscMix, lfo1Pitch, lfo1Detune, lfo1FmMod]
        lfo1Group.forEach { $0.alternateButton = lfo1Group }
        
        lfo2Group = [lfo2Rez, lfo2OscMorph, lfo2OscMix, lfo2Pitch, lfo2Detune, lfo2FmMod]
        lfo2Group.forEach { $0.alternateButton = lfo2Group }
        
        // Set Default LFO routing
        lfo1Cutoff.isSelected = true
        lfo2OscMorph.isSelected = true

        bitCrush.value = 24
        bitCrush.range = 1 ... 24
        bitCrush.taper = 2

        sampleRate.value = 44100
        sampleRate.range = 400 ... 44100
        sampleRate.taper = 5

        autoPanRate.range = 0 ... 10

        reverbLowCut.range = 200 ... 20000
        reverbLowCut.taper = 4

        delayFeedback.range = 0 ... 0.9

        updateCallbacks()
    }
    
    override func updateCallbacks() {

        bitCrush.callback = conductor.changeParameter(.bitCrushDepth)
        sampleRate.callback = conductor.changeParameter(.bitCrushSampleRate)
        autoPanToggle.callback = conductor.changeParameter(.autoPanOn)
        autoPanRate.callback = conductor.changeParameter(.autoPanFrequency)

        reverbSize.callback = conductor.changeParameter(.reverbFeedback)
        reverbLowCut.callback = conductor.changeParameter(.reverbHighPass)
        reverbMix.callback = conductor.changeParameter(.reverbMix)
        reverbToggle.callback = conductor.changeParameter(.reverbOn)

        delayTime.callback = conductor.changeParameter(.delayTime)
        delayFeedback.callback = conductor.changeParameter(.delayFeedback)
        delayMix.callback = conductor.changeParameter(.delayMix)
        delayToggle.callback = conductor.changeParameter(.delayOn)


        /*
        lfo1Amp.callback  = conductor.changeParameter()
        lfo1Rate.callback = conductor.changeParameter()
        lfo2Amp.callback = conductor.changeParameter()
        lfo2Rate.callback = conductor.changeParameter()

       */
    }
    
    override func updateUI(_ param: AKSynthOneParameter, value: Double) {

        switch param {
        case .bitCrushDepth:
            bitCrush.value = value
        case .bitCrushSampleRate:
            sampleRate.value = value
        case .autoPanOn:
            autoPanToggle.value = value
        case .autoPanFrequency:
            autoPanRate.value =  value
        case .reverbFeedback:
            reverbSize.value = value
        case .reverbHighPass:
            reverbLowCut.value = value
        case .reverbMix:
            reverbMix.value = value
        case .reverbOn:
            reverbToggle.value = value
        case .delayTime:
            delayTime.value = value
        case .delayFeedback:
            delayFeedback.value = value
        case .delayMix:
            delayMix.value = value
        case .delayOn:
            delayToggle.value = value

        default:
            _ = 0 // do nothing
        }
    /*
        switch param {
        case :
            lfo1Amp.value = value
        case :
            lfo1Rate.value = value
        case :
            lfo2Amp.value = value
        case :
            lfo2Rate.value = value
        case :
            masterVolume.value = value
        default:
            _ = 0
            // do nothing
        }
     */
    }
    
    



}