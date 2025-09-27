pragma ComponentBehavior: Bound

import qs.components
import qs.services

StyledText {
  id: root
  text: Time.format("hh")
  font.family: "JetBrainsMono Nerd Font Propo"
  font.pixelSize: 16
  font.bold: true
  color: "#ffffff"
  animate: true
}
