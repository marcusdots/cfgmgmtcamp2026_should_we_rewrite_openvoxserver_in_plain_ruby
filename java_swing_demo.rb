# https://github.com/jruby/jruby/wiki/Integration-With-JVM-Languages

require 'java'

frame = javax.swing.JFrame.new("Window")
label = javax.swing.JLabel.new("<html><span style='font-size:40px'>Hello World</span></html>")
frame.add(label) 
frame.setVisible(true)
