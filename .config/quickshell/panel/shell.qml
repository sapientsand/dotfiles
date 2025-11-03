import Quickshell
import QtQuick
import Quickshell.Hyprland

PanelWindow {
	//readonly property HyprLandMonitor monitor: Hyprland.monitorfor(bar.screen);
	anchors{
		bottom: true
		left: true
		right: true
	}

	implicitHeight: 20

	Text {
		anchors.centerIn: parent
		text: "am i doing it right?"
	}
	Text {
		anchors.left: parent
		text: Hyprland.monitorfor(bar.screen) 
		
	}
}
