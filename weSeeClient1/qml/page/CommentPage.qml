import VPlayApps 1.0
import QtQuick 2.0

Page {
    id:commentPage
    title: "213"
    backgroundColor: Qt.rgba(0,0,0,0.75)
    useSafeArea:false

    property int commentNum : 0

    Rectangle{
        color:"transparent"
        x:0
        y:0
        width: parent.width
        height: parent.height / 4
        MouseArea{
            anchors.fill: parent
            onClicked: commentPage.opacity = 0
        }

    }
    ListPage{
        Text {
            id: title
            text: commentNum + qsTr(" 条评论")
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin:dp(13)
        }
        y: parent.height / 4



        IconButton{
            id:close
            icon:IconType.close
            anchors.right: parent.right
            anchors.rightMargin: dp(5)
            onClicked:{
                commentPage.opacity = 0
            }
        }
    }

}
