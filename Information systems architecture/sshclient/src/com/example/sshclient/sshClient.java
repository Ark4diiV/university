package com.example.sshclient;

import java.awt.EventQueue;
import javax.swing.JFrame;
import javax.swing.JTextField;
import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelShell;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPasswordField;
import javax.swing.JScrollPane;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.io.PipedInputStream;
import java.io.PipedOutputStream;
import java.io.PrintStream;
import java.awt.event.ActionEvent;
import javax.swing.JTextArea;

public class sshClient {
    private JFrame frame;
    private JTextField hostTextField;
    private JLabel lblUsername;
    private JTextField usernameTextField;
    private JLabel lblPassword;
    private JPasswordField passwordTextField;
    private JTextField sendTextField;
    private JTextArea textArea;
    private JButton btnSend;
    private String hostName;
    private String userName;
    private String password;
    private JSch jsch;
    private PrintStream print;
    private Session session;
    private Channel channel;

    /**
     * Запуск приложения
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    sshClient window = new sshClient();
                    window.frame.setVisible(true);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    /**
     * Создание приложения
     */
    public sshClient() {
        initialize();
    }

    /**
     * Инициализировать содержимое фрейма
     */
    private void initialize() {
        frame = new JFrame();
        frame.setResizable(false);
        frame.setBounds(100, 100, 679, 619);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setTitle("SSH Client");
        frame.getContentPane().setLayout(null);

        hostTextField = new JTextField();
        hostTextField.setToolTipText("");
        hostTextField.setBounds(83, 11, 568, 30);
        frame.getContentPane().add(hostTextField);
        hostTextField.setColumns(10);
        hostTextField.setText("Server");

        JLabel lblHostIp = new JLabel("Host IP:");
        lblHostIp.setBounds(7, 15, 71, 22);
        frame.getContentPane().add(lblHostIp);

        lblUsername = new JLabel("Username:");
        lblUsername.setBounds(7, 65, 71, 14);
        frame.getContentPane().add(lblUsername);

        usernameTextField = new JTextField();
        usernameTextField.setBounds(83, 57, 568, 30);
        frame.getContentPane().add(usernameTextField);
        usernameTextField.setColumns(10);

        lblPassword = new JLabel("Password:");
        lblPassword.setBounds(7, 109, 63, 14);
        frame.getContentPane().add(lblPassword);

        passwordTextField = new JPasswordField();
        passwordTextField.setBounds(83, 101, 568, 30);
        frame.getContentPane().add(passwordTextField);

        JButton btnConnect = new JButton("Connect");
        btnConnect.addActionListener(new ActionListener() {
            @SuppressWarnings("deprecation") // игнорировать устаревший getText метод из поля пароля
            public void actionPerformed(ActionEvent arg0) {
                // Нажата кнопка подключения, создайте новый сеанс SSH
                hostName = hostTextField.getText();
                userName = usernameTextField.getText();
                password = passwordTextField.getText();

                if(!hostName.isEmpty() && !userName.isEmpty() && !password.isEmpty()) {
                    // обязательные поля заполнены
                    jsch = new JSch();

                    // использовать конвейерные потоки для перенаправления вывода в текстовую область и ввода в текстовое поле
                    PrintStream printStream = new PrintStream(new CustomOutputStream(textArea));
                    PipedInputStream pip = new PipedInputStream(40);
                    try {
                        PipedOutputStream pop = new PipedOutputStream(pip);
                        print = new PrintStream(pop);
                    } catch (IOException e1) {
                        // проблема с конвейерными потоками
                        e1.printStackTrace();
                    }

                    try {
                        session = jsch.getSession(userName, hostName);
                        session.setPassword(password);

                        // остановить строгую проверку хоста, чтобы избежать ошибки неизвестного хоста
                        java.util.Properties config = new java.util.Properties();
                        config.put("StrictHostKeyChecking", "no");
                        session.setConfig(config);
                        session.connect(30000); // timeout of 30000
                        channel = session.openChannel("shell");
                        channel.setInputStream(pip);
                        channel.setOutputStream(printStream);

                        // установите для типа канала pty значение dumb, чтобы исключить символы с цветовой кодировкой
                        ((ChannelShell) channel).setPtyType("dumb");
                        channel.connect(3000); // timeout of 3000
                        btnConnect.setEnabled(false);
                        btnSend.setEnabled(true);
                        sendTextField.setEnabled(true);
                        hostTextField.setEnabled(false);
                        usernameTextField.setEnabled(false);
                        passwordTextField.setEnabled(false);
                    } catch (JSchException e) {
                        // проблема с JSch
                        e.printStackTrace();
                    } catch (Exception e) {
                        // проблема установки типа pty
                        e.printStackTrace();
                    }
                } else {
                    JOptionPane.showMessageDialog(null, "Вам необходимо указать хост, имя пользователя и пароль!");
                }
            }
        });
        btnConnect.setBounds(7, 148, 644, 40);
        frame.getContentPane().add(btnConnect);
        textArea = new JTextArea();
        textArea.setEditable(false);
        JScrollPane scrollPane = new JScrollPane(textArea);
        scrollPane.setBounds(7, 199, 644, 329);
        frame.getContentPane().add(scrollPane);
        sendTextField = new JTextField();
        sendTextField.setBounds(7, 539, 521, 30);
        frame.getContentPane().add(sendTextField);
        sendTextField.setColumns(10);
        sendTextField.setEnabled(false);
        btnSend = new JButton("Send");
        btnSend.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent arg0) {
                // нажата кнопка отправки команды
                String send = sendTextField.getText();
                print.println(send);
                sendTextField.setText("");
            }
        });
        sendTextField.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent arg0) {
                // пользователь нажал клавишу ввода, отправить команду
                String send = sendTextField.getText();
                print.println(send);
                sendTextField.setText("");
            }
        });
        btnSend.setBounds(538, 539, 113, 30);
        btnSend.setEnabled(false);
        frame.getContentPane().add(btnSend);
    }
}