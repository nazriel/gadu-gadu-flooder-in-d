module View.Flooder;

enum view =
`<?xml version="1.0" encoding="UTF-8"?>
<interface>
  <requires lib="gtk+" version="2.20"/>
  <!-- interface-naming-policy project-wide -->
  <object class="GtkImage" id="image1">
    <property name="visible">True</property>
    <property name="can_focus">False</property>
    <property name="stock">gtk-media-stop</property>
  </object>
  <object class="GtkAdjustment" id="progressAdj">
    <property name="upper">100</property>
    <property name="step_increment">1</property>
    <property name="page_increment">10</property>
  </object>
  <object class="GtkWindow" id="progressWindow">
    <property name="width_request">300</property>
    <property name="height_request">150</property>
    <property name="can_focus">False</property>
    <property name="border_width">6</property>
    <property name="title">Flooding</property>
    <property name="resizable">False</property>
    <property name="modal">True</property>
    <property name="window_position">center</property>
    <property name="urgency_hint">True</property>
    <property name="deletable">False</property>
    <property name="gravity">center</property>
    <child>
      <object class="GtkVBox" id="vbox2">
        <property name="visible">True</property>
        <property name="can_focus">False</property>
        <property name="spacing">1</property>
        <property name="homogeneous">True</property>
        <child>
          <object class="GtkLabel" id="label2">
            <property name="width_request">150</property>
            <property name="height_request">0</property>
            <property name="visible">True</property>
            <property name="can_focus">False</property>
            <property name="label">Please wait while ...</property>
          </object>
          <packing>
            <property name="expand">True</property>
            <property name="fill">True</property>
            <property name="position">0</property>
          </packing>
        </child>
        <child>
          <object class="GtkLabel" id="numberLabel">
            <property name="visible">True</property>
            <property name="can_focus">False</property>
            <property name="xpad">1</property>
            <property name="label">label</property>
          </object>
          <packing>
            <property name="expand">False</property>
            <property name="fill">False</property>
            <property name="position">1</property>
          </packing>
        </child>
        <child>
          <object class="GtkProgressBar" id="progressbar">
            <property name="visible">True</property>
            <property name="can_focus">False</property>
            <property name="adjustment">progressAdj</property>
          </object>
          <packing>
            <property name="expand">True</property>
            <property name="fill">True</property>
            <property name="position">2</property>
          </packing>
        </child>
        <child>
          <object class="GtkHButtonBox" id="hbuttonbox2">
            <property name="visible">True</property>
            <property name="can_focus">False</property>
            <child>
              <object class="GtkButton" id="stopButton">
                <property name="label">Stop</property>
                <property name="width_request">120</property>
                <property name="height_request">40</property>
                <property name="visible">True</property>
                <property name="can_focus">True</property>
                <property name="receives_default">True</property>
                <property name="use_action_appearance">False</property>
                <property name="image">image1</property>
              </object>
              <packing>
                <property name="expand">False</property>
                <property name="fill">False</property>
                <property name="position">0</property>
              </packing>
            </child>
          </object>
          <packing>
            <property name="expand">True</property>
            <property name="fill">True</property>
            <property name="position">3</property>
          </packing>
        </child>
      </object>
    </child>
  </object>
</interface>
`;
