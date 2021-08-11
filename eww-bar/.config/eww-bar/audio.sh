#!/usr/bin/env bash


case "$1" in
  "symbol")
    pactl subscribe | grep --line-buffered "Event 'change' on client" | while read -r; do
      case "$(pactl get-default-sink)" in
        *Arctis_9*) echo "";;
        #*Arctis_9*) echo "";;
        *)          echo "";;
      esac
    done
    ;;
  "volume")
    pamixer --get-volume; 
    pactl subscribe | grep --line-buffered "Event 'change' on sink " | while read -r evt; 
      do pamixer --get-volume;
    done
    ;;
  "toggle")
    speaker_sink_id=$(pamixer --list-sinks | grep "Komplete_Audio_6" | awk '{print $1}')
    game_sink_id=$(pamixer --list-sinks | grep "stereo-game"         | awk '{print $1}')
    case "$(pactl get-default-sink)" in
      *Arctis_9*) pactl set-default-sink $speaker_sink_id;;
      *)          pactl set-default-sink $game_sink_id ;;
    esac
    ;;
esac
