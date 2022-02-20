-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--history--

--[[
-----2021/12/20----------
I don't support this module because I made it for myself.
This code is Frankenstein, so I'm sure there is a better code.
Please feel free to modify it.
-----2021/12/24----------
code like spaghetti is Organized 
but it's still tangled
chang whole GUI mechanism
maybe,made it easier to manage
!!!Merry Christmas!!!
-----2021/12/25----------
Add features and change UI
Create an explanation (guide)
-----2021/12/27---------
Added a drop-down list for WorldVisit.
However, it doesn't work because it hasn't been configured yet.
Geted home world and current world.
This information is not for showing, but is necessary for mechanic.
my great thanks to Madao & denvo for their help and advice.

Some items will be automatically saved as user data.
-----2021/12/29---------
Desynth can now specify IL.
-----2021/12/30---------
If you have select a server from list, 
you can check enable checkbox for a quick worldvisit.

i will enhance desynthesis function in the future.

-----2021/12/31---------
The order of the servers in some Data Centers was different, so I fixed it.
Materia Extract and Desythesis will stop when the bag is full.

Add Aetherial Reduction
bug fix

-----2022/1/1---------
Add filters to desynthesis
Collection of items becomes easier

however, the code is terrible.

----------------------
tyty kali

mushroom#8009
]]
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------



-----------------------------------------------------------------------------------------------------------------
AetheryteHelper = {}
-----------------------------------------------------------------------------------------------------------------
--table
local kinokoProject = {
  Addon  = {
      Folder =        "AetheryteHelper",
      Name =          "Aetheryte Helper",
      Version =         "1.6.5",   
      VersionList = { "[0.9.0] - Pre Release",
                      "[0.9.1] - hot fix",
                      "[0.9.5] - Add tool・UIchange",
                      "[0.9.6] - Add tool・UIchange",
                      "[0.9.9] - Add UI & bug fix",
                      "[1.0.0] - Release",
                      "[1.0.1] - hot fix",
                      "[1.0.2] - Add Aetherial Reduction",
                      "[1.0.25] - bug fix",
                      "[1.1.0] - add desynthesise filter",
                      "[1.1.1] - bug fix",
                      "[1.1.2] - Changed so that saved data",
                      "          is loaded correctly.",
                      "[1.1.3] - linked bot status",
                      "          in materia extract options",
                      "[1.1.5] - Add Aetherial Reduction Botmode and more",
                      "[1.2.0] - I done lot of add things.",
                      "[1.2.1] - Adjust Aetherial Reduction Botmode & tooltips",
                      "          Mouse over to view English",
                      "          Right button Press to view Japanese.",
                      "[1.2.2] - desynth bug fix & add Trust mode",
                      "[1.3.0] - add trun in & Organize code",
                      "          (just a little bit)",
                      "[1.3.1] - add Jumbo cactpot assist",
                      "[1.3.2] - bug fix",
                      "[1.3.3] - add auto move to Main tool",
                      "          & fewer error message in game.",
                      "[1.3.4] - fine tuning of auto move (Mare Lamentorum)",
                      "[1.3.5] - add Retrieve Materia & Exchange less max",
                      "[1.4.0] - please read Readme.txt in UserSettings folder",
                      "[1.4.1] - AR function was broken, and I fixed it",
                      "[1.4.2] - add auto Repair in TrustMode(DEMO)",
                      "          & bug fix",
                      "[1.4.3] - add mini button",
                      "[1.4.5] - Organize all code",
                      "[1.4.6] - add DC & move to MB on switch",
                      "[1.4.7] - adjusted behavior of trust mode",
                      "[1.4.7.1] - fix MBmode",
                      "[1.4.8] - Organize code for MBmode",
                      "[1.4.9] - remake RetrieveMateria,",
                      "          all function adjust delay",
                      "          change contents in junk tab",
                      "[1.5.0] - i've made some crazy stuff",
                      "[1.5.1] - Only some design changes",
                      "[1.5.2] - incorporated the code that kali created",
                      "[1.5.3] - add new 3 text command",
                      "          add youtube link",
                      "          & jumbocactpot assist(remake)",
                      "[1.6.0] - Renewal UI",
                      "[1.6.1] - Stabilize text commands.",
                      "          Speed adjustment of some functions",
                      "          UI adjustment at the beginning of new game",
                      "[1.6.2] - add text commands.",
                      "          add mini World Visit window",
                      "          adjustment of TrustMode",
                      "[1.6.2.1] - adjust text commands.",
                      "[1.6.3] - Changed the mechanics of text commands.",
                      "[1.6.3.1] - adjust text commands.",
                      "[1.6.3.2] - Remove AFK status.",
                      "[1.6.3.3] - Changed from OS time to",
                      "            Server time references for text command.",
                      "            Changed to show bookmarks in MB mode.",
                      "[1.6.4] - add Auto Player Commendation.",
                      "          add Auto Start and End Call in Duty.",
                      "[1.6.5] - add tool to organize inventory.",

                    },
      
  },
--  ---------------
  HELP   = {
      linkjp = [[https://github.com/mushroom8009/AutheryteHelper/wiki/Autheryte-Helper%E3%81%AE%E4%BD%BF%E3%81%84%E6%96%B9]],
      linken = [[https://github.com/mushroom8009/AutheryteHelper/wiki/How-to-use-%22-Autheryte-Helper-%22-in-minion]],
      mykofi = [[https://ko-fi.com/mushroom8009]],
  },
--  ---------------
  Menu = {
    Main = {
      Name =          "kinoko",
      Icon =          "love_mushroom.png",
      Id =            "kinoko",
      Tab =           ffxiv_kinoko_Menu,
    },
    Sub = {
      Name =          "AH",
      Icon =          "AetheryteHelper.png",
      Id =            "AetheryteHelper",
      Tooltip =       "Open AetheryteHelper",
    },
  },
--  ---------------
  Minion = {
      Folder =        "LuaMods",
  },
--  ---------------
  Windows = {
    MainWindows = {
      Name =          "AetheryteHelper Main Windows",
      Open =          true,
      Option =        GUI.WindowFlags_ShowBorders 
                    + GUI.WindowFlags_AlwaysAutoResize
                    + GUI.WindowFlags_NoScrollbar,
      Visible =       false,

    },
    minibutton = {
      Name =          "kinoko",
      Open =          false,
      Option =        GUI.WindowFlags_NoTitleBar
                    + GUI.WindowFlags_NoFocusOnAppearing
                    + GUI.WindowFlags_AlwaysAutoResize
                    + GUI.WindowFlags_NoBringToFrontOnFocus
                    + GUI.WindowFlags_NoScrollbar,
      Visible =       true,

    },
  },
--  ---------------
  Update = {
      Pulse =         500,
      Timer =         0,
  },

 }
-------------------------------
---tab
AetheryteHelper.GUI = {
  name = "AetheryteHelper###AetheryteHelper",
  open = false,
  visible = true,
  tabs = {
    [1] = {
      isselected = true,
      name = "[Main]"
    },
    [2] = {
      isselected = false,
      name = "[Tools]"
    },
    [3] = {
      isselected = false,
      name = "[ GC ]"
    },
    [4] = {
      isselected = false,
      name = "[Jank]"
    },
  },
  tabstyle = {
        selected = {r =.1, g = 1 , b =.1 , a = 1},
        hovered = {r =.4, g = .7, b = .1, a = 1 },
        normal = {r = 1, g = 1, b = 1, a = 1},
  },
}
AetheryteHelper.miniGUI = {
  name = "miniinfo###AetheryteHelper",
  open = false,
  visible = true,
  locked = false,
}
AetheryteHelper.insSelectGUI = {
  name = "insselecter###AetheryteHelper",
  open = false,
  visible = true,
  locked = false,
}
AetheryteHelper.miniWV = {
  name = "miniWV###AetheryteHelper",
  open = false,
  visible = true,
  locked = false,
}
AetheryteHelper.Jumbocactpot = {
  name = "jumbocactpot assist###AetheryteHelper",
  open = false,
  visible = true,
  locked = false,
}
AetheryteHelper.subtoolDesOP = {
  name = "Desynthesis option###AetheryteHelper",
  open = false,
  visible = true,
  locked = false,
}
AetheryteHelper.VersionList = {
  name = "VersionList###AetheryteHelper",
  open = false,
  visible = true,
  locked = false,
}
AetheryteHelper.TCList = {
  name = "TCList###AetheryteHelper",
  open = false,
  visible = true,
  locked = false,
}
AetheryteHelper.mip = {
  name = "MIP###AetheryteHelper",
  open = false,
  visible = true,
  locked = false,
}
AetheryteHelper.yoro_otu = {
  name = "yoro_otu###AetheryteHelper",
  open = false,
  visible = true,
  locked = false,
}
 AetheryteHelper.settings = {
  SET = {

    delay = 200,
    isMateriaEnabled = false,
    isSalvageEnabled = false,
    isPotionEnabled = false,
    isManualEnabled = false,
    isReductionEnabled = false,
    isQuestEnabled = false,
    isReductionOption = true,
    isExchangeOption = true,
    isBotStatusP = false,
    isBotStatusM = false,
    isQuestmode = false,
    nohousing = false,
    CrafterMode = true,
    DesynthTrust = false,
    dminil = 5,
    dmaxil = 540,
    selectDC = 1,
    selectGC = 1,
    hosiikazu = 1,
    koukanhin = 1,
    syojigunpyou = 10000,
    jumbo11 = 0,
    jumbo12 = 0,
    jumbo13 = 0,
    jumbo14 = 0,
    jumbo21 = 0,
    jumbo22= 0,
    jumbo23 = 0,
    jumbo24 = 0,
    jumbo31 = 0,
    jumbo32 = 0,
    jumbo33 = 0,
    jumbo34 = 0,
    minionclick = 0,
    GCexlessmax = false,
    mushrepairGear = 60,
    mushmovetoMB = false,
    mushtooltips = true,
    Pcurrnt = Player.currentworld,
    
    },

  Filter = { 
               Main = true,
               Sub = true,
               Head = true,
               Body = true,
               Hand = true,
               Legs = true,
               Feet = true,
               Earrings = true,
               Necklace = true,
               Bracelets = true,
               Ring = true,
  
    },  
  
  Job = {
           
             Crafter = false,
             --CRP = true,
             --BSM = true,
             --ARM = true,
             --GSM = true,
             --LTW = true,
             --WVR = true,
             --ALC = true,
             --CUL = true,
             ---
             Gatherer = false,
             --MIN = true,
             --BTN = true,
             --FSH = true,
             ---       
             Tank = true,
             PLD = true,
             WAR = true,
             DRK = true,
             GNB = true,
             ---
             Healer = true,
             WHM = true,
             SCH = true,
             AST = true,
             SGE = true,
             ---
             Slaying = true,
             Striking = true,
             MNK = true,
             SAM = true,
             ---
             Maiming = true,
             DRG = true,
             RPR = true,
             ---
             Scouting = true,
             NIN = true,
             ---
             Aiming = true,
             BRD = true,
             MCN = true,
             DNC = true,
             ---
             Sorcerer = true, 
             BLM = true,
             SMN = true,
             RDM = true,
             ALL = true,
             
  },

}

AetheryteHelper.DutyPlay = {
  MIP = {
    Enable = false,
    select = 0,
  },
  yoro = {
    Enable = false,
    word01 = "",
    word02 = "/bow",    
  },
  otu = {
    Enable = false,
    word01 = "",
    word02 = "/goodbye",
  },  

}

-------------------
AHLinks = {
      Name = "Minion Discord JP",
       link1 = [[https://discord.com/channels/127540472812929024/335225564803891210]],
       link2 = [[https://github.com/mushroom8009/AetheryteHelper]],
       link3 = [[https://github.com/mushroom8009/AutheryteHelper/releases]],
       link4 = [[https://youtube.com/playlist?list=PLS5EIB6BeDoKSRglypQIr_g9-MF6Cvbqh]], 
}
mushtooltips = {
  jp = { tip00 = "対象エリア外",
         tip01 = "AH オン/オフ",
         tip02 = "アクセス間隔を\n100msから1秒まで選べます",
         tip03 = "テキストコマンド[ /e <flag> ]を実行します",
         tip04 = "冒険者居住区未解放の場合オンにしてください",
         tip05 = "ディレイの値を初期値に戻します",
         tip06 = "インスタンスの人数が見れます",
         tip07 = "インスタンス1へ移動",
         tip08 = "インスタンス2へ移動",
         tip09 = "インスタンス3へ移動",
         tip10 = "グリダニアへテレポ",
         tip11 = "グリダニアのマケボへ移動",
         tip12 = "リムサへテレポ",
         tip13 = "リムサのマケボへ移動",
         tip14 = "ウルダハへテレポ",
         tip15 = "ウルダハのマケボへ移動",
         tip16 = "テレポとMBの切り替え",
         tip17 = "ジャンボクジテンダー入力アシスト",
         tip18 = "制限解除の切替",
         tip19 = "自由探索の切替",
         tip20 = "機能紹介動画へのリンク",
         tip21 = "ダブルクリックで開きます",
         tip22 = "閉じる",
         tip23 = "ランダム番号で購入します",
         tip24 = "うまく動作しない場合教えて下さい",
         tip25 = "装備の修理です\n自分で修理するのでクラフター必須",
         tip26 = "Trustモードのオン/オフ\n\nタブが強制的に[GC]に固定されます",
         tip27 = "クリックで分解オン/オフ\n右クリックでフィルターのオン/オフ",
         tip28 = "クラフターで分解をオフにします",
         tip29 = "分解とマテリア錬成をID内でのみ行ないます",
         tip30 = "IL1-IL1000\nこの数字より大きいIL装備を分解します",
         tip31 = "リセット",
         tip32 = "IL-IL1000\nIL1を除きこれ未満のIL装備を分解します",
         tip33 = "選択したものを分解します。\n大事な装備はアーマリーチェストへ入れましょう",
         tip34 = "武器・主道具",
         tip35 = "盾・副道具",
         tip36 = "頭装備",
         tip37 = "耳アクセ",
         tip38 = "胴装備",
         tip39 = "首アクセ",
         tip40 = "手装備",
         tip41 = "腕輪（アクセ）",
         tip42 = "脚装備",
         tip43 = "指輪",
         tip44 = "足装備",
         tip45 = "右クリックで全選択\n左クリックで反転",
         tip46 = "タンク共通装備",
         tip47 = "ヒーラー共通装備",
         tip48 = "アタッカーアクセ",
         tip49 = "レンジ共通装備",
         tip50 = "ストライカー装備",
         tip51 = "キャスター共通装備",
         tip52 = "スレイヤー装備",
         tip53 = "低レベル用の全ジョブ対応装備",
         tip54 = "スカウト装備",
         tip55 = "白杖/盾",
         tip56 = "斧",
         tip57 = "学本",
         tip58 = "大剣",
         tip59 = "天球儀",
         tip60 = "ガンブレード",
         tip61 = "賢具",
         tip62 = "格闘武器",
         tip63 = "弓",
         tip64 = "槍",
         tip65 = "銃",
         tip66 = "双剣",
         tip67 = "投擲武器",
         tip68 = "刀",
         tip69 = "黒杖/盾",
         tip70 = "鎌",
         tip71 = "召本",
         tip72 = "レイピア",
         tip73 = "クラフターの道具・防具・アクセサリー",
         tip74 = "ギャザラーの道具・防具・アクセサリー",
         tip75 = "軍票をアイテムに交換",
         tip76 = "自動調整のオン/オフ",
         tip77 = "軍票がこれ以上になると交換を開始",
         tip78 = "0を入力すると最大値になります",
         tip79 = "交換数(自動で最大値になります)",
         tip80 = "交換に必要なGCランクに満たないものを選ぶと\nチェックが外れます",
         tip81 = "交換に必要な軍票/現在の軍票",
         tip82 = "錬精薬の自動使用\n右クリックでminion連動のオンオフ",
         tip83 = "スピリットマニュアルの自動使用\n右クリックでminion連動のオンオフ",
         tip84 = "所属GCが自動で選ばれます",
         tip85 = "マテリア錬精",
         tip86 = "インベントリの中の装備を分解\n右クリックでオプション設定のオンオフ",
         tip87 = "GCの希少品納品",
         tip88 = "自動でGCに移動して納品します",
         tip89 = "自動移動を停止",
         tip90 = "軍票の最大を超えて納品しない",
         tip91 = "カバンの中の装備のマテリアを外す",
         tip92 = "精選\nカバンの空きが0になると動作しません\n右クリックでminion連動との切り替え",
         tip93 = "DCは自動で選択されます",
         tip94 = "マケボへ移動切り替えスイッチ",
         tip95 = "移動先のサーバーを選択",
         tip96 = "良い物を作るためにサポートしてください\n\nうちのねこのご飯が豪華になります",
         tip97 = "不具合とか要望あればDMで教えて下さい\nあと褒められるとモチベーションあがります",
         tip98 = "左クリックでgitのAHのホーム\n右クリックでリリースページ",
         tip99 = "クエストをクリアしてしないのでスキルが使えません",
         tip100 = "[MEx]=マテリア錬成\n[SbP]=錬成薬\n[SbM]=スピリットマニュアル",
         tip101 = "[Dsy]=分解\n[Fil]=分解フィルター\n[Cft]=クラフターモード\n[IDm]=IDモード",
         tip102 = "[AR]=精選\n[Link]=Minionリンクモード",
         tip103 = "[Ex]=希少品納品\n[M2G]=GCへ移動\n[LM]=軍票の上限を超えて納品しない\n[RM]=カバン内の装備のマテリアを外す",
         tip104 = "片手剣/盾",
         tip105 = "時間が足りない",
         tip106 = "つつかないでｗ",
         tip107 = "クジを3枚購入",
         tip108 = "分解オプションを開く",
         tip109 = "ツールチップの表示/非表示",
         tip110 = "右クリックでコピーできます",
         tip111 = "安定を重視したため、コマンドの受付までに最大5秒程度かかります\n受理されるとカラーメッセージ(エコー)でお知らせします\n進捗はコンソールで確認できます。",
         tip112 = "MIPアシスト",
         tip113 = "自分を除くパーティリストの順番です\nアイコンはソロでCFを使った場合の参考程度です",
         tip114 = "オン/オフ",
         tip115 = "パーティチャットに発言します",
         tip116 = "ゲーム内のテキストコマンドが使えます",
         tip117 = "[/e <pos>]を実行\nインスタンスの確認にどうぞ",
         tip118 = "自動よろおつ",
         tip119 = "カバン整理\nスタックできるものをまとめます",
         tip120 = "整理中",


  },
  en = { tip01 = "Outside of use area",
         tip01 = "AH Enable/Disable",
         tip02 = "access delay\n100ms-1sec",
         tip03 = "Send TextCommand in Game>> /e <flag>",
         tip04 = "didn't complete quest of residential",
         tip05 = "delay RESET",
         tip06 = "instance info",
         tip07 = "go to instance 1",
         tip08 = "go to instance 2",
         tip09 = "go to instance 3",
         tip10 = "Teleport to Gridania",
         tip11 = "Go to MB in Gridania",
         tip12 = "Teleport to Limsa",
         tip13 = "Go to MB in Limsa",
         tip14 = "Teleport to Uldah",
         tip15 = "Go to MB in Ul'dah",
         tip16 = "switching MB/Teleport",
         tip17 = "Jumbo cactpot assist",
         tip18 = "switching undersize for dungeon",
         tip19 = "switching Explorer for dungeon",
         tip20 = "Introduction to AH",
         tip21 = "open AH\ndouble click",
         tip22 = "close",
         tip23 = "Random num",
         tip24 = "If it does not work well, please report it",
         tip25 = "you'll need a crafter to do repairs yourself",
         tip26 = "Use Trust addon to exchange\nEnable/Disable\n\ntab will change to [GC] by itself",
         tip27 = "Click to Desynthsie on/off\nRightclick to turn filter on/off",
         tip28 = "Auto off in Crafter for Desynth",
         tip29 = "Desynth & Materia Extract  only in ID",
         tip30 = "IL1-IL1000\nDesynth IL equipment larger than this number",
         tip31 = "Setting IL Reset",
         tip32 = "IL5-IL1000\nDesynth any IL equipment\nless than this except IL1",
         tip33 = "selection will be Desynthesis\nValuable equipment\nis in armoury chest",
         tip34 = "Primary",
         tip35 = "Secondary & Shield",
         tip36 = "Head",
         tip37 = "Earrings",
         tip38 = "Body",
         tip39 = "Necklace",
         tip40 = "Hand",
         tip41 = "Bracelets",
         tip42 = "Legs",
         tip43 = "Ring",
         tip44 = "Feet",
         tip45 = "Left click : all on\nRight click : Reverse",
         tip46 = "Tank",
         tip47 = "Healer",
         tip48 = "Slaying",
         tip49 = "Aiming",
         tip50 = "Striking",
         tip51 = "Sorcerer",
         tip52 = "Maiming",
         tip53 = "All class",
         tip54 = "Scouting",
         tip55 = "WHM's Arm/Shield",
         tip56 = "WAR's Arm",
         tip57 = "SCH's ARM",
         tip58 = "DRK's Arm",
         tip59 = "AST's Arm",
         tip60 = "GNB's Arm",
         tip61 = "SGE's Arm",
         tip62 = "MNK's Arm",
         tip63 = "BRD's Arm",
         tip64 = "DRF's Arm",
         tip65 = "MCN's Arm",
         tip66 = "NIN's Arm",
         tip67 = "DNC's Arm",
         tip68 = "SAM's Arm",
         tip69 = "BLM's Arm/Shield",
         tip70 = "RPR's Arm",
         tip71 = "SMN's Arm",
         tip72 = "RDM's Arm",
         tip73 = "Tool & Armor & Accessories for Crafter",
         tip74 = "Tool & Armor & Accessories for Gatherer",
         tip75 = "Exchange seals for items",
         tip76 = "Quantity adjustment on/off",
         tip77 = "amount to start trun in",
         tip78 = "enter 0 to get the max value",
         tip79 = "number want(auto adjustment)",
         tip80 = "Note that if you do not meet GC rank,\nyou cannot trun in",
         tip81 = "Required seals/have seals",
         tip82 = "auto use potion\nRight-click to turn on/off minion link",
         tip83 = "auto use spiritbond manual\nRight-click to turn on/off minion link",
         tip84 = "Your GC\nautomatically select",
         tip85 = "Materia Extract",
         tip86 = "desynthesis all equipment in your inventory\nRight-click to turn on/off options",
         tip87 = "for GC seals",
         tip88 = "Auto Move to GC",
         tip89 = "move to stop",
         tip90 = "not done exchange over max seals",
         tip91 = "Remove materia from equipment in inventory",
         tip92 = "Aetherial Reduction\nStop when there is no more space in inventory\nRight-click to turn on/off minion link",
         tip93 = "Auto select DC",
         tip94 = "Switch to move to MB",
         tip95 = "Select World",
         tip96 = "please support me to make good\n\nfor my cat....",
         tip97 = "Please DM me if you have any problems or requests\nalso, please promote it.",
         tip98 = "Github link,\nLeft click:home\nRight click:Release",
         tip99 = "Quest complete to Get skill!",
         tip100 = "[MEx]=MateriaExtract\n[SbP]=Spiritbond Potion\n[SbM]=Spiritbond Manual",
         tip101 = "[Dsy]=Desynthesis\n[Fil]=Desynthesis Filter\n[Cft]=Crafter mode\n[IDm]=IDmode",
         tip102 = "[AR]=Aetherial Reduction\n[Link]=Minion Link mode",
         tip103 = "[Ex]=Exchange\n[M2G]=move to GC\n[LM]=less max\n[RM]=Remove Materia",
         tip104 = "PLD's Arm/Shield",
         tip105 = "・・・i need more time",
         tip106 = "please don't poke me...",
         tip107 = "3 ticket purchases",
         tip108 = "Desynthseise Options",
         tip109 = "tooltips Show/hide",
         tip110 = "Right click to copy",
         tip111 = "Due to the importance of stability,\nit may take a about 5 sec for the command to be accepted.\nit will be notified with a color message when it is accepted.\nProgress can be checked in the console.",
         tip112 = "Auto Commendation",
         tip113 = "index of party member in exclud you.\nthe side icon are just for reference when used DF for solo.",
         tip114 = "Enable/Disable",
         tip115 = "Send only in Party Chat.",
         tip116 = "Can use ingame text commands",
         tip117 = "[/e <pos>]:Check your instance.",
         tip118 = "Auto Start and End Call in Duty",
         tip119 = "organize inventory\nput together stackable items.",
         tip120 = "Now working...",

  },
}

----------------------------------------------------


FFXIVDClist = { "------", "Elemental", "Gaia", "Mana", "Aether", "Primal", "Chaos", "Light", "Crystal","Materia" }
noDClist = { "sorry" }

FFXIVServerlist = {  
    [1] = { "------" },
    [2] = { "------", "Aegis", "Atomos", "Carbuncle", "Garuda", "Gungnir", "Kujata", "Ramuh", "Tonberry", "Typhon", "Unicorn" },
    [3] = { "------", "Alexander", "Bahamut", "Durandal", "Fenrir", "Ifrit", "Ridill", "Tiamat", "Ultima", "Valefor", "Yojimbo", "Zeromus" },
    [4] = { "------", "Anima", "Asura", "Belias", "Chocobo", "Hades", "Ixion", "Mandragora", "Masamune", "Pandaemonium", "Shinryu", "Titan",  },
    [5] = { "------", "Adamantoise", "Cactuar", "Faerie", "Gilgamesh", "Jenova", "Midgardsormr", "Sargatanas", "Siren" },
    [6] = { "------", "Behemoth", "Excalibur", "Exodus", "Famfrit", "Hyperion", "Lamia", "Leviathan", "Ultros" },
    [7] = { "------", "Cerberus", "Louisoix", "Moogle", "Omega", "Ragnarok" ,"Spriggan" },
    [8] = { "------", "Lich", "Odin", "Phoenix","Shiva","Twintania","Zodiark" },
    [9] = { "------", "Balmung", "Brynhildr", "Coeurl", "Diabolos", "Goblin", "Malboro", "Mateus", "Zalera" },
    [10] = { "------", "Bismarck", "Ravana", "Sephirot", "Sophia", "Zurvan"},
    [11] = { "not support region" },
  }

WorldID = {
{id=1,Name="Unknown",DC="-"},
{id=2,Name="Unknown",DC="-"},
{id=3,Name="Unknown",DC="-"},
{id=4,Name="Unknown",DC="-"},
{id=5,Name="Unknown",DC="-"},
{id=6,Name="Unknown",DC="-"},
{id=7,Name="Unknown",DC="-"},
{id=8,Name="Unknown",DC="-"},
{id=9,Name="Unknown",DC="-"},
{id=10,Name="Unknown",DC="-"},
{id=11,Name="Unknown",DC="-"},
{id=12,Name="Unknown",DC="-"},
{id=13,Name="Unknown",DC="-"},
{id=14,Name="Unknown",DC="-"},
{id=15,Name="Unknown",DC="-"},
{id=16,Name="Unknown",DC="-"},
{id=17,Name="Unknown",DC="-"},
{id=18,Name="Unknown",DC="-"},
{id=19,Name="Unknown",DC="-"},
{id=20,Name="Unknown",DC="-"},
{id=21,Name="Ravana",DC="Materia"},
{id=22,Name="Bismarck",DC="Materia"},
{id=23,Name="Asura",DC="Mana"},
{id=24,Name="Belias",DC="Mana"},
{id=25,Name="Chaos",DC="-"},
{id=26,Name="Hecatoncheir",DC="-"},
{id=27,Name="Moomba",DC="-"},
{id=28,Name="Pandaemonium",DC="Mana"},
{id=29,Name="Shinryu",DC="Mana"},
{id=30,Name="Unicorn",DC="Elemental"},
{id=31,Name="Yojimbo",DC="Gaia"},
{id=32,Name="Zeromus",DC="Gaia"},
{id=33,Name="Twintania",DC="Light"},
{id=34,Name="Brynhildr",DC="Crystal"},
{id=35,Name="Famfrit",DC="Primal"},
{id=36,Name="Lich",DC="Light"},
{id=37,Name="Mateus",DC="Crystal"},
{id=38,Name="Shemhazai",DC="-"},
{id=39,Name="Omega",DC="Chaos"},
{id=40,Name="Jenova",DC="Aether"},
{id=41,Name="Zalera",DC="Crystal"},
{id=42,Name="Zodiark",DC="Light"},
{id=43,Name="Alexander",DC="Gaia"},
{id=44,Name="Anima",DC="Mana"},
{id=45,Name="Carbuncle",DC="Elemental"},
{id=46,Name="Fenrir",DC="Gaia"},
{id=47,Name="Hades",DC="Mana"},
{id=48,Name="Ixion",DC="Mana"},
{id=49,Name="Kujata",DC="Elemental"},
{id=50,Name="Typhon",DC="Elemental"},
{id=51,Name="Ultima",DC="Gaia"},
{id=52,Name="Valefor",DC="Gaia"},
{id=53,Name="Exodus",DC="Primal"},
{id=54,Name="Faerie",DC="Aether"},
{id=55,Name="Lamia",DC="Primal"},
{id=56,Name="Phoenix",DC="Light"},
{id=57,Name="Siren",DC="Aether"},
{id=58,Name="Garuda",DC="Elemental"},
{id=59,Name="Ifrit",DC="Gaia"},
{id=60,Name="Ramuh",DC="Elemental"},
{id=61,Name="Titan",DC="Mana"},
{id=62,Name="Diabolos",DC="Crystal"},
{id=63,Name="Gilgamesh",DC="Aether"},
{id=64,Name="Leviathan",DC="Primal"},
{id=65,Name="Midgardsormr",DC="Aether"},
{id=66,Name="Odin",DC="Light"},
{id=67,Name="Shiva",DC="Light"},
{id=68,Name="Atomos",DC="Elemental"},
{id=69,Name="Bahamut",DC="Gaia"},
{id=70,Name="Chocobo",DC="Mana"},
{id=71,Name="Moogle",DC="Chaos"},
{id=72,Name="Tonberry",DC="Elemental"},
{id=73,Name="Adamantoise",DC="Aether"},
{id=74,Name="Coeurl",DC="Crystal"},
{id=75,Name="Malboro",DC="Crystal"},
{id=76,Name="Tiamat",DC="Gaia"},
{id=77,Name="Ultros",DC="Primal"},
{id=78,Name="Behemoth",DC="Primal"},
{id=79,Name="Cactuar",DC="Aether"},
{id=80,Name="Cerberus",DC="Chaos"},
{id=81,Name="Goblin",DC="Crystal"},
{id=82,Name="Mandragora",DC="Mana"},
{id=83,Name="Louisoix",DC="Chaos"},
{id=84,Name="Syldra",DC="-"},
{id=85,Name="Spriggan",DC="Chaos"},
{id=86,Name="Sephirot",DC="Materia"},
{id=87,Name="Sophia",DC="Materia"},
{id=88,Name="Zurvan",DC="Materia"},
{id=89,Name="Unknown",DC="-"},
{id=90,Name="Aegis",DC="Elemental"},
{id=91,Name="Balmung",DC="Crystal"},
{id=92,Name="Durandal",DC="Gaia"},
{id=93,Name="Excalibur",DC="Primal"},
{id=94,Name="Gungnir",DC="Elemental"},
{id=95,Name="Hyperion",DC="Primal"},
{id=96,Name="Masamune",DC="Mana"},
{id=97,Name="Ragnarok",DC="Chaos"},
{id=98,Name="Ridill",DC="Gaia"},
{id=99,Name="Sargatanas",DC="Aether"}, 
}
mushPlayerGCrank = {
      {rank = 1, max = "10000"},
      {rank = 2, max = "15000"},
      {rank = 3, max = "20000"},
      {rank = 4, max = "25000"},
      {rank = 5, max = "30000"},
      {rank = 6, max = "35000"},
      {rank = 7, max = "40000"},
      {rank = 8, max = "45000"},
      {rank = 9, max = "50000"},
      {rank = 10, max = "80000"},
      {rank = 11, max = "90000"},
}
mushCD1 = {limsa = 4299025540, Gridania = 4298942321, Uldah = 4298610756 }
mushCD2 = {limsa = 4299025544, Gridania = 4298942322, Uldah = 4298610755 }
mushGCEN = {"Maelst","Adders","Flames","------"}
mushGCJP = {"黒渦団","双蛇党","不滅隊","------"}
mushGCDE = {"Mahlstrom","Bruderschaft","Legion","------"}
mushGCFR = {"Le Maelstrom","Deux Vipères","Immortels","------"}
GCexchangeItems = {
         jp = {"ベンチャースクリップ","ダークマターG8","グラスファイバー","特別支給コンテナ(新生・蒼天)","特別支給コンテナ(紅蓮)","転送網利用券(GC)"}, ---0          
         En = {"Ventures","G8DarkMatter","GlassFiber","MaterielContainer3.0","MaterielContainer4.0","AetheryteTicket(GC)"},---1
         De = {"Wertmarken","G8Dunkelmaterie ","Glasfasern","Sonderziehungstruhe(ARR/HW)","Sonderziehungstruhe(SB) ","Teleport-Ticket(GC)"},---2
         Fr = {"Jetons de tâche","Matière sombre G8","Fibre de verre","Malle-surprise(ARR/HW)","Malle-surprise(SB)","Billet de transport éthéré(GC)"},---3
         cost = {
         [1] = 200,
         [2] = 600,
         [3] = 7000,
         [4] = 20000,
         [5] = 20000,
         [6] = 2000,
         },
         id = {
         [1] = 21072,
         [2] = 33916,
         [3] = 15649,
         [4] = 36635,
         [5] = 36636,
         [6] = nil,
         },             

}




MoveServer = { 132, 129, 130 }
ploc = { 956, 957, 958, 959, 960, 961 }
mushnoAH = { 132, 129, 130, 956, 957, 958, 959, 960, 961 }
local uuid = GetUUID()
AetheryteHelper.savefile = GetStartupPath() .. '\\LuaMods\\AetheryteHelper\\UserSettings\\' ..'userID'..uuid.. '_setting.lua'
AetheryteHelper.settingfile = GetStartupPath() .. '\\LuaMods\\AetheryteHelper\\UserSettings\\' ..'kinoko_setting.lua'
AetheryteHelper.Dutyfile = GetStartupPath() .. '\\LuaMods\\AetheryteHelper\\UserSettings\\' ..'userDuty.lua'
-------------------------------------------------------------------------------------------------------------------------------------
-------------------
local gRegion = GetGameRegion()
local gstate = MGetGameState()
local language = GetGameLanguage()

--local nowServer = 
---------------------------------------------------------------------------------------------------------------------------------------------------
-- maintool local
local selectins = false
local autooff = true
local isins = 4
local WVaetheID = 0
local moveSVR = false
local isServer = 0
local modechg = 0
local Update = kinokoProject.Update
local aetheID = 0
local limaetheID = 0
local limMBID = 0
local griaetheID = 0
local griMBID = 0
local uldaetheID = 0
local uldMBID = 0
local GCexchange = false
local AutoMoveGC = false
local selectSVR = 1
local mushEXstep = 0
local mushtoItemstep = 0
local mushMBlim = false
local mushMBgri = false
local mushMBul = false
----------------------------------------
--subtool local
local lastUpdatePulse = 0
----------------------------------------
--subtool local
local PTadd = false
local MinionPath = GetStartupPath()
local LuaPath = GetLuaModsPath()
local ModulePath = LuaPath .. [[AetheryteHelper\]]
local ImageFolder = ModulePath .. [[image\]]
local GCdelistep = 0
local GCStep = 0
local limMBStep = 0
local griMBStep = 0
local uldMBStep = 0
local mushtruninGCitem = nil
local mushtruninGCseals = nil
local sealstoitem = false
local mushadjustoff = false
local mushJumbocactpothelper = false
local mushJumbocactpotrandom1 = false
local mushJumbocactpotrandom2 = false
local mushJumbocactpotrandom3 = false
local mushGSjcpstep = 0
local Remateria = false
local mushTrustmode = false
local Dawncloser = nil
local times = os.time()
local mushlooptimer = 1000
local GCexchangeT = false
local sealstoitemT = false
local mushMBinterat = false
local IDUSstep = 0
local IDexstep = 0
local MIPstep = 0
local AHitemsort = false
------------------

---------------------------------------------------------------------------------------------------------------------------------------------------
-- add Menu MMOMinion

function AetheryteHelper.Init()

  local Addon =     kinokoProject.Addon
  local Main =    kinokoProject.Menu.Main
  local Minion =    kinokoProject.Minion
  local Sub =     kinokoProject.Menu.Sub
  local Windows =   kinokoProject.Windows.MainWindows
  ----
  -- Menu
  if ffxiv_NotRelease_Menu == nil then
    local menuiconpath = GetStartupPath().. "\\"..Minion.Folder.."\\"..Addon.Folder.."\\image\\"..Main.Icon
    if FileExists(menuiconpath) then
      ffxiv_NotRelease_Menu = {
        ml_gui.ui_mgr:AddMember( { id = "FFXIV"..Main.Id.."##HEADER", expanded = false, name = Main.Name, texture = menuiconpath}, "FFXIVMINION##MENU_HEADER")
      }
    else
      d("["..Main.Name.."] - Main Menu - Icon Path Error")
      ffxiv_NotRelease_Menu = {
        ml_gui.ui_mgr:AddMember( { id = "FFXIV"..Main.Id.."##HEADER", expanded = false, name = Main.Name, texture = GetStartupPath().."\\GUI\\UI_Textures\\addon.png"}, "FFXIVMINION##MENU_HEADER")
      }
    end 
  end
  -- Sub Menu
  local iconpath = GetStartupPath().. "\\"..Minion.Folder.."\\"..Addon.Folder.."\\image\\"..Sub.Icon
  if FileExists(iconpath) then
    ml_gui.ui_mgr:AddSubMember( { id = "FFXIV"..Sub.Id.."##SubMenu", name = Sub.Name, onClick = function() Windows.Open = not Windows.Open end, tooltip = Sub.Tooltip, texture = iconpath}, "FFXIVMINION##MENU_HEADER", "FFXIV"..Main.Id.."##HEADER" )
  else
    d("["..Sub.Name.."] - Icon Path Error.")
    ml_gui.ui_mgr:AddSubMember( { id = "FFXIV"..Sub.Id.."##SubMenu", name = Sub.Name, onClick = function() Windows.Open = not Windows.Open end, tooltip = Sub.Tooltip}, "FFXIVMINION##MENU_HEADER", "FFXIV"..Main.Id.."##HEADER")
  end
end


--------
-------------------------------------------------------------------------------------------------------------------------------------------
-- window open

function AetheryteHelper.ModuleInit()
  local Windows = kinokoProject.Windows.MainWindows
  ----
  local menuTab = {
    name = "Aetheryte Helper",
    openWindow = function () Windows.Open = true end,
    isOpen = function () return Windows.Open end
  }
  table.insert(ml_global_information.menu.windows,menutab)

end


---------------------------------------------------------------------------------------------------------------------------------------------------
-- close

function AetheryteHelper.SwitchOpen()
  kinokoProject.Windows.MainWindows.Open = not kinokoProject.Windows.MainWindows.Open
end

---------------------------------------------------------------------------------------------------------------------------------------------------
-- tab setting

function AetheryteHelper.DrawTabs()
  local tabs = AetheryteHelper.GUI.tabs
  local tabstyle = AetheryteHelper.GUI.tabstyle
        GUI:BeginGroup()
    if (ValidTable(tabs)) then
        GUI:PushStyleColor(GUI.Col_Button,0,0,0,0)
        GUI:PushStyleColor(GUI.Col_ButtonHovered,0,0,0,0)
        GUI:PushStyleColor(GUI.Col_ButtonActive,0,0,0,0)
        for i, tab in spairs(tabs) do
          if (i ~= 1) then
              GUI:SameLine()
          else
            GUI:SameLine()
          end
            tab.order = i
           if tab.isselected then
              GUI:PushStyleColor(GUI.Col_Text, tabstyle.selected.r, tabstyle.selected.g, tabstyle.selected.b, tabstyle.selected.a)
              elseif tab.ishovered then
              GUI:PushStyleColor(GUI.Col_Text, tabstyle.hovered.r, tabstyle.hovered.g, tabstyle.hovered.b, tabstyle.hovered.a)
              else
              GUI:PushStyleColor(GUI.Col_Text, tabstyle.normal.r, tabstyle.normal.g, tabstyle.normal.b, tabstyle.normal.a)
              end
              if (GUI:Button(tab.name,nil,70)) then
              for k,v in pairs(tabs) do v.isselected = false end
              tab.isselected = true
              end
              if GUI:IsItemHovered() then 
              tab.ishovered = true
              else
              tab.ishovered = false
              end
                
       GUI:PopStyleColor()
       GUI:SameLine()
       --GUI:Spacing() 
       end
       GUI:PopStyleColor(3)
       GUI:InvisibleButton(" ") -- break SameLine()
       GUI:EndGroup() 
    end
end


---------------------------------------------------------------------------------------------------------------------------------------------------
--load fanction
function AetheryteHelper.LoadSettings()
  if FileExists(AetheryteHelper.savefile) then
    local save = persistence.load(AetheryteHelper.savefile)
    if (ValidTable(save)) then
      table.merge(AetheryteHelper.settings,save)      
    end
  end
  if FileExists(AetheryteHelper.settingfile) then
    local settings = persistence.load(AetheryteHelper.settingfile)
    if (ValidTable(settings)) then
      table.merge(kinokoProject.Windows,settings)      
    end
  end
  if FileExists(AetheryteHelper.Dutyfile) then
    local dutys = persistence.load(AetheryteHelper.Dutyfile)
    if (ValidTable(dutys)) then
      table.merge(AetheryteHelper.DutyPlay,dutys)      
    end
  end
end


---------------------------------------------------------------------------------------------------------------------------------------------------
--save fanction
AetheryteHelper.LoadSettings()
function AetheryteHelper.SaveSettings()
  persistence.store(AetheryteHelper.savefile, AetheryteHelper.settings)
  persistence.store(AetheryteHelper.settingfile, kinokoProject.Windows)
  persistence.store(AetheryteHelper.Dutyfile, AetheryteHelper.DutyPlay)
end
---------------------------------------------------------------------------------------------------------------------------------------------------
local AHSET = AetheryteHelper.settings.SET
local eqFilter = AetheryteHelper.settings.Filter
local AHeqjob = AetheryteHelper.settings.Job
---------------------------------------------------------------------------------------------------------------------------------------------------
-- ins select GUI
local insHistory = {
    isins = 4,
    selectins = false,
    autheStep = 0
}
function AetheryteHelper.Drawinsselect()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:SameLine(5)
      GUI:Dummy(40,60)
      if selectins == true then
              GUI:SameLine(5,-60)
              GUI:Image(ImageFolder..[[AHon.png]],40,60)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              isins = 4
              selectins = not selectins
              if not selectins then
              insHistory = {
              isins = 4,
              selectins = false,
              autheStep = 0
              }
              end
              Player:ClearTarget()
              Player:Stop()
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip01)
              else
              GUI:SetTooltip(mushtooltips.en.tip01)
              end
              end
              end      
      elseif selectins == false then
              GUI:SameLine(5,-60)
              GUI:Image(ImageFolder..[[AHoff.png]],40,60)
             if (GUI:IsItemHovered()) then
             if (GUI:IsMouseClicked(0)) then
             selectins = not selectins
             autheStep = 0
             if not selectins then
             insHistory = {
             isins = 4,
             selectins = false,
             autheStep = 0
             }
             end
             end
             if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip01)
              else
              GUI:SetTooltip(mushtooltips.en.tip01)
              end
             end
             end    
      end
      GUI:EndGroup()
end

function AetheryteHelper.Serverselect()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:SameLine(5)
      GUI:Dummy(40,60)
      if selectins == true then
              GUI:SameLine(5,-60)
              GUI:Image(ImageFolder..[[AHon.png]],40,60)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              isins = 4
              selectins = not selectins
              Player:ClearTarget()
              Player:Stop()
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip01)
              else
              GUI:SetTooltip(mushtooltips.en.tip01)
              end
              end
              end      
      elseif selectins == false then
              GUI:SameLine(5,-60)
              GUI:Image(ImageFolder..[[AHoff.png]],40,60)
             if (GUI:IsItemHovered()) then
             if (GUI:IsMouseClicked(0)) then
             selectins = not selectins
             autheStep = 0
             end
             if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip01)
              else
              GUI:SetTooltip(mushtooltips.en.tip01)
              end
             end
             end    
      end
      GUI:EndGroup()
end

function AetheryteHelper.notuseAH()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:SameLine(5)
      GUI:Dummy(40,60)
              GUI:SameLine(5,-60)
              GUI:Image(ImageFolder..[[AH_non.png]],40,60)
              if (GUI:IsItemHovered()) then
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip00)
              else
              GUI:SetTooltip(mushtooltips.en.tip00)
              end
              end
              end
      GUI:EndGroup() 

end


function AetheryteHelper.maininsButton()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Button("i",20,20)
      if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
             AetheryteHelper.miniGUI.open = not AetheryteHelper.miniGUI.open 
            end
            if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip06)
              else
              GUI:SetTooltip(mushtooltips.en.tip06)
              end
            end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Spacing()
      if isins == 1 then
      GUI:Text("select: 1")
      elseif isins == 2 then
      GUI:Text("select: 2")
      elseif isins == 3 then
      GUI:Text("select: 3")
      elseif isins == 4 then
      GUI:Text("no select")
      elseif isins == 0 then
      GUI:Text("select: Random")
      end
      GUI:EndGroup()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:ImageButton("###flag",ImageFolder..[[0001.png]], 25,25)
      if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
            if selectins == true then
            isins = 1
            else
            isins = 4
            end
          insHistory.isins = 1
          autheStep = 2
          insHistory.selectins = true
          insHistory.autheStep = 2
          end
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip07)
              else
              GUI:SetTooltip(mushtooltips.en.tip07)
              end
              end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:ImageButton("###flag",ImageFolder..[[0002.png]], 25,25)
      if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
          if selectins == true then
            isins = 2
            else
            isins = 4
            end
          insHistory.isins = 2
          autheStep = 2
          insHistory.selectins = true
          insHistory.autheStep = 2
          end
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip08)
              else
              GUI:SetTooltip(mushtooltips.en.tip08)
              end
              end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:ImageButton("###flag",ImageFolder..[[0003.png]], 25,25)
      if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
          if selectins == true then
            isins = 3
            else
            isins = 4
            end
          insHistory.isins = 3
          autheStep = 2
          insHistory.selectins = true
          insHistory.autheStep = 2
          end
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip09)
              else
              GUI:SetTooltip(mushtooltips.en.tip09)
              end
              end
      end
      GUI:EndGroup()
end

function AetheryteHelper.omikuji()
      GUI:BeginGroup()
      GUI:Text(AHSET.minionclick)
      GUI:EndGroup()
      local mushomikuji = GetCurrentWeather()
      GUI:SameLine(35)
      GUI:BeginGroup()
      if mushomikuji == 13 or mushomikuji == 14  then
           GUI:Image(ImageFolder..[[love_bon.png]],60,60)
      elseif mushomikuji == 2 then
           GUI:Image(ImageFolder..[[love_fc.png]],60,60)
      elseif mushomikuji == 7 then
           GUI:Image(ImageFolder..[[love_koro.png]],60,60)
      elseif mushomikuji == 3 then
           GUI:Image(ImageFolder..[[love_kupo.png]],60,60)      
      elseif mushomikuji == 5 then
           GUI:Image(ImageFolder..[[love_mandra.png]],60,60)
      elseif mushomikuji == 9 then
           GUI:Image(ImageFolder..[[love_namazu.png]],60,60)
      elseif mushomikuji == 1 then
           GUI:Image(ImageFolder..[[love_pai.png]],60,60)
      elseif mushomikuji == 8 then
           GUI:Image(ImageFolder..[[love_shark.png]],60,60)
      elseif mushomikuji == 15 or mushomikuji == 16 then
           GUI:Image(ImageFolder..[[love_yuki.png]],60,60)
      elseif mushomikuji == 11 or mushomikuji == 12 then
           GUI:Image(ImageFolder..[[love_sabo.png]],60,60)
      elseif mushomikuji == 27 then
           GUI:Image(ImageFolder..[[love_biba.png]],60,60)
      elseif mushomikuji == 10 then
           GUI:Image(ImageFolder..[[love_hebi.png]],60,60)
      else
           GUI:Image(ImageFolder..[[love_kar.png]],60,60)
      end
      GUI:EndGroup()
      if GUI:IsItemHovered() then
           if GUI:IsMouseClicked(0) then
           AHSET.minionclick = AHSET.minionclick + 1
           if AHSET.minionclick == 9999 then
           SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 Congratulations! <se.6>")
           end
           AetheryteHelper.SaveSettings()
           end
           if mushomikuji == 13 or mushomikuji == 14  then
           if language == 0 then
           GUI:SetTooltip("ギギ・・・ギギギ・・・")
           else
           GUI:SetTooltip("Brilliant bombs-\nbreathtaking,\nbeautiful,brilliant!\n- Acolyte Ba Go")
           end
           elseif mushomikuji == 2 then
           if language == 0 then
           GUI:SetTooltip("ブニャー！")
           else
           GUI:SetTooltip("When the master's away,\nthe cat will play.\n- Miqo'te Retainer")
           end
           elseif mushomikuji == 7 then
           if language == 0 then
           GUI:SetTooltip("コロリン、コロリン・・・・・・")
           else
           GUI:SetTooltip("Feels so soft and moist as\nfresh spring shower!\n- Ranu Vali")
           end
           elseif mushomikuji == 3 then
           if language == 0 then
           GUI:SetTooltip("クポー！働くクポー！")
           else
           GUI:SetTooltip("Off with their heads!\n- Good King Moggle Mog XII")
           end
           elseif mushomikuji == 5 then
           if language == 0 then
           GUI:SetTooltip("・・・・・・・・・")
           else
           GUI:SetTooltip("While little is Known about\nthem, what is known\ntends to be disturbing.\n- Eorzean Naturalist")
           end
           elseif mushomikuji == 9 then
           if language == 0 then
           GUI:SetTooltip("ギョギョギョ！？・・・ッペな")
           else
           GUI:SetTooltip("He's not heavy,\nbut gods, the smell...\n- Lyse")
           end
           elseif mushomikuji == 1 then
           if language == 0 then
           GUI:SetTooltip("・・・・・・！？")
           else
           GUI:SetTooltip("Even cowardly paossa\ncannot hide forever!\n- Gundu warrior")
           end
           elseif mushomikuji == 8 then
           if language == 0 then
           GUI:SetTooltip("シャーーッ！")
           else
           GUI:SetTooltip("To think I almost'ad\nye fed to the sharks!\n- Rhoswen")
           end
           elseif mushomikuji == 15 or mushomikuji == 16 then
           if language == 0 then
           GUI:SetTooltip("しんしんしん・・・")
           else
           GUI:SetTooltip("It is the enemy that weighs\non me-snow, rather than fire.\n- Martiallais")
           end
           elseif mushomikuji == 11 or mushomikuji == 12 then
           if language == 0 then
           GUI:SetTooltip("！？")
           else
           GUI:SetTooltip("The interior of its arm\nholds a surprising amount\nof fresh, drinkable water.\n- Common Knowledge")
           end
           elseif mushomikuji == 27 then
           if language == 0 then
           GUI:SetTooltip("ガウー！ ウウー！")
           else
           GUI:SetTooltip("Something tells me\nthat's one more mystery\nbetter left undolved.\n- Ellie")
           end
           elseif mushomikuji == 10 then
           if language == 0 then
           GUI:SetTooltip("キィっキュィ～！！")
           else
           GUI:SetTooltip("Screee!\n- The Great Sperpent of Ronka")
           end
           else
           if language == 0 then
           GUI:SetTooltip("ムギュー！")
           else
           GUI:SetTooltip("I hope to...create a new\nvariety of Carbuncle, perhaps\n- Alphinaud")
           end
           end
      end
      GUI:SameLine(110)
      GUI:BeginGroup()
      if AHSET.minionclick >= 9999 then
        GUI:ImageButton("###riset",ImageFolder..[[restart.png]],15,15)
        if GUI:IsItemHovered() then
          if GUI:IsItemClicked(0) then
            AHSET.minionclick = 0
            AetheryteHelper.SaveSettings()
          end
          GUI:SetTooltip("Reset num")
        end  
      end
      GUI:EndGroup()
      GUI:BeginGroup()
      if AHSET.minionclick > 9999 then AHSET.minionclick = 9999 end
      if AHSET.minionclick < 100 then
         GUI:TextColored(0,1,0,1,"AH Beginner")
      elseif AHSET.minionclick >= 9999 then
         GUI:TextColored(1,1,0,1,"Congratulations!")
      elseif AHSET.minionclick >= 5000 then
         GUI:TextColored(1,0,0,1,"You don't have\nto do this")
      elseif AHSET.minionclick >= 4000 then
         GUI:TextColored(1,0,0,1,"God of finger")
      elseif AHSET.minionclick >= 3000 then
         GUI:TextColored(1,0.5,0,1,"Legend of finger")
      elseif AHSET.minionclick >= 2000 then
         GUI:TextColored(1,0.3,0,1,"brain in finger")
      elseif AHSET.minionclick >= 1000 then
         GUI:TextColored(1,1,0,1,"mouse breaker")
      elseif AHSET.minionclick >= 500 then
         GUI:TextColored(1,0,1,1,"mouse clicker")
      elseif AHSET.minionclick >= 100 then
         GUI:TextColored(0,1,1,1,"Mr. Busyworker")
      end

      GUI:EndGroup()

end


function AetheryteHelper.accessdelay()
      GUI:Spacing()           
      GUI:Separator()    
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:PushItemWidth(120)
      GUI:BeginGroup()
      local changed
        AHSET.delay, changed = GUI:SliderInt("ms",AHSET.delay,100,1000)
        if (GUI:IsItemHovered()) then
        AetheryteHelper.SaveSettings()
        if AHSET.mushtooltips == true then
           if language == 0 then
           GUI:SetTooltip(mushtooltips.jp.tip02)
           else
           GUI:SetTooltip(mushtooltips.en.tip02)
           end
           end
        end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button( "Reset",40, 20)
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AHSET.delay = 200
          AetheryteHelper.SaveSettings()
          autheStep = 0
        end
        if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip05)
              else
              GUI:SetTooltip(mushtooltips.en.tip05)
              end
              end
        end
      GUI:EndGroup()
end

-------------------------------------------------------------------------------------------------------------------------------------
-- telepo button GUI

function AetheryteHelper.GLUtelepo()
      GUI:Spacing()
      GUI:SameLine(10)
      GUI:BeginGroup()
      GUI:Dummy(40,40)
      if AHSET.mushmovetoMB == true then
              GUI:SameLine(10,-40)
              GUI:Image(ImageFolder..[[MB.png]],40,40)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              AHSET.mushmovetoMB = not AHSET.mushmovetoMB
              AetheryteHelper.SaveSettings()
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip16)
              else
              GUI:SetTooltip(mushtooltips.en.tip16)
              end
              end
              end      
      elseif AHSET.mushmovetoMB == false then
              GUI:SameLine(10,-40)
              GUI:Image(ImageFolder..[[MB_non.png]],40,40)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              AHSET.mushmovetoMB = not AHSET.mushmovetoMB
              AetheryteHelper.SaveSettings()
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip16)
              else
              GUI:SetTooltip(mushtooltips.en.tip16)
              end
              end
              end       
      end
      if AHSET.mushmovetoMB == false then
      if mushMBlim == true then mushMBlim = false Player:Stop() end
      if mushMBgri == true then mushMBgri = false Player:Stop() end
      if mushMBul == true then mushMBul = false Player:Stop() end
     end
      GUI:EndGroup()
      GUI:SameLine(80)
      GUI:BeginGroup()
      GUI:Dummy(40,40)
      if AHSET.mushmovetoMB == true then
            GUI:SameLine(-10,-40)
            GUI:Image(ImageFolder..[[GCMBgri.png]],40,40)
            if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
               Player:ClearTarget()
               mushMBgri = true
               mushMBlim = false
               mushMBul = false
               griMBStep = 0
            end
            if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip11)
              else
              GUI:SetTooltip(mushtooltips.en.tip11)
              end
              end
            end
      elseif AHSET.mushmovetoMB == false then
            GUI:SameLine(-10,-40)
            GUI:Image(ImageFolder..[[GCtelepogri.png]],40,40)
            if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
              Player:ClearTarget()
              mushlooptimer = 0
              griMBStep = 0
              mushMBgri = true
              mushMBlim = false
              mushMBul = false
              moveSVR = true
              autooff = false
              modechg = 2
            end
            if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip10)
              else
              GUI:SetTooltip(mushtooltips.en.tip10)
              end
              end
            end       
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(40,40)
      if AHSET.mushmovetoMB == true then
            GUI:SameLine(-10,-40)
            GUI:Image(ImageFolder..[[GCMBlim.png]],40,40)
            if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
               Player:ClearTarget()
               mushMBgri = false
               mushMBlim = true
               mushMBul = false
               griMBStep = 0
            end
            if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip13)
              else
              GUI:SetTooltip(mushtooltips.en.tip13)
              end
              end
            end
      elseif AHSET.mushmovetoMB == false then
            GUI:SameLine(-10,-40)
            GUI:Image(ImageFolder..[[GCtelepolim.png]],40,40)
            if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
              Player:ClearTarget()
              mushlooptimer = 0
              griMBStep = 0
              mushMBgri = false
              mushMBlim = true
              mushMBul = false
              moveSVR = true
              autooff = false
              modechg = 2
            end
           if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip12)
              else
              GUI:SetTooltip(mushtooltips.en.tip12)
              end
              end
            end       
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(40,40)
      if AHSET.mushmovetoMB == true then
            GUI:SameLine(-10,-40)
            GUI:Image(ImageFolder..[[GCMBulu.png]],40,40)
            if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
               Player:ClearTarget()
               mushMBgri = false
               mushMBlim = false
               mushMBul = true
               griMBStep = 0
            end
            if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip15)
              else
              GUI:SetTooltip(mushtooltips.en.tip15)
              end
              end
            end
      elseif AHSET.mushmovetoMB == false then
            GUI:SameLine(-10,-40)
            GUI:Image(ImageFolder..[[GCtelepoulu.png]],40,40)
            if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
              Player:ClearTarget()
              mushlooptimer = 0
              griMBStep = 0
              mushMBgri = false
              mushMBlim = false
              mushMBul = true
              moveSVR = true
              autooff = false
              modechg = 2
            end
            if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip14)
              else
              GUI:SetTooltip(mushtooltips.en.tip14)
              end
              end
            end       
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      if AHSET.mushmovetoMB == true and mushMBgri == true then      
      GUI:Text("move to\nMB\nGridania")
      elseif AHSET.mushmovetoMB == true and mushMBlim == true then
      GUI:Text("move to\nMB\nLimsa")
      elseif AHSET.mushmovetoMB == true and mushMBul == true then
      GUI:Text("move to\nMB\nUl'dah")    
      end
      GUI:EndGroup()
