# Custom Xcode Template

## VIPER 아키텍처 소개

~/Library/Developer/Xcode/아래
Templates폴더/File Templates 폴더를 만든다.

xcodepath : xcode-select -p
cd `xcode-select -p` 이동 후
cd Developer/Library/Xcode/Templates/File\ Templates/ 이동한다


mkdir -p $HOME”/Library/Developer/Xcode/Templates/File Templates/Custom/[TemplateName].xctemplate/” && \
cp -R ./[TemplateName].xctemplate $HOME”/Library/Developer/Xcode/Templates/File Templates/Custom/”

실행하되 위의 TemplateName 부분은 내가 설정한다.




https://github.com/giftbott/XcodeTemplateHelper 다운 받은 후
터미널에서 다운받은 해당 폴더로 이동한다.

swift install_template.swift 실행 후 나에게 맞는 템플릿 선택 후 설치한다.
