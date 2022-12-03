# OpenAI Whisper Model served as a Flask App
### Setup
Start service: `docker-compose up --build` from repo dir

Stop service: `docker-compose down` from repo dir
### Usage
Record an audio file and send a POST request to `/transcribe` endpoint on the service with the file attached under the `audio` key

Audio file format supported include `.mp3` `.m4a` `.wav`

**Example:** `curl -X POST -F 'audio=@audio.m4a' http://127.0.0.1:5001/transcribe`