end

---------------------------------------------------------------------------------------------------------------------------------------------------
-- wip tab3 button GUI

function AetheryteHelper.DrawadWIP()
      GUI:Spacing(10)
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[jumbo.png]],30,30)
      if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
             AetheryteHelper.Jumbocactpot.open = not AetheryteHelper.Jumbocactpot.open 
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip17)
              else
              GUI:SetTooltip(mushtooltips.en.tip17)
              end
              end
            end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[undersize.png]],30,30)
      if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
            IDUSstep = 0
            mushundersize = true
            end
            if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip18)
              else
              GUI:SetTooltip(mushtooltips.en.tip18)
              end
              end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[explo.png]],30,30)
      if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
            IDexstep = 0
            mushExplorer = true
            end
            if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip19)
              else
              GUI:SetTooltip(mushtooltips.en.tip19)
              end
              end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[tube.png]],30,30)
      if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
            io.popen([[cmd /c start "" "]]..AHLinks.link4..[["]]):close()
            end
            if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip20)
              else
              GUI:SetTooltip(mushtooltips.en.tip20)
              end
              end
      end
      GUI:EndGroup()
      GUI:SameLine(220,0)
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[love_mushroom.png]],30,30)
      if (GUI:IsItemHovered()) then
        if GUI:IsItemClicked(0)then
          AetheryteHelper.VersionList.open = not AetheryteHelper.VersionList.open
        end
        if GUI:IsMouseDown(0) then
        if language == 0 then
        GUI:SetTooltip(mushtooltips.jp.tip106)
        else
        GUI:SetTooltip(mushtooltips.en.tip106)
        end              
        else
        if language == 0 then
        GUI:SetTooltip(mushtooltips.jp.tip105)
        else
        GUI:SetTooltip(mushtooltips.en.tip105)
        end       
      end
      end
      GUI:EndGroup()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[yoro.png]],30,30)
      if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.yoro_otu.open = not AetheryteHelper.yoro_otu.open
            end
            if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip118)
              else
              GUI:SetTooltip(mushtooltips.en.tip118)
              end
              end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[mip.png]],30,30)
      if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.mip.open = not AetheryteHelper.mip.open
            end
            if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip112)
              else
              GUI:SetTooltip(mushtooltips.en.tip112)
              end
              end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[quantity.png]],30,30)
      if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
            AHitemsort = not AHitemsort 
            end
            if AHSET.mushtooltips == true then
              if language == 0 then
                if AHitemsort == false then
                GUI:SetTooltip(mushtooltips.jp.tip119)
                else
                GUI:SetTooltip(mushtooltips.jp.tip120)
                end
              else
                if AHitemsort == false then
                GUI:SetTooltip(mushtooltips.en.tip119)
                else
                GUI:SetTooltip(mushtooltips.en.tip120)
                end
              end
              end
      end
      GUI:EndGroup()

      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Button("TextCommand List",120,20)
      if (GUI:IsItemHovered()) then
        if GUI:IsItemClicked(0)then
          AetheryteHelper.TCList.open = not AetheryteHelper.TCList.open
        end
      end
      GUI:EndGroup()
      GUI:Spacing()

end
--------------------------------------------------------------------------------------------------------------------------------------------------
function AetheryteHelper.minimush()
   local minikinoko = kinokoProject.Windows.minibutton
   local Windows = kinokoProject.Windows.MainWindows
   if (minikinoko.Open) then
      GUI:SetNextWindowSize(40,40)
      minikinoko.Visible, minikinoko.Open = GUI:Begin('mini', minikinoko.Open,minikinoko.Option)
      if (minikinoko.Visible) then
      GUI:SameLine(5)
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[AetheryteHelper.png]],30,30)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
         if GUI:IsMouseDoubleClicked(0) then
         Windows.Open = true
         minikinoko.Open = false
         end
         if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip21)
              else
              GUI:SetTooltip(mushtooltips.en.tip21)
              end
              end
      end
      end
      GUI:End()
   end
end
--------------------------------------------------------------------------------------------------------------------------------------------------
function AetheryteHelper.TCListwindow()
  if (AetheryteHelper.TCList.open) then
    local TCListflags = GUI.WindowFlags_ShowBorders + GUI.WindowFlags_AlwaysAutoResize --+ GUI.WindowFlags_NoScrollbar
    GUI:SetNextWindowSize(240,260)
     AetheryteHelper.TCList.visible, AetheryteHelper.TCList.open = GUI:Begin('AH TextCommand List', AetheryteHelper.TCList.open,TCListflags)
    if (AetheryteHelper.TCList.visible) then
      GUI:BeginGroup()
      local servertime = GetEorzeaTime().servertime
      local day = 0
      local hour = 0
      local min = 0
      local sec = 0
      if servertime > 86400 then
      local temp = math.floor(servertime/86400)
      day = temp
      servertime = servertime - (temp * 86400)
      end
      if servertime > 3600 then
      local temp = math.floor(servertime/3600)
      hour = temp
      servertime = servertime - (temp * 3600)
      end
      if servertime > 60 then
      local temp = math.floor(servertime/60)
      min = temp
      servertime = servertime - (temp * 60)
      end
      if servertime < 60 then
      local temp = servertime
      sec = temp
      servertime = servertime - temp
      end
      GUI:Text("ServerTime:"..string.format("%02d",hour)..":"..string.format("%02d",min)..":"..string.format("%02d",sec))
      GUI:SameLine()
      GUI:Image(ImageFolder..[[howto.png]],20,20)
      if GUI:IsItemHovered() then
        if language == 0 then
          GUI:SetTooltip(mushtooltips.jp.tip111)
        else
          GUI:SetTooltip(mushtooltips.en.tip111)
        end
      end
      GUI:EndGroup()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:TextColored(0,1,0,1,"More commands will be added!")
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[AHon.png]],30,40)
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Text("mini ins selecter")
      GUI:PushItemWidth(120)
      GUI:InputText("###114","/e AHmode 114",GUI.InputTextFlags_ReadOnly + GUI.InputTextFlags_AutoSelectAll)
      if GUI:IsItemHovered() then
        if GUI:IsItemClicked(1) then
          GUI:SetClipboardText("/e AHmode 114")
          if language == 0 then
          SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]コピーしました")
          else
          SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]text was copied in clip board")
          end
         end
        if AHSET.mushtooltips == true then
            if language == 0 then
            GUI:SetTooltip(mushtooltips.jp.tip110)
            else
            GUI:SetTooltip(mushtooltips.en.tip110)
            end
        end
      end
      GUI:EndGroup()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[AHon.png]],30,40)
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Text("mini World selecter")
      GUI:PushItemWidth(120)
      GUI:InputText("###WVmini","/e AHWV mini",GUI.InputTextFlags_ReadOnly + GUI.InputTextFlags_AutoSelectAll)
      if GUI:IsItemHovered() then
        if GUI:IsItemClicked(1) then
          GUI:SetClipboardText("/e AHWV mini")
          if language == 0 then
          SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]コピーしました")
          else
          SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]text was copied in clip board")
          end
         end
        if AHSET.mushtooltips == true then
            if language == 0 then
            GUI:SetTooltip(mushtooltips.jp.tip110)
            else
            GUI:SetTooltip(mushtooltips.en.tip110)
            end
        end
      end
      GUI:EndGroup()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[GCMBlim.png]],30,30)
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Text("move to MB in limsa")
      GUI:PushItemWidth(120)
      GUI:InputText("###MB1","/e AHMB limsa",GUI.InputTextFlags_ReadOnly + GUI.InputTextFlags_AutoSelectAll)
      if GUI:IsItemHovered() then
        if GUI:IsItemClicked(1) then
          GUI:SetClipboardText("/e AHMB limsa")
          if language == 0 then
          SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]コピーしました")
          else
          SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]text was copied in clip board")
          end
          end
        if AHSET.mushtooltips == true then
            if language == 0 then
            GUI:SetTooltip(mushtooltips.jp.tip110)
            else
            GUI:SetTooltip(mushtooltips.en.tip110)
            end
        end
      end
      GUI:EndGroup()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[GCMBgri.png]],30,30)
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Text("move to MB in gridania")
      GUI:PushItemWidth(120)
      GUI:InputText("###MB2","/e AHMB gridania",GUI.InputTextFlags_ReadOnly + GUI.InputTextFlags_AutoSelectAll)
      if GUI:IsItemHovered() then
        if GUI:IsItemClicked(1) then
          GUI:SetClipboardText("/e AHMB gridania")
          if language == 0 then
          SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]コピーしました")
          else
          SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]text was copied in clip board")
          end
        end
        if AHSET.mushtooltips == true then
            if language == 0 then
            GUI:SetTooltip(mushtooltips.jp.tip110)
            else
            GUI:SetTooltip(mushtooltips.en.tip110)
            end
        end
      end
      GUI:EndGroup()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[GCMBulu.png]],30,30)
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Text("move to MB in Ul'dah")
      GUI:PushItemWidth(120)
      GUI:InputText("###MB3","/e AHMB uldah",GUI.InputTextFlags_ReadOnly + GUI.InputTextFlags_AutoSelectAll)
      if GUI:IsItemHovered() then
        if GUI:IsItemClicked(1) then
          GUI:SetClipboardText("/e AHMB uldah")
          if language == 0 then
          SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]コピーしました")
          else
          SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]text was copied in clip board")
          end
          end
        if AHSET.mushtooltips == true then
            if language == 0 then
            GUI:SetTooltip(mushtooltips.jp.tip110)
            else
            GUI:SetTooltip(mushtooltips.en.tip110)
            end
        end
      end
      GUI:EndGroup()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[moveGC.png]],30,30)
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Text("move to GC")
      GUI:PushItemWidth(120)
      GUI:InputText("###MB3","/e AHGC move",GUI.InputTextFlags_ReadOnly + GUI.InputTextFlags_AutoSelectAll)
      if GUI:IsItemHovered() then
        if GUI:IsItemClicked(1) then
          GUI:SetClipboardText("/e AHGC move")
          if language == 0 then
          SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]コピーしました")
          else
          SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]text was copied in clip board")
          end
          end
        if AHSET.mushtooltips == true then
            if language == 0 then
            GUI:SetTooltip(mushtooltips.jp.tip110)
            else
            GUI:SetTooltip(mushtooltips.en.tip110)
            end
        end
      end
      GUI:EndGroup()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[bjem.png]],30,30)
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Text("bicolor gemstone amount")
      GUI:PushItemWidth(120)
      GUI:InputText("###MB3","/e AHBJ num",GUI.InputTextFlags_ReadOnly + GUI.InputTextFlags_AutoSelectAll)
      if GUI:IsItemHovered() then
        if GUI:IsItemClicked(1) then
          GUI:SetClipboardText("/e AHBJ num")
          if language == 0 then
          SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]コピーしました")
          else
          SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]text was copied in clip board")
          end
          end
        if AHSET.mushtooltips == true then
            if language == 0 then
            GUI:SetTooltip(mushtooltips.jp.tip110)
            else
            GUI:SetTooltip(mushtooltips.en.tip110)
            end
        end
      end
      GUI:EndGroup()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[WeeEa.png]],30,30)
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Text("minion WeeEa count")
      GUI:PushItemWidth(120)
      GUI:InputText("###MB3","/e AH WeeEa ",GUI.InputTextFlags_ReadOnly + GUI.InputTextFlags_AutoSelectAll)
      if GUI:IsItemHovered() then
        if GUI:IsItemClicked(1) then
          GUI:SetClipboardText("/e AH WeeEa")
          if language == 0 then
          SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]コピーしました")
          else
          SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]text was copied in clip board")
          end
          end
        if AHSET.mushtooltips == true then
            if language == 0 then
            GUI:SetTooltip(mushtooltips.jp.tip110)
            else
            GUI:SetTooltip(mushtooltips.en.tip110)
            end
        end
      end
      GUI:EndGroup()
    end        
    GUI:End()  
  end
end

