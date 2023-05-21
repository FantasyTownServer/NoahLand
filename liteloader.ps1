if (Test-Path bedrock_server_mod.exe) {
        .\bedrock_server_mod.exe
}else{
        $ProgressPreference = 'SilentlyContinue'
        echo 'Bedrock_server_mod.exe not detected, installing...';
        if (Test-Path plugins) {
                mkdir _BAK
                copy *.json _BAK
                copy server.properties _BAK
                copy config _BAK -r
                copy plugins _BAK -r
                copy *_packs _BAK -r
        }
        echo 'Downloading BDS-LiteLoader ...';
        curl -o Bedrock-LiteLoader.zip https://res.nullatom.com/file/Minecraft/Server/BDS/LiteLoader/Bedrock-1.19.72.01-LL.zip
        echo 'Downloading 7za ...';
        curl -o 7za.exe https://res.nullatom.com/resource/software/7za.exe
        echo 'Extracting ...';
        if (Test-Path plugins) {
                .\7za.exe x -y Bedrock-LiteLoader.zip
                rm config -Force -r
                rm plugins -Force -r
                rm *_packs -Force -r
                rm server.properties
                rm *.json
        }else{
                .\7za.exe x -y Bedrock-LiteLoader.zip
        }
        mv _BAK/* .
        echo 'Cleaning up ...';
        rm 7zaa.exe
        rm Bedrock-LiteLoader.zip
        rm liteloader.ps1
        rm _BAK -Force -r
        echo 'Restarting...';
        exit
        #.\bedrock_server_mod.exe
}


