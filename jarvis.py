import speech_recognition as sr
import pyttsx3
import pywhatkit

name = 'alexa'

listener = sr.Recognizer()

engine = pyttsx3.init()

voices = engine.getProperty('voices')
engine.setProperty('voice', voices[0].id)

pywhatkit.sendwhatmsg("+91xxxxxxxxxx",
                      "Hello from GeeksforGeeks",
                      22, 28)
print("Successfully Sent!")


def talk(text):
    engine.say(text)
    engine.runAndWait()


def listen():
    try:
        with sr.Microphone() as source:
            print("Escuchando...")
            voice = listener.listen(source)
            rec = listener.recognize_google(voice)
            rec = rec.lower()
            if name in rec:
                rec = rec.replace(name, '')
                print(rec)
                return rec
    except:
        pass
    exit()


def run():
    record = listen()
    if 'play' in record:
        music = record.replace("play", "")
        talk("Playing" + music)
        pywhatkit.playonyt(music)


run()