--------------------------------------------------------------------------------------------------------------------------------------------------
function AetheryteHelper.SubWindow()
  if (AetheryteHelper.miniGUI.open) then
    local miniGUIflags = GUI.WindowFlags_NoTitleBar +  GUI.WindowFlags_NoFocusOnAppearing + GUI.WindowFlags_NoBringToFrontOnFocus + GUI.WindowFlags_AlwaysAutoResize
    GUI:SetNextWindowSize(260,140)
     AetheryteHelper.miniGUI.visible, AetheryteHelper.miniGUI.open = GUI:Begin('miniinfo', AetheryteHelper.miniGUI.open,miniGUIflags)
    if (AetheryteHelper.miniGUI.visible) then
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:TextColored(0,1,0,1,"instance info")
      GUI:EndGroup()
      GUI:SameLine(230)
      GUI:BeginGroup()
      GUI:Button("X",20,20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if GUI:IsMouseDown(0) then              
        AetheryteHelper.miniGUI.open = false
        end
      if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip22)
              else
              GUI:SetTooltip(mushtooltips.en.tip22)
              end
              end
      end
      GUI:Separator()
      GUI:BeginGroup()
      GUI:TextColored(1,0,0,1,"Probably (350) is limit")
      GUI:EndGroup()
      
      GUI:Spacing()
      if mushins == nil or selectins == false then
      GUI:BeginGroup()
      GUI:TextColored(1,1,1,1,"ins1:-------")
      GUI:EndGroup()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:TextColored(1,1,1,1,"ins2:-------")
      GUI:EndGroup()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:TextColored(1,1,1,1,"ins3:-------")
      GUI:EndGroup()
      else
      GUI:BeginGroup()      
      GUI:TextColored(0,1,1,1,"ins1:"..mushins[9].value)
      GUI:EndGroup()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:TextColored(0,1,1,1,"ins2:"..mushins[10].value)
      GUI:EndGroup()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:TextColored(0,1,1,1,"ins3:"..mushins[11].value)
      GUI:EndGroup()
      end
    end        
    GUI:End()
    
  end
  
end

function AetheryteHelper.VlWindow()
  if (AetheryteHelper.VersionList.open) then
    local Vlflags = GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoFocusOnAppearing + GUI.WindowFlags_NoBringToFrontOnFocus + GUI.WindowFlags_AlwaysAutoResize
    GUI:SetNextWindowSize(450,140)
     AetheryteHelper.VersionList.visible, AetheryteHelper.VersionList.open = GUI:Begin('AH VersionList', AetheryteHelper.VersionList.open,Vlflags)
    if (AetheryteHelper.VersionList.visible) then
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:TextColored(0,1,0,1,"AH History")
      GUI:EndGroup()
      GUI:Separator()
      GUI:BeginGroup()
      for id, e in pairs(kinokoProject.Addon.VersionList) do
      GUI:Text(e)
      end
      GUI:EndGroup()
      GUI:Separator()
      GUI:BeginGroup()
      GUI:Button("Close",60,20)
      if (GUI:IsItemHovered()) then
        if GUI:IsMouseDown(0) then              
        AetheryteHelper.VersionList.open = false
        end
        if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip22)
              else
              GUI:SetTooltip(mushtooltips.en.tip22)
              end
        end
      end
      GUI:EndGroup()
    end
    GUI:End()
  end
end
--------------------------------------------------------------------------------------------------------------------------------------------------

function AetheryteHelper.insSelecterWindow()
  if (AetheryteHelper.insSelectGUI.open) then
    local insSelectGUIflags = GUI.WindowFlags_NoTitleBar +  GUI.WindowFlags_NoFocusOnAppearing + GUI.WindowFlags_NoBringToFrontOnFocus + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoScrollbar
    GUI:SetNextWindowSize(180,60)
     AetheryteHelper.insSelectGUI.visible, AetheryteHelper.insSelectGUI.open = GUI:Begin('insselecter', AetheryteHelper.insSelectGUI.open,insSelectGUIflags)
    if (AetheryteHelper.insSelectGUI.visible) then
      GUI:Spacing(5)
      GUI:Separator()
      GUI:Columns(3)
      GUI:SetColumnOffset(1, 40) GUI:SetColumnOffset(2, 140) GUI:SetColumnOffset(3, 180)
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if selectins == true then
              GUI:SameLine(-5,-20)
              GUI:Image(ImageFolder..[[AHon.png]],20,20)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              isins = 4
              selectins = not selectins
              if not selectins then
              insHistory = {
              isins = 4,
              selectins = false,
              autheStep = 0
              }
              end
              Player:ClearTarget()
              Player:Stop()
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip01)
              else
              GUI:SetTooltip(mushtooltips.en.tip01)
              end
              end
              end      
      elseif selectins == false then
              GUI:SameLine(-5,-20)
              GUI:Image(ImageFolder..[[AHoff.png]],20,20)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              isins = 4
              selectins = not selectins
              if not selectins then
              insHistory = {
              isins = 4,
              selectins = false,
              autheStep = 0
              }
              end
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip01)
              else
              GUI:SetTooltip(mushtooltips.en.tip01)
              end
              end
              end       
      end
      GUI:EndGroup()
      GUI:NextColumn()
      GUI:SameLine(25)
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if (GUI:IsItemHovered()) then
          GUI:SameLine(-7.5,-30)
          GUI:Image(ImageFolder..[[ins1.png]],25,25)
          if (GUI:IsMouseClicked(0)) then
          isins = 1
          insHistory.isins = 1
          autheStep = 2
          if selectins == false then
          selectins = true
          end
          insHistory.selectins = true
          insHistory.autheStep = 2
          end
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip07)
              else
              GUI:SetTooltip(mushtooltips.en.tip07)
              end
              end
      else
      GUI:SameLine(-5,-20)
      GUI:Image(ImageFolder..[[ins1non.png]],20,20)
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if (GUI:IsItemHovered()) then
          GUI:SameLine(-7.5,-30)
          GUI:Image(ImageFolder..[[ins2.png]],25,25)
          if (GUI:IsMouseClicked(0)) then
          isins = 2
          insHistory.isins = 2
          autheStep = 2
          if selectins == false then
          selectins = true
          end
          insHistory.selectins = true
          insHistory.autheStep = 2
          end
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip08)
              else
              GUI:SetTooltip(mushtooltips.en.tip08)
              end
              end
      else
      GUI:SameLine(-5,-20)
      GUI:Image(ImageFolder..[[ins2non.png]],20,20)
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if (GUI:IsItemHovered()) then
          GUI:SameLine(-7.5,-30)
          GUI:Image(ImageFolder..[[ins3.png]],25,25)
          if (GUI:IsMouseClicked(0)) then
          isins = 3
          insHistory.isins = 3
          autheStep = 2
          if selectins == false then
          selectins = true
          end
          insHistory.selectins = true
          insHistory.autheStep = 2
          end
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip09)
              else
              GUI:SetTooltip(mushtooltips.en.tip09)
              end
              end
      else
      GUI:SameLine(-5,-20)
      GUI:Image(ImageFolder..[[ins3non.png]],20,20)
      end

      GUI:EndGroup()
      GUI:NextColumn()
      GUI:SameLine(15)
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[close.png]],20,20)
      if (GUI:IsItemHovered()) then
          if GUI:IsMouseDown(0) then              
          AetheryteHelper.insSelectGUI.open = false
          end
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip22)
              else
              GUI:SetTooltip(mushtooltips.en.tip22)
              end
              end
      end
      GUI:EndGroup()
      GUI:Columns()
      GUI:Spacing(10)
      GUI:Separator()

      end
      GUI:End()  
  end
end


--------------------------------------------------------------------------------------------------------------------------------------------------
function AetheryteHelper.jumboWindow()
  if (AetheryteHelper.Jumbocactpot.open) then
    local Jumboflags =  GUI.WindowFlags_ShowBorders + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoScrollbar
    GUI:SetNextWindowSize(380,320)
     AetheryteHelper.Jumbocactpot.visible, AetheryteHelper.Jumbocactpot.open = GUI:Begin('jumbo cactpot assist', AetheryteHelper.Jumbocactpot.open,Jumboflags)
    if (AetheryteHelper.Jumbocactpot.visible) then
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:TextColored(0,1,0,1,"Once a week! Jumbo cactpot")
      GUI:EndGroup()
  
      GUI:Separator()
      GUI:BeginGroup()
      GUI:TextColored(0,1,1,1,"Enter 4 numbers")
      GUI:EndGroup()
      GUI:SameLine(220)
      if Inventory:Get(2000):GetList()[10] ~= nil then
      mushPmgp = Inventory:Get(2000):GetList()[10]      
      GUI:BeginGroup()
      GUI:TextColored(1,1,0,1,"MGP:"..mushPmgp.count.."/9999999")
      GUI:EndGroup()  
      else 
      GUI:BeginGroup()
      GUI:TextColored(1,0,0,1,"MGP:0/9999999")
      GUI:EndGroup()
      end
      if mushPmgp == nil or mushPmgp.count < 450 then
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:TextColored(1,0,0,1,"Requires 450 MGP")
      GUI:EndGroup()
      GUI:Spacing()
      end
      GUI:BeginGroup()
      GUI:Text("1st--100MGP---------------------------------------")
      GUI:EndGroup()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("random",mushJumbocactpotrandom1)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
         if (GUI:IsMouseClicked(0)) then
         mushJumbocactpotrandom1 = not mushJumbocactpotrandom1
         mushGSjcpstep = 0
        end   
        if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip23)
              else
              GUI:SetTooltip(mushtooltips.en.tip23)
              end
              end
     end
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:PushItemWidth(80)
      AHSET.jumbo11 = GUI:InputInt("###11",AHSET.jumbo11,1,1)
      if AHSET.jumbo11 < 0 then AHSET.jumbo11 = 9 end
      if AHSET.jumbo11 > 9 then AHSET.jumbo11 = 0 end
      GUI:SameLine()
      GUI:PushItemWidth(80)
      AHSET.jumbo12 = GUI:InputInt("###12",AHSET.jumbo12,1,1)
      if AHSET.jumbo12 < 0 then AHSET.jumbo12 = 9 end
      if AHSET.jumbo12 > 9 then AHSET.jumbo12 = 0 end
      GUI:SameLine()
      GUI:PushItemWidth(80)
      AHSET.jumbo13 = GUI:InputInt("###13",AHSET.jumbo13,1,1)
      if AHSET.jumbo13 < 0 then AHSET.jumbo13 = 9 end
      if AHSET.jumbo13 > 9 then AHSET.jumbo13 = 0 end
      GUI:SameLine()
      GUI:PushItemWidth(80)
      AHSET.jumbo14 = GUI:InputInt("###14",AHSET.jumbo14,1,1)
      if AHSET.jumbo14 < 0 then AHSET.jumbo14 = 9 end
      if AHSET.jumbo14 > 9 then AHSET.jumbo14 = 0 end
      AetheryteHelper.SaveSettings()
      GUI:EndGroup()
      
      GUI:Spacing()
      
      GUI:BeginGroup()
      GUI:Text("2nd--150MGP---------------------------------------")
      GUI:EndGroup()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("random",mushJumbocactpotrandom2)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
         if (GUI:IsMouseClicked(0)) then
         mushJumbocactpotrandom2 = not mushJumbocactpotrandom2
         mushGSjcpstep = 0
        end   
        if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip23)
              else
              GUI:SetTooltip(mushtooltips.en.tip23)
              end
              end
      end
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:PushItemWidth(80)
      AHSET.jumbo21 = GUI:InputInt("###21",AHSET.jumbo21,1,1)
      if AHSET.jumbo21 < 0 then AHSET.jumbo21 = 9 end
      if AHSET.jumbo21 > 9 then AHSET.jumbo21 = 0 end
      GUI:SameLine()
      GUI:PushItemWidth(80)
      AHSET.jumbo22 = GUI:InputInt("###22",AHSET.jumbo22,1,1)
      if AHSET.jumbo22 < 0 then AHSET.jumbo22 = 9 end
      if AHSET.jumbo22 > 9 then AHSET.jumbo22 = 0 end
      GUI:SameLine()
      GUI:PushItemWidth(80)
      AHSET.jumbo23 = GUI:InputInt("###23",AHSET.jumbo23,1,1)
      if AHSET.jumbo23 < 0 then AHSET.jumbo23= 9 end
      if AHSET.jumbo23 > 9 then AHSET.jumbo23 = 0 end
      GUI:SameLine()
      GUI:PushItemWidth(80)
      AHSET.jumbo24 = GUI:InputInt("###24",AHSET.jumbo24,1,1)
      if AHSET.jumbo24 < 0 then AHSET.jumbo24 = 9 end
      if AHSET.jumbo24 > 9 then AHSET.jumbo24 = 0 end
      AetheryteHelper.SaveSettings()
      GUI:EndGroup()


      GUI:Spacing()
      
      GUI:BeginGroup()
      GUI:Text("3rd--200MGP---------------------------------------")
      GUI:EndGroup()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("random",mushJumbocactpotrandom3)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
         if (GUI:IsMouseClicked(0)) then
         mushJumbocactpotrandom3 = not mushJumbocactpotrandom3
         mushGSjcpstep = 0
        end   
        if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip23)
              else
              GUI:SetTooltip(mushtooltips.en.tip23)
              end
              end
     end
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:PushItemWidth(80)
      AHSET.jumbo31 = GUI:InputInt("###31",AHSET.jumbo31,1,1)
      if AHSET.jumbo31 < 0 then AHSET.jumbo31 = 9 end
      if AHSET.jumbo31 > 9 then AHSET.jumbo31 = 0 end
      GUI:SameLine()
      GUI:PushItemWidth(80)
      AHSET.jumbo32 = GUI:InputInt("###32",AHSET.jumbo32,1,1)
      if AHSET.jumbo32 < 0 then AHSET.jumbo32 = 9 end
      if AHSET.jumbo32 > 9 then AHSET.jumbo32 = 0 end
      GUI:SameLine()
      GUI:PushItemWidth(80)
      AHSET.jumbo33 = GUI:InputInt("###33",AHSET.jumbo33,1,1)
      if AHSET.jumbo33 < 0 then AHSET.jumbo33 = 9 end
      if AHSET.jumbo33 > 9 then AHSET.jumbo33 = 0 end
      GUI:SameLine()
      GUI:PushItemWidth(80)
      AHSET.jumbo34 = GUI:InputInt("###34",AHSET.jumbo34,1,1)
      if AHSET.jumbo34 < 0 then AHSET.jumbo34 = 9 end
      if AHSET.jumbo34 > 9 then AHSET.jumbo34 = 0 end
      AetheryteHelper.SaveSettings()
      GUI:EndGroup()

      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("ticket purchases",mushJumbocactpothelper)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
         if (GUI:IsMouseClicked(0)) then
         mushJumbocactpothelper = not mushJumbocactpothelper
         mushGSjcpstep = 0
        end   
        if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip107)
              else
              GUI:SetTooltip(mushtooltips.en.tip107)
              end
              end
      end
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:TextColored(1,0,0,1,"[[Warning]]")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
         if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip24)
              else
              GUI:SetTooltip(mushtooltips.en.tip24)
              end
              end
      end


    end        
    GUI:End()
    
  end
  
end

--------------------------------------------------------------------------------------------------------------------------------------------------
local MIP = AetheryteHelper.DutyPlay.MIP
function AetheryteHelper.MIPselect()
  if (AetheryteHelper.mip.open) then
    local mipflags =  GUI.WindowFlags_ShowBorders + GUI.WindowFlags_AlwaysAutoResize
    GUI:SetNextWindowSize(260,150)
     AetheryteHelper.mip.visible, AetheryteHelper.mip.open = GUI:Begin('Auto Commendation', AetheryteHelper.mip.open,mipflags)
    if (AetheryteHelper.mip.visible) then
      GUI:Spacing()
      GUI:BeginGroup()
      --GUI:PushItemWidth(150)
          if Player.Job == 19 or Player.Job == 1 then
            GUI:Image(ImageFolder..[[icon_t01.png]],20,20)
          elseif Player.Job == 21 or Player.Job == 3 then
            GUI:Image(ImageFolder..[[icon_t02.png]],20,20)
          elseif Player.Job == 32 then
            GUI:Image(ImageFolder..[[icon_t03.png]],20,20)
          elseif Player.Job == 37 then
            GUI:Image(ImageFolder..[[icon_t04.png]],20,20)
          elseif Player.Job == 24 or Player.Job == 6 then
            GUI:Image(ImageFolder..[[icon_h01.png]],20,20)
          elseif Player.Job == 28 then
            GUI:Image(ImageFolder..[[icon_h02.png]],20,20)
          elseif Player.Job == 33 then
            GUI:Image(ImageFolder..[[icon_h03.png]],20,20)
          elseif Player.Job == 40 then
            GUI:Image(ImageFolder..[[icon_h04.png]],20,20)
          elseif Player.Job == 20 or Player.Job == 2 then
            GUI:Image(ImageFolder..[[icon_d01.png]],20,20)
          elseif Player.Job == 22 or Player.Job == 4 then
            GUI:Image(ImageFolder..[[icon_d02.png]],20,20)
          elseif Player.Job == 23 or Player.Job == 5 then
            GUI:Image(ImageFolder..[[icon_d03.png]],20,20)
          elseif Player.Job == 25 or Player.Job == 7 then
            GUI:Image(ImageFolder..[[icon_d04.png]],20,20)
          elseif Player.Job == 27 or Player.Job == 26 then
            GUI:Image(ImageFolder..[[icon_d05.png]],20,20)
          elseif Player.Job == 30 or Player.Job == 29 then
            GUI:Image(ImageFolder..[[icon_d06.png]],20,20)
          elseif Player.Job == 31 then
            GUI:Image(ImageFolder..[[icon_d07.png]],20,20)
          elseif Player.Job == 34 then
            GUI:Image(ImageFolder..[[icon_d08.png]],20,20)
          elseif Player.Job == 35 then
            GUI:Image(ImageFolder..[[icon_d09.png]],20,20)
          elseif Player.Job == 38 then
            GUI:Image(ImageFolder..[[icon_d10.png]],20,20)
          elseif Player.Job == 39 then
            GUI:Image(ImageFolder..[[icon_d11.png]],20,20)
          else
            GUI:Image(ImageFolder..[[fil_jall_non.png]],20,20)
          end
      GUI:EndGroup()
      GUI:SameLine()
      --GUI:InputText("##name",Player.name,GUI.InputTextFlags_ReadOnly)
      GUI:Text("Player Job")
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Text("Party info:")
      GUI:SameLine()
          local plist = EntityList.myparty
          if (table.valid(plist)) then
             if (#plist) >= 7 then
             GUI:TextColored(0,1,0,1,"Full Party")
             end
             if (#plist) < 7 then
             GUI:TextColored(0,1,1,1,"Light Party")
             end
          else
             GUI:TextColored(1,1,0,1,"Solo")
          end
       GUI:EndGroup()
       GUI:BeginGroup()
       GUI:Dummy(1,1)
          if (table.valid(plist)) then
            for id,e in pairs(plist) do
              GUI:SameLine()
              if e.job == 19 or e.job == 1 then
              GUI:Image(ImageFolder..[[icon_t01.png]],20,20)
              elseif e.job == 21 or e.job == 3 then
              GUI:Image(ImageFolder..[[icon_t02.png]],20,20)
              elseif e.job == 32 then
              GUI:Image(ImageFolder..[[icon_t03.png]],20,20)
              elseif e.job == 37 then
              GUI:Image(ImageFolder..[[icon_t04.png]],20,20)
              elseif e.job == 24 or e.job == 6 then
              GUI:Image(ImageFolder..[[icon_h01.png]],20,20)
              elseif e.job == 28 then
              GUI:Image(ImageFolder..[[icon_h02.png]],20,20)
              elseif e.job == 33 then
              GUI:Image(ImageFolder..[[icon_h03.png]],20,20)
              elseif e.job == 40 then
              GUI:Image(ImageFolder..[[icon_h04.png]],20,20)
              elseif e.job == 20 or e.job == 2 then
              GUI:Image(ImageFolder..[[icon_d01.png]],20,20)
              elseif e.job == 22 or e.job == 4 then
              GUI:Image(ImageFolder..[[icon_d02.png]],20,20)
              elseif e.job == 23 or e.job == 5 then
              GUI:Image(ImageFolder..[[icon_d03.png]],20,20)
              elseif e.job == 25 or e.job == 7 then
              GUI:Image(ImageFolder..[[icon_d04.png]],20,20)
              elseif e.job == 27 or e.job == 26 then
              GUI:Image(ImageFolder..[[icon_d05.png]],20,20)
              elseif e.job == 30 or e.job == 29 then
              GUI:Image(ImageFolder..[[icon_d06.png]],20,20)
              elseif e.job == 31 then
              GUI:Image(ImageFolder..[[icon_d07.png]],20,20)
              elseif e.job == 34 then
              GUI:Image(ImageFolder..[[icon_d08.png]],20,20)
              elseif e.job == 35 then
              GUI:Image(ImageFolder..[[icon_d09.png]],20,20)
              elseif e.job == 38 then
              GUI:Image(ImageFolder..[[icon_d10.png]],20,20)
              elseif e.job == 39 then
              GUI:Image(ImageFolder..[[icon_d11.png]],20,20)
              else
              GUI:Image(ImageFolder..[[fil_jall_non.png]],20,20)
              end
            end
            else
            GUI:SameLine()  
            GUI:Image(ImageFolder..[[fil_jall_non.png]],20,20)
            GUI:SameLine()  
            GUI:Image(ImageFolder..[[fil_jall_non.png]],20,20)
            GUI:SameLine()  
            GUI:Image(ImageFolder..[[fil_jall_non.png]],20,20)
            GUI:SameLine()  
            GUI:Image(ImageFolder..[[fil_jall_non.png]],20,20)
            GUI:SameLine()  
            GUI:Image(ImageFolder..[[fil_jall_non.png]],20,20)
            GUI:SameLine()  
            GUI:Image(ImageFolder..[[fil_jall_non.png]],20,20)
            GUI:SameLine()  
            GUI:Image(ImageFolder..[[fil_jall_non.png]],20,20)
            GUI:SameLine()  
            GUI:Image(ImageFolder..[[fil_jall_non.png]],20,20)
          end
      GUI:EndGroup()
      GUI:Spacing()
      GUI:Separator()
      GUI:BeginGroup()
      GUI:Checkbox("Enable",MIP.Enable)
      if GUI:IsItemHovered() then
        if GUI:IsItemClicked(0) then
          MIP.Enable = not MIP.Enable
          AetheryteHelper.SaveSettings()
        end
         if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip114)
              else
              GUI:SetTooltip(mushtooltips.en.tip114)
              end
         end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:PushItemWidth(60)
      MIP.select = GUI:InputInt("###index",MIP.select,1,1)
      AetheryteHelper.SaveSettings()
      if (#plist) > 4 then
        if MIP.select > 7 then MIP.select = 7 end
        if MIP.select < 1  then MIP.select = 1 end
      elseif (#plist) <= 4 then
        if MIP.select > 3 then MIP.select = 3 end
        if MIP.select < 1  then MIP.select = 1 end
      end
      GUI:EndGroup()
       if GUI:IsItemHovered() then
         if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip113)
              else
              GUI:SetTooltip(mushtooltips.en.tip113)
              end
         end
      end
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[mip.png]],20,20)
      GUI:SameLine(25)
      GUI:Text(">>")
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      local ABCduty = { 174,372,151,508,556,627,734,776,826,882,917,966 }  --5.x
      local allaiance = false
      for _,v in pairs(ABCduty) do
        if Player.localmapid == v then
           allaiance = true
        end  
      end
      if Duty:IsQueued() == false and (#plist) > 1 then
         GUI:Image(ImageFolder..[[fil_jall.png]],20,20)
      elseif (#plist) > 4 and allaiance == false then
         if MIP.select == 1 or 
            MIP.select == 2 and Player.role == 2 or
            MIP.select == 2 and Player.role == 3 or
            MIP.select == 2 and Player.role == 4 then
            GUI:Image(ImageFolder..[[fil_jTNK.png]],20,20)
         elseif MIP.select == 2 and Player.role == 1 or
                MIP.select == 3 and Player.role == 1 or
                MIP.select == 3 and Player.role == 2 or
                MIP.select == 3 and Player.role == 3 or
                MIP.select == 3 and Player.role == 4 or
                MIP.select == 4 and Player.role == 2 or
                MIP.select == 4 and Player.role == 3 then
            GUI:Image(ImageFolder..[[fil_jHRR.png]],20,20)
         elseif MIP.select == 4 and Player.role == 4 or 
                MIP.select == 5 or MIP.select == 6 or MIP.select == 7 then
            GUI:Image(ImageFolder..[[fil_jDPS.png]],20,20)
         end
      elseif (#plist) > 4 and allaiance == true then
         if MIP.select == 1 and Player.role == 2 or 
            MIP.select == 1 and Player.role == 3 or
            MIP.select == 1 and Player.role == 4 then
            GUI:Image(ImageFolder..[[fil_jTNK.png]],20,20)
         elseif MIP.select == 1 and Player.role == 1 or
                MIP.select == 2 and Player.role == 1 or
                MIP.select == 2 and Player.role == 2 or
                MIP.select == 2 and Player.role == 3 or
                MIP.select == 2 and Player.role == 4 or
                MIP.select == 3 and Player.role == 2 or
                MIP.select == 3 and Player.role == 3 then
            GUI:Image(ImageFolder..[[fil_jHRR.png]],20,20)
         elseif MIP.select == 3 and Player.role == 1 or
                MIP.select == 3 and Player.role == 4 or
                MIP.select == 4 and Player.role == 2 or
                MIP.select == 4 and Player.role == 3 or
                MIP.select == 4 and Player.role == 4 or 
                MIP.select == 5 or MIP.select == 6 or MIP.select == 7 then
            GUI:Image(ImageFolder..[[fil_jDPS.png]],20,20)
         end
      elseif (#plist) <= 4 then
         if MIP.select == 1 and Player.role == 1 or
            MIP.select == 2 and Player.role == 2 or
            MIP.select == 2 and Player.role == 3 then
            GUI:Image(ImageFolder..[[fil_jHRR.png]],20,20)
         elseif MIP.select == 1 and Player.role == 2 or
                MIP.select == 1 and Player.role == 3 or 
                MIP.select == 1 and Player.role == 4 then
            GUI:Image(ImageFolder..[[fil_jTNK.png]],20,20)   
         elseif MIP.select == 2 and Player.role == 1 or
                MIP.select == 2 and Player.role == 4 or
                MIP.select == 3 then
            GUI:Image(ImageFolder..[[fil_jDPS.png]],20,20)
         end
      end
      GUI:EndGroup()
      mushmipselect = MIP.select-1
  
    end        
    GUI:End()
  end
end


--------------------------------------------------------------------------------------------------------------------------------------------------
local Scall = AetheryteHelper.DutyPlay.yoro
local Ecall = AetheryteHelper.DutyPlay.otu
function AetheryteHelper.YoroOtu()
  if (AetheryteHelper.yoro_otu.open) then
    local yoroflags =  GUI.WindowFlags_ShowBorders + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoScrollbar
    GUI:SetNextWindowSize(280,240)
     AetheryteHelper.yoro_otu.visible, AetheryteHelper.yoro_otu.open = GUI:Begin('Duty Chat Support', AetheryteHelper.yoro_otu.open,yoroflags)
    if (AetheryteHelper.yoro_otu.visible) then
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Checkbox("##on",Scall.Enable)
      if GUI:IsItemHovered() then
        if GUI:IsItemClicked(0) then
          Scall.Enable = not Scall.Enable
          AetheryteHelper.SaveSettings()
        end
        if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip114)
              else
              GUI:SetTooltip(mushtooltips.en.tip114)
              end
         end
      end
      GUI:SameLine()
      GUI:TextColored(0,1,0,1,"Start Call")
      GUI:EndGroup()
      
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[Pchat.png]],20,20)
      GUI:SameLine()
      Scall.word01 = GUI:InputText("##Sword01",Scall.word01)
      AetheryteHelper.SaveSettings()
      if GUI:IsItemHovered() then
        if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip115)
              else
              GUI:SetTooltip(mushtooltips.en.tip115)
              end
        end
      end
      GUI:EndGroup()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[free_chat.png]],20,20)
      GUI:SameLine()
      Scall.word02 = GUI:InputText("##Sword02",Scall.word02)
      AetheryteHelper.SaveSettings()
      if GUI:IsItemHovered() then
        if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip116)
              else
              GUI:SetTooltip(mushtooltips.en.tip116)
              end
        end
      end
      GUI:EndGroup()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Checkbox("##on",Ecall.Enable)
      if GUI:IsItemHovered() then
        if GUI:IsItemClicked(0) then
          Ecall.Enable = not Ecall.Enable
          AetheryteHelper.SaveSettings()
        end
        if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip114)
              else
              GUI:SetTooltip(mushtooltips.en.tip114)
              end
         end
      end
      GUI:SameLine()
      GUI:TextColored(0,1,0,1,"End Call")
      GUI:EndGroup()
      
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[Pchat.png]],20,20)
      GUI:SameLine()
      Ecall.word01 = GUI:InputText("##Eword01",Ecall.word01)
      AetheryteHelper.SaveSettings()
      if GUI:IsItemHovered() then
        if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip115)
              else
              GUI:SetTooltip(mushtooltips.en.tip115)
              end
        end
      end
      GUI:EndGroup()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[free_chat.png]],20,20)
      GUI:SameLine()
      Ecall.word02 = GUI:InputText("##Eword02",Ecall.word02)
      AetheryteHelper.SaveSettings()
      if GUI:IsItemHovered() then
        if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip116)
              else
              GUI:SetTooltip(mushtooltips.en.tip116)
              end
        end
      end
      GUI:EndGroup()
  

    end        
    GUI:End()
  end
end


--------------------------------------------------------------------------------------------------------------------------------------------------

