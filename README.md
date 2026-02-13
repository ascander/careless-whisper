<!-- markdownlint-disable MD013 -->
# Careless Whisper — Local Audio/Video Transcription

A simple, fully local setup for transcribing audio or video recordings to text using [OpenAI Whisper](https://github.com/openai/whisper).
Designed for macOS (Apple Silicon) with Nix flakes + Python.

---

## Purpose

This project exists to provide:

- **Privacy:** Everything runs locally; no audio/video is sent to the cloud.  
- **Simplicity:** Easy command-line workflow for single-speaker English recordings.  
- **Reproducibility:** Managed with Nix flakes, so dependencies are isolated and reproducible.  

---

## Features

- Record short audio clips with `sox`.  
- Transcribe audio or video to text using Whisper.  
- Supports `.wav`, `.m4a`, `.mp3`, and common video formats.  
- Fully isolated Python environment managed via Nix + virtualenv.  

---

## Quick Start

### Prerequisites

- A flake-enabled [Nix installation](≥≥)

### 1. Enter the Nix shell

```bash
nix develop
```

This gives you a shell with:

- `sox` (audio recording)
- `ffmpeg` (audio/video processing)
- Python 3.10
- `uv` (Python project/package management)

### 2. Install Python dependencies

```bash
uv sync
```

## Common Tasks

### Record an audio clip

```bash
rec test_audio.wav trim 0 10
```

This records a 10 second WAV clip from the microphone.

### Transcribe the clip

```bash
whisper test_audio.wav --model small.en
```

This transcribes the audio from `test_audio.wav` using Whisper small, and produces the following outputs:

- `test_audio.txt` - plain text transcription
- `test_audio.{srt,vtt}` - optional subtitle files
- `test_audio.json` - structured output

## Notes

- Recommended model for single-speaker English: `small.en`.
- Larger models (`medium.en`, `large`) increase accuracy but require more memory and CPU/GPU resources.
- No speaker diarization is included; intended for solo recordings.
