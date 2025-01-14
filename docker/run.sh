#!/bin/bash

#default options
MODEL="turbo"
TASK="transcribe"

#arguments
while [[ "$#" -gt 0 ]]; do
  case $1 in
    -f|--file) AUDIO_FILE="$2"; shift ;;
    -m|--model) MODEL="$2"; shift ;;
    -t|--task) TASK="$2"; shift ;;
    *) echo "Unknown parameter: $1"; exit 1 ;;
  esac
  shift
done

if [ -z "$AUDIO_FILE" ]; then
  echo "Usage: ./run.sh -f <path_to_audio_file> [-m <model>] [-t <task>]"
  exit 1
fi

#this might be needed if error
cd "$(dirname "$0")/.." || exit 1

docker run -it --rm \
  -v "$(pwd):/app" \
  whisper \
  python3 -m whisper "$AUDIO_FILE" --model "$MODEL" --task "$TASK"

#can provide the model or task but defaults also work.
#ex: ./run.sh -f ../tests/jfk.flac