function AetheryteHelper.subtoolDesOPwindow()
  if (AetheryteHelper.subtoolDesOP.open) then
    local SubTDflags =  GUI.WindowFlags_ShowBorders + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoScrollbar
    GUI:SetNextWindowSize(320,500)
     AetheryteHelper.subtoolDesOP.visible, AetheryteHelper.subtoolDesOP.open = GUI:Begin('Desynthesis option setting', AetheryteHelper.subtoolDesOP.open,SubTDflags)
    if (AetheryteHelper.subtoolDesOP.visible) then
     GUI:Spacing()
     GUI:Columns(2,"header")
     GUI:SetColumnOffset(1, 140) GUI:SetColumnOffset(2, 400)
     GUI:BeginGroup()
     GUI:Dummy(40,40)
     if AHSET.CrafterMode == true then
          GUI:SameLine(10,-40)
          GUI:Image(ImageFolder..[[D_Cmode.png]],40,40)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHSET.CrafterMode = not AHSET.CrafterMode
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip28)
              else
              GUI:SetTooltip(mushtooltips.en.tip28)
              end
              end
          end
     elseif AHSET.CrafterMode == false then
          GUI:SameLine(10,-40)
          GUI:Image(ImageFolder..[[D_Cmode_non.png]],40,40)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHSET.CrafterMode = not AHSET.CrafterMode
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip28)
              else
              GUI:SetTooltip(mushtooltips.en.tip28)
              end
              end
          end
     end
     GUI:EndGroup()
     GUI:SameLine()
     GUI:BeginGroup()
     GUI:Dummy(40,40)
     if AHSET.DesynthTrust == true then
          GUI:SameLine(10,-40)
          GUI:Image(ImageFolder..[[D_idmode.png]],40,40)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHSET.DesynthTrust = not AHSET.DesynthTrust
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip29)
              else
              GUI:SetTooltip(mushtooltips.en.tip29)
              end
              end
          end
     elseif AHSET.DesynthTrust == false then
          GUI:SameLine(10,-40)
          GUI:Image(ImageFolder..[[D_idmode_non.png]],40,40)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHSET.DesynthTrust = not AHSET.DesynthTrust
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip29)
              else
              GUI:SetTooltip(mushtooltips.en.tip29)
              end
              end
          end
     end
     GUI:EndGroup()
     --if mushTrustmode == true then
     --AHSET.DesynthTrust = true
     --end
     GUI:NextColumn()
     GUI:BeginGroup()
     GUI:PushItemWidth(80)
     AHSET.dminil = GUI:InputInt("< IL",AHSET.dminil,1,500)
     if (GUI:IsItemHovered()) then
     AetheryteHelper.SaveSettings()
     if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip30)
              else
              GUI:SetTooltip(mushtooltips.en.tip30)
              end
              end
     end
     GUI:EndGroup()
     GUI:BeginGroup()
     AHSET.dmaxil = GUI:InputInt("> IL",AHSET.dmaxil,1,500)
     if (AHSET.dminil < 1) then AHSET.dminil = 1 end        
     if (AHSET.dmaxil < 5) then AHSET.dmaxil = 5 end
     if (AHSET.dmaxil > 1000) then AHSET.dmaxil = 1000 end
     if (AHSET.dminil > AHSET.dmaxil) then AHSET.dminil = AHSET.dmaxil end
     if (GUI:IsItemHovered()) then
     AetheryteHelper.SaveSettings()
     if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip32)
              else
              GUI:SetTooltip(mushtooltips.en.tip32)
              end
              end
     end
     GUI:EndGroup()
     GUI:SameLine()
     GUI:BeginGroup()
     GUI:Button("Reset",40,20)
     if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHSET.dminil = 5
            AHSET.dmaxil = 540
            AetheryteHelper.SaveSettings()
        end
       if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip31)
              else
              GUI:SetTooltip(mushtooltips.en.tip31)
              end
              end
     end
     GUI:EndGroup()
     GUI:Columns(1)
     GUI:Spacing()
     GUI:Separator()
     GUI:Spacing()
     GUI:TextColored(1,0,0,1,"selection will be Desynthesis" )
     GUI:Spacing()
     GUI:Separator()
     GUI:Spacing()
     GUI:Columns(3)
     GUI:SetColumnOffset(1, 80)
     GUI:SetColumnOffset(2, 230)
     GUI:SetColumnOffset(3, 400)
     GUI:BeginGroup()
     GUI:TextColored(0,1,1,1,"Slot" )
     GUI:EndGroup()
     GUI:Spacing()
     GUI:BeginGroup()
     GUI:Button("Quick",60,20)
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            eqFilter.Main = true
            eqFilter.Sub = true 
            eqFilter.Head = true
           eqFilter.Body = true
           eqFilter.Hand = true
           eqFilter.Legs = true
           eqFilter.Feet = true
           eqFilter.Earrings = true
           eqFilter.Necklace = true
           eqFilter.Bracelets = true
           eqFilter.Ring = true
        AetheryteHelper.SaveSettings()
           end
        if (GUI:IsMouseClicked(1)) then
           eqFilter.Main = not eqFilter.Main
           eqFilter.Sub = not eqFilter.Sub
           eqFilter.Head = not eqFilter.Head
           eqFilter.Body = not eqFilter.Body
           eqFilter.Hand = not eqFilter.Hand
           eqFilter.Legs = not eqFilter.Legs
           eqFilter.Feet = not eqFilter.Feet
           eqFilter.Earrings = not eqFilter.Earrings
           eqFilter.Necklace = not eqFilter.Necklace
           eqFilter.Bracelets = not eqFilter.Bracelets
           eqFilter.Ring = not eqFilter.Ring
        AetheryteHelper.SaveSettings()
           end
     if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip45)
              else
              GUI:SetTooltip(mushtooltips.en.tip45)
              end
              end              
      end
     GUI:EndGroup()
     GUI:Spacing()
     GUI:BeginGroup()
     GUI:Dummy(20,20)
     if eqFilter.Main == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_main.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Main = not eqFilter.Main
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip34)
              else
              GUI:SetTooltip(mushtooltips.en.tip34)
              end
              end
          end
     elseif eqFilter.Main == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_main_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Main = not eqFilter.Main
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip34)
              else
              GUI:SetTooltip(mushtooltips.en.tip34)
              end
              end
          end
     end
     GUI:EndGroup()
     GUI:SameLine()
     GUI:BeginGroup()
     GUI:Dummy(20,20)
     if eqFilter.Sub == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_sub.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Sub = not eqFilter.Sub
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip35)
              else
              GUI:SetTooltip(mushtooltips.en.tip35)
              end
              end
          end
     elseif eqFilter.Sub == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_sub_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Sub = not eqFilter.Sub
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip35)
              else
              GUI:SetTooltip(mushtooltips.en.tip35)
              end
              end
          end
     end
     GUI:EndGroup()
     GUI:BeginGroup()
     GUI:Dummy(20,20)
     if eqFilter.Head == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_head.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Head = not eqFilter.Head
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip36)
              else
              GUI:SetTooltip(mushtooltips.en.tip36)
              end
              end
          end
     elseif eqFilter.Head == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_head_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Head = not eqFilter.Head
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip36)
              else
              GUI:SetTooltip(mushtooltips.en.tip36)
              end
              end
          end
     end
     GUI:EndGroup()
     GUI:SameLine()
     GUI:BeginGroup()
     GUI:Dummy(20,20)
     if eqFilter.Earrings == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_ear.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Earrings = not eqFilter.Earrings
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip37)
              else
              GUI:SetTooltip(mushtooltips.en.tip37)
              end
              end
          end
     elseif eqFilter.Earrings == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_ear_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Earrings = not eqFilter.Earrings
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip37)
              else
              GUI:SetTooltip(mushtooltips.en.tip37)
              end
              end
          end
     end
     GUI:EndGroup()
     GUI:BeginGroup()
     GUI:Dummy(20,20)
     if eqFilter.Body == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_body.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Body = not eqFilter.Body
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip38)
              else
              GUI:SetTooltip(mushtooltips.en.tip38)
              end
              end
          end
     elseif eqFilter.Body == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_body_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Body = not eqFilter.Body
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip38)
              else
              GUI:SetTooltip(mushtooltips.en.tip38)
              end
              end
          end
     end
     GUI:EndGroup()
     GUI:SameLine()
     GUI:BeginGroup()
     GUI:Dummy(20,20)
     if eqFilter.Necklace == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_neck.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Necklace = not eqFilter.Necklace
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip39)
              else
              GUI:SetTooltip(mushtooltips.en.tip39)
              end
              end
          end
     elseif eqFilter.Necklace == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_neck_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Necklace = not eqFilter.Necklace
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip39)
              else
              GUI:SetTooltip(mushtooltips.en.tip39)
              end
              end
          end
     end
     GUI:EndGroup()
     GUI:BeginGroup()
     GUI:Dummy(20,20)
     if eqFilter.Hand == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_hand.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Hand = not eqFilter.Hand
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip40)
              else
              GUI:SetTooltip(mushtooltips.en.tip40)
              end
              end
          end
     elseif eqFilter.Hand == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_hand_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Hand = not eqFilter.Hand
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip40)
              else
              GUI:SetTooltip(mushtooltips.en.tip40)
              end
              end
          end
     end
     GUI:EndGroup()
     GUI:SameLine()
     GUI:BeginGroup()
     GUI:Dummy(20,20)
     if eqFilter.Bracelets == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_brace.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Bracelets = not eqFilter.Bracelets
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip41)
              else
              GUI:SetTooltip(mushtooltips.en.tip41)
              end
              end
          end
     elseif eqFilter.Bracelets == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_brace_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Bracelets = not eqFilter.Bracelets
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip41)
              else
              GUI:SetTooltip(mushtooltips.en.tip41)
              end
              end
          end
     end
     GUI:EndGroup()
     GUI:BeginGroup()
     GUI:Dummy(20,20)
     if eqFilter.Legs == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_leg.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Legs = not eqFilter.Legs
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip42)
              else
              GUI:SetTooltip(mushtooltips.en.tip42)
              end
              end
          end
     elseif eqFilter.Legs == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_leg_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Legs = not eqFilter.Legs
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip42)
              else
              GUI:SetTooltip(mushtooltips.en.tip42)
              end
              end
          end
     end
     GUI:EndGroup()
     GUI:SameLine()
     GUI:BeginGroup()
     GUI:Dummy(20,20)
     if eqFilter.Ring == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_ring.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Ring = not eqFilter.Ring
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip43)
              else
              GUI:SetTooltip(mushtooltips.en.tip43)
              end
              end
          end
     elseif eqFilter.Ring == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_ring_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Ring = not eqFilter.Ring
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip43)
              else
              GUI:SetTooltip(mushtooltips.en.tip43)
              end
              end
          end
     end
     GUI:EndGroup()
     GUI:BeginGroup()
     GUI:Dummy(20,20)
     if eqFilter.Feet == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_feet.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Feet = not eqFilter.Feet
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip44)
              else
              GUI:SetTooltip(mushtooltips.en.tip44)
              end
              end
          end
     elseif eqFilter.Feet == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_feet_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              eqFilter.Feet = not eqFilter.Feet
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip44)
              else
              GUI:SetTooltip(mushtooltips.en.tip44)
              end
              end
          end
     end
     GUI:EndGroup()
      GUI:NextColumn()
      GUI:BeginGroup()
      GUI:TextColored(0,1,1,1,"Armor & Accessories" ) 
      GUI:EndGroup()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Button("Quick",130,20)
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
           AHeqjob.Tank = true
           AHeqjob.Healer = true
           AHeqjob.Slaying = true
           AHeqjob.Aiming = true
           AHeqjob.Striking = true
           AHeqjob.Sorcerer = true
           AHeqjob.Maiming = true
           AHeqjob.ALL = true
           AHeqjob.Scouting = true

           AetheryteHelper.SaveSettings()
           end
        if (GUI:IsMouseClicked(1)) then
           AHeqjob.Tank = not  AHeqjob.Tank
           AHeqjob.Healer = not  AHeqjob.Healer
           AHeqjob.Slaying = not  AHeqjob.Slaying
           AHeqjob.Aiming = not  AHeqjob.Aiming
           AHeqjob.Striking = not  AHeqjob.Striking
           AHeqjob.Sorcerer = not  AHeqjob.Sorcerer
           AHeqjob.Maiming = not  AHeqjob.Maiming
           AHeqjob.Scouting = not  AHeqjob.Scouting
           AHeqjob.ALL = not  AHeqjob.ALL
           AetheryteHelper.SaveSettings()
           end
      if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip45)
              else
              GUI:SetTooltip(mushtooltips.en.tip45)
              end
              end             
      end
      GUI:EndGroup()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.Tank == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jTNK.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Tank = not AHeqjob.Tank
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip46)
              else
              GUI:SetTooltip(mushtooltips.en.tip46)
              end
              end
          end
      elseif AHeqjob.Tank == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jTNK_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Tank = not AHeqjob.Tank
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip46)
              else
              GUI:SetTooltip(mushtooltips.en.tip46)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_t01.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_t02.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_t03.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_t04.png]],20,20)
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.Healer == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jHRR.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Healer = not AHeqjob.Healer
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip47)
              else
              GUI:SetTooltip(mushtooltips.en.tip47)
              end
              end
          end
      elseif AHeqjob.Healer == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jHRR_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Healer = not AHeqjob.Healer
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip47)
              else
              GUI:SetTooltip(mushtooltips.en.tip47)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_h01.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_h02.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_h03.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_h04.png]],20,20)
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.Slaying == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jatk.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Slaying = not AHeqjob.Slaying
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip48)
              else
              GUI:SetTooltip(mushtooltips.en.tip48)
              end
              end
          end
      elseif AHeqjob.Slaying == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jatk_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Slaying = not AHeqjob.Slaying
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip48)
              else
              GUI:SetTooltip(mushtooltips.en.tip48)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_d01.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_d02.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_d08.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_d11.png]],20,20)
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.Striking == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jatk.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Striking = not AHeqjob.Striking
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip50)
              else
              GUI:SetTooltip(mushtooltips.en.tip50)
              end
              end
          end
      elseif AHeqjob.Striking == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jatk_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Striking = not AHeqjob.Striking
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip50)
              else
              GUI:SetTooltip(mushtooltips.en.tip50)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_d01.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_d08.png]],20,20)
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.Maiming == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jatk.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Maiming = not AHeqjob.Maiming
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip52)
              else
              GUI:SetTooltip(mushtooltips.en.tip52)
              end
              end
          end
      elseif AHeqjob.Maiming == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jatk_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Maiming = not AHeqjob.Maiming
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip52)
              else
              GUI:SetTooltip(mushtooltips.en.tip52)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_d02.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_d11.png]],20,20)
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.Scouting == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jatk.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Scouting = not AHeqjob.Scouting
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip54)
              else
              GUI:SetTooltip(mushtooltips.en.tip54)
              end
              end
          end
      elseif AHeqjob.Scouting == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jatk_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Scouting = not AHeqjob.Scouting
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip54)
              else
              GUI:SetTooltip(mushtooltips.en.tip54)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_d06.png]],20,20)
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.Aiming == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jRNG.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Aiming = not AHeqjob.Aiming
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip49)
              else
              GUI:SetTooltip(mushtooltips.en.tip49)
              end
              end
          end
      elseif AHeqjob.Aiming == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jRNG_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Aiming = not AHeqjob.Aiming
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip49)
              else
              GUI:SetTooltip(mushtooltips.en.tip49)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_d03.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_d07.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_d10.png]],20,20)
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.Sorcerer == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jMRNG.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Sorcerer = not AHeqjob.Sorcerer
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip51)
              else
              GUI:SetTooltip(mushtooltips.en.tip51)
              end
              end
          end
      elseif AHeqjob.Sorcerer == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jMRNG_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Sorcerer = not AHeqjob.Sorcerer
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip51)
              else
              GUI:SetTooltip(mushtooltips.en.tip51)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_d04.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_d05.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_d09.png]],20,20)
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.ALL == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jall.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.ALL = not AHeqjob.ALL
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip53)
              else
              GUI:SetTooltip(mushtooltips.en.tip53)
              end
              end
          end
      elseif AHeqjob.ALL == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jall_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.ALL = not AHeqjob.ALL
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip53)
              else
              GUI:SetTooltip(mushtooltips.en.tip53)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:NextColumn()
      GUI:BeginGroup()
      GUI:TextColored(0,1,1,1,"Arms" ) 
      GUI:EndGroup()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Button("Quick",60,20)
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.PLD = true
            AHeqjob.WHM = true
            AHeqjob.WAR = true
            AHeqjob.SCH = true
            AHeqjob.DRK = true
            AHeqjob.AST = true
            AHeqjob.GNB = true
            AHeqjob.SGE = true
            AHeqjob.MNK = true
            AHeqjob.BRD = true
            AHeqjob.DRG = true
            AHeqjob.MCN = true
            AHeqjob.NIN = true
            AHeqjob.DNC = true
            AHeqjob.SAM = true
            AHeqjob.BLM = true
            AHeqjob.RPR = true
            AHeqjob.SMN = true
            AHeqjob.RDM = true
            AetheryteHelper.SaveSettings()
           end
        if (GUI:IsMouseClicked(1)) then
            AHeqjob.PLD = not  AHeqjob.PLD
            AHeqjob.WHM = not  AHeqjob.WHM
            AHeqjob.WAR = not  AHeqjob.WAR
            AHeqjob.SCH = not  AHeqjob.SCH
            AHeqjob.DRK = not  AHeqjob.DRK
            AHeqjob.AST = not  AHeqjob.AST
            AHeqjob.GNB = not  AHeqjob.GNB
            AHeqjob.SGE = not  AHeqjob.SGE
            AHeqjob.MNK = not  AHeqjob.MNK
            AHeqjob.BRD = not  AHeqjob.BRD
            AHeqjob.DRG = not  AHeqjob.DRG
            AHeqjob.MCN = not  AHeqjob.MCN
            AHeqjob.NIN = not  AHeqjob.NIN
            AHeqjob.DNC = not  AHeqjob.DNC
            AHeqjob.SAM = not  AHeqjob.SAM
            AHeqjob.BLM = not  AHeqjob.BLM
            AHeqjob.RPR = not  AHeqjob.RPR
            AHeqjob.SMN = not  AHeqjob.SMN
            AHeqjob.RDM = not  AHeqjob.RDM
            AetheryteHelper.SaveSettings()
           end
      if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip45)
              else
              GUI:SetTooltip(mushtooltips.en.tip45)
              end
              end              
      end
      GUI:EndGroup()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.PLD == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jPLD.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.PLD = not AHeqjob.PLD
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip104)
              else
              GUI:SetTooltip(mushtooltips.en.tip104)
              end
              end
          end
      elseif AHeqjob.PLD == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jPLD_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.PLD = not AHeqjob.PLD
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip104)
              else
              GUI:SetTooltip(mushtooltips.en.tip104)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.WHM == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jWHM.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.WHM = not AHeqjob.WHM
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip55)
              else
              GUI:SetTooltip(mushtooltips.en.tip55)
              end
              end
          end
      elseif AHeqjob.WHM == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jWHM_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.WHM = not AHeqjob.WHM
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip55)
              else
              GUI:SetTooltip(mushtooltips.en.tip55)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.WAR == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jWAR.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.WAR = not AHeqjob.WAR
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip56)
              else
              GUI:SetTooltip(mushtooltips.en.tip56)
              end
              end
          end
      elseif AHeqjob.WAR == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jWAR_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.WAR = not AHeqjob.WAR
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip56)
              else
              GUI:SetTooltip(mushtooltips.en.tip56)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.SCH == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jSCH.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.SCH = not AHeqjob.SCH
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip57)
              else
              GUI:SetTooltip(mushtooltips.en.tip57)
              end
              end
          end
      elseif AHeqjob.SCH == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jSCH_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.SCH = not AHeqjob.SCH
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip57)
              else
              GUI:SetTooltip(mushtooltips.en.tip57)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.DRK == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jDRK.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.DRK = not AHeqjob.DRK
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip58)
              else
              GUI:SetTooltip(mushtooltips.en.tip58)
              end
              end
          end
      elseif AHeqjob.DRK == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jDRK_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.DRK = not AHeqjob.DRK
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip58)
              else
              GUI:SetTooltip(mushtooltips.en.tip58)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.AST == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jAST.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.AST = not AHeqjob.AST
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip59)
              else
              GUI:SetTooltip(mushtooltips.en.tip59)
              end
              end
          end
      elseif AHeqjob.AST == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jAST_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.AST = not AHeqjob.AST
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip59)
              else
              GUI:SetTooltip(mushtooltips.en.tip59)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.GNB == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jGNB.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.GNB = not AHeqjob.GNB
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip60)
              else
              GUI:SetTooltip(mushtooltips.en.tip60)
              end
              end
          end
      elseif AHeqjob.GNB == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jGNB_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.GNB = not AHeqjob.GNB
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip60)
              else
              GUI:SetTooltip(mushtooltips.en.tip60)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.SGE == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jSGE.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.SGE = not AHeqjob.SGE
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip61)
              else
              GUI:SetTooltip(mushtooltips.en.tip61)
              end
              end
          end
      elseif AHeqjob.SGE == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jSGE_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.SGE = not AHeqjob.SGE
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip61)
              else
              GUI:SetTooltip(mushtooltips.en.tip61)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.MNK == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jMNK.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.MNK = not AHeqjob.MNK
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip62)
              else
              GUI:SetTooltip(mushtooltips.en.tip62)
              end
              end
          end
      elseif AHeqjob.MNK == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jMNK_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.MNK = not AHeqjob.MNK
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip62)
              else
              GUI:SetTooltip(mushtooltips.en.tip62)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.BRD == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jBRD.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.BRD = not AHeqjob.BRD
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip63)
              else
              GUI:SetTooltip(mushtooltips.en.tip63)
              end
              end
          end
      elseif AHeqjob.BRD == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jBRD_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.BRD = not AHeqjob.BRD
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip63)
              else
              GUI:SetTooltip(mushtooltips.en.tip63)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.DRG == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jDRG.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.DRG = not AHeqjob.DRG
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip64)
              else
              GUI:SetTooltip(mushtooltips.en.tip64)
              end
              end
          end
      elseif AHeqjob.DRG == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jDRG_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.DRG = not AHeqjob.DRG
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip64)
              else
              GUI:SetTooltip(mushtooltips.en.tip64)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.MCN == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jMCN.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.MCN = not AHeqjob.MCN
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip65)
              else
              GUI:SetTooltip(mushtooltips.en.tip65)
              end
              end
          end
      elseif AHeqjob.MCN == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jMCN_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.MCN = not AHeqjob.MCN
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip65)
              else
              GUI:SetTooltip(mushtooltips.en.tip65)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.NIN == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jNIN.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.NIN = not AHeqjob.NIN
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip66)
              else
              GUI:SetTooltip(mushtooltips.en.tip66)
              end
              end
          end
      elseif AHeqjob.NIN == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jNIN_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.NIN = not AHeqjob.NIN
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip66)
              else
              GUI:SetTooltip(mushtooltips.en.tip66)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.DNC == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jDNC.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.DNC = not AHeqjob.DNC
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip67)
              else
              GUI:SetTooltip(mushtooltips.en.tip67)
              end
              end
          end
      elseif AHeqjob.DNC == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jDNC_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.DNC = not AHeqjob.DNC
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip67)
              else
              GUI:SetTooltip(mushtooltips.en.tip67)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.SAM == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jSAM.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.SAM = not AHeqjob.SAM
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip68)
              else
              GUI:SetTooltip(mushtooltips.en.tip68)
              end
              end
          end
      elseif AHeqjob.SAM == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jSAM_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.SAM = not AHeqjob.SAM
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip68)
              else
              GUI:SetTooltip(mushtooltips.en.tip68)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.BLM == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jBLM.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.BLM = not AHeqjob.BLM
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip69)
              else
              GUI:SetTooltip(mushtooltips.en.tip69)
              end
              end
          end
      elseif AHeqjob.BLM == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jBLM_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.BLM = not AHeqjob.BLM
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip69)
              else
              GUI:SetTooltip(mushtooltips.en.tip69)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.RPR == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jRPR.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.RPR = not AHeqjob.RPR
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip70)
              else
              GUI:SetTooltip(mushtooltips.en.tip70)
              end
              end
          end
      elseif AHeqjob.RPR == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jRPR_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.RPR = not AHeqjob.RPR
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip70)
              else
              GUI:SetTooltip(mushtooltips.en.tip70)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.SMN == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jSMN.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.SMN = not AHeqjob.SMN
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip71)
              else
              GUI:SetTooltip(mushtooltips.en.tip71)
              end
              end
          end
      elseif AHeqjob.SMN == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_jSMN_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.SMN = not AHeqjob.SMN
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip71)
              else
              GUI:SetTooltip(mushtooltips.en.tip71)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.RDM == true then
          GUI:SameLine(10,-20)
          GUI:Image(ImageFolder..[[fil_jRDM.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.RDM = not AHeqjob.RDM
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip72)
              else
              GUI:SetTooltip(mushtooltips.en.tip72)
              end
              end
          end
      elseif AHeqjob.RDM == false then
          GUI:SameLine(10,-20)
          GUI:Image(ImageFolder..[[fil_jRDM_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.RDM = not AHeqjob.RDM
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip72)
              else
              GUI:SetTooltip(mushtooltips.en.tip72)
              end
              end
          end
      end
      GUI:EndGroup()
      
      GUI:Columns()
      GUI:Spacing()
      GUI:Separator()
      GUI:BeginGroup()
      GUI:TextColored(0,1,1,1,"・Tool & Armor & Accessories" ) 
      GUI:EndGroup()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.Crafter == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_craft.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Crafter = not AHeqjob.Crafter
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip73)
              else
              GUI:SetTooltip(mushtooltips.en.tip73)
              end
              end
          end
      elseif AHeqjob.Crafter == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_craft_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Crafter = not AHeqjob.Crafter
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip73)
              else
              GUI:SetTooltip(mushtooltips.en.tip73)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_c01.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_c02.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_c03.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_c04.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_c05.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_c06.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_c07.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_c08.png]],20,20)
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if AHeqjob.Gatherer == true then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_gathe.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Gatherer = not AHeqjob.Gatherer
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip74)
              else
              GUI:SetTooltip(mushtooltips.en.tip74)
              end
              end
          end
      elseif AHeqjob.Gatherer == false then
          GUI:SameLine(5,-20)
          GUI:Image(ImageFolder..[[fil_gathe_non.png]],20,20)
          if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AHeqjob.Gatherer = not AHeqjob.Gatherer
              AetheryteHelper.SaveSettings()
          end   
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip74)
              else
              GUI:SetTooltip(mushtooltips.en.tip74)
              end
              end
          end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_g01.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_g02.png]],20,20)
      GUI:SameLine()
      GUI:Image(ImageFolder..[[icon_g03.png]],20,20)

    end
    GUI:End()
  end
end





---------------------------------------------------------------------------------------------------------------------------------------------------
--materia UI(tab2) GUI
function AetheryteHelper.Inventoryfree()
      local bags1 = {0} for _, e in pairs(bags1) do local bag1 = Inventory:Get(e)
      Pbfree1 = tonumber(bag1.free) end
      local bags2 = {1} for _, e in pairs(bags2) do local bag2 = Inventory:Get(e)
      Pbfree2 = tonumber(bag2.free) end
      local bags3 = {2} for _, e in pairs(bags3) do local bag3 = Inventory:Get(e)
      Pbfree3 = tonumber(bag3.free) end
      local bags4 = {3} for _, e in pairs(bags4) do local bag4 = Inventory:Get(e)
      Pbfree4 = tonumber(bag4.free) end
      mushPbtotal = (Pbfree1 + Pbfree2 + Pbfree3 + Pbfree4) 
end


function AetheryteHelper.subtoolmateria()
      AetheryteHelper.Inventoryfree()
      GUI:Spacing()      
      GUI:SameLine(10)
      GUI:BeginGroup()
      GUI:Dummy(40,40)
      local seisen = ActionList:Get(5,14)
      if seisen.usable == true then
         if AHSET.isMateriaEnabled == true then
              GUI:SameLine(10,-40)
              GUI:Image(ImageFolder..[[materia.png]],40,40)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              AHSET.isMateriaEnabled = not AHSET.isMateriaEnabled
              AetheryteHelper.SaveSettings()
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip85)
              else
              GUI:SetTooltip(mushtooltips.en.tip85)
              end
              end
              end     
         elseif AHSET.isMateriaEnabled == false then
              GUI:SameLine(10,-40)
              GUI:Image(ImageFolder..[[materia_non.png]],40,40)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              AHSET.isMateriaEnabled = not AHSET.isMateriaEnabled
              AetheryteHelper.SaveSettings()
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip85)
              else
              GUI:SetTooltip(mushtooltips.en.tip85)
              end
              end
              end       
         end
      else
         GUI:SameLine(10,-40)
         GUI:Image(ImageFolder..[[materia_lock.png]],40,40)
         if (GUI:IsItemHovered()) then
         if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip99)
              else
              GUI:SetTooltip(mushtooltips.en.tip99)
              end
              end
         end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(40,40)
      if AHSET.isBotStatusP == false then
         if AHSET.isPotionEnabled == true then
              GUI:SameLine(10,-40)
              GUI:Image(ImageFolder..[[SP_potion.png]],40,40)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              AHSET.isPotionEnabled = not AHSET.isPotionEnabled
              AetheryteHelper.SaveSettings()
              end
              if (GUI:IsMouseClicked(1)) then
              AHSET.isBotStatusP = not AHSET.isBotStatusP
              AetheryteHelper.SaveSettings()
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip82)
              else
              GUI:SetTooltip(mushtooltips.en.tip82)
              end
              end
              end     
         elseif AHSET.isPotionEnabled == false then
              GUI:SameLine(10,-40)
              GUI:Image(ImageFolder..[[SP_potion_non.png]],40,40)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              AHSET.isPotionEnabled = not AHSET.isPotionEnabled
              AetheryteHelper.SaveSettings()
              end
              if (GUI:IsMouseClicked(1)) then
              AHSET.isBotStatusP = not AHSET.isBotStatusP
              AetheryteHelper.SaveSettings()
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip82)
              else
              GUI:SetTooltip(mushtooltips.en.tip82)
              end
              end
              end
          end
      else
        if AHSET.isPotionEnabled == true then
              GUI:SameLine(10,-40)
              GUI:Image(ImageFolder..[[SP_potion_minion.png]],40,40)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(1)) then
              AHSET.isBotStatusP = not AHSET.isBotStatusP
              AetheryteHelper.SaveSettings()
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip82)
              else
              GUI:SetTooltip(mushtooltips.en.tip82)
              end
              end
              end     
         elseif AHSET.isPotionEnabled == false then
              GUI:SameLine(10,-40)
              GUI:Image(ImageFolder..[[SP_potion_minion_non.png]],40,40)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(1)) then
              AHSET.isBotStatusP = not AHSET.isBotStatusP
              AetheryteHelper.SaveSettings()
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip82)
              else
              GUI:SetTooltip(mushtooltips.en.tip82)
              end
              end
              end
         end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(40,40)
      if AHSET.isBotStatusM == false then
         if AHSET.isManualEnabled == true then
              GUI:SameLine(10,-40)
              GUI:Image(ImageFolder..[[SP_manual.png]],40,40)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              AHSET.isManualEnabled = not AHSET.isManualEnabled
              AetheryteHelper.SaveSettings()
              end
              if (GUI:IsMouseClicked(1)) then
              AHSET.isBotStatusM = not AHSET.isBotStatusM
              AetheryteHelper.SaveSettings()
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip83)
              else
              GUI:SetTooltip(mushtooltips.en.tip83)
              end
              end
              end     
         elseif AHSET.isManualEnabled == false then
              GUI:SameLine(10,-40)
              GUI:Image(ImageFolder..[[SP_manual_non.png]],40,40)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              AHSET.isManualEnabled = not AHSET.isManualEnabled
              AetheryteHelper.SaveSettings()
              end
              if (GUI:IsMouseClicked(1)) then
              AHSET.isBotStatusM = not AHSET.isBotStatusM
              AetheryteHelper.SaveSettings()
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip83)
              else
              GUI:SetTooltip(mushtooltips.en.tip83)
              end
              end
              end
          end
      else
        if AHSET.isManualEnabled == true then
              GUI:SameLine(10,-40)
              GUI:Image(ImageFolder..[[SP_manual_minion.png]],40,40)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(1)) then
              AHSET.isBotStatusM = not AHSET.isBotStatusM
              AetheryteHelper.SaveSettings()
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip83)
              else
              GUI:SetTooltip(mushtooltips.en.tip83)
              end
              end
              end     
         elseif AHSET.isManualEnabled == false then
              GUI:SameLine(10,-40)
              GUI:Image(ImageFolder..[[SP_manual_minion_non.png]],40,40)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(1)) then
              AHSET.isBotStatusM = not AHSET.isBotStatusM
              AetheryteHelper.SaveSettings()
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip83)
              else
              GUI:SetTooltip(mushtooltips.en.tip83)
              end
              end
              end
         end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      if AHSET.isMateriaEnabled == true then
      GUI:Text("[MEx]:ON")
      else
      GUI:Text("[MEx]:OFF")
      end
      if AHSET.isBotStatusP == true then
         GUI:Text("[SbP:Link]")
      else   
         if AHSET.isPotionEnabled == true then
         GUI:Text("[SbP]:ON")
         else
         GUI:Text("[SbP]:OFF")
         end
      end
      if AHSET.isBotStatusM == true then
         GUI:Text("[SbM:Link]")
      else
        if AHSET.isManualEnabled == true then
        GUI:Text("[SbM]:ON")
        else
        GUI:Text("[SbM]:OFF")
        end
      end
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
      if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip100)
              else
              GUI:SetTooltip(mushtooltips.en.tip100)
              end
      end
      end
      

      if (FFXIV_Common_BotRunning == false) and (AHSET.isBotStatusP == true) then
         AHSET.isPotionEnabled = false
      elseif (FFXIV_Common_BotRunning == true) and (AHSET.isBotStatusP == true) then
        AHSET.isPotionEnabled = true
      end
      if (FFXIV_Common_BotRunning == false) and (AHSET.isBotStatusM == true) then
        AHSET.isManualEnabled = false
      elseif (FFXIV_Common_BotRunning == true) and (AHSET.isBotStatusM == true) then
        AHSET.isManualEnabled = true
      end    
      GUI:BeginGroup()
      GUI:Spacing()
      if (mushPbtotal < 2) then AHSET.isMateriaEnabled = false GUI:TextColored(1,0,0,1,"inventory full!") end
      GUI:EndGroup()
end



function AetheryteHelper.subtoolDesynth()
      AetheryteHelper.Inventoryfree()
      GUI:Spacing()      
      GUI:SameLine(10)
      GUI:BeginGroup()
      GUI:Dummy(40,40)
      local bunkai = ActionList:Get(5,5)
      if bunkai.usable == true then
          if AHSET.isReductionOption == false then
             if AHSET.isSalvageEnabled == true then
                GUI:SameLine(10,-40)
                GUI:Image(ImageFolder..[[desynth.png]],40,40)
                if (GUI:IsItemHovered()) then
                if (GUI:IsMouseClicked(0)) then
                AHSET.isSalvageEnabled = not AHSET.isSalvageEnabled
                GCexchange = false
                AetheryteHelper.SaveSettings()
                end
                if (GUI:IsMouseClicked(1)) then
                AHSET.isReductionOption = not AHSET.isReductionOption
                AetheryteHelper.SaveSettings()
                end
                if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip27)
              else
              GUI:SetTooltip(mushtooltips.en.tip27)
              end
              end
                end     
              elseif AHSET.isSalvageEnabled == false then
                GUI:SameLine(10,-40)
                GUI:Image(ImageFolder..[[desynth_non.png]],40,40)
                if (GUI:IsItemHovered()) then
                if (GUI:IsMouseClicked(0)) then
                AHSET.isSalvageEnabled = not AHSET.isSalvageEnabled
                GCexchange = false
                AetheryteHelper.SaveSettings()
                end
                if (GUI:IsMouseClicked(1)) then
                AHSET.isReductionOption = not AHSET.isReductionOption
                AetheryteHelper.SaveSettings()
                end
                if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip27)
              else
              GUI:SetTooltip(mushtooltips.en.tip27)
              end
              end
                end       
             end
          elseif AHSET.isReductionOption == true then
            if AHSET.isSalvageEnabled == true then
                GUI:SameLine(10,-40)
                GUI:Image(ImageFolder..[[desynth_op.png]],40,40)
                if (GUI:IsItemHovered()) then
                if (GUI:IsMouseClicked(0)) then
                AHSET.isSalvageEnabled = not AHSET.isSalvageEnabled
                GCexchange = false
                AetheryteHelper.SaveSettings()
                end
                if (GUI:IsMouseClicked(1)) then
                AHSET.isReductionOption = not AHSET.isReductionOption
                AetheryteHelper.SaveSettings()
                end
                if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip27)
              else
              GUI:SetTooltip(mushtooltips.en.tip27)
              end
              end
                end     
              elseif AHSET.isSalvageEnabled == false then
                GUI:SameLine(10,-40)
                GUI:Image(ImageFolder..[[desynth_op_non.png]],40,40)
                if (GUI:IsItemHovered()) then
                if (GUI:IsMouseClicked(0)) then
                AHSET.isSalvageEnabled = not AHSET.isSalvageEnabled
                GCexchange = false
                AetheryteHelper.SaveSettings()
                end
                if (GUI:IsMouseClicked(1)) then
                AHSET.isReductionOption = not AHSET.isReductionOption
                AetheryteHelper.SaveSettings()
                end
                if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip27)
              else
              GUI:SetTooltip(mushtooltips.en.tip27)
              end
              end
                end       
             end
          end
      else
      GUI:SameLine(10,-40)
      GUI:Image(ImageFolder..[[desynth_lock.png]],40,40)
         if (GUI:IsItemHovered()) then
         if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip99)
              else
              GUI:SetTooltip(mushtooltips.en.tip99)
              end
              end
         end
      end
      GUI:EndGroup()

      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      GUI:SameLine(5,-20)
      GUI:Image(ImageFolder..[[config.png]],20,20)
      if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
              AetheryteHelper.subtoolDesOP.open = not AetheryteHelper.subtoolDesOP.open
          end
      if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip108)
              else
              GUI:SetTooltip(mushtooltips.en.tip108)
              end
              end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      if AHSET.isSalvageEnabled == true then  GUI:Text("[Dsy]ON") else GUI:Text("[Dsy]OFF") end
      if AHSET.isReductionOption == true then  GUI:Text("[Fil]ON") else GUI:Text("[Fil]OFF") end
      if AHSET.isReductionOption == true then
        GUI:SameLine()
        GUI:Text(":IL"..AHSET.dminil.."-IL"..AHSET.dmaxil)
      end
      if AHSET.CrafterMode == true then  GUI:Text("[Cft]ON") else GUI:Text("[Cft]OFF") end
      GUI:SameLine()
      if AHSET.DesynthTrust == true then  GUI:Text("[IDm]ON") else GUI:Text("[IDm]OFF") end
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
      if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip101)
              else
              GUI:SetTooltip(mushtooltips.en.tip101)
              end
      end
      end      
      

      if AHSET.CrafterMode == true then
        if (Player.Job == 8 or Player.Job == 9 or Player.Job == 10 or Player.Job == 11 or
        Player.Job == 12 or Player.Job == 13 or Player.Job == 14 or Player.Job == 15) then
         AHSET.isSalvageEnabled = false
        end
      end
      GUI:BeginGroup()
      GUI:Spacing()
      if (mushPbtotal < 2) then AHSET.isSalvageEnabled = false GUI:TextColored(1,0,0,1,"inventory full!") end
      GUI:EndGroup()
end

