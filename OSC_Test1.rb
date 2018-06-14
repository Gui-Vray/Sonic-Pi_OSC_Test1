# Coded by Guillaume Auvray
#
# This code is using some basic OSC messages from any phone using at this stage
# TouchOSC in Keys Layout. Later on a proper Unity3D software will enclose
# everything in order to create an app that can be send freely out.
#
# The code has to improve and is still under development, /accxyz has to be
# implemented and te entire code must be more efficiently written.
#
# Code v2018.06.14-0936
# Sonic Pi v3.1.0


# This section runs the first layer of the project and is controlled with the third
# page of OSCTouch - Keys layer. Push on the left RED button to activate it.
# De-activation must still be coded with a counter and a ring.


# !!! Scroll Down for the Keyboard functions !!!

live_loop :runner do
  v = sync "/osc/3/push1"
  if v[0] == 1
    define :run4solo do
      4.times do
        with_fx :reverb, room: 1 do
          play 45, release: 0.1
          sample :bd_boom, rate: 0.6 , amp: 0.8
          sleep 0.125
        end
        sleep 8
      end
    end
    
    define :run2duplet do
      2.times do
        with_fx :reverb, room: 1 do
          2.times do
            play 45, release: 0.1
            sleep 0.1
          end
          sleep 0.3
        end
        sleep 8
      end
    end
    
    define :s do
      cue :tick1
    end
    
    define :t do
      cue :tick2
    end
    
    
    in_thread(name: :drums) do
      loop do
        choose [run4solo, run2duplet, s, t]
        
      end
    end
    
    in_thread(name: :choir1) do
      loop do
        sync :tick1
        sample :bd_klub, rate: 0.7, attack: 0.01, amp: 0.7
        sample :ambi_choir, rate: 0.125, amp: 0.9
        sleep 0.1
      end
    end
    
    in_thread(name: :choir2) do
      loop do
        sync :tick2
        sample :ambi_choir, rate: 0.0675, amp: 0.6
        sleep 0.1
      end
    end
  end
end


# --------------------------------------------------------
# --------------------------------------------------------


# This section declares the, at this stage, variables we use for the keyboard at Awake

# Select your synth
synth = :tri
# Select your release time
r = 8
# Select the octave you want to play in [-1, 6]
oct = 3
# Select the Velocity you want to send the MIDI out of Pi
vel = 100
# Select the Midi channel you want to send :Cx to the Arturia Matrix Brute
c1 = 1
# Select the Midi channel you want to send :Cx to the Roland HP-307
c2 = 1

use_bpm 55

# This section runs the interaction with the Keyboard on Page 1 of OSCTouch
with_fx :reverb, mix: 0.7, room: 0.9, amp: 0.3 do
  with_fx :echo, mix: 0.9, phase: 0.30 do
    with_fx :slicer, mix: 0.7, probability: 0.2 do
      
      
      live_loop :Cn do
        use_real_time
        v = sync "/osc/1/push1"
        if v[0] == 1
          use_synth synth
          play v[0] * (24 + (12 * oct)), release: r
          midi_note_on v[0] * (24 + (12 * oct)), vel, port: "Matrix_Brute", channel: c1
          midi_note_on v[0] * (24 + (12 * oct)), vel, port: "Roland_HP307", channel: c2
        end
        v = sync "/osc/1/push1/z"
        if v[0] == 1
          midi_note_off v[0] * (24 + (12 * oct)), vel, port: "Matrix_Brute", channel: c1
          midi_note_off v[0] * (24 + (12 * oct)), vel, port: "Roland_HP307", channel: c2
        end
      end
      
      
      live_loop :Csn do
        use_real_time
        v = sync "/osc/1/push2"
        if v[0] == 1
          use_synth synth
          play v[0] * (25 + (12 * oct)), release: r
        end
      end
      
      live_loop :Dn do
        use_real_time
        v = sync "/osc/1/push3"
        if v[0] == 1
          use_synth synth
          play v[0] * (26 + (12 * oct)), release: r
        end
      end
      
      live_loop :Dsn do
        use_real_time
        v = sync "/osc/1/push4"
        if v[0] == 1
          use_synth synth
          play v[0] * (27 + (12 * oct)), release: r
        end
      end
      
      live_loop :En do
        use_real_time
        v = sync "/osc/1/push5"
        if v[0] == 1
          use_synth synth
          play v[0] * (28 + (12 * oct)), release: r
        end
      end
      
      live_loop :Fn do
        use_real_time
        v = sync "/osc/1/push6"
        if v[0] == 1
          use_synth synth
          play v[0] * (29 + (12 * oct)), release: r
        end
      end
      
      live_loop :Fsn do
        use_real_time
        v = sync "/osc/1/push7"
        if v[0] == 1
          use_synth synth
          play v[0] * (30 + (12 * oct)), release: r
        end
      end
      
      live_loop :Gn do
        use_real_time
        v = sync "/osc/1/push8"
        if v[0] == 1
          use_synth synth
          play v[0] * (31 + (12 * oct)), release: r
        end
      end
      
      live_loop :Gsn do
        use_real_time
        v = sync "/osc/1/push9"
        if v[0] == 1
          use_synth synth
          play v[0] * (32 + (12 * oct)), release: r
        end
      end
      
      live_loop :An do
        use_real_time
        v = sync "/osc/1/push10"
        if v[0] == 1
          use_synth synth
          play v[0] * (33 + (12 * oct)), release: r
        end
      end
      
      live_loop :Asn do
        use_real_time
        v = sync "/osc/1/push11"
        if v[0] == 1
          use_synth synth
          play v[0] * (34 + (12 * oct)), release: r
        end
      end
      
      live_loop :Bn do
        use_real_time
        v = sync "/osc/1/push12"
        if v[0] == 1
          use_synth synth
          play v[0] * (35 + (12 * oct)), release: r
        end
      end
    end
  end
end
