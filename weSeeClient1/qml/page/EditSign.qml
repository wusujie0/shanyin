import VPlayApps 1.0
import QtQuick 2.0

Page {
    id:editSignPage
    title: "修改签名"
    backgroundColor: "lightblue"

    property string usedSign  //之前的签名

    rightBarItem: NavigationBarRow{
        AppButton{
            id:saveButton
            text: "保存"
            onClicked: {
                usedSign = signName.text.length
                editSignPage.navigationStack.pop()
            }
        }
    }

    Text {
        id:signLabel
        text: qsTr("个性签名")
        color:"white"
        font.pixelSize: dp(15)
    }
    AppTextField{
        id:signName
        anchors.top: signLabel.bottom
        anchors.topMargin: dp(10)
        text:"修改签名"             //需要读取数据得知用户现在的签名
        textColor: "white"        //字体颜色
        cursorColor: "yellow"     //光标颜色
        placeholderText: "填写个性签名更容易获得别人关注哦"
        maximumLength: 40         //最大长度
        font.pixelSize: dp(15)
        cursorPosition: getInputLength()
        implicitWidth: parent.width
        backgroundColor: editSignPage.backgroundColor

        onTextChanged:  {          //将修改的签名上传

        }
    }
    Rectangle {
        id:line
        height: px(1)
        anchors.top: signName.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        color: "#cccccc"
    }

    Text {
        id: length
        text: qsTr(getInputLength() + "/40")
        anchors.top: line.bottom
        anchors.topMargin: dp(5)
        color: "white"
        font.pixelSize: dp(11)
    }
    function getInputLength(){    //获得文本框中已输入字符的长度
        return signName.text.length
    }

    Component.onCompleted: {
        signName.text = usedSign
    }

}