function AetheryteHelper.subtoolAR()
      AetheryteHelper.Inventoryfree()
      GUI:Spacing()      
      GUI:SameLine(10)
      GUI:BeginGroup()
      GUI:Dummy(40,40)
      local seisen = ActionList:Get(5,21)
      if seisen.usable == true then
             if AHSET.isQuestmode == false then
                    if AHSET.isReductionEnabled == true then
                          GUI:SameLine(10,-40)
                          GUI:Image(ImageFolder..[[AR.png]],40,40)
                          if (GUI:IsItemHovered()) then
                              if (GUI:IsMouseClicked(0)) then
                                  AHSET.isReductionEnabled = not AHSET.isReductionEnabled
                                  GCexchange = false
                                  AetheryteHelper.SaveSettings()
                              end
                              if (GUI:IsMouseClicked(1)) then
                              AHSET.isQuestmode = not AHSET.isQuestmode
                              AetheryteHelper.SaveSettings()
                              end
                              if AHSET.mushtooltips == true then
                                  if language == 0 then
                                  GUI:SetTooltip(mushtooltips.jp.tip92)
                                  else
                                  GUI:SetTooltip(mushtooltips.en.tip92)
                                  end
                              end
                          end     
                    elseif AHSET.isReductionEnabled == false then
                          GUI:SameLine(10,-40)
                          GUI:Image(ImageFolder..[[AR_non.png]],40,40)
                          if (GUI:IsItemHovered()) then
                              if (GUI:IsMouseClicked(0)) then
                                  AHSET.isReductionEnabled = not AHSET.isReductionEnabled
                                  GCexchange = false
                                  AetheryteHelper.SaveSettings()
                              end
                              if (GUI:IsMouseClicked(1)) then
                              AHSET.isQuestmode = not AHSET.isQuestmode
                              AetheryteHelper.SaveSettings()
                              end
                              if AHSET.mushtooltips == true then
                                  if language == 0 then
                                  GUI:SetTooltip(mushtooltips.jp.tip92)
                                  else
                                  GUI:SetTooltip(mushtooltips.en.tip92)
                                  end
                              end
                          end

                    end
             elseif AHSET.isQuestmode == true then
                        if AHSET.isReductionEnabled == true then
                            GUI:SameLine(10,-40)
                            GUI:Image(ImageFolder..[[AR_minion.png]],40,40)
                            if (GUI:IsItemHovered()) then
                                if (GUI:IsMouseClicked(0)) then
                                    AHSET.isReductionEnabled = not AHSET.isReductionEnabled
                                    GCexchange = false
                                    AetheryteHelper.SaveSettings()
                                end
                                if (GUI:IsMouseClicked(1)) then
                                    AHSET.isQuestmode = not AHSET.isQuestmode
                                    AetheryteHelper.SaveSettings()
                                end
                                if AHSET.mushtooltips == true then
                                    if language == 0 then
                                    GUI:SetTooltip(mushtooltips.jp.tip92)
                                    else
                                    GUI:SetTooltip(mushtooltips.en.tip92)
                                    end
                                end
                            end

                        elseif AHSET.isReductionEnabled == false then
                            GUI:SameLine(10,-40)
                            GUI:Image(ImageFolder..[[AR_non.png]],40,40)
                            if (GUI:IsItemHovered()) then
                                if (GUI:IsMouseClicked(0)) then
                                AHSET.isReductionEnabled = not AHSET.isReductionEnabled
                                GCexchange = false
                                AetheryteHelper.SaveSettings()
                                end
                                if (GUI:IsMouseClicked(1)) then
                                AHSET.isQuestmode = not AHSET.isQuestmode
                                AetheryteHelper.SaveSettings()
                                end
                                if AHSET.mushtooltips == true then
                                    if language == 0 then
                                    GUI:SetTooltip(mushtooltips.jp.tip92)
                                    else
                                    GUI:SetTooltip(mushtooltips.en.tip92)
                                    end
                               end
                            end       
                        end
             end
      else
      GUI:SameLine(10,-40)
      GUI:Image(ImageFolder..[[AR_lock.png]],40,40)
      if (GUI:IsItemHovered()) then
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip99)
              else
              GUI:SetTooltip(mushtooltips.en.tip99)
              end
              end
      end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      if AHSET.isReductionEnabled == true then  GUI:Text("[AR]ON") else GUI:Text("[AR]OFF") end
      if AHSET.isQuestmode == true then  GUI:Text("[Link]ON") else GUI:Text("[Link]OFF") end
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
      if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip102)
              else
              GUI:SetTooltip(mushtooltips.en.tip102)
              end
      end
      end
      GUI:BeginGroup()
      GUI:Spacing()
      if (mushPbtotal < 1) then AHSET.isReductionEnabled = false GUI:TextColored(1,0,0,1,"inventory full!") end
      GUI:EndGroup()

end


-----------------------------------------------------------------------------------------------

function AetheryteHelper.subtoolGC()
     GUI:BeginGroup()  
     if Player.GrandCompanyRank < 6 then GUI:TextColored(1,0,0,1,"need GC rank 6 over")end
     GUI:EndGroup()
     GUI:BeginGroup()
     GUI:PushItemWidth(100)
     if language == 0 and Player.GrandCompany ~= 0 then
     AHSET.selectGC = GUI:Combo("###GC",Player.GrandCompany,mushGCJP,1)
     elseif language == 1 and Player.GrandCompany ~= 0 then
     AHSET.selectGC = GUI:Combo("###GC",Player.GrandCompany,mushGCEN,1)
     elseif language == 2 and Player.GrandCompany ~= 0 then
     AHSET.selectGC = GUI:Combo("###GC",Player.GrandCompany,mushGCDE,1)
     elseif language == 3 and Player.GrandCompany ~= 0 then
     AHSET.selectGC = GUI:Combo("###GC",Player.GrandCompany,mushGCFR,1)
     elseif Player.GrandCompany ~= 0 then
     AHSET.selectGC = GUI:Combo("###GC",Player.GrandCompany,mushGCEN,1)
     end
     if Player.GrandCompany == 0 then 
     AHSET.selectGC = GUI:Combo("###",4,mushGCEN,1) end
     AetheryteHelper.SaveSettings()
     if (GUI:IsItemHovered()) then
       if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip84)
              else
              GUI:SetTooltip(mushtooltips.en.tip84)
              end
              end
     end
     GUI:EndGroup()
     GUI:SameLine()
     GUI:BeginGroup()
     if AHSET.selectGC == 1 then
     GUI:Image(ImageFolder..[[sealslim.png]],20,20)
     mushGseals = Inventory:Get(2000):GetList()[2]
     elseif Inventory:Get(2000):GetList()[2] == nil then mushGseals = nil end
     if AHSET.selectGC == 2 then
     GUI:Image(ImageFolder..[[sealsgri.png]],20,20)
     mushGseals = Inventory:Get(2000):GetList()[3]
     elseif Inventory:Get(2000):GetList()[2] == nil then mushGseals = nil end
     if AHSET.selectGC == 3 then
     GUI:Image(ImageFolder..[[sealsulu.png]],20,20)
     mushGseals = Inventory:Get(2000):GetList()[4]
     elseif Inventory:Get(2000):GetList()[2] == nil then mushGseals = nil end
     if AHSET.selectGC == 4 then
     GUI:Image(ImageFolder..[[seals_non.png]],20,20)
     mushGseals  = nil end  

     for k,v in pairs(mushPlayerGCrank) do
     if (k == Player.GrandCompanyRank) then mushmaxseal = v
     if mushGseals == nil then
     GUI:SameLine()
     GUI:TextColored(1,1,1,.8,"0/"..mushmaxseal.max)
     elseif mushGseals.count == mushmaxseal.max then
     GUI:SameLine()
     GUI:TextColored(1,0,0,.8,tostring(mushGseals.count).."/"..mushmaxseal.max)
     elseif mushGseals.count < mushmaxseal.max/2 then
     GUI:SameLine()
     GUI:TextColored(0,1,1,.8,tostring(mushGseals.count).."/"..mushmaxseal.max)
     elseif mushGseals.count ~= mushmaxseal.max then
     GUI:SameLine()
     GUI:TextColored(1,1,0,.8,tostring(mushGseals.count).."/"..mushmaxseal.max)
     elseif Player.GrandCompany == 0 then GUI:Text("GCseals:---/---")
     end
     end
     end
     GUI:EndGroup()
     GUI:Spacing()
     GUI:BeginGroup()
     GUI:Dummy(40,40)
     if GCexchange == true then
              GUI:SameLine(10,-40)
              if AHSET.selectGC == 1 then
              GUI:Image(ImageFolder..[[exchange_lim.png]],40,40)
              elseif AHSET.selectGC == 2 then
              GUI:Image(ImageFolder..[[exchange_gri.png]],40,40)
              elseif AHSET.selectGC == 3 then
              GUI:Image(ImageFolder..[[exchange_ulu.png]],40,40)
              elseif AHSET.selectGC == 4 then
              GUI:Image(ImageFolder..[[GClock.png]],40,40)
              end
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              mushEXstep = 0
              GCexchange = not GCexchange
              sealstoitem = false 
              if mushTrustmode == true then GCexchange = false end
              if Player.GrandCompanyRank < 6 then GCexchange = false end
              if tonumber(mushGseals.count) == tonumber(mushmaxseal.max) then GCexchange = false end
              AHSET.isSalvageEnabled = false
              AetheryteHelper.SaveSettings()
              end
             if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip87)
              else
              GUI:SetTooltip(mushtooltips.en.tip87)
              end
              end
              end
     elseif GCexchange == false then
              GUI:SameLine(10,-40)
              if AHSET.selectGC == 1 then
              GUI:Image(ImageFolder..[[exchange_lim_non.png]],40,40)
              elseif AHSET.selectGC == 2 then
              GUI:Image(ImageFolder..[[exchange_gri_non.png]],40,40)
              elseif AHSET.selectGC == 3 then
              GUI:Image(ImageFolder..[[exchange_ulu_non.png]],40,40)
              elseif AHSET.selectGC == 4 then
              GUI:Image(ImageFolder..[[GClock.png]],40,40)
              end
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              mushEXstep = 0
              GCexchange = not GCexchange
              sealstoitem = false
              if mushTrustmode == true then GCexchange = false end
              if Player.GrandCompanyRank < 6 then GCexchange = false end
              if tonumber(mushGseals.count) == tonumber(mushmaxseal.max) then GCexchange = false end
              AHSET.isSalvageEnabled = false
              AetheryteHelper.SaveSettings()
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip87)
              else
              GUI:SetTooltip(mushtooltips.en.tip87)
              end
              end
              end
     end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(40,40)
      if AutoMoveGC == true then
           GUI:SameLine(10,-40)
           GUI:Image(ImageFolder..[[moveGC.png]],40,40)
           if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              AutoMoveGC = not AutoMoveGC
              Player:Stop()
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip88)
              else
              GUI:SetTooltip(mushtooltips.en.tip88)
              end
              end
           end
      elseif AutoMoveGC == false then
           GUI:SameLine(10,-40)
           GUI:Image(ImageFolder..[[moveGC_non.png]],40,40)
           if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              AutoMoveGC = not AutoMoveGC
              AHSET.isSalvageEnabled = false
              end
              AetheryteHelper.SaveSettings()
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip88)
              else
              GUI:SetTooltip(mushtooltips.en.tip88)
              end
              end
           end
      end
      GUI:EndGroup()  
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[close.png]],20,20)
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
           Player:Stop()
           AutoMoveGC = false
           GCexchange = false
        end
        AetheryteHelper.SaveSettings()
        if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip89)
              else
              GUI:SetTooltip(mushtooltips.en.tip89)
              end
              end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(40,40)
      if AHSET.GCexlessmax == true then
           GUI:SameLine(10,-40)
           GUI:Image(ImageFolder..[[lessmax.png]],40,40)
           if (GUI:IsItemHovered()) then
           if (GUI:IsMouseClicked(0)) then
           AHSET.GCexlessmax = not AHSET.GCexlessmax
           end
           if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip90)
              else
              GUI:SetTooltip(mushtooltips.en.tip90)
              end
              end
           end
      elseif AHSET.GCexlessmax == false then
           GUI:SameLine(10,-40)
           GUI:Image(ImageFolder..[[lessmax_non.png]],40,40)
           if (GUI:IsItemHovered()) then
           if (GUI:IsMouseClicked(0)) then
           AHSET.GCexlessmax = not AHSET.GCexlessmax
           end
           if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip90)
              else
              GUI:SetTooltip(mushtooltips.en.tip90)
              end
              end
           end
      end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Dummy(40,40)
      if Remateria == true then
           GUI:SameLine(10,-40)
           GUI:Image(ImageFolder..[[remate.png]],40,40)
           if (GUI:IsItemHovered()) then
           if (GUI:IsMouseClicked(0)) then
           Remateria = not Remateria
           end
           if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip91)
              else
              GUI:SetTooltip(mushtooltips.en.tip91)
              end
              end
           end
      elseif Remateria == false then
           GUI:SameLine(10,-40)
           GUI:Image(ImageFolder..[[remate_non.png]],40,40)
           if (GUI:IsItemHovered()) then
           if (GUI:IsMouseClicked(0)) then
           Remateria = not Remateria
           end
           if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip91)
              else
              GUI:SetTooltip(mushtooltips.en.tip91)
              end
              end
           end
      end
      GUI:EndGroup()
      GUI:Spacing()
      GUI:Separator()
      GUI:BeginGroup()
      if GCexchange == true then GUI:Text("[Ex]:ON") else GUI:Text("[Ex]:OFF") end
      GUI:SameLine()
      if AutoMoveGC == true then GUI:Text("[M2G]:ON") else GUI:Text("[M2G]:OFF") end
      GUI:SameLine()
      if AHSET.GCexlessmax == true then GUI:Text("[LM]:ON") else GUI:Text("[LM]:OFF") end
      GUI:SameLine()
      if Remateria == true then GUI:Text("[RM]:ON") else GUI:Text("[RM]:OFF") end
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
      if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip103)
              else
              GUI:SetTooltip(mushtooltips.en.tip103)
              end
      end
      end
      GUI:Separator()

end

-------------------------------------------------------------------------------------------------------------------------------------------
function AetheryteHelper.GCtrunin()
      if mushTrustmode == true then 
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[repair.png]],20,20)
      GUI:SameLine()
      GUI:PushItemWidth(80)
      AHSET.mushrepairGear = GUI:InputInt("%",AHSET.mushrepairGear,1,1000)
      if AHSET.mushrepairGear < 1 then AHSET.mushrepairGear = 99 end
      if AHSET.mushrepairGear > 99 then AHSET.mushrepairGear = 1 end
      if (GUI:IsItemHovered()) then
        if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip25)
              else
              GUI:SetTooltip(mushtooltips.en.tip25)
              end
              end
     end
     GUI:EndGroup()
     GUI:SameLine()
     GUI:BeginGroup()
     GUI:Text("Status:")
     GUI:SameLine()
     if Dawncloser == false then 
     GUI:Text("Que wait")
     elseif Dawncloser == true and GCexchangeT == true and Duty:IsQueued() == false then
     GUI:TextColored(0,1,0,1,"Exchange")
     elseif Dawncloser == true and sealstoitemT == true and Duty:IsQueued() == false then
     GUI:TextColored(0,1,0,1,"Trun in")
     elseif Dawncloser == nil then 
     GUI:Text("standby")
     else 
     GUI:Text("standby")
     end
     GUI:EndGroup()
     GUI:Spacing()
     end
     GUI:Separator()
     GUI:Columns(2)
     GUI:SetColumnOffset(1,80)
     GUI:BeginGroup()
     GUI:Dummy(40,40)
     if sealstoitem == true then
         GUI:SameLine(10,-40)
         if AHSET.selectGC == 1 then
         GUI:Image(ImageFolder..[[TIsealslim.png]],40,40)
         elseif AHSET.selectGC == 2 then
         GUI:Image(ImageFolder..[[TIsealsgri.png]],40,40)
         elseif AHSET.selectGC == 3 then
         GUI:Image(ImageFolder..[[TIsealsul.png]],40,40)
         elseif AHSET.selectGC == 4 then
         GUI:Image(ImageFolder..[[TIseal_non.png]],40,40)
         end
         if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
            sealstoitem = not sealstoitem
            GCexchange = false
            mushtoItemstep = 0
            end
            if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip75)
              else
              GUI:SetTooltip(mushtooltips.en.tip75)
              end
              end
         end
     elseif sealstoitem == false then
         GUI:SameLine(10,-40)
         GUI:Image(ImageFolder..[[TIseals_non.png]],40,40)
         if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
            sealstoitem = not sealstoitem
            GCexchange = false
            mushtoItemstep = 0
            end
            if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip75)
              else
              GUI:SetTooltip(mushtooltips.en.tip75)
              end
              end
         end
     end
     if mushTrustmode == true then sealstoitem = false end
     GUI:EndGroup()
     GUI:BeginGroup()
     GUI:Dummy(40,40)
     if mushTrustmode == true then
         GUI:SameLine(10,-40)
         GUI:Image(ImageFolder..[[GCtrust.png]],40,40)
         if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
            mushTrustmode = not mushTrustmode
            end
            if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip26)
              else
              GUI:SetTooltip(mushtooltips.en.tip26)
              end
              end
         end
     elseif mushTrustmode == false then
         GUI:SameLine(10,-40)
         GUI:Image(ImageFolder..[[GCtrust_non.png]],40,40)
         if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
            mushTrustmode = not mushTrustmode
            end
            if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip26)
              else
              GUI:SetTooltip(mushtooltips.en.tip26)
              end
              end
         end
     end
     GUI:EndGroup()
     GUI:NextColumn()
     GUI:Spacing()
     GUI:BeginGroup()
     GUI:Text("Start amount")
     if (GUI:IsItemHovered()) then
       if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip77)
              else
              GUI:SetTooltip(mushtooltips.en.tip77)
              end
              end
     end
     GUI:EndGroup()
     GUI:Dummy(1,20)
     GUI:SameLine()
     GUI:BeginGroup()
     if AHSET.selectGC == 1 then
     GUI:Image(ImageFolder..[[sealslim.png]],20,20)
     elseif AHSET.selectGC == 2 then
     GUI:Image(ImageFolder..[[sealsgri.png]],20,20)
     elseif AHSET.selectGC == 3 then
     GUI:Image(ImageFolder..[[sealsulu.png]],20,20)
     elseif AHSET.selectGC == 4 then
     GUI:Image(ImageFolder..[[seals_non.png]],20,20)
     end
     GUI:EndGroup()
     GUI:SameLine()
     GUI:BeginGroup()
     GUI:PushItemWidth(100)
     AHSET.syojigunpyou = GUI:InputInt("###seals",AHSET.syojigunpyou,100,10000)
     AetheryteHelper.SaveSettings()
     if (GUI:IsItemHovered()) then
       if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip78)
              else
              GUI:SetTooltip(mushtooltips.en.tip78)
              end
              end
     end
     for k,v in pairs(mushPlayerGCrank) do
     if (k == Player.GrandCompanyRank) then mushmaxseal = v
     if AHSET.syojigunpyou < 1 then AHSET.syojigunpyou = tonumber(mushmaxseal.max) end
     if AHSET.syojigunpyou > tonumber(mushmaxseal.max) then AHSET.syojigunpyou = tonumber(mushmaxseal.max) end
     if mushTrustmode == true then AHSET.syojigunpyou = tonumber(mushmaxseal.max)*0.95 end
     end
     end
     GUI:EndGroup()
     GUI:Spacing()
     GUI:BeginGroup()
     GUI:Dummy(20,20)
     if mushadjustoff == true then
      GUI:SameLine(5,-20)
      GUI:Image(ImageFolder..[[LB.png]],20,20)
            if (GUI:IsItemHovered()) then
               if (GUI:IsMouseClicked(0)) then
               mushadjustoff = not mushadjustoff
               end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip76)
              else
              GUI:SetTooltip(mushtooltips.en.tip76)
              end
              end
            end
     elseif mushadjustoff == false then
      GUI:SameLine(5,-20)
      GUI:Image(ImageFolder..[[LB_non.png]],20,20)
            if (GUI:IsItemHovered()) then
               if (GUI:IsMouseClicked(0)) then
               mushadjustoff = not mushadjustoff
               end
               if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip76)
              else
              GUI:SetTooltip(mushtooltips.en.tip76)
              end
              end
            end
     end
     GUI:EndGroup()
     GUI:SameLine()
     GUI:AlignFirstTextHeightToWidgets()
     GUI:BeginGroup()
     GUI:Image(ImageFolder..[[quantity.png]],20,20)
     GUI:EndGroup()
     GUI:SameLine()
     GUI:BeginGroup()
     GUI:PushItemWidth(80)
     AHSET.hosiikazu = GUI:InputInt("###Quantity",AHSET.hosiikazu,1,10000)
     AetheryteHelper.SaveSettings()
     if (GUI:IsItemHovered()) then
       if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip79)
              else
              GUI:SetTooltip(mushtooltips.en.tip79)
              end
              end
     end
     GUI:EndGroup()
     GUI:AlignFirstTextHeightToWidgets()
     GUI:BeginGroup()
     GUI:PushItemWidth(170)
     if language == 0 then
     AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.jp,5)
     AetheryteHelper.SaveSettings()
     elseif language == 1 then
     AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.En,5)   
     AetheryteHelper.SaveSettings()
     elseif language == 2 then
     AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.De,5)
     AetheryteHelper.SaveSettings()
     elseif language == 3 then
     AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.Fr,5)   
     AetheryteHelper.SaveSettings()
     else
     AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.En,5)
     AetheryteHelper.SaveSettings()   
     end
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
       if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip80)
              else
              GUI:SetTooltip(mushtooltips.en.tip80)
              end
              end
     end
     GUI:Spacing()
     if AHSET.koukanhin == 1 and Player.GrandCompanyRank < 1 then                           
        sealstoitem = false
     elseif AHSET.koukanhin == 2 and Player.GrandCompanyRank < 1 then 
        sealstoitem = false
     elseif AHSET.koukanhin == 3 and Player.GrandCompanyRank < 9 then 
        sealstoitem = false
     elseif AHSET.koukanhin == 4 and Player.GrandCompanyRank < 11 then 
        sealstoitem = false
     elseif AHSET.koukanhin == 5 and Player.GrandCompanyRank < 11 then 
        sealstoitem = false
     elseif AHSET.koukanhin == 6 and Player.GrandCompanyRank < 10 then 
        sealstoitem = false
     end   
     if AHSET.selectGC == 1 then mushGseals = Inventory:Get(2000):GetList()[2] 
     elseif Inventory:Get(2000):GetList()[2] == nil then mushGseals = nil end
     if AHSET.selectGC == 2 then mushGseals = Inventory:Get(2000):GetList()[3]
     elseif Inventory:Get(2000):GetList()[2] == nil then mushGseals = nil end
     if AHSET.selectGC == 3 then mushGseals = Inventory:Get(2000):GetList()[4]
     elseif Inventory:Get(2000):GetList()[2] == nil then mushGseals = nil end
     if AHSET.selectGC == 4 then mushGseals  = nil end 
     local mushcost = GCexchangeItems.cost[AHSET.koukanhin]
     if mushGseals ~= nil then
     if (mushadjustoff == false) then
     if mushGseals.count < 200 then AHSET.hosiikazu = 0 end
      while (mushcost * AHSET.hosiikazu ) <  mushGseals.count do AHSET.hosiikazu = AHSET.hosiikazu + 1 end
      if mushcost * AHSET.hosiikazu >  mushGseals.count then AHSET.hosiikazu = (AHSET.hosiikazu - 1) end
     else
      if mushGseals.count >= 200 and AHSET.hosiikazu < 0 then AHSET.hosiikazu = 450
      elseif mushcost * AHSET.hosiikazu >  AHSET.syojigunpyou then AHSET.hosiikazu = (AHSET.hosiikazu - 1) 
      end
     end
     if AHSET.hosiikazu == 0 then sealstoitem = false mushlooptimer = 1000 end

     GUI:BeginGroup()
     GUI:TextColored(1,1,0,1,"COST:"..mushcost)
     GUI:EndGroup()
     GUI:SameLine(100)
     GUI:BeginGroup()
     if mushcost * AHSET.hosiikazu >  mushGseals.count then
     GUI:TextColored(1,0,0,1,mushcost * AHSET.hosiikazu.."/"..mushGseals.count)
     else GUI:TextColored(0,1,1,1,mushcost * AHSET.hosiikazu.."/"..mushGseals.count) end
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
       if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip81)
              else
              GUI:SetTooltip(mushtooltips.en.tip81)
              end
              end
     end
     if AHSET.syojigunpyou <= mushGseals.count then mushtruninGCitem = true
     elseif AHSET.syojigunpyou > mushGseals.count then mushtruninGCitem = false
     end
     if AHSET.hosiikazu == 0 then mushtruninGCseals = false
     elseif AHSET.hosiikazu > 0 and mushcost * AHSET.hosiikazu <=  mushGseals.count then mushtruninGCseals = true
     elseif mushcost * AHSET.hosiikazu >  mushGseals.count then mushtruninGCseals = false 
     end
     elseif mushGseals == nil then
     mushtruninGCitem = false
     mushtruninGCseals = false
     if (mushadjustoff == false) then
      if AHSET.hosiikazu < 0 then AHSET.hosiikazu = 450
      elseif mushcost * AHSET.hosiikazu >  0 then AHSET.hosiikazu = (AHSET.hosiikazu - 1) 
      end
     else
      if AHSET.hosiikazu < 0 then AHSET.hosiikazu = 450
      elseif mushcost * AHSET.hosiikazu >  AHSET.syojigunpyou then AHSET.hosiikazu = (AHSET.hosiikazu - 1) 
      end
     end


     GUI:BeginGroup()
     GUI:TextColored(1,1,0,1,"COST:"..mushcost)
     GUI:EndGroup()
     GUI:SameLine(100)
     GUI:BeginGroup()
     GUI:TextColored(1,0,0,1,mushcost * AHSET.hosiikazu.."/"..0)
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
       if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip81)
              else
              GUI:SetTooltip(mushtooltips.en.tip81)
              end
              end
     end
     end
     mushitemid = GCexchangeItems.id[AHSET.koukanhin]
     mushhosiikazu = AHSET.hosiikazu
     GUI:Columns(1)
    
end




-------------------------------------------------------------------------------------------------------------------------------------------
----footer GUI

function AetheryteHelper.Drawafooter()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Text("[")
      GUI:EndGroup()

      GUI:SameLine()
      GUI:BeginGroup()
      GUI:TextColored( 0.8,0.2,0.2,1,"Github")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
      if GUI:IsItemClicked(0) then
         io.popen([[cmd /c start "" "]]..AHLinks.link2..[["]]):close()
      elseif GUI:IsItemClicked(1) then
         io.popen([[cmd /c start "" "]]..AHLinks.link3..[["]]):close()
      end
      if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip98)
              else
              GUI:SetTooltip(mushtooltips.en.tip98)
              end
              end
      end

      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Text("]")
      GUI:EndGroup()

      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Text("[")
      GUI:EndGroup()
      
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:TextColored( 0.2,0.8,0.8,1, "Discord")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
      if GUI:IsItemClicked(0) then
            io.popen([[cmd /c start "" "]]..AHLinks.link1..[["]]):close()
      end
      if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip97)
              else
              GUI:SetTooltip(mushtooltips.en.tip97)
              end
              end
      end
      
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Text("]")
      GUI:EndGroup()
      GUI:SameLine()
  end
      
       
-------------------------------------------------------------------------------------------------------------------------------------------
----DCinfo GUI

function AetheryteHelper.homeDCinfo()
    GUI:BeginGroup()
    for k,v in pairs(WorldID) do   
       if (k == Player.homeworld) then local homeWorld = v 
          GUI:Text("Home：" ..tostring(homeWorld.Name).."["..tostring(homeWorld.DC).."]")
       end    
    end
    GUI:EndGroup()
    --GUI:SameLine()
    GUI:BeginGroup()
    for k,v in pairs(WorldID) do
       if (k == Player.currentworld) then local NowWorld = v 
          GUI:Text("Now：" ..tostring(NowWorld.Name).."["..tostring(NowWorld.DC).."]")     
       AH_AutoDC = tostring(NowWorld.DC)
       end
    end
    GUI:EndGroup()
end

-------------------------------------------------------------------------------------------------------------------------------------------
-----DCset
function AetheryteHelper.autoDCset()
     if (AH_AutoDC == "Elemental") then AHSET.selectDC = 2
         elseif (AH_AutoDC == "Gaia" ) then AHSET.selectDC = 3
         elseif (AH_AutoDC == "Mana" ) then AHSET.selectDC = 4
         elseif (AH_AutoDC == "Aether" ) then AHSET.selectDC = 5
         elseif (AH_AutoDC == "Primal" ) then AHSET.selectDC = 6
         elseif (AH_AutoDC == "Chaos" ) then AHSET.selectDC = 7
         elseif (AH_AutoDC == "Light" ) then AHSET.selectDC = 8
         elseif (AH_AutoDC == "Crystal" ) then AHSET.selectDC = 9
         elseif (AH_AutoDC == "Materia" ) then AHSET.selectDC = 10
         else AHSET.selectDC = 1
      end
end

-----------------------------------------------------------
--Player CurrentWorld save
local mushPcurrnt = AHSET.Pcurrnt
if mushPcurrnt ~= nil then AetheryteHelper.SaveSettings() end
-------------------------------------------------------------------------------------------------------------------------------------------
-- list GUI

function AetheryteHelper.Origin()
           Origin_list = {} 
           musholist = FFXIVServerlist[AHSET.selectDC]
           for k, v in ipairs(musholist) do
           Origin_list[k] = v
--d(Origin_list)
           end
end


--------------------------------------------------------------------------------------------------------------------------------------------------

function AetheryteHelper.SVRSelectermini()
  if (AetheryteHelper.miniWV.open) then
    local miniWVflags = GUI.WindowFlags_NoTitleBar +  GUI.WindowFlags_NoFocusOnAppearing + GUI.WindowFlags_NoBringToFrontOnFocus + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoScrollbar
    GUI:SetNextWindowSize(220,60)
     AetheryteHelper.miniWV.visible, AetheryteHelper.miniWV.open = GUI:Begin('miniWV', AetheryteHelper.miniWV.open,miniWVflags)
    if (AetheryteHelper.miniWV.visible) then
      GUI:Spacing()
      GUI:Separator()
      GUI:Columns(3)
      GUI:SetColumnOffset(1, 40) GUI:SetColumnOffset(2, 180)
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Dummy(20,20)
      if selectins == true then
              GUI:SameLine(-5,-20)
              GUI:Image(ImageFolder..[[AHon.png]],20,20)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              isins = 4

              selectins = not selectins
              if not selectins then
              end
              Player:ClearTarget()
              Player:Stop()
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip01)
              else
              GUI:SetTooltip(mushtooltips.en.tip01)
              end
              end
              end      
      elseif selectins == false then
              GUI:SameLine(-5,-30)
              GUI:Image(ImageFolder..[[AHoff.png]],20,20)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              isins = 4
              selectins = not selectins
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip01)
              else
              GUI:SetTooltip(mushtooltips.en.tip01)
              end
              end
              end       
      end
      GUI:EndGroup()
      GUI:NextColumn()
      --GUI:Text("World select")
      AetheryteHelper.Origin()
            AetheryteHelper.SaveSettings()
            MushmoveServerlist = Origin_list
            for k, v in pairs(MushmoveServerlist) do
                local templist = MushmoveServerlist
--d(templist)
                for k,v in pairs(WorldID) do
                    if (k == Player.currentworld) then local tempWorld = v 
                    tempname = tostring(tempWorld.Name)
--d(tempname)
                    for k,v in pairs(templist) do
                    local tempindex = table.find(templist, tempname)
--d(tempindex)     
                    if (tempindex ~= nil) then 
                    table.remove(templist,tempindex)
                    else tempindex = 0
                    end 
                    end
                    end
                 end
             end
     AetheryteHelper.autoDCset()
     GUI:Dummy(120,1)
     GUI:BeginGroup()
     GUI:PushItemWidth(120)
     if (table.valid(FFXIVServerlist[AHSET.selectDC])) then
     selectSVR = GUI:Combo( "###server",selectSVR,MushmoveServerlist,height or 20)
     else
     GUI:Combo( "DC",1,noDClist,1)
     GUI:Combo( "server",1,FFXIVServerlist[11],1)
     end
     if (GUI:IsItemHovered()) then
      if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip95)
              else
              GUI:SetTooltip(mushtooltips.en.tip95)
              end
              end
     end
     GUI:EndGroup()
     isServer = selectSVR
      GUI:NextColumn()
      GUI:SameLine(10)
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[close.png]],20,20)
      if (GUI:IsItemHovered()) then
          if GUI:IsMouseDown(0) then              
          AetheryteHelper.miniWV.open = false
          end
          if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip22)
              else
              GUI:SetTooltip(mushtooltips.en.tip22)
              end
              end
      end
      GUI:EndGroup()
      GUI:Columns()
      GUI:Spacing()
      GUI:Separator()

      end
      GUI:End()  
  end
end

-------------------------------------------------------------------------------------------------------------




function AetheryteHelper.DCSVselect()
            AetheryteHelper.Origin()
            AetheryteHelper.SaveSettings()
            MushmoveServerlist = Origin_list
            for k, v in pairs(MushmoveServerlist) do
                local templist = MushmoveServerlist
--d(templist)
                for k,v in pairs(WorldID) do
                    if (k == Player.currentworld) then local tempWorld = v 
                    tempname = tostring(tempWorld.Name)
--d(tempname)
                    for k,v in pairs(templist) do
                    local tempindex = table.find(templist, tempname)
--d(tempindex)     
                    if (tempindex ~= nil) then 
                    table.remove(templist,tempindex)
                    else tempindex = 0
                    end 
                    end
                    end
                 end
             end
     AetheryteHelper.autoDCset()
     GUI:BeginGroup()
     GUI:PushItemWidth(80)
     
     if ( gRegion == 1) then
        AHSET.selectDC = GUI:Combo( "###DC", AHSET.selectDC,FFXIVDClist,1)
     end
     if (GUI:IsItemHovered()) then
     if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip93)
              else
              GUI:SetTooltip(mushtooltips.en.tip93)
              end
              end
     end
     GUI:EndGroup()
     GUI:SameLine()
     GUI:BeginGroup()
     GUI:Dummy(25,25)
     if AHSET.nohousing == true then
              GUI:SameLine(2.5,-25)
              GUI:Image(ImageFolder..[[harea_lock.png]],25,25)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              AHSET.nohousing = not AHSET.nohousing
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip04)
              else
              GUI:SetTooltip(mushtooltips.en.tip04)
              end
              end
              end      
      elseif AHSET.nohousing == false then
              GUI:SameLine(2.5,-25)
              GUI:Image(ImageFolder..[[harea_lock_non.png]],25,25)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              AHSET.nohousing = not AHSET.nohousing
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip04)
              else
              GUI:SetTooltip(mushtooltips.en.tip04)
              end
              end
              end
     end
     GUI:EndGroup()
     GUI:BeginGroup()
     GUI:Text("World")
     GUI:EndGroup()
     GUI:BeginGroup()
     GUI:PushItemWidth(120)
     if (table.valid(FFXIVServerlist[AHSET.selectDC])) then
     selectSVR = GUI:Combo( "###server",selectSVR,MushmoveServerlist,height or 20)
     else
     GUI:Combo( "DC",1,noDClist,1)
     GUI:Combo( "server",1,FFXIVServerlist[11],1)
     end
     if (GUI:IsItemHovered()) then
      if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip95)
              else
              GUI:SetTooltip(mushtooltips.en.tip95)
              end
              end
     end
     GUI:EndGroup()
     isServer = selectSVR

end

function AetheryteHelper.minitools()
      GUI:BeginGroup()
      GUI:Dummy(25,25)
      if AHSET.mushtooltips == true then
              GUI:SameLine(2.5,-25)
              GUI:Image(ImageFolder..[[tips.png]],25,25)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              AHSET.mushtooltips = not AHSET.mushtooltips
              AetheryteHelper.SaveSettings()
              end
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip109)
              else
              GUI:SetTooltip(mushtooltips.en.tip109)
              end
              end      
      elseif AHSET.mushtooltips == false then
              GUI:SameLine(2.5,-25)
              GUI:Image(ImageFolder..[[tips_non.png]],25,25)
              if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              AHSET.mushtooltips = not AHSET.mushtooltips
              AetheryteHelper.SaveSettings()
              end
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip109)
              else
              GUI:SetTooltip(mushtooltips.en.tip109)
              end
              end       
      end
      GUI:EndGroup()
      GUI:BeginGroup()
      GUI:ImageButton("###flag",ImageFolder..[[flag.png]], 20,20)
            if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              SendTextCommand("/e <flag>")
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip03)
              else
              GUI:SetTooltip(mushtooltips.en.tip03)
              end
              end           
            end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:ImageButton("###pos",ImageFolder..[[P_pos.png]], 20,20)
            if (GUI:IsItemHovered()) then
              if (GUI:IsMouseClicked(0)) then
              SendTextCommand("/e [AH]Now Instance: \x02\x13\x06\xfe\xff\xff\xff\x11 <pos>")
              end
              if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip117)
              else
              GUI:SetTooltip(mushtooltips.en.tip117)
              end
              end           
            end
      GUI:EndGroup()

