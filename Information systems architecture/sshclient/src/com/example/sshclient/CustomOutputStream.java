package com.example.sshclient;

import java.io.IOException;
import java.io.OutputStream;
import javax.swing.JTextArea;

/**
 * Этот класс расширяется от OutputStream для перенаправления вывода в JTextarea
 */

public class CustomOutputStream extends OutputStream {
    private JTextArea textArea;

    public CustomOutputStream(JTextArea textArea) {
        this.textArea = textArea;
    }

    @Override
    public void write(int b) throws IOException {
        // перенаправляет данные в текстовую область
        textArea.append(String.valueOf((char)b));
        // прокручивает текстовую область до конца данных
        textArea.setCaretPosition(textArea.getDocument().getLength());
    }
}
