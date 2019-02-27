import VPlayApps 1.0
import QtQuick 2.0
import VPlay 2.0
import QtQuick.Controls 2.0 as QtQuick2


Page {
    id:page
    navigationBarTranslucency: 1.0
    backgroundColor: "lightblue"

    property string sex
    property bool isMale : true

    Row{
        id:mainRow
        anchors.left: parent.left
        anchors.leftMargin: dp(20)
        y:parent.height/10 * 1
        spacing: dp(100)
        //头像
        UserImage{
            id: userImage
            property string iconFontName: Theme.iconFont.name
            width: dp(72)
            height: width

            placeholderImage: "\uf007" // user
            source: ""

            editable: true
            editBackgroundColor: Theme.tintColor

            property bool shownEditPhotoDialog: false

            onEditClicked: {
                // We do not have camera feature on desktop yet, so just show file dialog
                if (system.desktopPlatform) {
                    nativeUtils.displayImagePicker(qsTr("Choose Image"))
                }
                else {
                    // Probably better use a QML styled dialog?
                    shownEditPhotoDialog = true
                    nativeUtils.displayAlertSheet("", ["Choose Photo", "Take Photo", "Reset Photo"], true)
                }
            }
            Connections {
                target: nativeUtils
                onAlertSheetFinished: {
                    if (userImage.shownEditPhotoDialog) {
                        if (index == 0)
                            nativeUtils.displayImagePicker(qsTr("Choose Image")) // Choose image
                        else if (index == 1)
                            nativeUtils.displayCameraPicker("Take Photo") // Take from Camera
                        else if (index == 2)
                            userImage.source = "" // Reset
                        userImage.shownEditPhotoDialog = false
                    }
                }

                onImagePickerFinished: {
                    console.debug("Image picker finished with path:", path)
                    if(accepted)
                        userImage.source = Qt.resolvedUrl(path)
                }

                onCameraPickerFinished: {
                    console.debug("Camera picker finished with path:", path)
                    if(accepted)
                        userImage.source = Qt.resolvedUrl(path)
                }
            }
        } // User Image



        Row{
            anchors.verticalCenter: mainRow
            AppButton{         //编辑资料
                text: "编辑资料"
                backgroundColor: "#DDDDDD"
                backgroundColorPressed:"#DDDDDD"
                onClicked: {
                    page.navigationStack.push(Qt.resolvedUrl("EditInformation.qml"))
                }
            }
            AppButton{        //添加好友
                icon:IconType.userplus
                backgroundColor: "#DDDDDD"
                backgroundColorPressed:"#DDDDDD"
                minimumWidth: dp(10)
                onClicked: {
                    page.navigationStack.push(Qt.resolvedUrl("SearchFriend.qml"))
                }
            }
        }
    }
    //昵称,ID,签名显示
    Column{
        id:nameCol
        anchors.top: mainRow.bottom
        anchors.topMargin: dp(8)
        anchors.left: parent.left
        anchors.leftMargin: dp(20)
        spacing: dp(5)
        Text {
            id: userName
            text: qsTr("name")
            font.pixelSize: dp(20)   //用户昵称
            color: "white"
        }
        Row{
            Text {
                id:weSeeIDLabel
                text: qsTr("ID:")     //标签
                color: "white"
            }
            Text{
                id:weSeeID
                text:qsTr("123456")     //用户账号
                color:"white"
            }
        }
    }

    Text {    //签名
        id:signText
        anchors.top: nameCol.bottom
        anchors.topMargin: dp(10)
        anchors.left: parent.left
        anchors.leftMargin: dp(20)
        text: qsTr("填写个性签名更容易获得别人的关注哦")
        color: "white"
    }

    Row{
        //性别
        id:sexRow
        anchors.top: signText.bottom
        anchors.topMargin: dp(15)
        anchors.left: parent.left
        anchors.leftMargin: dp(20)
        spacing: dp(5)

        Icon{
            icon: isMale ? IconType.male : IconType.female        //需要根据性别显示图标
            color: isMale ? "blue" : "red"              //需要根据性别显示颜色
        }
        Text{
            id:ageText
            text: "18岁"                 //需要根据年龄显示数字
            color:"white"
        }
    }
    Row{
        id:thirdRow
        anchors.top: sexRow.bottom
        anchors.topMargin: dp(10)
        anchors.left: parent.left
        anchors.leftMargin: dp(20)
        spacing: dp(20)
        Row{
            //获赞数
            Text {
                id: likeNum
                text: qsTr("0")
                font.pixelSize: dp(20)
                color: "white"
            }

            Text {
                text: qsTr("获赞")
                font.pixelSize: dp(20)
                color: "white"
            }
        }

        Row{
            //关注数
            Text {
                id: followNum
                text: qsTr("200")          //需要读取关注人数
                font.pixelSize: dp(20)
                color: "white"
            }
            Text {
                id: followNumLabel
                text: qsTr("关注")
                font.pixelSize: dp(20)
                color: "white"
            }
        }
        Row{
            //粉丝数
            Text {
                id: fansNum
                text: qsTr("3000")   //需要读取粉丝人数
                font.pixelSize: dp(20)
                color: "white"
            }
            Text {
                id: fansNumLaber
                text: qsTr("粉丝")
                font.pixelSize: dp(20)
                color: "white"
            }
        }

    }
    AppTabBar{
        id:appTabBar
        showIcon: false
        contentContainer:gridView
        translucency: 1.0
        anchors.top: thirdRow.bottom
        anchors.topMargin: dp(20)


        AppTabButton{
            text: "作品"
        }
        AppTabButton{
            text: "喜欢"
        }

    }
    GridView{
        id:gridView
        clip: true
        currentIndex: appTabBar.currentIndex
        
    }

    Component.onCompleted: {          //需要读取头像,昵称,ID,签名,性别,年龄,获赞数,关注数,粉丝数
        followNum.text = 1                   //关注人数
        fansNum.text = 3000                  //粉丝数
        likeNum.text = 0                     //获赞数

        if(sex === '男'){
            isMale = true
        }
        else{
           isMale = false
        }

    }

}