end


function AetheryteHelper.statuscheck()
      GUI:BeginGroup()
      GUI:Text("Main:")
      if selectins == true then
      GUI:SameLine()
      GUI:Text("[AH]")
      end 
      if AHSET.mushmovetoMB == true then
      GUI:SameLine()
      GUI:Text("[MB]")
      end
      if AHSET.mushtooltips == true then
      GUI:SameLine()
      GUI:Text("[Tips]")
      end
      GUI:Text("AHPulse:"..mushlooptimer)  
      GUI:EndGroup()

end

function AetheryteHelper.footerkofi()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[kofi.png]],90,25)
      if (GUI:IsItemHovered()) then
      if GUI:IsItemClicked(0) then
            io.popen([[cmd /c start "" "]]..kinokoProject.HELP.mykofi..[["]]):close()
      end
      if AHSET.mushtooltips == true then
              if language == 0 then
              GUI:SetTooltip(mushtooltips.jp.tip96)
              else
              GUI:SetTooltip(mushtooltips.en.tip96)
              end
              end
      end
      GUI:EndGroup()
end
--------------------------------------------------------------------------------
-- header & All Drowcall GUI

function AetheryteHelper.DrawCall()
  local Windows = kinokoProject.Windows.MainWindows
  local Addon = kinokoProject.Addon
  local minikinoko = kinokoProject.Windows.minibutton

 if (Windows.Open) then
    GUI:SetNextWindowSize(280,350,GUI.SetCond_FirstUseEver)
    Windows.Visible, Windows.Open = GUI:Begin(Addon.Name.." - v"..Addon.Version.."##MainWindows_begin", Windows.Open, Windows.Option)
    if (Windows.Visible) then
      GUI:BeginGroup()
      GUI:Text("[")
      GUI:SameLine()
      if Player.localmapid == 0 then GUI:TextColored(0,0.8,0,1,"Loading...")
      elseif Player.localmapid == nil then GUI:TextColored(0.8,0,0,1,"wait for login")
      else GUI:TextColored(0.7,0.8,0.1,1,GetMapName(Player.localmapid)) end
      GUI:SameLine()
      GUI:Text("]:MAPID:"..tostring(Player.localmapid))
      GUI:EndGroup()

      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      AetheryteHelper.DrawTabs()-----tabs
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()


      if (AetheryteHelper.GUI.tabs[1].isselected) and mushTrustmode == false then
      if Player.localmapid == 956 or Player.localmapid == 957 or Player.localmapid == 958 or
      Player.localmapid == 959 or Player.localmapid == 960 or Player.localmapid == 961 then 
      GUI:Columns(3)
      GUI:SetColumnOffset(1, 70) GUI:SetColumnOffset(2, 200)
      AetheryteHelper.Drawinsselect()
      GUI:NextColumn()
      AetheryteHelper.maininsButton()
      GUI:NextColumn()
      AetheryteHelper.minitools()
      GUI:Columns()
      AetheryteHelper.homeDCinfo()
      AetheryteHelper.accessdelay()
    elseif Player.localmapid == 132 or Player.localmapid == 129 or Player.localmapid == 130 then
      GUI:Columns(3)
      GUI:SetColumnOffset(1, 70) GUI:SetColumnOffset(2, 200)
      AetheryteHelper.Serverselect()
      GUI:NextColumn()
      AetheryteHelper.DCSVselect()
      GUI:NextColumn()
      AetheryteHelper.minitools()
      GUI:Columns()
      AetheryteHelper.homeDCinfo()
      AetheryteHelper.accessdelay() 
    else
      GUI:Columns(3)
      GUI:SetColumnOffset(1, 70) GUI:SetColumnOffset(2, 200)
      AetheryteHelper.notuseAH()
      GUI:NextColumn()
      AetheryteHelper.omikuji()
      GUI:NextColumn()
      AetheryteHelper.minitools()
      GUI:Columns()
      AetheryteHelper.homeDCinfo()
      AetheryteHelper.accessdelay()
    end
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      AetheryteHelper.GLUtelepo() ----telepo    
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      AetheryteHelper.footerkofi()
      GUI:SameLine()
      AetheryteHelper.statuscheck()
      
      elseif (AetheryteHelper.GUI.tabs[2].isselected) and mushTrustmode == false then
      AetheryteHelper.subtoolmateria()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      AetheryteHelper.subtoolDesynth()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      AetheryteHelper.subtoolAR()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      AetheryteHelper.footerkofi()
      GUI:SameLine()
      AetheryteHelper.statuscheck()

      elseif (AetheryteHelper.GUI.tabs[3].isselected) or mushTrustmode == true then  
      AetheryteHelper.subtoolGC()
      --GUI:Spacing()
      --GUI:Separator()
      --GUI:Spacing()
      AetheryteHelper.GCtrunin()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      AetheryteHelper.footerkofi()
      GUI:SameLine()
      AetheryteHelper.statuscheck()
      if mushTrustmode == true then
        AetheryteHelper.GUI.tabs[1].isselected = false
        AetheryteHelper.GUI.tabs[2].isselected = false
        AetheryteHelper.GUI.tabs[3].isselected = true
        AetheryteHelper.GUI.tabs[4].isselected = false
      end

      elseif (AetheryteHelper.GUI.tabs[4].isselected) and mushTrustmode == false then 
      AetheryteHelper.DrawadWIP() ------button
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      AetheryteHelper.footerkofi()
      GUI:SameLine()
      AetheryteHelper.statuscheck()

      end
--------------------------------------------------------------------
--mini Button
      GUI:Separator()
      GUI:Spacing(5)
      if GUI:Button("Mini##"..Windows.Name,(GUI:GetWindowSize()), 40, 20) then
         Windows.Open = false
         minikinoko.Open = true
         if Windows.Open == true then
            minikinoko.Open = false
         end
      AetheryteHelper.SaveSettings()
      end
      GUI:SameLine(60)
      GUI:BeginGroup()
      GUI:Text("mushroom")
      GUI:EndGroup()

      AetheryteHelper.Drawafooter()
--------------------------------------------------------------------
    end
    GUI:End()
  end
  AetheryteHelper.SubWindow()
  AetheryteHelper.jumboWindow()
  AetheryteHelper.minimush()
  AetheryteHelper.insSelecterWindow()
  AetheryteHelper.subtoolDesOPwindow()
  AetheryteHelper.VlWindow()
  AetheryteHelper.TCListwindow()
  AetheryteHelper.SVRSelectermini()
  AetheryteHelper.MIPselect()
  AetheryteHelper.YoroOtu()
end

---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
--GUIend
--begin function
---------------------------------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------------------------------------------------
-- main function

function AetheryteHelper.insselect()
  if autheVar == nil then
    autheVar = true
    autheStep = 0
    isTime = 0
    else
    autheVar = not autheVar
  end

  if (selectins) then  
      if autheVar and TimeSince(isTime) > AHSET.delay then
              aetheID = 0
              local el = EntityList("nearest,type=5")
              if table.valid(el) then
                      for k,v in pairs(el) do
                              aetheID = v.id
                      end
              end
              if autheStep == 0 then
                  if (AHSET.nohousing)then autheStep = 5
                  else autheStep = 1
                  end
              end
              if autheStep == 1 then
                      Player:SetTarget(aetheID)
                      local pos = Player:GetTarget().pos
                   if Player.localmapid == 959 then
                      if Player:GetTarget().Distance < 10 and Player.IsMounted == true then 
                      autheStep = 99
                      elseif Player:GetTarget().Distance < 10 and Player.IsMounted == false then
                      autheStep = 2
                      elseif Player:GetTarget().Distance > 10 and Player.IsMounted == false then 
                      Player:MoveTo(pos.x,pos.y,pos.z,10,true,true)
                      end
                   else
                      if Player:GetTarget().Distance < 6.5 and Player.IsMounted == true then 
                      autheStep = 99
                      elseif Player:GetTarget().Distance < 6.5 and Player.IsMounted == false then
                      autheStep = 2
                      elseif Player:GetTarget().Distance > 6.5 and Player.IsMounted == false then 
                      Player:MoveTo(pos.x,pos.y,pos.z,10,true,true)
                      end
                   end
              end
              if (autheStep == 2) then
                      Player:SetTarget(aetheID)
                      Player:Interact(aetheID)              
                      if IsControlOpen("SelectString") then
                         GetControl("SelectString"):Action("SelectIndex",modechg)
                         if (modechg == 3) then autheStep = 3 else autheStep = 4 end
                      end
              end
              if (autheStep == 3) then
                        Player:Stop()                      
                     if IsControlOpen("SelectYesno") then
                            UseControlAction("SelectYesno","No")
                            selectins = not selectins
                     elseif IsControlOpen("SelectString") then
                  mushins = GetControl("SelectString"):GetRawData()                  
                            GetControl("SelectString"):Action("SelectIndex",isins)
                            isTime = Now()
                            isins = 4
                            autheStep = 0

                     elseif Player:GetTarget() == nil then
                            isTime = Now()
                            autheStep = 0
                      end
              end
              if autheStep == 4 then
                        Player:Stop()
                        GetControl("WorldTravelSelect"):Action("SelectIndex",isServer)
                     if (isServer < 2) then selectins = not selectins end 
                        UseControlAction("SelectYesno")
                     if IsControlOpen("SelectYesno") then
                        UseControlAction("SelectYesno","Yes")
                           moveSVR = not moveSVR
                           selectins = not selectins
                           autooff = not autooff
                           autheStep = 0
                     elseif Player:GetTarget() == nil then
                           isTime = Now()
                           Player:SetTarget(aetheID)
                           Player:Interact(aetheID)
                           isServer = 1
                           autheStep = 0                           
                      end
              end
              if autheStep == 5 then
                      Player:SetTarget(aetheID)
                      local pos = Player:GetTarget().pos
                      if Player:GetTarget().Distance < 6.5 and Player.IsMounted == true then 
                      autheStep = 99
                      elseif Player:GetTarget().Distance < 6.5 and Player.IsMounted == false then
                      autheStep = 6
                      elseif Player:GetTarget().Distance > 6.5 and Player.IsMounted == false then 
                      Player:MoveTo(pos.x,pos.y,pos.z,10,true,true)
                      end
              end
              if autheStep == 6 then
                      Player:Stop()
                      Player:SetTarget(aetheID)
                      Player:Interact(aetheID)
                      UseControlAction("Aetheryte") 
                      if IsControlOpen("SelectString") then
                         GetControl("SelectString"):Action("SelectIndex",1)
                         autheStep = 7
                      end
              end
              if autheStep == 7 then
                        GetControl("WorldTravelSelect"):Action("SelectIndex",isServer)
                        UseControlAction("SelectYesno")
                     if IsControlOpen("SelectYesno") then
                        UseControlAction("SelectYesno","Yes")
                           moveSVR = not moveSVR
                           selectins = not selectins
                           autooff = not autooff
                           autheStep = 5
                     elseif Player:GetTarget() == nil then
                           isTime = Now()
                           Player:SetTarget(aetheID)
                           Player:Interact(aetheID)
                           isServer = 1
                           autheStep = 5                           
                      end
              end
              if autheStep == 99 then
                  if Player.IsMounted == true and ActionList:Get(5,23):IsReady() == true then
                  ActionList:Get(5,23):Cast()
                  return
                  end
                  if Player.IsMounted == false then
                  autheStep = 0
                  end                  
              end
           
      if Player:GetTarget() == nil then
         if( autooff ) then
          isins = 4
          selectins = not selectins
         end
         end
      end
    end   
end


---------------------------------------------------------------------------------------------------------------------------------------------------
--fix function

function AetheryteHelper.mushMaintool()

  if(selectins == true) and (Player.localmapid == 130 ) then
      moveSVR = true
      modechg = 2
      autooff = false
      AetheryteHelper.insselect()
  elseif (selectins == true) and (Player.localmapid == 129) then
      moveSVR = true
      modechg = 2
      autooff = false
      AetheryteHelper.insselect()
  elseif (selectins == true) and (Player.localmapid == 132) then
      moveSVR = true
      modechg = 2
      autooff = false
      AetheryteHelper.insselect()
  elseif (selectins == true) then
      moveSVR = false
      modechg = 3
      autooff = true
      AetheryteHelper.insselect()
   end
 
   if IsControlOpen("_TextError") then
        if not MIsLoading() then
            local errmsg = {
                [0] = "移動先のエリアが混雑しています。しばらく時間をおいてからお試しください。", -- JP
                [1] = "Your destination is currently congested. Please try again later.", -- EN
                [2] = "Der Zielort ist gerade überfüllt. Bitte versuch es später noch einmal.", -- DE
                [3] = "Votre destination est actuellement encombrée. Veuillez réessayer d'y accéder ultérieurement.", -- FR
                [4] = "前方区域繁忙，请稍后再试。", -- CN
                [6] = "이동할 지역이 혼잡한 상태입니다. 잠시 후 다시 시도하십시오.", -- KR
            }
            local str = GetControlStrings("_TextError",2)
            if str == errmsg[language] then
                isins = insHistory.isins
                selectins = insHistory.selectins
                if autheStep == 0 then
                    autheStep = insHistory.autheStep
                end
            end
        else
            insHistory = {
                isins = 4,
                selectins = false,
                autheStep = 0
            }
        end
    end
 end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--move to GC
function AetheryteHelper.movetoGCAll()
      if ( AutoMoveGC ) then
        mushlooptimer = 500
        if (AHSET.selectGC == 1) then
          AetheryteHelper.movetoCOMPANYlimsa()
        elseif (AHSET.selectGC == 2) then
          AetheryteHelper.movetoCOMPANYgridania()
        elseif (AHSET.selectGC == 3) then
          AetheryteHelper.movetoCOMPANYuldah()
        else
          AutoMoveGC = false
        end
      end
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--move to GC (beta)
function AetheryteHelper.movetoCOMPANYlimsa()
         if( Player.localmapid == 129 ) then GCStep = 0 end    
         if( Player.localmapid == 128 ) then GCStep = 3 end
         if ( Player.localmapid ~= 129 )and( Player.localmapid ~= 128 ) and (Player:GetTarget() == nil) then        
             if(ActionList:Get(5,7):IsReady() == true) then
             Player:Teleport(8,0)
             end
         end      

             if (GCStep == 0) then
                      Player:SetTarget(4298661156)
                      limsaAethe = Player:GetTarget()
                      local pos = limsaAethe.pos
                      local dis = limsaAethe.Distance
                      Player:MoveTo(pos.x,pos.y,pos.z,10,true,true)
                      if dis <= 5 then
                      GCStep = 1
                      end
              end
              if (GCStep == 1) then
                     Player:Interact(4298661156)                      
                     if IsControlOpen("SelectString") then
                     GetControl("SelectString"):Action("SelectIndex",0)
                        GCStep = 1
                     else
                        GCStep = 2
                     end
                     
              end
              if (GCStep == 2) then                      
                     if IsControlOpen("TelepotTown") then
                        GetControl("TelepotTown"):Action("Teleport",1)
                        GCStep = 2
                     else
                        GCStep = 3
                     end
              end
         
              if (GCStep == 3) then
                       Player:MoveTo(92.68,40.28,75.63,15,true,true)             
                       GCStep = 4
              end
              if (GCStep == 4) then
                       if Player:IsMoving() then  
                       AutoMoveGC = false
                       GCexchange = true
                       end
              end
end
              

---------------------------------------------------------------------------------------------------------------------------
function AetheryteHelper.movetoCOMPANYgridania()
              if( Player.localmapid == 132 ) then
                Player:MoveTo(-66.87,-0.50,-7.71,15,true,true)
                if Player:IsMoving() then  
                       AutoMoveGC = false
                       GCexchange = true
                       end
              
              elseif ( Player.localmapid ~= 132 ) then
                  if Player.localmapid ~= 132  and (Player:GetTarget() == nil) then        
                  if(ActionList:Get(5,7):IsReady() == true) then
                  Player:Teleport(2,0)
                  end
                  end
              end  
end

---------------------------------------------------------------------------------------------------------------------------
function AetheryteHelper.movetoCOMPANYuldah()
               if( Player.localmapid == 130 ) then
                Player:MoveTo(-140.2,4.10,-106.6,15,true,true)
                if Player:IsMoving() then  
                       AutoMoveGC = false
                       GCexchange = true
                       end

              elseif ( Player.localmapid ~= 130 ) then
                  if Player.localmapid ~= 130  and (Player:GetTarget() == nil) then        
                  if(ActionList:Get(5,7):IsReady() == true) then
                  Player:Teleport(9,0)
                  end
                  end
              end 
end

---------------------------------------------------------------------------------------------------------------------------
function AetheryteHelper.moveMBlimsa()
                limaetheID = 0
                local el = EntityList("nearest,type=5")
                if table.valid(el) then
                for k,v in pairs(el) do
                limaetheID = v.id
                end
                end
                limMBID = 0
                local elm = EntityList("nearest,contentID=2000402")
                if table.valid(elm) then
                for k,v in pairs(elm) do
                limMBID = v.id
                end
                end
         if mushMBlim == true then
         
            if limMBStep == 0 then
               if AHSET.mushmovetoMB == false then
                  if ActionList:IsReady() and (Player.localmapid ~= 129) and (Player.localmapid ~= 128) then
                  Player:Teleport(8,0)
                  --mushlooptimer = 1000
                  mushMBlim = false
                  end
               elseif AHSET.mushmovetoMB == true then
                  if ActionList:IsReady() and (Player.localmapid ~= 129) and (Player.localmapid ~= 128) then
                  Player:Teleport(8,0)
                  end           
                  if Player.localmapid == 129 then
                  limMBStep = 1
                  elseif Player.localmapid == 128 then
                  limMBStep = 10
                  end
               end
            end
            if limMBStep == 1 then
            --d("limMBStep:"..limMBStep)
               if Player.localmapid == 129 then
                  Player:SetTarget(limMBID)
                  if ActionList:IsReady() and Player:SetTarget(limMBID) == false then
                  limMBStep = 10
                  elseif Player:SetTarget(limMBID) then
                     local pos = Player:GetTarget().pos
                           if Player:GetTarget().Distance > 50 then
                           Player:MoveTo(-121.8,18.0,12.20,10,true,true)
                           limMBStep = 1
                             if Player:IsMoving() then
                                if ActionList:Get(1,3):IsReady() then ActionList:Get(1,3):Cast() end
                             limMBStep = 2
                             end
                           else
                           Player:MoveTo(pos.x,pos.y,pos.z,10,true,true)
                           limMBStep = 1
                             if Player:IsMoving() then
                                limMBStep = 2
                             end
                           end
                  end
               end
            end
            if limMBStep == 2 then
            --d("limMBStep:"..limMBStep)
               Player:SetTarget(limMBID)
               local limsaMB = Player:GetTarget()
               local Adis = limsaMB.Distance   
               if Adis < 4 then
               Player:Stop()
               Player:Interact(limMBID)
               limMBStep = 3
               end
            end
            if limMBStep == 3 then
            --d("limMBStep:"..limMBStep)
               if IsControlOpen("ItemSearch") then
               GetControl("ItemSearch"):PushButton(25,11)
               mushlooptimer = 1000
               limMBStep = 0           
               mushMBlim = false
               end
            end
            if limMBStep == 10 then
            --d("limMBStep:"..limMBStep)
              Player:SetTarget(limaetheID)
              local pos = Player:GetTarget().pos
              if Player:GetTarget().Distance > 4 then 
                 Player:MoveTo(pos.x,pos.y,pos.z,10,true,true)
                 if Player:GetTarget().Distance > 50  and ActionList:Get(1,3):IsReady() then ActionList:Get(1,3):Cast() end
              limMBStep = 11
              end
           end
           if limMBStep == 11 then
            --d("limMBStep:"..limMBStep)
              Player:SetTarget(limaetheID)
              if Player:GetTarget(limaetheID).Distance < 1 then
                 Player:Interact(limaetheID)
                 limMBStep = 12
              end
           end
           if limMBStep == 12 then
            --d("limMBStep:"..limMBStep)
              if IsControlOpen("TelepotTown") then
                 GetControl("TelepotTown"):Action("Teleport",0)
                 limMBStep = 1            
              end
           end
         end
end

function AetheryteHelper.moveMBgridania()
                griaetheID = 0
                local el = EntityList("nearest,type=5")
                if table.valid(el) then
                for k,v in pairs(el) do
                griaetheID = v.id
                end
                end
                griMBID = 0
                local elm = EntityList("nearest,contentID=2000402")
                if table.valid(elm) then
                for k,v in pairs(elm) do
                griMBID = v.id
                end
                end 
         if mushMBgri == true then
         
            if griMBStep == 0 then
               if AHSET.mushmovetoMB == false then
                  if ActionList:IsReady() and (Player.localmapid ~= 132) and (Player.localmapid ~= 133) then
                  Player:Teleport(2,0)
                  --mushlooptimer = 1000
                  mushMBlim = false
                  end
               elseif AHSET.mushmovetoMB == true then
                  if ActionList:IsReady() and (Player.localmapid ~= 132) and (Player.localmapid ~= 133) then
                  Player:Teleport(2,0)
                  end           
                  if Player.localmapid == 133 then
                  griMBStep = 1
                  elseif Player.localmapid == 132 then
                  griMBStep = 10
                  end
               end
            end
            if griMBStep == 1 then
            --d("griMBStep:"..griMBStep)
               if Player.localmapid == 133 then
                  Player:SetTarget(griMBID)
                  if ActionList:IsReady() and Player:SetTarget(griMBID) == false then
                  griMBStep = 10
                  elseif Player:SetTarget(griMBID) then
                     local pos = Player:GetTarget().pos
                           if Player:GetTarget().Distance > 100 then
                           Player:MoveTo(161.44,15.50,-100.2,10,true,true)
                           griMBStep = 1
                             if Player:IsMoving() then
                                if ActionList:Get(1,3):IsReady() then ActionList:Get(1,3):Cast() end
                             griMBStep = 2
                             end
                           else
                           Player:MoveTo(pos.x,pos.y,pos.z,10,true,true)
                           griMBStep = 1
                             if Player:IsMoving() then
                                griMBStep = 2
                             end
                           end
                  end
               end
            end
            if griMBStep == 2 then
            --d("griMBStep:"..griMBStep)
               Player:SetTarget(griMBID)
               local griMB = Player:GetTarget()
               local Adis = griMB.Distance   
               if Adis < 4 then
               Player:Stop()
               Player:Interact(griMBID)
               griMBStep = 3
               end
            end
            if griMBStep == 3 then
            --d("griMBStep:"..griMBStep)
               if IsControlOpen("ItemSearch") then
               GetControl("ItemSearch"):PushButton(25,11)
               mushlooptimer = 1000
               griMBStep = 0           
               mushMBgri = false
               end
            end
            if griMBStep == 10 then
            --d("griMBStep:"..griMBStep)
              Player:SetTarget(griaetheID)
              local pos = Player:GetTarget().pos
              if ActionList:IsReady() and Player:GetTarget().Distance > 4 then 
                 Player:MoveTo(pos.x,pos.y,pos.z,10,true,true)
                 if Player:GetTarget().Distance > 50  and ActionList:Get(1,3):IsReady() then ActionList:Get(1,3):Cast() end
              griMBStep = 11
              end
           end
           if griMBStep == 11 then
            --d("griMBStep:"..griMBStep)
              Player:SetTarget(griaetheID)
              if Player:GetTarget(griaetheID).Distance < 4 then
                 Player:Interact(griaetheID)
                 griMBStep = 12
              end
           end
           if (griMBStep == 12) then
             --d("griMBStep:"..griMBStep)
                 Player:Interact(griaetheID)                      
                 if IsControlOpen("SelectString") then
                 GetControl("SelectString"):Action("SelectIndex",0)
                 elseif IsControlOpen("TelepotTown") then
                 griMBStep = 13
                 else
                 griMBStep = 12
                 end
           end
           if griMBStep == 13 then
            --d("griMBStep:"..griMBStep)
              if IsControlOpen("TelepotTown") then
                 GetControl("TelepotTown"):Action("Teleport",2)
                 griMBStep = 1            
              end
           end
         end
end


function AetheryteHelper.moveMBuldah()
                uldaetheID = 0
                local el = EntityList("nearest,type=5")
                if table.valid(el) then
                for k,v in pairs(el) do
                uldaetheID = v.id
                end
                end
                uldMBID = 0
                local elm = EntityList("nearest,contentID=2000442")
                if table.valid(elm) then
                for k,v in pairs(elm) do
                uldMBID = v.id
                end
                end 
         if mushMBul == true then
         
            if uldMBStep == 0 then
               if AHSET.mushmovetoMB == false then
                  if ActionList:IsReady() and (Player.localmapid ~= 130) and (Player.localmapid ~= 131) then
                  Player:Teleport(9,0)
                  --mushlooptimer = 1000
                  mushMBlim = false
                  end
               elseif AHSET.mushmovetoMB == true then
                  if ActionList:IsReady() and (Player.localmapid ~= 130) and (Player.localmapid ~= 131) then
                  Player:Teleport(9,0)
                  end           
                  if Player.localmapid == 130 then
                  uldMBStep = 10
                  elseif Player.localmapid == 131 then
                  uldMBStep = 1
                  end
               end
            end
            if uldMBStep == 1 then
            --d("uldMBStep:"..uldMBStep)
               if Player.localmapid == 131 then
                  Player:SetTarget(uldMBID)
                  if ActionList:IsReady() and Player:SetTarget(uldMBID) == false then
                  uldMBStep = 10
                  elseif Player:SetTarget(uldMBID) then
                     local pos = Player:GetTarget().pos
                           if Player:GetTarget().Distance > 50 then
                           Player:MoveTo(161.44,15.50,-100.2,10,true,true)
                           uldMBStep = 1
                             if Player:IsMoving() then
                                if ActionList:Get(1,3):IsReady() then ActionList:Get(1,3):Cast() end
                             uldMBStep = 2
                             end
                           else
                           Player:MoveTo(pos.x,pos.y,pos.z,10,true,true)
                           uldMBStep = 1
                             if Player:IsMoving() then
                                uldMBStep = 2
                             end
                           end
                  end
               end
            end
            if uldMBStep == 2 then
            --d("uldMBStep:"..uldMBStep)
               Player:SetTarget(uldMBID)
               local uldMB = Player:GetTarget()
               local Adis = uldMB.Distance   
               if Adis < 4 then
               Player:Stop()
               Player:Interact(uldMBID)
               uldMBStep = 3
               end
            end
            if uldMBStep == 3 then
            --d("uldMBStep:"..uldMBStep)
               if IsControlOpen("ItemSearch") then
               GetControl("ItemSearch"):PushButton(25,11)
               mushlooptimer = 1000
               uldMBStep = 0           
               mushMBul = false
               end
            end
            if uldMBStep == 10 then
            --d("uldMBStep:"..uldMBStep)
              Player:SetTarget(uldaetheID)
              local pos = Player:GetTarget().pos
              if ActionList:IsReady() and Player:GetTarget().Distance > 5 then 
                 Player:MoveTo(pos.x,pos.y,pos.z,10,true,true)
                 if Player:GetTarget().Distance > 50  and ActionList:Get(1,3):IsReady() then ActionList:Get(1,3):Cast() end
              uldMBStep = 11
              end
           end
           if uldMBStep == 11 then
            --d("uldMBStep:"..uldMBStep)
              Player:SetTarget(uldaetheID)
              if Player:GetTarget(uldaetheID).Distance < 5 then
                 Player:Interact(uldaetheID)
                 uldMBStep = 12
              end
           end
           if (uldMBStep == 12) then
             --d("uldMBStep:"..uldMBStep)
                 Player:Interact(uldaetheID)                      
                 if IsControlOpen("SelectString") then
                 GetControl("SelectString"):Action("SelectIndex",0)
                 elseif IsControlOpen("TelepotTown") then
                 uldMBStep = 13
                 else
                 uldMBStep = 12
                 end
           end
           if uldMBStep == 13 then
            --d("uldMBStep:"..uldMBStep)
              if IsControlOpen("TelepotTown") then
                 GetControl("TelepotTown"):Action("Teleport",9)
                 uldMBStep = 1            
              end
           end
         end
end
---------------------------------------------------------------------------------------------------------------------------

function AetheryteHelper.Exchange()
             if Player.GrandCompanyRank < 6 then GCexchange = false
             elseif Player.GrandCompany  == 0 then GCexchange = false
             elseif Player.GrandCompany == 1 then GCID1 = tonumber(mushCD1.limsa)   
             elseif Player.GrandCompany == 2 then GCID1 = tonumber(mushCD1.Gridania) 
             elseif Player.GrandCompany  == 3 then GCID1 = tonumber(mushCD1.Uldah)
             end
       if (GCexchange)then
              mushlooptimer = 750
              if( mushEXstep == 0) then
                 d("[AH][Exchange]step:SetTarget")
                 Player:SetTarget(GCID1)
                 if Player:GetTarget().Distance < 6 then
                 Player:Interact(GCID1)
                 end
                 if IsControlOpen("SelectString") then
                 Player:Stop()                           
                 GetControl("SelectString"):Action("SelectIndex",0)
                 mushEXstep = 1
                 else
                 mushEXstep = 0                   
                 end
              end
              if (mushEXstep == 1) then
                d("[AH][Exchange]step:SelectCategory")
                  if IsControlOpen("GrandCompanySupplyList") then
                  GetControl("GrandCompanySupplyList"):PushButton(25,4)
                  --GetControl("GrandCompanySupplyList"):Action("SelectCategory",2)
                  mushEXstep = 2
                  end
              end
              if (mushEXstep == 2) then
                d("[AH][Exchange]step:SelectFilter")
                    if IsControlOpen("GrandCompanySupplyList") then
                    if GetControl("GrandCompanySupplyList"):GetData().category == nil then
                    mushEXstep = 10
                    elseif GetControl("GrandCompanySupplyList"):GetData().category ~= 2 then
                    mushEXstep = 1 
                    elseif GetControl("GrandCompanySupplyList"):GetData().category == 2 then
                    GetControl("GrandCompanySupplyList"):Action("SelectFilterIndex",2)
                    mushEXstep = 3
                    end
                    end
              end            
              if (mushEXstep == 3) then
                d("[AH][Exchange]step:FilterCheck")
                  if GetControl("GrandCompanySupplyList"):GetRawData()[347].value == 2 or 3 then
                  mushEXstep = 4
                  else
                  mushEXstep = 10
                  end
              end
              if (mushEXstep == 4) then
                d("[AH][Exchange]step:itemDelivery")
                     if GetControl("GrandCompanySupplyList"):GetRawData()[8].value == 0 then
                     mushEXstep = 10
                     elseif IsControlOpen("GrandCompanySupplyList") then
                     GetControl("GrandCompanySupplyList"):Action("CompleteDelivery",0)
                     mushEXstep = 5
                     else
                     mushEXstep = 0
                     end
              end
              if (mushEXstep == 5) then
                d("[AH][Exchange]step:Deliver to Yes")
                  if IsControlOpen("GrandCompanySupplyReward") then
                  GetControl("GrandCompanySupplyReward"):Action("Deliver")
                  mushEXstep = 6
                  elseif IsControlOpen("SelectYesno") then 
                  UseControlAction("SelectYesno","Yes")
                  mushEXstep = 5
                  elseif IsControlOpen("Request") then 
                  UseControlAction("Request","Cancel")
                  mushEXstep = 10
                  else
                  mushEXstep = 0
                  end
              end
              if (mushEXstep == 6) then
                  if IsControlOpen("GrandCompanySupplyList") then
                  d("[AH][Exchange]step:Repeattask")
                  mushEXstep = 2
                  elseif IsControlOpen("SelectYesno") then
                  mushEXstep = 7
                  end 
              end
              if (mushEXstep == 7) then
                 if AHSET.GCexlessmax == true then
                    d("[AH][Exchange]step:sealsMAX Yes")
                    mushEXstep = 8
                 elseif AHSET.GCexlessmax == false then
                    d("[AH][Exchange]step:sealsMAX No")
                    mushEXstep = 9
                 end 
              end
              if (mushEXstep == 8) then
                  if IsControlOpen("SelectYesno") then
                     UseControlAction("SelectYesno","No")
                      mushEXstep = 10
                  end   
              end
              if (mushEXstep == 9) then
                  if IsControlOpen("SelectYesno") then
                     UseControlAction("SelectYesno","Yes")
                      mushEXstep = 10
                  end   
              end
              if (mushEXstep == 10) then
                d("[AH][Exchange]step:ListClose")
                  if IsControlOpen("GrandCompanySupplyList") then
                  UseControlAction("GrandCompanySupplyList","Close")
                  mushEXstep = 11
                  end 
              end
              if (mushEXstep == 11 ) then
                d("[AH][Exchange]step:END")
                  if IsControlOpen("SelectString") then
                  UseControlAction("SelectString","Close")
                  Player:ClearTarget()
                  mushEXstep = 0
                  GCexchange = false
                  end
              end
              if Player:GetTarget() == nil then
                 GCexchange = false
              end
  end
 end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--seals to items
