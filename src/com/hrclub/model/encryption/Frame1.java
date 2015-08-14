package com.hrclub.model.encryption;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public class Frame1 extends JFrame {
  JPanel contentPane;
  BorderLayout borderLayout1 = new BorderLayout();
  JLabel jLabel1 = new JLabel();
  JTextField jTextField1 = new JTextField();
  JLabel jLabel2 = new JLabel();
  JTextField jTextField2 = new JTextField();
  JButton jButton1 = new JButton();
  JButton jButton2 = new JButton();

  //Construct the frame
  public Frame1() {
    enableEvents(AWTEvent.WINDOW_EVENT_MASK);
    try {
      jbInit();
    }
    catch(Exception e) {
      e.printStackTrace();
    }
  }
  //Component initialization
  private void jbInit() throws Exception  {
    contentPane = (JPanel) this.getContentPane();
    jLabel1.setFont(new java.awt.Font("Dialog", 0, 15));
    jLabel1.setAlignmentY((float) 0.5);
    jLabel1.setDoubleBuffered(false);
    jLabel1.setHorizontalAlignment(SwingConstants.CENTER);
    jLabel1.setHorizontalTextPosition(SwingConstants.CENTER);
    jLabel1.setText("明      文：");
    contentPane.setLayout(new GridLayout(3,2));
    this.setSize(new Dimension(300, 100));
    this.setTitle("密码生成器");
    jTextField1.addActionListener(new Frame1_jTextField1_actionAdapter(this));
    jLabel2.setFont(new java.awt.Font("Dialog", 0, 15));
    jLabel2.setForeground(Color.black);
    jLabel2.setPreferredSize(new Dimension(22, 16));
    jLabel2.setRequestFocusEnabled(true);
    jLabel2.setHorizontalAlignment(SwingConstants.CENTER);
    jLabel2.setHorizontalTextPosition(SwingConstants.CENTER);
    jLabel2.setText("密      文：");
    jButton1.setText("Generate");
    jButton1.addActionListener(new Frame1_jButton1_actionAdapter(this));
    jButton2.setText("Close");
    jButton2.addActionListener(new Frame1_jButton2_actionAdapter(this));
    jTextField1.setText("");
    jTextField2.setText("");
    contentPane.add(jLabel1, null);
    contentPane.add(jTextField1, null);
    contentPane.add(jLabel2, null);
    contentPane.add(jTextField2, null);
    contentPane.add(jButton1, null);
    contentPane.add(jButton2, null);
  }
  //Overridden so we can exit when window is closed
  protected void processWindowEvent(WindowEvent e) {
    super.processWindowEvent(e);
    if (e.getID() == WindowEvent.WINDOW_CLOSING) {
      System.exit(0);
    }
  }

  void jTextField1_actionPerformed(ActionEvent e) {

  }

  void jButton1_actionPerformed(ActionEvent e) {
    Md5encrypter md5 = new Md5encrypter();
    String str1=md5.getMD5ofStr(this.jTextField1.getText() );
    System.out.println(str1);
    String encryStr = EncodeDecode.encode(str1);
    System.out.println(encryStr);

    this.jTextField2.setText(encryStr);
    DecodeEncode d = new DecodeEncode();
    System.out.println(d.getDecodeEncodeofStr(encryStr));
  }

  void jButton2_actionPerformed(ActionEvent e) {
   System.exit(0);
  }
}

class Frame1_jTextField1_actionAdapter implements java.awt.event.ActionListener {
  Frame1 adaptee;

  Frame1_jTextField1_actionAdapter(Frame1 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jTextField1_actionPerformed(e);
  }
}

class Frame1_jButton1_actionAdapter implements java.awt.event.ActionListener {
  Frame1 adaptee;

  Frame1_jButton1_actionAdapter(Frame1 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jButton1_actionPerformed(e);
  }
}

class Frame1_jButton2_actionAdapter implements java.awt.event.ActionListener {
  Frame1 adaptee;

  Frame1_jButton2_actionAdapter(Frame1 adaptee) {
    this.adaptee = adaptee;
  }
  public void actionPerformed(ActionEvent e) {
    adaptee.jButton2_actionPerformed(e);
  }
}
