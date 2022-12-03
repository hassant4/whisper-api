from flask import Flask, request
import whisper

app = Flask(__name__)
model = whisper.load_model("base")

@app.route('/transcribe', methods=['POST'])
def transcribe():

    if 'audio' not in request.files:
        return 'No audio file was included in the request'

    # Get the file from the request
    file = request.files['audio']
    file.save("./audio")

    result = model.transcribe("audio")
    return result["text"]

if __name__ == '__main__':
    app.run()