function AetheryteHelper.mushSealstoItem()
   if (sealstoitem == true and mushtruninGCitem == true and mushtruninGCseals == true) then
     if Player.GrandCompany == 1 then
      GCID2 = tonumber(mushCD2.limsa)
        GCexchangeItems.id[6] = 26518
       elseif Player.GrandCompany == 2 then
        GCID2 = tonumber(mushCD2.Gridania)
        GCexchangeItems.id[6] = 26519
       elseif Player.GrandCompany  == 3 then
        GCID2 = tonumber(mushCD2.Uldah)
        GCexchangeItems.id[6] = 26520
       else sealstoitem = false end
    
              if( mushtoItemstep == 0) then
                 mushlooptimer = 500            
                 Player:SetTarget(GCID2)
                 if Player:GetTarget().Distance < 6 then  
                 Player:Interact(GCID2)
                 end
                 if IsControlOpen("GrandCompanyExchange") then
                 if AHSET.koukanhin == 1 then                           
                 mushtoItemstep = 1
               elseif AHSET.koukanhin == 2 then 
                 mushtoItemstep = 10
               elseif AHSET.koukanhin == 3 then 
                 mushtoItemstep = 20
               elseif AHSET.koukanhin == 4 then 
                 mushtoItemstep = 30
               elseif AHSET.koukanhin == 5 then 
                 mushtoItemstep = 40
               elseif AHSET.koukanhin == 6 then 
                 mushtoItemstep = 50
               else
                sealstoitem = false
                 end
                 end
              end

              if (mushtoItemstep == 1) then
                if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                   UseControlAction("GrandCompanyExchange", "SetRankIndex",0)
                   if GetControl("GrandCompanyExchange"):GetRawData()[3].value == 0 then
                   mushtoItemstep = 2
                   else
                   mushtoItemstep = 1
                   end
                end                  
              end
               if (mushtoItemstep == 2) then
                if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                   UseControlAction("GrandCompanyExchange", "SetTabIndex",0)
                   if GetControl("GrandCompanyExchange"):GetRawData()[68].value == 200 then
                   mushtoItemstep = 3
                   else
                   mushtoItemstep = 2
                   end
                end                   
               end
               if (mushtoItemstep == 3) then
                 if IsControlOpen("GrandCompanyExchange") then
                   GetControl("GrandCompanyExchange"):Action("SelectItem",0,mushhosiikazu)
                   mushtoItemstep = 4
                end
               end
               if (mushtoItemstep == 4) then
                if IsControlOpen("SelectYesno") then
                   UseControlAction("SelectYesno","Yes")
                   mushtoItemstep = 98
                end
               end
              if (mushtoItemstep == 98) then
                if IsControlOpen("SelectYesno") then
                   UseControlAction("SelectYesno"):PushButton(25,0)
                   mushtoItemstep = 99
                elseif IsControlOpen("GrandCompanyExchange") then
                   mushtoItemstep = 99  
                end
              end

               if (mushtoItemstep == 10) then
                if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                   UseControlAction("GrandCompanyExchange", "SetRankIndex",2)
                   if GetControl("GrandCompanyExchange"):GetRawData()[3].value == 2 then
                   mushtoItemstep = 11
                   else
                   mushtoItemstep = 10
                   end
                end                  
              end
              if (mushtoItemstep == 11) then
                if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                   UseControlAction("GrandCompanyExchange", "SetTabIndex",0)
                   if GetControl("GrandCompanyExchange"):GetRawData()[70].value == 600 then
                   mushtoItemstep = 12
                   else
                   mushtoItemstep = 11
                   end
                end
               end
               if (mushtoItemstep == 12) then
                if IsControlOpen("GrandCompanyExchange") then
                   GetControl("GrandCompanyExchange"):Action("SelectItem",2,mushhosiikazu)
                   mushtoItemstep = 4
                end
               end

               if (mushtoItemstep == 20) then
                if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                   UseControlAction("GrandCompanyExchange", "SetRankIndex",2)
                   if GetControl("GrandCompanyExchange"):GetRawData()[3].value == 2 then
                   mushtoItemstep = 21
                   else
                   mushtoItemstep = 20
                   end
                end
              end
              if (mushtoItemstep == 21) then
                if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                   UseControlAction("GrandCompanyExchange", "SetTabIndex",4)
                   if GetControl("GrandCompanyExchange"):GetRawData()[69].value == 7000 then
                   mushtoItemstep = 22
                   else
                   mushtoItemstep = 21
                   end
                end
               end
               if (mushtoItemstep == 22) then
                if IsControlOpen("GrandCompanyExchange") then
                   GetControl("GrandCompanyExchange"):Action("SelectItem",1,mushhosiikazu)
                   mushtoItemstep = 4
                end
               end

               if (mushtoItemstep == 30) then
                if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                   UseControlAction("GrandCompanyExchange", "SetRankIndex",2)
                   if GetControl("GrandCompanyExchange"):GetRawData()[3].value == 2 then
                   mushtoItemstep = 31
                   else
                   mushtoItemstep = 30
                   end
                end                  
              end
              if (mushtoItemstep == 31) then
                if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                   UseControlAction("GrandCompanyExchange", "SetTabIndex",0)
                   if GetControl("GrandCompanyExchange"):GetRawData()[103].value == 20000 then
                   mushtoItemstep = 32
                   else
                   mushtoItemstep = 31
                   end
                end                   
               end
               if (mushtoItemstep == 32) then
                if IsControlOpen("GrandCompanyExchange") then
                   GetControl("GrandCompanyExchange"):Action("SelectItem",35,mushhosiikazu)
                   mushtoItemstep = 4
                end
               end

               if (mushtoItemstep == 40) then
                if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                   UseControlAction("GrandCompanyExchange", "SetRankIndex",2)
                   if GetControl("GrandCompanyExchange"):GetRawData()[3].value == 2 then
                   mushtoItemstep = 41
                   else
                   mushtoItemstep = 40
                   end
                end                  
              end
              if (mushtoItemstep == 41) then
                if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                   UseControlAction("GrandCompanyExchange", "SetTabIndex",0)
                   if GetControl("GrandCompanyExchange"):GetRawData()[104].value == 20000 then
                   mushtoItemstep = 42
                   else
                   mushtoItemstep = 41
                   end
                end                   
               end
               if (mushtoItemstep == 42) then
                if IsControlOpen("GrandCompanyExchange") then
                   GetControl("GrandCompanyExchange"):Action("SelectItem",36,mushhosiikazu)
                   mushtoItemstep = 4
                end
               end

               if (mushtoItemstep == 50) then
                if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                   UseControlAction("GrandCompanyExchange", "SetRankIndex",2)
                   if GetControl("GrandCompanyExchange"):GetRawData()[3].value == 2 then
                   mushtoItemstep = 51
                   else
                   mushtoItemstep = 50
                   end
                end                  
              end
              if (mushtoItemstep == 51) then
                if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                   UseControlAction("GrandCompanyExchange", "SetTabIndex",0)
                   if GetControl("GrandCompanyExchange"):GetRawData()[97].value == 2000 then
                   mushtoItemstep = 52
                   else
                   mushtoItemstep = 51
                   end
                end                   
               end
               if (mushtoItemstep == 52) then
                if IsControlOpen("GrandCompanyExchange") then
                   GetControl("GrandCompanyExchange"):Action("SelectItem",29,mushhosiikazu)
                   mushtoItemstep = 4
                end
               end

              if (mushtoItemstep == 99) then
                if IsControlOpen("GrandCompanyExchange") then
                UseControlAction("GrandCompanyExchange","Close")  
                end
                Player:ClearTarget()
                mushlooptimer = 1000
                sealstoitem = false
                mushtoItemstep = 0
              end

    end
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--

function AetheryteHelper.mushEXchangeTrust(event)
  if Player.GrandCompany == 0 or Player.GrandCompanyRank < 6 then mushTrustmode = false and IsControlOpen("NowLoading") == false end
  local step = 0
  local nohinsoubi = 0
  if(mushTrustmode == true ) then
         if Duty:IsQueued() == true and Duty:GetQueueStatus() == 4 then
               local equip = {1000}
               for _, e in pairs(equip) do
               local equip_item = Inventory:Get(e)
               if (table.valid(equip_item)) then
               local equiplist = equip_item:GetList()
               if (table.valid(equiplist)) then
               for _, item in pairs(equiplist) do
                      if item.Condition < AHSET.mushrepairGear then
                         mushlooptimer = 500
                         Player:Stop()
                         ActionList:Get(5,6):Cast()
                         d("[AH][Tmode]:Repair")
                         if IsControlOpen("Repair") then
                         GetControl("Repair"):PushButton(25,0)
                         if IsControlOpen("SelectYesno") then
                         UseControlAction("SelectYesno","Yes")
                         if IsControlOpen("Repair") then
                         UseControlAction("Repair","Close")  
                         end
                         end
                         end
                      end
               end
               end
               end
               end
         end

        local bags = {0,1,2,3}
        for _, e in pairs(bags) do
        local bag = Inventory:Get(e)
        if (table.valid(bag)) then
        local ilist = bag:GetList()
        if (table.valid(ilist)) then
        for _, item in pairs(ilist) do
           if (item.equipslot > 0 and item.requiredlevel > 1 and item.desynthvalue > 0 and item.Rarity > 1) then 
           nohinsoubi = nohinsoubi + 1
           end
        end
        end
        end
        end
        if nohinsoubi == 0 then GCexchangeT = false end
           

                        if step == 0 then
                           if Duty:IsQueued() == true then
                              Dawncloser = nil
                              mushlooptimer = 5000
                              step = 1
                           elseif nohinsoubi < 1 and sealstoitemT == false and GCexchangeT == false and Duty:IsQueued() == false then
                              Dawncloser = false
                              mushlooptimer = 1000
                              step = 42
                           elseif nohinsoubi > 0 and Duty:IsQueued() == false then
                              Dawncloser = true
                              mushlooptimer = 1000
                              step = 2
                           end
                        end
                        if step == 1 then
                          if Dawncloser == nil then
                            d("[AH][Tmode]:standby:[itemcount:"..nohinsoubi.."]")
                            mushlooptimer = 5000
                            sealstoitemT = false
                            GCexchangeT = false
                            step = 0
                          end
                        end
                        if step == 2 then
                          if Dawncloser == true then
                             d("[AH][TMode]:working")
                            if nohinsoubi == 0 then
                               GCexchangeT = false
                               step = 0
                            elseif mushtruninGCitem == true and mushtruninGCseals == true then
                               d("[AH][TMode]:Trun in")
                               sealstoitemT = true
                               step = 3
                            elseif nohinsoubi > 0 then
                              d("[AH][TMode]:Exchange")
                               GCexchangeT = true
                               step = 30
                            end
                          end
                        end
                        if step == 3 then
                           if (sealstoitemT == true and mushtruninGCitem == true and mushtruninGCseals == true) then
                                mushlooptimer = 500
                             --d("[AH][Tmode][Trunin]:GCselect")
                              if Player.GrandCompany == 1 then
                                 GCID2 = tonumber(mushCD2.limsa)
                                 GCexchangeItems.id[6] = 26518
                                 elseif Player.GrandCompany == 2 then
                                 GCID2 = tonumber(mushCD2.Gridania)
                                 GCexchangeItems.id[6] = 26519
                                 elseif Player.GrandCompany  == 3 then
                                 GCID2 = tonumber(mushCD2.Uldah)
                                 GCexchangeItems.id[6] = 26520
                                 else sealstoitemT = false
                                 step = 0
                               end
                           step = 4
                           end
                        end
    
                        if step == 4 then
                            --d("[AH][Tmode][Trunin]:itemSelect")            
                              Player:SetTarget(GCID2)
                              Player:Interact(GCID2)
                              if IsControlOpen("SelectYesno") then
                              UseControlAction("SelectYesno","Yes")
                              step = 25
                              elseif IsControlOpen("GrandCompanyExchange") then
                                  if AHSET.koukanhin == 1 then                           
                                     step = 5
                                  elseif AHSET.koukanhin == 2 then 
                                     step = 8
                                  elseif AHSET.koukanhin == 3 then 
                                     step = 11
                                  elseif AHSET.koukanhin == 4 then 
                                     step = 14
                                  elseif AHSET.koukanhin == 5 then 
                                     step = 17
                                  elseif AHSET.koukanhin == 6 then 
                                     step = 20
                                  else
                                     sealstoitemT = false
                                     step = 0
                                  end
                              end
                        end
                        if step == 5 then
                            --d("[AH][Tmode][Trunin]step:"..step)
                              if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                              UseControlAction("GrandCompanyExchange", "SetRankIndex",0)
                              if GetControl("GrandCompanyExchange"):GetRawData()[3].value == 0 then
                              step = 6
                              else
                              step = 5
                              end
                              end                  
                        end
                        if step == 6 then
                            --d("[AH][Tmode][Trunin]step:"..step)
                              if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                              UseControlAction("GrandCompanyExchange", "SetTabIndex",0)
                              if GetControl("GrandCompanyExchange"):GetRawData()[68].value == 200 then
                              step = 7
                              else
                              step = 6
                              end
                              end                   
                        end
                        if step == 7 then
                            --d("[AH][Tmode][Trunin]step:"..step)
                              if IsControlOpen("GrandCompanyExchange") then
                              GetControl("GrandCompanyExchange"):Action("SelectItem",0,mushhosiikazu)
                              step = 24
                              end
                        end
                        if step == 8 then
                            --d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                              UseControlAction("GrandCompanyExchange", "SetRankIndex",2)
                              if GetControl("GrandCompanyExchange"):GetRawData()[3].value == 2 then
                              step = 9
                              else
                              step = 8
                              end
                              end                  
                        end
                        if step == 9 then
                            --d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                              UseControlAction("GrandCompanyExchange", "SetTabIndex",0)
                              if GetControl("GrandCompanyExchange"):GetRawData()[70].value == 600 then
                              step = 10
                              else
                              step = 9
                              end
                              end
                        end
                        if step == 10 then
                            --d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") then
                              GetControl("GrandCompanyExchange"):Action("SelectItem",2,mushhosiikazu)
                              step = 24
                              end
                        end
                        if step == 11 then
                            --d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                              UseControlAction("GrandCompanyExchange", "SetRankIndex",2)
                              if GetControl("GrandCompanyExchange"):GetRawData()[3].value == 2 then
                              step = 12
                              else
                              step = 11
                              end
                              end
                        end
                        if step == 12 then
                            --d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                              UseControlAction("GrandCompanyExchange", "SetTabIndex",4)
                              if GetControl("GrandCompanyExchange"):GetRawData()[69].value == 7000 then
                              step = 13
                              else
                              step = 12
                              end
                              end
                        end
                        if step == 13 then
                            --d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") then
                              GetControl("GrandCompanyExchange"):Action("SelectItem",1,mushhosiikazu)
                              step = 24
                              end
                        end
                        if step == 14 then
                            --d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                              UseControlAction("GrandCompanyExchange", "SetRankIndex",2)
                              if GetControl("GrandCompanyExchange"):GetRawData()[3].value == 2 then
                              step = 15
                              else
                              step = 14
                              end
                              end                  
                        end
                        if step == 15 then
                            --d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                              UseControlAction("GrandCompanyExchange", "SetTabIndex",0)
                              if GetControl("GrandCompanyExchange"):GetRawData()[103].value == 20000 then
                              step = 16
                              else
                              step = 15
                              end
                              end                   
                        end
                        if step == 16 then
                            --d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") then
                              GetControl("GrandCompanyExchange"):Action("SelectItem",35,mushhosiikazu)
                              step = 24
                              end
                        end
                        if step == 17 then
                            --d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                              UseControlAction("GrandCompanyExchange", "SetRankIndex",2)
                              if GetControl("GrandCompanyExchange"):GetRawData()[3].value == 2 then
                              step = 18
                              else
                              step = 17
                              end
                              end                  
                        end
                        if step == 18 then
                            --d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                              UseControlAction("GrandCompanyExchange", "SetTabIndex",0)
                              if GetControl("GrandCompanyExchange"):GetRawData()[104].value == 20000 then
                              step = 19
                              else
                              step = 18
                              end
                              end                   
                        end
                        if step == 19 then
                            --d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") then
                              GetControl("GrandCompanyExchange"):Action("SelectItem",36,mushhosiikazu)
                              step = 24
                              end
                        end
                        if step == 20 then
                            --d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                              UseControlAction("GrandCompanyExchange", "SetRankIndex",2)
                              if GetControl("GrandCompanyExchange"):GetRawData()[3].value == 2 then
                              step = 21
                              else
                              step = 20
                              end
                              end                  
                        end
                        if step == 21 then
                            --d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") and GetControl("GrandCompanyExchange") then
                              UseControlAction("GrandCompanyExchange", "SetTabIndex",0)
                              if GetControl("GrandCompanyExchange"):GetRawData()[97].value == 2000 then
                              step = 22
                              else
                              step = 21
                              end
                              end                   
                        end
                        if step == 23 then
                            --d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") then
                              GetControl("GrandCompanyExchange"):Action("SelectItem",29,mushhosiikazu)
                              step = 24
                              end
                        end
                        if step == 24 then
                              if IsControlOpen("SelectYesno") then
                              UseControlAction("SelectYesno","Yes")
                              step = 25
                              end
                        end
                        if step == 25 then
                              if IsControlOpen("SelectYesno") then
                              UseControlAction("SelectYesno"):PushButton(25,0)
                              step = 26
                              elseif IsControlOpen("GrandCompanyExchange") then
                              step = 26  
                              end
                        end
                        if step == 26 then
                            --d("[AH][Tmode][Trunin]step:"..step)
                              if IsControlOpen("GrandCompanyExchange") then
                              UseControlAction("GrandCompanyExchange","Close")
                              end
                              Player:ClearTarget()
                              mushlooptimer = 5000
                              sealstoitemT = false
                              step = 0
                        end
                        

                        if step == 30 then
                             --d("[AH][Tmode][Exchange]step:"..step)
                             --if (GCexchangeT == true) then
                                 mushlooptimer = 1000
                                 if Player.GrandCompany == 1 then GCID1 = tonumber(mushCD1.limsa)   
                                 elseif Player.GrandCompany == 2 then GCID1 = tonumber(mushCD1.Gridania) 
                                 elseif Player.GrandCompany  == 3 then GCID1 = tonumber(mushCD1.Uldah) 
                                 else GCexchangeT = false
                                 end
                                 step = 31
                             --end
                        end
                        if step == 31 then
                            --d("[AH][Tmode][Exchange]step:"..step)
                                Player:SetTarget(GCID1)
                                if Player:GetTarget().Distance < 6 then
                                Player:Interact(GCID1)
                                end
                                if IsControlOpen("SelectString") then                          
                                GetControl("SelectString"):Action("SelectIndex",0)                
                                end
                                step = 32
                        end
                        if step == 32 then
                            --d("[AH][Tmode][Exchange]step:"..step)
                                if IsControlOpen("GrandCompanySupplyList") then
                                --GetControl("GrandCompanySupplyList"):PushButton(25,4)
                                GetControl("GrandCompanySupplyList"):Action("SelectCategory",2)
                                step = 33
                                end
                        end
                        if step == 33 then
                            --d("[AH][Tmode][Exchange]step:"..step)
                                if IsControlOpen("GrandCompanySupplyList") then
                                   if GetControl("GrandCompanySupplyList"):GetData().category ~= 2 then
                                   step = 32 
                                   elseif GetControl("GrandCompanySupplyList"):GetData().category == 2 then
                                   GetControl("GrandCompanySupplyList"):Action("SelectFilterIndex",2)
                                   step = 34
                                   end
                                end
                        end            
                        if step == 34 then
                            --d("[AH][Tmode][Exchange]step:"..step)
                                if GetControl("GrandCompanySupplyList"):GetRawData()[347].value == 0 or 
                                   GetControl("GrandCompanySupplyList"):GetRawData()[347].value == 1 or
                                   GetControl("GrandCompanySupplyList"):GetRawData()[347].value == 2 or
                                   GetControl("GrandCompanySupplyList"):GetRawData()[347].value == 3 then
                                step = 35
                                end
                        end
                        if step == 35 then
                            --d("[AH][Tmode][Exchange]step:"..step)
                                if IsControlOpen("GrandCompanySupplyList") then
                                GetControl("GrandCompanySupplyList"):Action("CompleteDelivery",0)
                                step = 36
                                else
                                step = 32
                                end
                        end
                        if step == 36 then
                            --d("[AH][Tmode][Exchange]step:"..step)
                                if IsControlOpen("GrandCompanySupplyList") then
                                step = 42
                                elseif IsControlOpen("GrandCompanySupplyReward") then
                                GetControl("GrandCompanySupplyReward"):Action("Deliver")
                                step = 32
                                
                                end
                        end
                         if step == 42 then
                          --d("[AH][Tmode][Exchange]step:"..step)
                               if IsControlOpen("GrandCompanySupplyList") then
                               UseControlAction("GrandCompanySupplyList","Close")
                               step = 42
                               else
                               step = 43
                               end
                        end
                         if step == 43 then
                          --d("[AH][Tmode][Exchange]step:"..step)
                               if IsControlOpen("SelectString") then
                               UseControlAction("SelectString","Close")
                               step = 43
                               else
                               step = 44
                               end
                        end
                        if step == 44 then
                          --d("[AH][Tmode][Exchange]step:"..step)
                               Player:ClearTarget()
                               mushlooptimer = 1000
                               step = 45
                        end
                        if step == 45 then
                         d("[AH][TMode]:trust Que waiting")
                              step = 0
                        end       
  end
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--
function AetheryteHelper.undersizeIDswitch()
   if mushundersize == true then
         mushlooptimer = 100    
      if IDUSstep == 0 then
         if ActionList:IsReady() and Duty:IsQueued() == false then
         if IsControlOpen("ContentsFinder") then
         IDUSstep = 5
         else
         ActionList:Get(10,33):Cast()
         IDUSstep = 1
         end
         end
      end
      if IDUSstep == 1 then
         if IsControlOpen("ContentsFinder") then
         GetControl("ContentsFinder"):Action("Settings",0)
         IDUSstep = 2

         end
      end
      if IDUSstep == 2 then
         if IsControlOpen("ContentsFinderSetting") then
             GetControl("ContentsFinderSetting"):PushButton(25,1) 
             IDUSstep = 3
          end
      end
      if IDUSstep == 3 then
          if IsControlOpen("ContentsFinderSetting") then
             GetControl("ContentsFinderSetting"):Action("Confirm",0)
          IDUSstep = 4
          end
      end
      if IDUSstep == 4 then
        d("[AH][undersize switch]complete")
          if IsControlOpen("ContentsFinder") then
             UseControlAction("ContentsFinder","Destroy")
             mushlooptimer = 1000
             mushundersize = false 
          end
      end
      if IDUSstep == 5 then
         if IsControlOpen("ContentsFinder") then
         GetControl("ContentsFinder"):Action("Settings",0)
         IDUSstep = 6

         end
      end
      if IDUSstep == 6 then
         if IsControlOpen("ContentsFinderSetting") then
             GetControl("ContentsFinderSetting"):PushButton(25,1) 
             IDUSstep = 7
          end
      end
      if IDUSstep == 7 then
          if IsControlOpen("ContentsFinderSetting") then
             GetControl("ContentsFinderSetting"):Action("Confirm",0)
          IDUSstep = 8
          end
      end
      if IDUSstep == 8 then
        d("[AH][undersize switch]complete")
             mushlooptimer = 1000
             mushundersize = false 
      end
   end
end

            

function AetheryteHelper.explorerIDswitch()
   if mushExplorer == true then
      mushlooptimer = 100    
      if IDexstep == 0 then
         if ActionList:IsReady() and Duty:IsQueued() == false then
         if IsControlOpen("ContentsFinder") then
         IDexstep = 5 
         else
         ActionList:Get(10,33):Cast()
         IDexstep = 1
         end
         end
      end
      if IDexstep == 1 then
         if IsControlOpen("ContentsFinder") then
         GetControl("ContentsFinder"):Action("Settings",0)
         IDexstep = 2
         end
      end
      if IDexstep == 2 then
         if IsControlOpen("ContentsFinderSetting") then
             GetControl("ContentsFinderSetting"):PushButton(25,5) 
             IDexstep = 3
          end
      end
      if IDexstep == 3 then
          if IsControlOpen("ContentsFinderSetting") then
             GetControl("ContentsFinderSetting"):Action("Confirm",0)
          IDexstep = 4
          end
      end
      if IDexstep == 4 then
        d("[AH][Explorer switch]complete")
          if IsControlOpen("ContentsFinder") then
             UseControlAction("ContentsFinder","Destroy")
             mushlooptimer = 1000
             mushExplorer = false 
          end
      end
      if IDexstep == 5 then
         if IsControlOpen("ContentsFinder") then
         GetControl("ContentsFinder"):Action("Settings",0)
         IDexstep = 6
         end
      end
      if IDexstep == 6 then
         if IsControlOpen("ContentsFinderSetting") then
             GetControl("ContentsFinderSetting"):PushButton(25,5) 
             IDexstep = 7
          end
      end
      if IDexstep == 7 then
          if IsControlOpen("ContentsFinderSetting") then
             GetControl("ContentsFinderSetting"):Action("Confirm",0)
          IDexstep = 8
          end
      end
      if IDexstep == 8 then
        d("[AH][Explorer switch]complete")
             mushlooptimer = 1000
             mushExplorer = false 
      end
   end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--
function AetheryteHelper.Jumbocactpothelper()
    local jbc11 = AHSET.jumbo11
    local jbc12 = AHSET.jumbo12
    local jbc13 = AHSET.jumbo13
    local jbc14 = AHSET.jumbo14
    local jbc21 = AHSET.jumbo21
    local jbc22 = AHSET.jumbo22
    local jbc23 = AHSET.jumbo23
    local jbc24 = AHSET.jumbo24
    local jbc31 = AHSET.jumbo31
    local jbc32 = AHSET.jumbo32
    local jbc33 = AHSET.jumbo33
    local jbc34 = AHSET.jumbo34
if (mushJumbocactpothelper) then
     if mushGSjcpstep == 0 then
        mushlooptimer = 100
        Player:SetTarget(4299949120)
        if Player:GetTarget().Distance < 6 then
        Player:Interact(4299949120)
        end
        mushGSjcpstep = 1
       --d("mushGSjcpstep"..mushGSjcpstep)
     end

     if mushGSjcpstep == 1 then
       if IsControlOpen("Talk") then                           
          UseControlAction("Talk", "Close")
          mushGSjcpstep = 2
       end
       --d("mushGSjcpstep"..mushGSjcpstep)
     end
     if mushGSjcpstep == 2 then
       if IsControlOpen("SelectString") then                           
          UseControlAction("SelectString","SelectIndex",0)
          mushlooptimer = 3000
          mushGSjcpstep = 3
       end
       --d("mushGSjcpstep"..mushGSjcpstep)
     end

     if mushGSjcpstep == 3 then
       if IsControlOpen("LotteryWeeklyInput")then
          mushGSjcpstep = 4
       elseif IsControlOpen("LotteryWeeklyRewardList") then
          mushlooptimer = 100 
          mushGSjcpstep = 38
       end 
       --d("mushGSjcpstep"..mushGSjcpstep)
     end

     if mushGSjcpstep == 4 then
       if IsControlOpen("LotteryWeeklyInput") then
            if mushJumbocactpotrandom1 == true then
            mushGSjcpstep = 9
            elseif mushJumbocactpotrandom1 == false then
            mushGSjcpstep = 5
            end
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
     if mushGSjcpstep == 5 then
       if IsControlOpen("LotteryWeeklyInput") then
            GetControl("LotteryWeeklyInput"):PushButton(25,jbc11+8)
            mushGSjcpstep = 6
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
     if mushGSjcpstep == 6 then
       if IsControlOpen("LotteryWeeklyInput") then
            GetControl("LotteryWeeklyInput"):PushButton(25,jbc12+8)
            mushGSjcpstep = 7 
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
    if mushGSjcpstep == 7 then
       if IsControlOpen("LotteryWeeklyInput") then
            GetControl("LotteryWeeklyInput"):PushButton(25,jbc13+8)
            mushGSjcpstep = 8       
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
    if mushGSjcpstep == 8 then
       if IsControlOpen("LotteryWeeklyInput") then
            GetControl("LotteryWeeklyInput"):PushButton(25,jbc14+8)
            mushGSjcpstep = 10       
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
    if mushGSjcpstep == 9 then
       if IsControlOpen("LotteryWeeklyInput") then
            GetControl("LotteryWeeklyInput"):PushButton(25,2)
            mushGSjcpstep = 10
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
    if mushGSjcpstep == 10 then
       if IsControlOpen("LotteryWeeklyInput") then
            GetControl("LotteryWeeklyInput"):PushButton(25,1)
            mushGSjcpstep = 11
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
   if mushGSjcpstep == 11 then
         if IsControlOpen("SelectYesno") then
         UseControlAction("SelectYesno","Yes")
         mushGSjcpstep = 11
         elseif IsControlOpen("LotteryWeeklyInput") then
         mushGSjcpstep = 20
         end
        --d("mushGSjcpstep"..mushGSjcpstep)
     end
    if mushGSjcpstep == 20 then
       if IsControlOpen("LotteryWeeklyInput") then
            if mushJumbocactpotrandom2 == true then
            mushGSjcpstep = 25
            elseif mushJumbocactpotrandom2 == false then
            mushGSjcpstep = 21
            end
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
     if mushGSjcpstep == 21 then
       if IsControlOpen("LotteryWeeklyInput") then
            GetControl("LotteryWeeklyInput"):PushButton(25,jbc21+8)
            mushGSjcpstep = 22
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
     if mushGSjcpstep == 22 then
       if IsControlOpen("LotteryWeeklyInput") then
            GetControl("LotteryWeeklyInput"):PushButton(25,jbc22+8)
            mushGSjcpstep = 23 
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
    if mushGSjcpstep == 23 then
       if IsControlOpen("LotteryWeeklyInput") then
            GetControl("LotteryWeeklyInput"):PushButton(25,jbc23+8)
            mushGSjcpstep = 24       
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
    if mushGSjcpstep == 24 then
       if IsControlOpen("LotteryWeeklyInput") then
            GetControl("LotteryWeeklyInput"):PushButton(25,jbc24+8)
            mushGSjcpstep = 26       
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
    if mushGSjcpstep == 25 then
       if IsControlOpen("LotteryWeeklyInput") then
            GetControl("LotteryWeeklyInput"):PushButton(25,2)
            mushGSjcpstep = 26
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
    if mushGSjcpstep == 26 then
       if IsControlOpen("LotteryWeeklyInput") then
            GetControl("LotteryWeeklyInput"):PushButton(25,1)
            mushGSjcpstep = 27
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
    if mushGSjcpstep == 27 then
         if IsControlOpen("SelectYesno") then
         UseControlAction("SelectYesno","Yes")
         mushGSjcpstep = 27
         elseif IsControlOpen("LotteryWeeklyInput") then
         mushGSjcpstep = 30
         end
        --d("mushGSjcpstep"..mushGSjcpstep)
     end
        if mushGSjcpstep == 30 then
       if IsControlOpen("LotteryWeeklyInput") then
            if mushJumbocactpotrandom3 == true then
            mushGSjcpstep = 35
            elseif mushJumbocactpotrandom3 == false then
            mushGSjcpstep = 31
            end
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
     if mushGSjcpstep == 31 then
       if IsControlOpen("LotteryWeeklyInput") then
            GetControl("LotteryWeeklyInput"):PushButton(25,jbc31+8)
            mushGSjcpstep = 32
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
     if mushGSjcpstep == 32 then
       if IsControlOpen("LotteryWeeklyInput") then
            GetControl("LotteryWeeklyInput"):PushButton(25,jbc32+8)
            mushGSjcpstep = 33 
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
    if mushGSjcpstep == 33 then
       if IsControlOpen("LotteryWeeklyInput") then
            GetControl("LotteryWeeklyInput"):PushButton(25,jbc33+8)
            mushGSjcpstep = 34       
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
    if mushGSjcpstep == 34 then
       if IsControlOpen("LotteryWeeklyInput") then
            GetControl("LotteryWeeklyInput"):PushButton(25,jbc34+8)
            mushGSjcpstep = 36       
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
    if mushGSjcpstep == 35 then
       if IsControlOpen("LotteryWeeklyInput") then
            GetControl("LotteryWeeklyInput"):PushButton(25,2)
            mushGSjcpstep = 36
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
    if mushGSjcpstep == 36 then
       if IsControlOpen("LotteryWeeklyInput") then
            GetControl("LotteryWeeklyInput"):PushButton(25,1)
            mushlooptimer = 100
            mushGSjcpstep = 37
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
     if mushGSjcpstep == 37 then
         if IsControlOpen("SelectYesno") then
         UseControlAction("SelectYesno","Yes")
         mushGSjcpstep = 37
         elseif IsControlOpen("SelectString") then
         mushlooptimer = 100 
         mushGSjcpstep = 39
         end
        --d("mushGSjcpstep"..mushGSjcpstep)
     end
     if mushGSjcpstep == 38 then
       if IsControlOpen("LotteryWeeklyRewardList") then                           
          UseControlAction("LotteryWeeklyRewardList", "Close")
          mushGSjcpstep = 39
       end
       --d("mushGSjcpstep"..mushGSjcpstep)
     end
     if mushGSjcpstep == 39 then
          if IsControlOpen("SelectString") then                           
             UseControlAction("SelectString", "SelectIndex",4)
             mushGSjcpstep = 40

          end
          --d("mushGSjcpstep"..mushGSjcpstep)
     end
     if mushGSjcpstep == 40 then
          if IsControlOpen("Talk") then                           
             UseControlAction("Talk", "Click")
             mushGSjcpstep = 40             
          else 
             mushlooptimer = 1000
             mushJumbocactpothelper = false
          end
     end

   end       
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Desynthesis filter

function AetheryteHelper.SalvageAll()
     local bags = {0, 1, 2, 3}
     for _, e in pairs(bags) do
     local bag = Inventory:Get(e)
     if (table.valid(bag)) then
     local ilist = bag:GetList()
     if (table.valid(ilist)) then
     for _, item in pairs(ilist) do
     local equipflag = item.equipslot > 0 and item.requiredlevel > 1 and item.desynthvalue > 0 and item.level > AHSET.dminil and item.level < AHSET.dmaxil
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.desynthvalue > 0) then
      mushlooptimer = 1000
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      end
      end
      end
end


function AetheryteHelper.Salvagefilter()
     local bags = {0, 1, 2, 3}
     for _, e in pairs(bags) do
     local bag = Inventory:Get(e)
     if (table.valid(bag)) then
     local ilist = bag:GetList()
     if (table.valid(ilist)) then
     for _, item in pairs(ilist) do
     local equipflag = item.equipslot > 0 and item.requiredlevel > 1 and item.desynthvalue > 0 and item.level > AHSET.dminil and item.level < AHSET.dmaxil
      if (eqFilter.Main) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13)) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end

---alljob
   
      if (eqFilter.Head) and ( AHeqjob.ALL ) then                     
      if (equipflag and item.Equipslot == 3 and item.category == 1) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Body) and ( AHeqjob.ALL ) then                     
      if (equipflag and item.Equipslot == 4 and item.category == 1) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Hand) and ( AHeqjob.ALL ) then                     
      if (equipflag and item.Equipslot == 5 and item.category == 1) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Legs) and ( AHeqjob.ALL ) then                     
      if (equipflag and item.Equipslot == 7 and item.category == 1) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Feet) and ( AHeqjob.ALL ) then                     
      if (equipflag and item.Equipslot == 8 and item.category == 1) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Earrings) and ( AHeqjob.ALL ) then                     
      if (equipflag and item.Equipslot == 9 and item.category == 1) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Necklace) and ( AHeqjob.ALL ) then                     
      if (equipflag and item.Equipslot == 10 and item.category == 1) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Bracelets) and ( AHeqjob.ALL ) then                     
      if (equipflag and item.Equipslot == 11 and item.category == 1) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Ring) and ( AHeqjob.ALL )  then                     
      if (equipflag and item.Equipslot == 12 and item.category == 1) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
         
---tank

      if (eqFilter.Head) and ( AHeqjob.Tank ) then                     
      if (equipflag and item.Equipslot == 3 and item.category == 59) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Body) and ( AHeqjob.Tank ) then                     
      if (equipflag and item.Equipslot == 4 and item.category == 59) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Hand) and ( AHeqjob.Tank ) then                     
      if (equipflag and item.Equipslot == 5 and item.category == 59) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Legs) and ( AHeqjob.Tank ) then                     
      if (equipflag and item.Equipslot == 7 and item.category == 59) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Feet) and ( AHeqjob.Tank ) then                     
      if (equipflag and item.Equipslot == 8 and item.category == 59) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Earrings) and ( AHeqjob.Tank ) then                     
      if (equipflag and item.Equipslot == 9 and item.category == 59) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Necklace) and ( AHeqjob.Tank ) then                     
      if (equipflag and item.Equipslot == 10 and item.category == 59) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Bracelets) and ( AHeqjob.Tank ) then                     
      if (equipflag and item.Equipslot == 11 and item.category == 59) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Ring) and ( AHeqjob.Tank )  then                     
      if (equipflag and item.Equipslot == 12 and item.category == 59) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
         

      if (eqFilter.Head) and ( AHeqjob.Healer ) then                     
      if (equipflag and item.Equipslot == 3 and item.category == 64) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Body) and ( AHeqjob.Healer ) then                     
      if (equipflag and item.Equipslot == 4 and item.category == 64) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Hand) and ( AHeqjob.Healer ) then                     
      if (equipflag and item.Equipslot == 5 and item.category == 64) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Legs) and ( AHeqjob.Healer ) then                     
      if (equipflag and item.Equipslot == 7 and item.category == 64) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Feet) and ( AHeqjob.Healer ) then                     
      if (equipflag and item.Equipslot == 8 and item.category == 64) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Earrings) and ( AHeqjob.Healer ) then                     
      if (equipflag and item.Equipslot == 9 and item.category == 64) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Necklace) and ( AHeqjob.Healer ) then                     
      if (equipflag and item.Equipslot == 10 and item.category == 64) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Bracelets) and ( AHeqjob.Healer ) then                     
      if (equipflag and item.Equipslot == 11 and item.category == 64) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Ring) and ( AHeqjob.Healer )  then                     
      if (equipflag and item.Equipslot == 12 and item.category == 64) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
         
