import QtQuick 2.4
import Ubuntu.Components 1.3
import Svggraph 1.0
/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "svggraph.liu-xiao-guo"

    width: units.gu(60)
    height: units.gu(85)

    MyType {
        id: myType
    }

    Page {
        id: page
        header: PageHeader {
            id: pageHeader
            title: i18n.tr("svggraph")
            StyleHints {
                foregroundColor: UbuntuColors.orange
                backgroundColor: UbuntuColors.porcelain
                dividerColor: UbuntuColors.slate
            }
        }

        Rectangle {
            anchors {
                top:page.header.bottom
                left: page.header.left
                right: page.header.right
            }
            height: parent.height - page.header.height

            TextField{
                id:txt
                width:parent.width - units.gu(4)
                anchors.top:parent.top
                anchors.horizontalCenter:parent.horizontalCenter
                anchors.margins:units.gu(2)
                text: "0 10 50 80 60 90"
            }
            Row {
                anchors.top:txt.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.margins: units.gu(2)
                spacing: units.gu(2)
                Button {
                    id:drawButton
                    anchors.margins:units.gu(2)
                    text:i18n.tr("Draw")
                    enabled:(txt.length)
                    color: UbuntuColors.orange
                    onClicked: {
                        myType.draw(page.width, page.height, txt.text)
                        img.source = ""
                        img.source = Qt.resolvedUrl("graph.svg")
                    }
                }
                Button {
                    id:clearButton
                    anchors.margins:units.gu(2)
                    text:i18n.tr("Clear")
                    onClicked: {
                        myType.draw(page.width, page.height, "")
                        img.source = ""
                        img.source = Qt.resolvedUrl("graph.svg")
                    }
                }
            }
            Image {
                id:img
                anchors.fill:parent
                anchors.margins:units.gu(2)
                cache:false
                source: Qt.resolvedUrl("graph.svg")
            }
        }
    }
}



