module View.Main;

enum view = `
<?xml version="1.0" encoding="UTF-8"?>
<interface>
  <requires lib="gtk+" version="2.20"/>
  <!-- interface-naming-policy project-wide -->
  <object class="GtkEntryBuffer" id="ggNumberEntryBuffer">
    <property name="max_length">30</property>
  </object>
  <object class="GtkAdjustment" id="floods">
    <property name="lower">1</property>
    <property name="upper">100</property>
    <property name="value">1</property>
    <property name="step_increment">1</property>
    <property name="page_increment">10</property>
  </object>
  <object class="GtkImage" id="image1">
    <property name="visible">True</property>
    <property name="can_focus">False</property>
    <property name="stock">gtk-ok</property>
  </object>
  <object class="GtkImage" id="image2">
    <property name="visible">True</property>
    <property name="can_focus">False</property>
    <property name="stock">gtk-about</property>
  </object>
  <object class="GtkImage" id="image3">
    <property name="visible">True</property>
    <property name="can_focus">False</property>
    <property name="stock">gtk-quit</property>
  </object>
  <object class="GtkAdjustment" id="intervals">
    <property name="upper">180</property>
    <property name="value">1</property>
    <property name="step_increment">0.25</property>
    <property name="page_increment">10</property>
  </object>
  <object class="GtkWindow" id="mainWindow">
    <property name="width_request">400</property>
    <property name="height_request">300</property>
    <property name="can_focus">False</property>
    <property name="border_width">15</property>
    <property name="title">GG Flooder</property>
    <property name="resizable">False</property>
    <property name="window_position">center</property>
    <property name="icon_name">ggflooder</property>
    <child>
      <object class="GtkVBox" id="vbox1">
        <property name="visible">True</property>
        <property name="can_focus">False</property>
        <child>
          <object class="GtkHBox" id="hbox1">
            <property name="visible">True</property>
            <property name="can_focus">False</property>
            <child>
              <object class="GtkLabel" id="label4">
                <property name="width_request">50</property>
                <property name="visible">True</property>
                <property name="can_focus">False</property>
                <property name="label">Nr GG</property>
              </object>
              <packing>
                <property name="expand">True</property>
                <property name="fill">True</property>
                <property name="position">0</property>
              </packing>
            </child>
            <child>
              <object class="GtkEntry" id="ggNumberEntry">
                <property name="width_request">50</property>
                <property name="visible">True</property>
                <property name="can_focus">True</property>
                <property name="buffer">ggNumberEntryBuffer</property>
                <property name="max_length">14</property>
                <property name="invisible_char">●</property>
                <property name="activates_default">True</property>
                <property name="invisible_char_set">True</property>
                <property name="primary_icon_activatable">False</property>
                <property name="secondary_icon_activatable">False</property>
                <property name="primary_icon_sensitive">True</property>
                <property name="secondary_icon_sensitive">True</property>
              </object>
              <packing>
                <property name="expand">True</property>
                <property name="fill">True</property>
                <property name="position">1</property>
              </packing>
            </child>
          </object>
          <packing>
            <property name="expand">True</property>
            <property name="fill">True</property>
            <property name="position">0</property>
          </packing>
        </child>
        <child>
          <object class="GtkLabel" id="vip">
            <property name="can_focus">False</property>
            <property name="label">label</property>
            <attributes>
              <attribute name="style" value="oblique"/>
              <attribute name="weight" value="semibold"/>
            </attributes>
          </object>
          <packing>
            <property name="expand">True</property>
            <property name="fill">True</property>
            <property name="position">1</property>
          </packing>
        </child>
        <child>
          <object class="GtkHSeparator" id="hseparator2">
            <property name="visible">True</property>
            <property name="can_focus">False</property>
          </object>
          <packing>
            <property name="expand">False</property>
            <property name="fill">True</property>
            <property name="position">2</property>
          </packing>
        </child>
        <child>
          <object class="GtkHBox" id="hbox2">
            <property name="visible">True</property>
            <property name="can_focus">False</property>
            <child>
              <object class="GtkLabel" id="label5">
                <property name="width_request">50</property>
                <property name="visible">True</property>
                <property name="can_focus">False</property>
                <property name="label">Floods count</property>
              </object>
              <packing>
                <property name="expand">True</property>
                <property name="fill">True</property>
                <property name="position">0</property>
              </packing>
            </child>
            <child>
              <object class="GtkSpinButton" id="floodCount">
                <property name="width_request">50</property>
                <property name="visible">True</property>
                <property name="can_focus">True</property>
                <property name="max_length">100</property>
                <property name="invisible_char">●</property>
                <property name="invisible_char_set">True</property>
                <property name="primary_icon_activatable">False</property>
                <property name="secondary_icon_activatable">False</property>
                <property name="primary_icon_sensitive">True</property>
                <property name="secondary_icon_sensitive">True</property>
                <property name="adjustment">floods</property>
                <property name="climb_rate">1</property>
                <property name="snap_to_ticks">True</property>
                <property name="numeric">True</property>
              </object>
              <packing>
                <property name="expand">True</property>
                <property name="fill">True</property>
                <property name="position">1</property>
              </packing>
            </child>
          </object>
          <packing>
            <property name="expand">True</property>
            <property name="fill">True</property>
            <property name="position">3</property>
          </packing>
        </child>
        <child>
          <object class="GtkHSeparator" id="hseparator3">
            <property name="visible">True</property>
            <property name="can_focus">False</property>
          </object>
          <packing>
            <property name="expand">False</property>
            <property name="fill">True</property>
            <property name="position">4</property>
          </packing>
        </child>
        <child>
          <object class="GtkHBox" id="hbox3">
            <property name="visible">True</property>
            <property name="can_focus">False</property>
            <child>
              <object class="GtkLabel" id="label2">
                <property name="width_request">50</property>
                <property name="visible">True</property>
                <property name="can_focus">False</property>
                <property name="label">Delays (sec)</property>
              </object>
              <packing>
                <property name="expand">True</property>
                <property name="fill">True</property>
                <property name="position">0</property>
              </packing>
            </child>
            <child>
              <object class="GtkSpinButton" id="spinbutton1">
                <property name="width_request">50</property>
                <property name="visible">True</property>
                <property name="can_focus">True</property>
                <property name="invisible_char">●</property>
                <property name="primary_icon_activatable">False</property>
                <property name="secondary_icon_activatable">False</property>
                <property name="primary_icon_sensitive">True</property>
                <property name="secondary_icon_sensitive">True</property>
                <property name="adjustment">intervals</property>
                <property name="digits">2</property>
              </object>
              <packing>
                <property name="expand">True</property>
                <property name="fill">True</property>
                <property name="position">1</property>
              </packing>
            </child>
          </object>
          <packing>
            <property name="expand">True</property>
            <property name="fill">True</property>
            <property name="position">5</property>
          </packing>
        </child>
        <child>
          <object class="GtkHSeparator" id="hseparator1">
            <property name="visible">True</property>
            <property name="can_focus">False</property>
          </object>
          <packing>
            <property name="expand">False</property>
            <property name="fill">True</property>
            <property name="position">6</property>
          </packing>
        </child>
        <child>
          <object class="GtkLabel" id="label1">
            <property name="visible">True</property>
            <property name="can_focus">False</property>
            <property name="yalign">1</property>
            <property name="label">Message</property>
          </object>
          <packing>
            <property name="expand">True</property>
            <property name="fill">True</property>
            <property name="padding">5</property>
            <property name="position">7</property>
          </packing>
        </child>
        <child>
          <object class="GtkScrolledWindow" id="scrolledwindow1">
            <property name="visible">True</property>
            <property name="can_focus">True</property>
            <property name="hscrollbar_policy">never</property>
            <property name="vscrollbar_policy">automatic</property>
            <property name="shadow_type">in</property>
            <child>
              <object class="GtkTextView" id="msgField">
                <property name="width_request">150</property>
                <property name="height_request">100</property>
                <property name="visible">True</property>
                <property name="can_focus">True</property>
                <property name="border_width">1</property>
                <property name="pixels_inside_wrap">5</property>
                <property name="wrap_mode">word</property>
                <property name="justification">fill</property>
                <property name="buffer">msg</property>
              </object>
            </child>
          </object>
          <packing>
            <property name="expand">True</property>
            <property name="fill">True</property>
            <property name="position">8</property>
          </packing>
        </child>
        <child>
          <object class="GtkHButtonBox" id="hbuttonbox1">
            <property name="visible">True</property>
            <property name="can_focus">False</property>
            <property name="spacing">1</property>
            <property name="homogeneous">True</property>
            <property name="layout_style">center</property>
            <child>
              <object class="GtkButton" id="okButton">
                <property name="label">Ok</property>
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
            <child>
              <object class="GtkButton" id="aboutButton">
                <property name="label"  comments="O programie">About</property>
                <property name="visible">True</property>
                <property name="can_focus">True</property>
                <property name="receives_default">True</property>
                <property name="use_action_appearance">False</property>
                <property name="image">image2</property>
              </object>
              <packing>
                <property name="expand">False</property>
                <property name="fill">False</property>
                <property name="position">1</property>
              </packing>
            </child>
            <child>
              <object class="GtkButton" id="exitButton">
                <property name="label">Quit</property>
                <property name="visible">True</property>
                <property name="can_focus">True</property>
                <property name="receives_default">True</property>
                <property name="use_action_appearance">False</property>
                <property name="image">image3</property>
              </object>
              <packing>
                <property name="expand">False</property>
                <property name="fill">False</property>
                <property name="position">2</property>
              </packing>
            </child>
          </object>
          <packing>
            <property name="expand">True</property>
            <property name="fill">True</property>
            <property name="position">9</property>
          </packing>
        </child>
      </object>
    </child>
  </object>
  <object class="GtkTextBuffer" id="msg">
    <property name="text">Hi there.
Check out driv.pl</property>
  </object>
</interface>
`;