---slaying
  
      if (eqFilter.Head) and ( AHeqjob.Slaying ) then                     
      if (equipflag and item.Equipslot == 3 and item.category == 84) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Body) and ( AHeqjob.Slaying ) then                     
      if (equipflag and item.Equipslot == 4 and item.category == 84) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Hand) and ( AHeqjob.Slaying ) then                     
      if (equipflag and item.Equipslot == 5 and item.category == 84) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Legs) and ( AHeqjob.Slaying ) then                     
      if (equipflag and item.Equipslot == 7 and item.category == 84) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Feet) and ( AHeqjob.Slaying ) then                     
      if (equipflag and item.Equipslot == 8 and item.category == 84) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Earrings) and ( AHeqjob.Slaying ) then                     
      if (equipflag and item.Equipslot == 9 and item.category == 84) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Necklace) and ( AHeqjob.Slaying ) then                     
      if (equipflag and item.Equipslot == 10 and item.category == 84) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Bracelets) and ( AHeqjob.Slaying ) then                     
      if (equipflag and item.Equipslot == 11 and item.category == 84) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Ring) and ( AHeqjob.Slaying )  then                     
      if (equipflag and item.Equipslot == 12 and item.category == 84) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
         
---striking
     
      if (eqFilter.Head) and ( AHeqjob.Striking ) then                     
      if (equipflag and item.Equipslot == 3 and item.category == 65) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Body) and ( AHeqjob.Striking ) then                     
      if (equipflag and item.Equipslot == 4 and item.category == 65) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Hand) and ( AHeqjob.Striking ) then                     
      if (equipflag and item.Equipslot == 5 and item.category == 65) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Legs) and ( AHeqjob.Striking ) then                     
      if (equipflag and item.Equipslot == 7 and item.category == 65) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Feet) and ( AHeqjob.Striking ) then                     
      if (equipflag and item.Equipslot == 8 and item.category == 65) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end

---aiming      
       
      if (eqFilter.Head) and ( AHeqjob.Aiming ) then                     
      if (equipflag and item.Equipslot == 3 and item.category == 66) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Body) and ( AHeqjob.Aiming ) then                     
      if (equipflag and item.Equipslot == 4 and item.category == 66) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Hand) and ( AHeqjob.Aiming ) then                     
      if (equipflag and item.Equipslot == 5 and item.category == 66) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Legs) and ( AHeqjob.Aiming ) then                     
      if (equipflag and item.Equipslot == 7 and item.category == 66) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Feet) and ( AHeqjob.Aiming ) then                     
      if (equipflag and item.Equipslot == 8 and item.category == 66) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Earrings) and ( AHeqjob.Aiming ) then                     
      if (equipflag and item.Equipslot == 9 and item.category == 105) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Necklace) and ( AHeqjob.Aiming ) then                     
      if (equipflag and item.Equipslot == 10 and item.category == 105) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Bracelets) and ( AHeqjob.Aiming ) then                     
      if (equipflag and item.Equipslot == 11 and item.category == 105) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Ring) and ( AHeqjob.Aiming )  then                     
      if (equipflag and item.Equipslot == 12 and item.category == 105) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
         
---sorcerer

      if (eqFilter.Head) and ( AHeqjob.Sorcerer ) then                     
      if (equipflag and item.Equipslot == 3 and item.category == 63) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Body) and ( AHeqjob.Sorcerer ) then                     
      if (equipflag and item.Equipslot == 4 and item.category == 63) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Hand) and ( AHeqjob.Sorcerer ) then                     
      if (equipflag and item.Equipslot == 5 and item.category == 63) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Legs) and ( AHeqjob.Sorcerer ) then                     
      if (equipflag and item.Equipslot == 7 and item.category == 63) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Feet) and ( AHeqjob.Sorcerer ) then                     
      if (equipflag and item.Equipslot == 8 and item.category == 63) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Earrings) and ( AHeqjob.Sorcerer ) then                     
      if (equipflag and item.Equipslot == 9 and item.category == 63) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Necklace) and ( AHeqjob.Sorcerer ) then                     
      if (equipflag and item.Equipslot == 10 and item.category == 63) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end 
      if (eqFilter.Bracelets) and ( AHeqjob.Sorcerer ) then                     
      if (equipflag and item.Equipslot == 11 and item.category == 63) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Ring) and ( AHeqjob.Sorcerer )  then                     
      if (equipflag and item.Equipslot == 12 and item.category == 63) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
         
---maiming

      if (eqFilter.Head) and ( AHeqjob.Maiming ) then                     
      if (equipflag and item.Equipslot == 3 and item.category == 76) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Body) and ( AHeqjob.Maiming ) then                     
      if (equipflag and item.Equipslot == 4 and item.category == 76) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Hand) and ( AHeqjob.Maiming ) then                     
      if (equipflag and item.Equipslot == 5 and item.category == 76) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Legs) and ( AHeqjob.Maiming ) then                     
      if (equipflag and item.Equipslot == 7 and item.category == 76) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Feet) and ( AHeqjob.Maiming ) then                     
      if (equipflag and item.Equipslot == 8 and item.category == 76) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end

---scouting

      if (eqFilter.Head) and ( AHeqjob.Scouting ) then                     
      if (equipflag and item.Equipslot == 3 and item.category == 103) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Body) and ( AHeqjob.Scouting ) then                     
      if (equipflag and item.Equipslot == 4 and item.category == 103) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Hand) and ( AHeqjob.Scouting ) then                     
      if (equipflag and item.Equipslot == 5 and item.category == 103) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Legs) and ( AHeqjob.Scouting ) then                     
      if (equipflag and item.Equipslot == 7 and item.category == 103) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Feet) and ( AHeqjob.Scouting ) then                     
      if (equipflag and item.Equipslot == 8 and item.category == 103) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end

---gatherer

      if (eqFilter.Main) and ( AHeqjob.Gatherer ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13)
        and (item.category == 17 or item.category == 18 or item.category == 19))then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Sub) and ( AHeqjob.Gatherer ) then                     
      if (equipflag and item.Equipslot == 2
        and (item.category == 17 or item.category == 18 or item.category == 19)) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Head) and ( AHeqjob.Gatherer ) then                     
      if (equipflag and item.Equipslot == 3  and item.category == 32 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Body) and ( AHeqjob.Gatherer ) then                     
      if (equipflag and item.Equipslot == 4  and item.category == 32 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Hand) and ( AHeqjob.Gatherer ) then                     
      if (equipflag and item.Equipslot == 5  and item.category == 32 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Legs) and ( AHeqjob.Gatherer ) then                     
      if (equipflag and item.Equipslot == 7  and item.category == 32 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Feet) and ( AHeqjob.Gatherer ) then                     
      if (equipflag and item.Equipslot == 8  and item.category == 32 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Earrings) and ( AHeqjob.Gatherer ) then                     
      if (equipflag and item.Equipslot == 9  and item.category == 32 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Necklace) and ( AHeqjob.Gatherer ) then                     
      if (equipflag and item.Equipslot == 10  and item.category == 32 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Bracelets) and ( AHeqjob.Gatherer ) then                     
      if (equipflag and item.Equipslot == 11  and item.category == 32 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Ring) and ( AHeqjob.Gatherer ) then                     
      if (equipflag and item.Equipslot == 12  and item.category == 32 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end

---crafter   

      if (eqFilter.Main) and ( AHeqjob.Crafter ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13)
        and (item.category == 9 or item.category == 10 or item.category == 11 or item.category == 12 or item.category == 13 or item.category == 14 or item.category == 15 or item.category == 16))then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Sub) and ( AHeqjob.Crafter ) then                     
      if (equipflag and item.Equipslot == 2
        and (item.category == 9 or item.category == 10 or item.category == 11 or item.category == 12 or item.category == 13 or item.category == 14 or item.category == 15 or item.category == 16)) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Head) and ( AHeqjob.Crafter ) then                     
      if (equipflag and item.Equipslot == 3  and item.category == 33 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Body) and ( AHeqjob.Crafter ) then                     
      if (equipflag and item.Equipslot == 4  and item.category == 33 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Hand) and ( AHeqjob.Crafter ) then                     
      if (equipflag and item.Equipslot == 5  and item.category == 33 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Legs) and ( AHeqjob.Crafter ) then                     
      if (equipflag and item.Equipslot == 7  and item.category == 33 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Feet) and ( AHeqjob.Crafter ) then                     
      if (equipflag and item.Equipslot == 8  and item.category == 33 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Earrings) and ( AHeqjob.Crafter ) then                     
      if (equipflag and item.Equipslot == 9  and item.category == 33 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Necklace) and ( AHeqjob.Crafter ) then                     
      if (equipflag and item.Equipslot == 10  and item.category == 33 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end 
      if (eqFilter.Bracelets) and ( AHeqjob.Crafter ) then                     
      if (equipflag and item.Equipslot == 11  and item.category == 33 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Ring) and ( AHeqjob.Crafter ) then                     
      if (equipflag and item.Equipslot == 12  and item.category == 33 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end

---Weapon   

      if (eqFilter.Main) and ( AHeqjob.PLD ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 38) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Main) and ( AHeqjob.WAR ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 44 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Main) and ( AHeqjob.DRK ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 98 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Main) and ( AHeqjob.GNB ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 149 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Main) and ( AHeqjob.WHM ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 53 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Main) and ( AHeqjob.SCH ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and (item.category == 29 or item.category == 68 )) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Main) and ( AHeqjob.AST ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 99 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Main) and ( AHeqjob.SGE ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 181 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Main) and ( AHeqjob.MNK ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 41 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Main) and ( AHeqjob.DRG ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 47 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Main) and ( AHeqjob.SAM ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 111 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Main) and ( AHeqjob.NIN ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 93 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Main) and ( AHeqjob.RPR ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 180 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Main) and ( AHeqjob.BRD ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 50 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Main) and ( AHeqjob.MCN ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 96 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Main) and ( AHeqjob.DNC ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 150 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Main) and ( AHeqjob.BLM ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 55 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Main) and ( AHeqjob.RDM ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 112 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Main) and ( AHeqjob.SMN ) then                     
      if (equipflag and (item.Equipslot == 1 or item.Equipslot == 13) and (item.category == 28 or item.category == 68 or item.category == 69 )) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end

      if (eqFilter.Sub) and ( AHeqjob.WHM ) or ( AHeqjob.BLM )then                     
      if (equipflag and item.Equipslot == 2 and item.category == 56 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end
      if (eqFilter.Sub) and ( AHeqjob.PLD )then                     
      if (equipflag and item.Equipslot == 2 and item.category == 38 ) then
      if(ActionList:IsReady()) then
      item:Salvage()     
      return
      end
      end
      end

      end
      end
      end
      end

end

---------------------------------------------------------------------------------------------------------------------------------------------------
function AetheryteHelper.nonAFK()
  if Player.OnlineStatus == 17 then
     mushlooptimer = 100
    if Player:IsMoving() or Player.LastAction == 33 or Player.LastAction == 85 or IsControlOpen("MaterializeDialog") or
       Player.LastAction == 87 or Player.LastAction == 3191 or FFXIV_Common_BotRunning == true then
       SendTextCommand("/afk")
       mushlooptimer = 1000
    end
  end
end

---------------------------------------------------------------------------------------------------------------------------------------------------
-- sub function
function AetheryteHelper.mushMaterialize()
   if (AHSET.DesynthTrust == true ) or ( mushTrustmode == true ) then
         if (AHSET.isMateriaEnabled and Player.IsMounted == false and Player:GetTarget() == nil and Duty:GetQueueStatus() == 4 ) then 
            if (IsControlOpen("MaterializeDialog") and GetControlData("MaterializeDialog")) then
            UseControlAction("MaterializeDialog","Yes")
            return
            end
            local bags = {1000, 3200, 3201, 3202, 3203, 3204, 3205, 3206, 3207, 3208, 3209, 3300, 3500}
            for _, e in pairs(bags) do
            local bag = Inventory:Get(e)
            if (table.valid(bag)) then
            local ilist = bag:GetList()
            if (table.valid(ilist)) then
            for _, item in pairs(ilist) do
            if (item.spiritbond == 100 and item:CanCast(5, 14)) then
               mushlooptimer = 1500
               if(ActionList:IsReady()) then
               item:Convert()
               return
               end
            end
            end
            end
            end
            end
         end
   elseif (AHSET.DesynthTrust == false ) and ( mushTrustmode == false ) then
      if(AHSET.isMateriaEnabled and Player.IsMounted == false and Player:GetTarget() == nil and not IsControlOpen("Trade")) then
            if (IsControlOpen("MaterializeDialog") and GetControlData("MaterializeDialog")) then
            UseControlAction("MaterializeDialog","Yes")
            return
            end
            local bags = {1000, 3200, 3201, 3202, 3203, 3204, 3205, 3206, 3207, 3208, 3209, 3300, 3500}
            for _, e in pairs(bags) do
            local bag = Inventory:Get(e)
            if (table.valid(bag)) then
            local ilist = bag:GetList()
            if (table.valid(ilist)) then
            for _, item in pairs(ilist) do
            if (item.spiritbond == 100 and item:CanCast(5, 14)) then
               mushlooptimer = 1500
               if(ActionList:IsReady()) then
               item:Convert()
               return
               end
            end
            end
            end
            end
            end
      end
   end
end


function AetheryteHelper.mushpotionmanual()
       if (Player.CurrentAction ~= 92) then
       if (IsControlOpen("SalvageResult")) then
           UseControlAction("SalvageResult", "Close")
       end
       if (Player.incombat or Busy()) then
       return
       end
    if (AHSET.isMateriaEnabled and AHSET.isPotionEnabled and MissingBuffs(Player,"49")) then
      local potionid = {7059, 19885, 27960}
      --錬精薬　強錬精薬　極錬精薬
      for i = 0, 3 do
        for _, id in pairs(potionid) do
        local potion = Inventory:Get(i):Get(id)
        if (potion and potion:GetAction():IsReady()) then
        mushlooptimer = 100
        potion:Cast()
        return
        end
        end
      end
    end
    if (AHSET.isMateriaEnabled and AHSET.isManualEnabled and MissingBuffs(Player,"1083")) then
      local manualid = {14951}
      --スピリットマニュアル
      for i = 0, 3 do
        for _, id in pairs(manualid) do
        local manual = Inventory:Get(i):Get(id)
        if (manual and manual:GetAction():IsReady()) then
        mushlooptimer = 100
        manual:Cast()
        return
        end
        end
      end
    end
   end
  end

function AetheryteHelper.mushsRemateria()
    AetheryteHelper.Inventoryfree()
    local seisen = ActionList:Get(5,14)
    if seisen.usable == false then Remateria = false end
    if (Remateria) then
        if mushPbtotal < 1 then
        Remateria = false
        end
        if (Player.IsMounted == false and Player:GetTarget() == nil and Duty:IsQueued() == false and not IsControlOpen("Trade")) then
        if (IsControlOpen("MateriaRetrieveDialog")) then
        UseControlAction("MateriaRetrieveDialog"):PushButton(25,0)
        return
        end
        local bags = {0,1,2,3}
        for _, e in pairs(bags) do
        local bag = Inventory:Get(e)
        if (table.valid(bag)) then
        local ilist = bag:GetList()
        if (table.valid(ilist)) then
        local materia = 0
        for _, item in pairs(ilist) do
        materia = materia + table.size(item.materias)
        end
        --if materia == 0 then
        --Remateria = false
        --end
        for _, item in pairs(ilist) do
        if table.size(item.materias) > 0 and item.equipslot > 0 and item.requiredlevel > 1 then
          mushlooptimer = 1000
          if ActionList:IsReady() then
          d("[AH][RetrieveMateria]:Count["..materia.."]")
          item:RetrieveMateria()
          return
          end
        elseif table.size(item.materias) == 0 and item.equipslot > 0 and item.requiredlevel > 1 then
          Remateria = false

        end
        end
        end
        end
        end
        end
  end
 end

function AetheryteHelper.mushsubAR()
    AetheryteHelper.Inventoryfree()
       if (AHSET.isQuestmode == true and mushPbtotal < 5 and FFXIV_Common_BotRunning == true ) then
           Player:Stop()
           ml_global_information.ToggleRun()
       end       
       local syusyuhin = 0
       if (AHSET.isQuestmode == true and FFXIV_Common_BotRunning == false and Player.IsMounted == false and not IsControlOpen("Trade")) then
           if (IsControlOpen("PurifyResult")) then
           UseControlAction("PurifyResult", "Close")
           return
           end
           if (IsControlOpen("GatheringMasterpiece")) then
           UseControlAction("GatheringMasterpiece", "Destroy")
           Player:ClearTarget()
           end
           if (IsControlOpen("Gathering")) then
           UseControlAction("Gathering", "Close")
           Player:ClearTarget()
           end
             local bags = {0, 1, 2, 3}
             for _, e in pairs(bags) do
             local bag = Inventory:Get(e)
             if (table.valid(bag)) then
             local Rlist = bag:GetList()
             if (table.valid(Rlist)) then
             for _, item in pairs(Rlist) do
             if( item.IsCollectable == true and item.IsBinding == true ) then
              mushtoItemstep = 1000
              syusyuhin = syusyuhin + 1
              if(ActionList:IsReady()) then
              item:Purify()
              return
              end
             end
             end
             end
             end
             end
             if syusyuhin == 0 then
               mushtoItemstep = 1000
               if (IsControlOpen("PurifyResult")) then
               UseControlAction("PurifyResult", "Close")
               end
               if( AHSET.isQuestmode == true and FFXIV_Common_BotRunning == false and mushPbtotal > 5 ) then
               ml_global_information.ToggleRun()
               end
             end
       end
        
    
    if (AHSET.isReductionEnabled == true and Player.IsMounted == false and Player:GetTarget() == nil and not IsControlOpen("Trade")) then
        if (IsControlOpen("PurifyResult")) then
          UseControlAction("PurifyResult", "Close")
        return
        end
        local bags = {0, 1, 2, 3}
        for _, e in pairs(bags) do
        local bag = Inventory:Get(e)
        if (table.valid(bag)) then
        local Rlist = bag:GetList()
        if (table.valid(Rlist)) then
        for _, item in pairs(Rlist) do        
        if( item.IsCollectable == true and item.IsBinding == true) then
          syusyuhin = syusyuhin + 1
          mushlooptimer = 1000
           if(ActionList:IsReady()) then
           item:Purify()         
           return
           end
        end
        end
        end
        end
        end
        if syusyuhin == 0 then AHSET.isReductionEnabled = false end
    end
end

function AetheryteHelper.Desynthseis()
if (AHSET.DesynthTrust) then
       if (AHSET.isSalvageEnabled and Player.IsMounted == false and Player:GetTarget() == nil and not IsControlOpen("Trade") and Duty:GetQueueStatus() == 4 ) then
       mushlooptimer = 1000
       if (IsControlOpen("SalvageDialog") and GetControlData("SalvageDialog")) then
       UseControlAction("SalvageDialog","Confirm")
       end
       if (AHSET.isReductionOption)then    
          AetheryteHelper.Salvagefilter()
       else
          AetheryteHelper.SalvageAll()
       end
       end      
   elseif (AHSET.isSalvageEnabled and Player.IsMounted == false and Player:GetTarget() == nil and not IsControlOpen("Trade")) then   
       mushlooptimer = 1000
       if (IsControlOpen("SalvageDialog") and GetControlData("SalvageDialog")) then
       UseControlAction("SalvageDialog","Confirm")
       end
       if (AHSET.isReductionOption)then
          AetheryteHelper.Salvagefilter()
       else
          AetheryteHelper.SalvageAll()
       end
     end
end



function AetheryteHelper.itemsort()
        local nonmaxitem = {}
        local jufuku = 0
        local bags = {0, 1, 2, 3}
     if AHitemsort then
        mushlooptimer = 100
        for _, e in pairs(bags) do
        local bag = Inventory:Get(e)
        if (table.valid(bag)) then
        local ilist = bag:GetList()
        if (table.valid(ilist)) then
        for _, item in pairs(ilist) do
          if item.count ~= item.max then
            table.insert(nonmaxitem,item)
          end
        end
        end
        end
        end
          for i = 1,tonumber(#nonmaxitem),1 do
             for k,v in pairs(nonmaxitem) do
              if k == i then
                 for key,val in pairs(nonmaxitem) do
                    if v.hqid == val.hqid and k ~= key then
                       jufuku = jufuku + 1
                       v:Move(0,0)
                    end
                 end
              end
             end
          end
          d("[AH][ItemSort]num of items to separated:"..jufuku)
          if jufuku == 0 then
          Inventory:SortInventory()
          mushlooptimer = 1000
          AHitemsort = false
          end
      end
end




function AetheryteHelper.voteMVP()
   if (MIP.Enable) then
     if Player.Targetable == true and IsControlOpen("NowLoading") == false then
     if MIPstep == 0 then
        if IsControlOpen("_NotificationIcMvp") then
        mushlooptimer = 200
        UseControlAction("_NotificationIcMvp","OpenVoteMvp")
        if IsControlOpen("VoteMvp") then
        MIPstep = 1
        else
        MIPstep = 0
        end
        end
      end
      if MIPstep == 1 then
        if IsControlOpen("VoteMvp") then
        UseControlAction("VoteMvp","SelectIndex",mushmipselect)
        d("[AH][MIP][[SelectIndex]:"..mushmipselect)
        MIPstep = 2
        end
      end
      if MIPstep == 2 then
        if IsControlOpen("VoteMvp") then
        UseControlAction("VoteMvp","PressOK")
        MIPstep = 1
        else
        MIPstep = 0
--        mushlooptimer = 1000
        end
      end
      end
   end
end

local PScallstep = 0
local PEcallstep = 0
function AetheryteHelper.PartyCall()
   if (Scall.Enable) then
         if PScallstep == 0 then
            if Duty:IsQueued() == true and Duty:GetQueueStatus() == 4 and
               Player.Targetable == true and Duty:GetActiveDutyInfo() ~= nil then
              if Duty:GetActiveDutyInfo().timer == 7200 then PScallstep = 10 end 
              if Duty:GetActiveDutyInfo().timer == 5400 then  PScallstep = 20 end 
              if Duty:GetActiveDutyInfo().timer == 3600 then  PScallstep = 30 end 
              if Duty:GetActiveDutyInfo().timer == 1800 then  PScallstep = 40 end
            end
         end
         if PScallstep == 10 then
              if Duty:GetActiveDutyInfo().timer == 7197 then
              SendTextCommand("/p "..tostring(Scall.word01)) 
              SendTextCommand(tostring(Scall.word02))
              PScallstep = 99
              end
         end
         if PScallstep == 20 then
              if Duty:GetActiveDutyInfo().timer == 5397 then
              SendTextCommand("/p "..tostring(Scall.word01)) 
              SendTextCommand(tostring(Scall.word02))
              PScallstep = 99
              end
         end
         if PScallstep == 30 then
              if Duty:GetActiveDutyInfo().timer == 3597 then
              SendTextCommand("/p "..tostring(Scall.word01)) 
              SendTextCommand(tostring(Scall.word02))
              PScallstep = 99
              end
         end
         if PScallstep == 40 then
              if Duty:GetActiveDutyInfo().timer == 1797 then
              SendTextCommand("/p "..tostring(Scall.word01)) 
              SendTextCommand(tostring(Scall.word02))
              PScallstep = 99
              end
         end
         if PScallstep == 99 then
            if Duty:GetActiveDutyObjectives() == nil and Duty:IsQueued() == false then
            PScallstep = 0
            end
         end
   end
   local Dtask = Duty:GetActiveDutyObjectives()
   local Entity = 0
   local el = EntityList("type=2")
              if table.valid(el) then
                      for k,v in pairs(el) do
                            Entity = Entity + 1  
                      end
              end
   if (Ecall.Enable) then
         if PEcallstep == 0 then
            if Duty:IsQueued() == true and Duty:GetQueueStatus() == 4 and
               Player.Targetable == true and Duty:GetActiveDutyInfo() ~= nil then
              if Duty:GetActiveDutyInfo().timer == 7200 then PEcallstep = 10 end 
              if Duty:GetActiveDutyInfo().timer == 5400 then  PEcallstep = 20 end 
              if Duty:GetActiveDutyInfo().timer == 3600 then  PEcallstep = 30 end 
              if Duty:GetActiveDutyInfo().timer == 1800 then  PEcallstep = 40 end
            end
         end
         if PEcallstep == 10 then
              if (#Dtask) == 0 and Entity == 0 or IsControlOpen("_NotificationIcMvp") then
              SendTextCommand("/p "..tostring(Ecall.word01)) 
              SendTextCommand(tostring(Ecall.word02))
              PEcallstep = 99
              end
         end
         if PEcallstep == 20 then
              if (#Dtask) == 0 and Entity == 0 or IsControlOpen("_NotificationIcMvp") then
              SendTextCommand("/p "..tostring(Ecall.word01)) 
              SendTextCommand(tostring(Ecall.word02))
              PEcallstep = 99
              end
         end
         if PEcallstep == 30 then
              if (#Dtask) == 0 and Entity == 0 or IsControlOpen("_NotificationIcMvp") then
              SendTextCommand("/p "..tostring(Ecall.word01)) 
              SendTextCommand(tostring(Ecall.word02))
              PEcallstep = 99
              end
         end
         if PEcallstep == 40 then
              if (#Dtask) == 0 and Entity == 0 or IsControlOpen("_NotificationIcMvp") then
              SendTextCommand("/p "..tostring(Ecall.word01)) 
              SendTextCommand(tostring(Ecall.word02))
              PEcallstep = 99
              end
         end
         if PEcallstep == 99 then
            if Duty:IsQueued() == false then
            PEcallstep = 0
            end
         end
   end
end



function AetheryteHelper.mushTextCommands()
    local log = GetChatLines()
    local logmatch = nil
    local mushtextstep = 99
    local logmatchtime = 3
    local ezt = GetEorzeaTime().servertime
    local mushlogtime = ezt
    



    if Duty:GetQueueStatus() <= 2 then
    for _, command in pairs(log) do
    if command.timestamp > ezt-5 and command.code == 56 then
      if command.line:match("AHmode 114") then
           logmatch = command.line
           mushlogtime = command.timestamp
           mushtextstep = 1
      end
      if command.line:match("AHMB limsa") then
           logmatch = command.line
           mushlogtime = command.timestamp
           mushtextstep = 10
      end
      if command.line:match("AHMB gridania") then
           logmatch = command.line
           mushlogtime = command.timestamp
           mushtextstep = 20
      end
      if command.line:match("AHMB uldah") then
           logmatch = command.line
           mushlogtime = command.timestamp
           mushtextstep = 30
      end
      if command.line:match("AHGC move") then
           logmatch = command.line
           mushlogtime = command.timestamp
           mushtextstep = 40
      end
      if command.line:match("AHBJ num") then
           logmatch = command.line
           mushlogtime = command.timestamp
           mushtextstep = 50
      end
      if command.line:match("AH WeeEa") then
           logmatch = command.line
           mushlogtime = command.timestamp
           mushtextstep = 60
      end
      if command.line:match("AHWV mini") then
           logmatch = command.line
           mushlogtime = command.timestamp
           mushtextstep = 70
      end
    end  
    end
    end
    if mushtextstep == 1 then
       if AetheryteHelper.insSelectGUI.open == true then
       logmatch = nil
       mushtextstep = 99
       else
       mushtextstep = 2
       end
    end
    if mushtextstep == 2 then
       if logmatch then
        d("[AH][text][Progress]"..(mushlogtime+logmatchtime)-ezt)
          if mushlogtime+logmatchtime == ezt then
          mushlooptimer = 1000
          mushtextstep = 3
          else
          mushtextstep = 99
          end
       end
     end
     if mushtextstep == 3 then
           AetheryteHelper.insSelectGUI.open = true
           AHSET.delay = 150
           d("[AH][textcommand]:success")
           SendTextCommand("/e \x02\x13\x06\xfe\xff\x11\x99\x11 [AH][insSelecter Mini]:open")
           mushtextstep = 99
     end
     if mushtextstep == 10 then
       if AHSET.mushmovetoMB == true and mushMBlim == true then
       logmatch = nil
       mushtextstep = 99
       else
       mushtextstep = 11
       end
    end
    if mushtextstep == 11 then
       if logmatch then
        d("[AH][text][Progress]"..(mushlogtime+logmatchtime)-ezt)
          if mushlogtime+logmatchtime == ezt then
          mushlooptimer = 1000
          mushtextstep = 12
          else
          mushtextstep = 99
          end
       end
     end
     if mushtextstep == 12 then
           AHSET.mushmovetoMB = true
           mushMBlim = true
           d("[AH][textcommand]:success")
           SendTextCommand("/e \x02\x13\x06\xfe\xff\x11\x99\x11 [AH][MB][Limsa]:ON")
           mushtextstep = 99
     end
     if mushtextstep == 20 then
       if AHSET.mushmovetoMB == true and mushMBgri == true then
       logmatch = nil
       mushtextstep = 99
       else
       mushtextstep = 21
       end
    end
    if mushtextstep == 21 then
       if logmatch then
        d("[AH][text][Progress]"..(mushlogtime+logmatchtime)-ezt)
          if mushlogtime+logmatchtime == ezt then
          mushlooptimer = 1000
          mushtextstep = 22
          else
          mushtextstep = 99
          end
       end
     end
     if mushtextstep == 22 then
           AHSET.mushmovetoMB = true
           mushMBgri = true
           d("[AH][textcommand]:success")
           SendTextCommand("/e \x02\x13\x06\xfe\xff\x11\x99\x11 [AH][MB][Gridania]:ON")
           mushtextstep = 99
     end
     if mushtextstep == 30 then
       if AHSET.mushmovetoMB == true and mushMBul == true then
       logmatch = nil
       mushtextstep = 99
       else
       mushtextstep = 31
       end
    end
    if mushtextstep == 31 then
       if logmatch then
        d("[AH][text][Progress]"..(mushlogtime+logmatchtime)-ezt)
          if mushlogtime+logmatchtime == ezt then
          mushlooptimer = 1000
          mushtextstep = 32
          else
          mushtextstep = 99
          end
       end
     end
     if mushtextstep == 32 then
           AHSET.mushmovetoMB = true
           mushMBul = true
           d("[AH][textcommand]:success")
           SendTextCommand("/e \x02\x13\x06\xfe\xff\x11\x99\x11 [AH][MB][Ul'dah]:ON")
           mushtextstep = 99
     end
     if mushtextstep == 40 then
       if AutoMoveGC == true then
       logmatch = nil
       mushtextstep = 99
       else
       mushtextstep = 41
       end
    end
    if mushtextstep == 41 then
       if logmatch then
        d("[AH][text][Progress]"..(mushlogtime+logmatchtime)-ezt)
          if mushlogtime+logmatchtime == ezt then
          mushlooptimer = 1000
          mushtextstep = 42
          else
          mushtextstep = 99
          end
       end
     end
     if mushtextstep == 42 then
           AutoMoveGC = true
           d("[AH][textcommand]:success")
           SendTextCommand("/e \x02\x13\x06\xfe\xff\x11\x99\x11 [AH][GC]:ON")
           mushtextstep = 99
     end
    if mushtextstep == 50 then
       if logmatch then
        d("[AH][text][Progress]"..(mushlogtime+logmatchtime)-ezt)
          if mushlogtime+logmatchtime == ezt then
          mushlooptimer = 1000
          mushtextstep = 51
          else
          mushtextstep = 99
          end          
       end
     end
     if mushtextstep == 51 then
          local jemcount = Inventory:GetCurrencyCountByID(26807)
          d("[AH][textcommand]:success")
          if language == 0 then
           SendTextCommand(tostring("/e \x02\x13\x06\xfe\xff\x99\x11\x99 バイカラージェム："..jemcount.."個"))
           mushtextstep = 99
           else
           SendTextCommand(tostring("/e \x02\x13\x06\xfe\xff\x99\x11\x99 bicolor gemstone："..jemcount))
           mushtextstep = 99
          end
     end
    if mushtextstep == 60 then
       if logmatch then
        d("[AH][text][Progress]"..(mushlogtime+logmatchtime)-ezt)
          if mushlogtime+logmatchtime == ezt then
          mushlooptimer = 1000
          mushtextstep = 61
          else
          mushtextstep = 99
          end         
       end
     end
     if mushtextstep == 61 then
          local WeeEa = 0
          local el = EntityList("type=9")
          for i,entity in pairs(el) do
              if entity.ContentID == 423 then
                WeeEa = WeeEa + 1
              end
          end
          d("[AH][textcommand]:success")
           SendTextCommand(tostring("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH]WeeEa："..WeeEa))
           mushtextstep = 99
     end
     if mushtextstep == 70 then
       if AetheryteHelper.miniWV.open == true then
       logmatch = nil
       mushtextstep = 99
       else
       mushtextstep = 71
       end
    end
    if mushtextstep == 71 then
       if logmatch then
        d("[AH][text][Progress]"..(mushlogtime+logmatchtime)-ezt)
          if mushlogtime+logmatchtime == ezt then
          mushlooptimer = 1000
          mushtextstep = 72
          else
          mushtextstep = 99
          end        
       end
     end
     if mushtextstep == 72 then
           AetheryteHelper.miniWV.open = true
           AHSET.delay = 150
           d("[AH][textcommand]:success")
           SendTextCommand("/e \x02\x13\x06\xfe\xff\x11\x99\x11 [AH][WV Mini]:open")
           mushtextstep = 99
     end
         
     if mushtextstep == 99 then
        mushlogtime = ezt
        logmatch = nil
     end
end
---------------------------------------------------------------   
function AetheryteHelper.mushsubtool()

    if (GetGameState() == FFXIV.GAMESTATE.INGAME and TimeSince(lastUpdatePulse) > mushlooptimer) then
       lastUpdatePulse = Now()
            
            AetheryteHelper.Exchange()
            AetheryteHelper.mushSealstoItem()
            AetheryteHelper.movetoGCAll()
            AetheryteHelper.mushpotionmanual()
            AetheryteHelper.mushEXchangeTrust()
            AetheryteHelper.Jumbocactpothelper()
            AetheryteHelper.moveMBlimsa()
            AetheryteHelper.moveMBgridania()
            AetheryteHelper.moveMBuldah()
            AetheryteHelper.mushsRemateria()
            AetheryteHelper.mushMaterialize()
            AetheryteHelper.mushsubAR()
            AetheryteHelper.Desynthseis()
            AetheryteHelper.undersizeIDswitch()
            AetheryteHelper.explorerIDswitch()
            AetheryteHelper.mushTextCommands()
            AetheryteHelper.nonAFK()
            AetheryteHelper.voteMVP()
            AetheryteHelper.PartyCall()
            AetheryteHelper.itemsort()
     end

            
    
    
       
                
AetheryteHelper.Inventoryfree()
end



---------------------------------------------------------------------------------------------------------------------------------------------------
-- Register
RegisterEventHandler("Module.Initalize",AetheryteHelper.Init,"AetheryteHelper.Init") 
RegisterEventHandler("Module.Initalize",AetheryteHelper.ModuleInit,"AetheryteHelper.ModuleInit")
RegisterEventHandler("Gameloop.Draw", AetheryteHelper.DrawCall,"AetheryteHelper.DrawCall")
RegisterEventHandler("Gameloop.Update", AetheryteHelper.mushMaintool,"AetheryteHelper.mushMaintool")
RegisterEventHandler("Gameloop.Update", AetheryteHelper.mushsubtool,"AetheryteHelper.mushsubtool")
---------------------------------------------------------------------------------------------------------------------------------------------------