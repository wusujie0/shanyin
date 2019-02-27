import VPlayApps 1.0
import QtQuick 2.0
import "../page"

Page {
    id:editNickNamePage
    title: "修改昵称"
    backgroundColor: "lightblue"

    property string usedName   //读取之前的名字

    rightBarItem: NavigationBarRow{
        AppButton{
            id:saveButton
            text: "保存"
            onClicked: {
                usedName = nickName.text
                editNickNamePage.navigationStack.pop()
            }
        }
    }

    Text {
        id:nickLabel
        text: qsTr("我的昵称")
        color:"white"
        font.pixelSize: dp(15)
    }


    AppTextField{
        id:nickName
        anchors.top: nickLabel.bottom
        anchors.topMargin: dp(10)
        text:"修改昵称"             //需要读取数据得知用户现在的昵称
        textColor: "white"        //字体颜色
        cursorColor: "yellow"     //光标颜色
        placeholderText: "记得填写昵称哦"
        maximumLength: 20         //最大长度
        font.pixelSize: dp(15)
        cursorPosition: getInputLength()
        implicitWidth: parent.width            //文本框长度
        backgroundColor: editNickNamePage.backgroundColor

        onTextChanged:  {          //将修改的昵称上传

        }
    }

    Rectangle{
        id:line
        height: px(1)
        anchors.top: nickName.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        color: "#cccccc"
    }
    Text {
        id: length
        text: qsTr(getInputLength() + "/20")
        anchors.top: line.bottom
        anchors.topMargin: dp(5)
        color: "white"
        font.pixelSize: dp(11)
    }
    function getInputLength(){    //获得文本框中已输入字符的长度
        return nickName.text.length
    }

    Component.onCompleted: {
        nickName.text = usedName
    }

}
