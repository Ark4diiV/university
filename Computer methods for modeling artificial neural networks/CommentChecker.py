import os
os.environ["CUDA_VISIBLE_DEVICES"] = "-1"  # использование CPU (без использования GPU)
os.environ['TF_CPP_MIN_LOG_LEVEL'] = '3'  # отключение лога

import keras
import io
import json
from keras.models import Sequential
from keras.layers import Dense, SpatialDropout1D, Embedding, LSTM
from nltk.corpus import stopwords
from keras.preprocessing.text import Tokenizer, tokenizer_from_json
from keras.preprocessing.sequence import pad_sequences
import pymorphy2
import numpy as np
import time
from tkinter import *
from progress.bar import IncrementalBar
import PySimpleGUI as sg


class NeuralModel:
    def __init__(self):
        self._vocab_size = 10000
        self._model = None
        self._ready_to_educate = False
        self.ready_to_use = False
        self._tokenizer = None

    def _text_preprocess(self, text):
        text = text.lower().split("\n")
        preprocessed = []
        for i in range(len(text)):
            preprocessed.append(re.sub(r'[^а-я]', ' ', text[i]).split(" "))
        return preprocessed

    def _words_lemmatize(self, words_sequences):
        lenn = 0
        for s in words_sequences:
            for _ in s:
                lenn += 1
        bar = IncrementalBar("words lemmatizing...", max=lenn)
        morph = pymorphy2.MorphAnalyzer()
        stop_words = stopwords.words("russian")
        lemmas = []
        i = 0
        for sequence in words_sequences:
            lemmas.append(list())
            for word in sequence:
                bar.next()
                if word not in stop_words and not word == "":
                    lemmas[i].append(morph.parse(word)[0].normal_form)
            i += 1
        bar.finish()
        return lemmas

    def _shapes_get(self, filename1="comments_good.txt", filename2="comments_bad.txt"):
        with open(filename1, "r", encoding="utf-8") as g:
            with open(filename2, "r", encoding="utf-8") as b:
                tg = g.read()
                tb = b.read()
                ul = len(tb)
                tg = tg[:ul]
                tb = tb[:ul]
                tg = self._words_lemmatize(self._text_preprocess(tg))
                tb = self._words_lemmatize(self._text_preprocess(tb))
        used_len = min(len(tg), len(tb))
        tg, tb = tg[:used_len], tb[:used_len]
        self._tokenizer = Tokenizer(len(tg + tb))
        self._tokenizer.fit_on_texts(tg + tb)
        tokenizer_json = self._tokenizer.to_json()
        with io.open('tokenizer.json', 'w', encoding='utf-8') as f:
            f.write(json.dumps(tokenizer_json, ensure_ascii=False))
        self._vocab_size = len(self._tokenizer.word_index) + 1
        sequences = self._tokenizer.texts_to_sequences(tg + tb)
        data = pad_sequences(sequences, maxlen=50)
        return data, np.array([0]*(len(data) // 2) + [1]*(len(data) // 2))

    def _model_make(self):
        self._model = Sequential()
        self._model.add(Embedding(self._vocab_size, 128, input_length=50))
        self._model.add(SpatialDropout1D(0.5))
        self._model.add(LSTM(40, return_sequences=True))
        self._model.add(LSTM(40))
        self._model.add(Dense(1, activation='sigmoid'))
        self._model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy'])

    def train(self, f1, f2, filepath):
        x, y = self._shapes_get(f1, f2)
        print(x, y, sep="\n")
        self._model_make()
        print("model education...")
        train_start = time.time()
        callbacks = None
        self._model.fit(x, y, batch_size=128, epochs=3, callbacks=callbacks)
        train_end = time.time()
        print(f"education time: {(int((train_end - train_start)) // 60) // 60}h {(int((train_end - train_start)) // 60) % 60}min {int((train_end - train_start)) % 60}sec")
        self._model.save(filepath)
        self.ready_to_use = True

    def model_load(self, model_file):
        self._model_make()
        self._model = keras.models.load_model(model_file)
        with open('tokenizer.json') as f:
            data = json.load(f)
            self._tokenizer = tokenizer_from_json(data)
        self._vocab_size = len(self._tokenizer.word_index) + 1
        self.ready_to_use = True

    def check_comment(self, cmt):
        return float(self._model.predict(pad_sequences(self._tokenizer.texts_to_sequences(self._words_lemmatize(self._text_preprocess(cmt)))))[0, 0])


sg.theme("DarkAmber")    # Keep things interesting for your users

layout = [[sg.Text("Датасет (нейтральные комментарии)", size=(30, 1)), sg.Input(default_text="comments_good.txt", key="-DB1_IN-", size=(50, 1))],
          [sg.Text("Датасет (непристойные комментарии)", size=(30, 1)), sg.Input(default_text="comments_bad.txt", key="-DB2_IN-", size=(50, 1))],
          [sg.Text("Файл обученной модели", size=(30, 1)), sg.Input(default_text="trained.h5", key="-TRAINED_IN-", size=(50, 1))],
          [sg.Text("Ввод комментария", size=(30, 1)), sg.Input(key="-COMMENT_IN-", size=(50, 1))],
          [sg.Text("Вывод", size=(10, 1)), sg.Output(key="-CSTATUS_OUT-", size=(67, 10))],
          [sg.Button("Проверить комментарий", size=(23, 1)), sg.Button("Обучить модель", size=(23, 1)), sg.Button("Загрузить модель", size=(23, 1))]]

window = sg.Window('CommentChecker', layout, element_justification='c')

m = NeuralModel()
while True:
    check_result = 0
    event, values = window.read()
    if event == "Проверить комментарий":
        if m.ready_to_use and len(values["-COMMENT_IN-"]) > 0:
            try:
                print(m.check_comment(values["-COMMENT_IN-"]), end=" : ")
                check_result = m.check_comment(values["-COMMENT_IN-"])
                if check_result > 0.9:
                    print("Неуместный комментарий.")
                else:
                    print("Уместный комментарий.")
            except:
                print("Ошибка обработки.")
        else:
            print("Модель не обучена или не введен комментарий.")
    elif event == "Обучить модель":
        try:
            m.train(values["-DB1_IN-"], values["-DB2_IN-"], values["-TRAINED_IN-"])
        except:
            print("Ошибка обучения. Проверьте указанные имена файлов.")
    elif event == "Загрузить модель":
        try:
            m.model_load(values["-TRAINED_IN-"])
        except:
            print("Ошибка загрузки модели. Проверьте указанные имена файлов.")

    if event == sg.WIN_CLOSED:
        break

window.close()
