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
      Version =         "1.5.3",   
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
                      "[1.1.2] - Changed so that saved data is loaded correctly.",
                      "[1.1.3] - linked bot status in materia extract options",
                      "[1.1.5] - Add Aetherial Reduction Botmode and more",
                      "[1.2.0] - I done lot of add things.",
                      "[1.2.1] - Adjust Aetherial Reduction Botmode & tooltips",
                      "          Mouse over to view English",
                      "          Right button Press to view Japanese.",
                      "[1.2.2] - desynth bug fix & add Trust mode",
                      "[1.3.0] - add trun in & Organize code(just a little bit)",
                      "[1.3.1] - add Jumbo cactpot assist",
                      "[1.3.2] - bug fix",
                      "[1.3.3] - add auto move to Main tool & fewer error message in game.",
                      "[1.3.4] - fine tuning of auto move (Mare Lamentorum)",
                      "[1.3.5] - add Retrieve Materia & Exchange less max",
                      "[1.4.0] - please read Readme.txt in UserSettings folder",
                      "[1.4.1] - AR function was broken, and I fixed it",
                      "[1.4.2] - add auto Repair in TrustMode(DEMO) & bug fix",
                      "[1.4.3] - add mini button",
                      "[1.4.5] - Organize all code",
                      "[1.4.6] - add DC & move to MB on switch",
                      "[1.4.7] - adjusted behavior of trust mode",
                      "[1.4.7.1] - fix MBmode",
                      "[1.4.8] - Organize code for MBmode",
                      "[1.4.9] - remake RetrieveMateria,all function adjust delay",
                      "          change contents in junk tab",
                      "[1.5.0] - i've made some crazy stuff",
                      "[1.5.1] - Only some design changes",
                      "[1.5.2] - incorporated the code that kali created",
                      "[1.5.3] - add new 3 text command",
                      "          add youtube link & jumbocactpot assist(remake)",

                    },
      
  },
--  ---------------
  HELP   = {
      entext =       { "・Code optimization\n・language switching\n\nlink:", }, 
      jptext =       { "・コードの最適化\n・各項目のローカライズ\n\nlink:", },
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
      name = "[Option]"
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
AetheryteHelper.Jumbocactpot = {
  name = "jumbocactpot###AetheryteHelper",
  open = false,
  visible = true,
  locked = false,
}
AetheryteHelper.trustmode = {
  name = "trustmode(DEMO)###AetheryteHelper",
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
    GCexlessmax = false,
    mushrepairGear = 60,
    mushmovetoMB = false,
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
-------------------
Links = {
      Name = "Minion Discord JP",
       link1 = [[https://discord.com/channels/127540472812929024/335225564803891210]],
       link2 = [[https://github.com/mushroom8009/AetheryteHelper]],
       link3 = [[https://github.com/mushroom8009/AutheryteHelper/releases]],
       link4 = [[https://youtube.com/playlist?list=PLS5EIB6BeDoKSRglypQIr_g9-MF6Cvbqh]],     
      tooltip1 = "Please DM me if you have any problems or requests\nalso, please promote it.\n\n不具合とか要望あればDMで教えて下さい\nあと褒められるとモチベーションあがります",
      tooltip2 = "Github link,\nLeft click:home\nRight click:Release\n\n左クリックでgitのAHのホーム\n右クリックでリリースページ",
  

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
GCexchangeItems = {
         jp = {"ベンチャースクリップ","ダークマターG8","グラスファイバー","特別支給コンテナ(新生・蒼天)","特別支給コンsテナ(紅蓮)","転送網利用券(GC)"},           
         En = {"Ventures","G8DarkMatter","GlassFiber","MaterielContainer3.0","MaterielContainer4.0","AetheryteTicket(GC)"},
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
local uuid = GetUUID()
AetheryteHelper.savefile = GetStartupPath() .. '\\LuaMods\\AetheryteHelper\\UserSettings\\' ..'userID'..uuid.. '_setting.lua'
AetheryteHelper.settingfile = GetStartupPath() .. '\\LuaMods\\AetheryteHelper\\UserSettings\\' ..'kinoko_setting.lua'
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

end

---------------------------------------------------------------------------------------------------------------------------------------------------
--save fanction
AetheryteHelper.LoadSettings()
function AetheryteHelper.SaveSettings()
  persistence.store(AetheryteHelper.savefile, AetheryteHelper.settings)
  persistence.store(AetheryteHelper.settingfile, kinokoProject.Windows)
  
end
---------------------------------------------------------------------------------------------------------------------------------------------------
local AHSET = AetheryteHelper.settings.SET
local eqFilter = AetheryteHelper.settings.Filter
local AHeqjob = AetheryteHelper.settings.Job
---------------------------------------------------------------------------------------------------------------------------------------------------
-- ins select GUI
local insHistory = {
    isins = 0,
    selectins = false,
    autheStep = 0
}
function AetheryteHelper.Drawinsselect()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Text("Tips : use MobHunt & Rare F.A.T.E")      
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        GUI:SetTooltip("--instance select--\nonly use EW area\n・Labyrinthos\n・Thavnair\n・Garlemald\n・Mare Lamentorum\n・Elpis\n・Ultima Thule\n\n--World visit--\n・Gridania\n・Limsa\n・Uldah")
      if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("--インスタンスセレクト--\nEWエリアのみ対応です\n・ラビリンソス\n・サベネア\n・ガレマルド\n・嘆きの海\n・エルピス\n・ウルティマ・トゥーレ\n\n--サーバーテレポ対応都市--\n・グリダニア\n・リムサ\n・ウルダハ")
      end
      end

      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:SameLine()
      GUI:Checkbox("##select_ins", selectins)
      GUI:SameLine()
      GUI:Text("Helper Enable")
      GUI:EndGroup()      
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          selectins = not selectins
          autheStep = 0
          if not selectins then
             insHistory = {
             isins = 0,
             selectins = false,
             autheStep = 0
                }
          end
          if selectins == false then
          Player:Stop()
          end
        if ( moveSVR == false ) then  modechg = 3 end 
          end
        GUI:SetTooltip("on/auto off\nOnly possible in front of Aetheryte")
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("エーテライトのそばで使用してください。\nオンは手動ですがオフは自動です")
      end
      end
      if GUI:TreeNode("AH-option") then
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Text("----")
      GUI:SameLine()
      GUI:Checkbox("##nohousing", AHSET.nohousing)
      GUI:SameLine()
      GUI:TextColored(1,0,0,1,"residential no visible")
      GUI:EndGroup()      
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AHSET.nohousing = not AHSET.nohousing
          end       
         GUI:SetTooltip("didn't complete quest of residential\nonly Worldvisit mode\nmean [Mist][Lavender Beds][Goblet] thing")
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("サーバーテレポ時のみ、冒険者居住区未解放のエリアでオンにしてください\n具体的にはミストビレッジ・ラベンダーベッド・ゴブレットビュートです")
      end
      end

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Text("----")
      GUI:SameLine()
      GUI:Checkbox("##AutoOffmode", autooff)
      GUI:SameLine()
      GUI:Text("Mode: ins select")
      for _,v in pairs(ploc) do
        if (v == Player.localmapid) then
          GUI:SameLine()
          GUI:TextColored(0,1,0,1," Ready")
        end
      end
      GUI:EndGroup()      
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          if ( moveSVR == false ) then
           autooff = not autooff
           elseif( moveSVR == true ) then
           moveSVR = not moveSVR
           autooff = not autooff
          --moveSVR = not moveSVR
           modechg = 3  
          end 
        end
        GUI:SetTooltip("Instance Select Mode\nAuto change")
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("インスタンスセレクトモード\n対象エリアで内部的に自動で切り替わります")
        end 
      end
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Text("----")
      GUI:SameLine()      
      GUI:Checkbox("##move_svr", moveSVR)
      GUI:SameLine()
      GUI:Text( "Mode: World Visit" )
      for _,v in pairs(MoveServer) do
        if (v == Player.localmapid) then
          GUI:SameLine()
          GUI:TextColored(0,1,0,1," Ready")
        end
      end
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
          if (GUI:IsMouseClicked(0)) then
          if ( autooff == false ) then
           moveSVR = not moveSVR
           elseif( autooff == true ) then
           moveSVR = not moveSVR
           autooff = not autooff
           end
          if (moveSVR == true) then
           modechg = 2
          else
           modechg = 3
           end
           autheStep = 0            
          
        end       
        GUI:SetTooltip("World Visit Mode\nAuto change")
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("サーバーテレポモード\n対象エリアで内部的に自動で切り替わります")
        end 
      end
      GUI:TreePop()
      end
      GUI:Spacing()           
      GUI:Separator()    
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:PushItemWidth(140)
      GUI:BeginGroup()
      local changed
        AHSET.delay, changed = GUI:SliderInt("ms",AHSET.delay,100,1000)
        
        if (GUI:IsItemHovered()) then
        GUI:SetTooltip("access delay\n100ms-1000ms")
        AetheryteHelper.SaveSettings()
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("アクセス間隔\n100ミリ秒から1秒まで選べます")
        end 
        end

      GUI:EndGroup()
      --GUI:Spacing() 
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button( "Reset",40, 20)
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AHSET.delay = 200
          AetheryteHelper.SaveSettings()
          autheStep = 0
        end
        GUI:SetTooltip("delay RESET")
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("ディレイの値を初期値に戻します")
        end 
        end
      GUI:EndGroup()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button("F",20,20)
      GUI:EndGroup()
            if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
              SendTextCommand("/e <flag>")
              end
              GUI:SetTooltip("Send TextCommand in Game>> /e <flag>")
              if (GUI:IsMouseDown(1)) then
              GUI:SetTooltip("ゲーム内マクロと同じですが、「/e <flag>」を実行します")
             end               
            end
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button("i",20,20)
      GUI:EndGroup()
      if AHSET.delay == 194 then
            if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
             AetheryteHelper.trustmode.open = not AetheryteHelper.trustmode.open 
              end
              GUI:SetTooltip("Exchange TrustMode")
              if (GUI:IsMouseDown(1)) then
              GUI:SetTooltip("HMTrustアドオンでExchange使いたい人向け")
              end 
            end
      else
      if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
             AetheryteHelper.miniGUI.open = not AetheryteHelper.miniGUI.open 
              end
              GUI:SetTooltip("info")
              if (GUI:IsMouseDown(1)) then
              GUI:SetTooltip("別窓でインスタンスの人数が見れます")
              end 
            end
      end
      GUI:Separator()
      GUI:Spacing()
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button( "ins 1", 55, 20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          isins = 1
          insHistory.isins = 1
          if AHSET.delay == 114 then selectins = true
          autheStep = 2
          insHistory.selectins = true
          insHistory.autheStep = 2
          end     
       end 
      GUI:SetTooltip("go to instance 1\nrepeate click")
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("インスタンス1へ移動\n混雑時は連打してください\nインスタンスが350人前後だと入れません")
        end
      end
      
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button( "ins 2", 55, 20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
         isins = 2
         insHistory.isins = 2
           if AHSET.delay == 114 then selectins = true
           autheStep = 2
           insHistory.selectins = true
           insHistory.autheStep = 2
           end
         end
        GUI:SetTooltip("go to instance 2\nrepeate click")
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("インスタンス2へ移動\n混雑時は連打してください\nインスタンスが350人前後だと入れません")
        end 
      end
      
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button( "ins 3", 55, 20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          isins = 3
          insHistory.isins = 3
          if AHSET.delay == 114 then selectins = true
          autheStep = 2
          insHistory.selectins = true
          insHistory.autheStep = 2
          end
        end
        GUI:SetTooltip("go to instance 3\nrepeate click")
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("インスタンス3へ移動\n混雑時は連打してください\nインスタンスが350人前後だと入れません")
        end 
      end
      
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()      
      GUI:Button( "free", 55, 20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          isins = 0
          insHistory.isins = 0
          if AHSET.delay == 114 then selectins = true 
          autheStep = 2
          insHistory.selectins = true
          insHistory.autheStep = 2
          end
        end 
        GUI:SetTooltip("auto select")
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("自動選択です")
        end
      end
end
-------------------------------------------------------------------------------------------------------------------------------------
-- telepo button GUI

function AetheryteHelper.GLUtelepo()
      GUI:BeginGroup()
      if AHSET.mushmovetoMB == false then
      GUI:Text("Go to Gridania, Limsa Lominsa, Ul'dah")
      else
      GUI:TextColored(1,1,0,1,"Auto go to MarketBoard button")
      end  
      GUI:EndGroup()
            if (GUI:IsItemHovered()) then
            GUI:SetTooltip("available from the central aetheryte")
            if (GUI:IsMouseDown(1)) then
            GUI:SetTooltip("三国へのテレポボタン")
            end 
            end
      GUI:BeginGroup()
      GUI:Checkbox("###MB",mushMBgri)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
         GUI:SetTooltip("When the checkbox [MB] is turned on,\nit will switch automatically")
         if (GUI:IsMouseDown(1)) then
         GUI:SetTooltip("自動でオンになります\n\n[MB]チェックでボタンの挙動が変わります")
         end
      end
      GUI:SameLine()
      GUI:BeginGroup()  
      GUI:Button("Grida",55,20)
      GUI:EndGroup()
         if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) and (AHSET.mushmovetoMB == false ) then
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
            if (GUI:IsMouseClicked(0)) and (AHSET.mushmovetoMB == true ) then
              Player:ClearTarget()
              mushMBgri = true
              mushMBlim = false
              mushMBul = false
              griMBStep = 0
              mushlooptimer = 100
            end
            if AHSET.mushmovetoMB == false then
            GUI:SetTooltip("Teleport to Gridania")
            if (GUI:IsMouseDown(1)) then
            GUI:SetTooltip("グリダニア")
            end
            else
            GUI:SetTooltip("Go to Gridania MB")
            if (GUI:IsMouseDown(1)) then
            GUI:SetTooltip("グリダニアのマケボへ移動")
            end 
            end
         end
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Checkbox("###MB",mushMBlim)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
         GUI:SetTooltip("When the checkbox [MB] is turned on,\nit will switch automatically")
         if (GUI:IsMouseDown(1)) then
         GUI:SetTooltip("自動でオンになります\n\n[MB]チェックでボタンの挙動が変わります")
         end
      end
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button("Limsa",55,20)
      GUI:EndGroup()
         if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) and (AHSET.mushmovetoMB == false ) then
              Player:ClearTarget()
              mushlooptimer = 0
              limMBStep = 0
              mushMBgri = false
              mushMBlim = true
              mushMBul = false
              moveSVR = true
              autooff = false
              modechg = 2
            end
            if (GUI:IsMouseClicked(0)) and (AHSET.mushmovetoMB == true ) then
              Player:ClearTarget()
              mushMBlim = true
              mushMBul = false
              mushMBgri = false
              limMBStep = 0
              mushlooptimer = 100
            end
            if AHSET.mushmovetoMB == false then
            GUI:SetTooltip("Teleport to Limsa")
            if (GUI:IsMouseDown(1)) then
            GUI:SetTooltip("リムサ")
            end
            else
            GUI:SetTooltip("Go to Limsa MB")
            if (GUI:IsMouseDown(1)) then
            GUI:SetTooltip("リムサのマケボへ移動")
            end 
            end
         end
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Checkbox("###MB",mushMBul)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
         GUI:SetTooltip("When the checkbox [MB] is turned on,\nit will switch automatically")
         if (GUI:IsMouseDown(1)) then
         GUI:SetTooltip("自動でオンになります\n\n[MB]チェックでボタンの挙動が変わります")
         end
      end      
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button("Uldah",55,20)
      GUI:EndGroup()
         if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) and (AHSET.mushmovetoMB == false ) then
              Player:ClearTarget()
              mushlooptimer = 0
              uldMBStep = 0
              mushMBgri = false
              mushMBlim = false
              mushMBul = true
              moveSVR = true
              autooff = false
              modechg = 2
            end
            if (GUI:IsMouseClicked(0)) and (AHSET.mushmovetoMB == true ) then
              Player:ClearTarget()
              mushMBul = true
              mushMBlim = false
              mushMBgri = false
              uldMBStep = 0
              mushlooptimer = 100
            end
            if AHSET.mushmovetoMB == false then
            GUI:SetTooltip("Teleport to Uldah")
            if (GUI:IsMouseDown(1)) then
            GUI:SetTooltip("ウルダハ")
            end
            else
            GUI:SetTooltip("Go to Uldah MB")
            if (GUI:IsMouseDown(1)) then
            GUI:SetTooltip("ウルダハのマケボへ移動")
            end 
            end
         end
end

---------------------------------------------------------------------------------------------------------------------------------------------------
-- wip tab3 button GUI

function AetheryteHelper.DrawadWIP()
      GUI:Spacing(10)
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[jumbo.png]],30,30)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
             AetheryteHelper.Jumbocactpot.open = not AetheryteHelper.Jumbocactpot.open 
              end
              GUI:SetTooltip("Jumbo cactpot assist")
              if (GUI:IsMouseDown(1)) then
              GUI:SetTooltip("ジャンボクジテンダー入力アシスト")
              end 
            end
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[undersize.png]],30,30)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
            mushlooptimer = 100
            IDUSstep = 0
            mushundersize = true
            end
            GUI:SetTooltip("switching undersize for dungeon")
            if (GUI:IsMouseDown(1)) then
            GUI:SetTooltip("制限解除の切替ボタンです")
            end 
      end
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[explo.png]],30,30)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
            mushlooptimer = 100
            IDexstep = 0
            mushExplorer = true
            end
            GUI:SetTooltip("switching Explorer for dungeon")
            if (GUI:IsMouseDown(1)) then
            GUI:SetTooltip("自由探索の切替ボタンです")
            end 
      end
      GUI:SameLine(220)
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[tube.png]],30,30)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
            io.popen([[cmd /c start "" "]]..Links.link4..[["]]):close()
            end
            GUI:SetTooltip("Introduction to AH")
            if (GUI:IsMouseDown(1)) then
            GUI:SetTooltip("機能紹介動画へのリンク")
            end 
      end
      GUI:Spacing()
      GUI:Separator()
      GUI:BeginGroup()
      GUI:TextColored(0,1,1,1,"Notice")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
      GUI:SetTooltip("i have added too many features than we originally planned.\ni will only fix bugs, not add more.\ni'll create another module.")
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("機能が増えすぎたのでこれ以上追加はせずバグ修正のみ行い\n今後は別のモジュールを作成します")
        end
      end
      GUI:SameLine(220,10)
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[love_mushroom.png]],30,30)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if GUI:IsMouseDown(0) then              
        GUI:SetTooltip("please don't poke me...")
        else GUI:SetTooltip("・・・i need more time")
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("つつかないでｗ")
        end 
      end
      end
      GUI:Spacing(10)
      GUI:SameLine(20)
       if GUI:TreeNode("VersionList##AetheryteHelper")then
      for id, e in pairs(kinokoProject.Addon.VersionList) do
      GUI:Text(e)
      end
      GUI:TreePop()
      end
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
         GUI:SetTooltip("open AH\ndouble click")
      end
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
      GUI:SetTooltip("close info")
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("インフォメーションウィンドウを閉じる")
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
              isins = 0,
              selectins = false,
              autheStep = 0
              }
              end
              Player:ClearTarget()
              Player:Stop()
              end
              GUI:SetTooltip("now ON")
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
              isins = 0,
              selectins = false,
              autheStep = 0
              }
              end
              end
              GUI:SetTooltip("now Off")
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
          selectins = true
          insHistory.selectins = true
          insHistory.autheStep = 2
          end
          GUI:SetTooltip("Push")
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
          selectins = true
          insHistory.selectins = true
          insHistory.autheStep = 2
          end
          GUI:SetTooltip("Push")
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
          selectins = true
          insHistory.selectins = true
          insHistory.autheStep = 2
          end
          GUI:SetTooltip("Push")
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
          GUI:SetTooltip("close")
          if (GUI:IsMouseDown(1)) then
          GUI:SetTooltip("閉じる")
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
     AetheryteHelper.Jumbocactpot.visible, AetheryteHelper.Jumbocactpot.open = GUI:Begin('jumbocactpot', AetheryteHelper.Jumbocactpot.open,Jumboflags)
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
        if (GUI:IsMouseDown(1)) then
            GUI:SetTooltip("ランダム番号で購入します")
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
        if (GUI:IsMouseDown(1)) then
            GUI:SetTooltip("ランダム番号で購入します")
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
        if (GUI:IsMouseDown(1)) then
            GUI:SetTooltip("ランダム番号で購入します")
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
         mushlooptimer = 3000
         mushJumbocactpothelper = not mushJumbocactpothelper
         mushGSjcpstep = 0
        end   
        if (GUI:IsMouseDown(1)) then
            GUI:SetTooltip("ジャンボくじテンダーを3枚買います")
        end 
      end
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:TextColored(1,0,0,1,"[[Warning]]")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
          GUI:SetTooltip(" I only get one chance a week,\nand I haven't been able to test much.\nIf it does not work well, please report it.")
      if (GUI:IsMouseDown(1)) then
          GUI:SetTooltip("週一しかテストのチャンスがなく\nうまく動作しない可能性は充分あります\nうまく動作しない場合教えて下さい")
      end 
      end


    end        
    GUI:End()
    
  end
  
end

--------------------------------------------------------------------------------------------------------------------------------------------------
function AetheryteHelper.TMwindow()
  if (AetheryteHelper.trustmode.open) then
    local trustmodeflags = GUI.WindowFlags_NoTitleBar +  GUI.WindowFlags_NoFocusOnAppearing + GUI.WindowFlags_NoBringToFrontOnFocus + GUI.WindowFlags_AlwaysAutoResize
    GUI:SetNextWindowSize(220,140)
     AetheryteHelper.trustmode.visible, AetheryteHelper.trustmode.open = GUI:Begin('trustmode', AetheryteHelper.trustmode.open,trustmodeflags)
    if (AetheryteHelper.trustmode.visible) then
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:TextColored(1,0,0,1,"Trust Mode(DEMO version)")
      GUI:EndGroup()
      GUI:Separator()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Text("Status:")
      GUI:SameLine()
      if Dawncloser == true and GCexchangeT == true and sealstoitemT == false and Duty:IsQueued() == false then
      GUI:TextColored(0,1,0,1,"Exchange")
      elseif Dawncloser == true and sealstoitemT == true and GCexchangeT == false and Duty:IsQueued() == false then
      GUI:TextColored(0,1,0,1,"Trun in")
      elseif Dawncloser == false then 
      GUI:Text("Que wait")
      elseif Dawncloser == nil then 
      GUI:Text("standby")
      end
      GUI:SameLine()
      GUI:Text("/delay:"..mushlooptimer)
      GUI:Spacing()
      GUI:Separator()
      GUI:EndGroup()
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:PushItemWidth(80)
      GUI:Text("Repair Gear(self only)")
      AHSET.mushrepairGear = GUI:InputInt("%",AHSET.mushrepairGear,1,1000)
      GUI:EndGroup()
      if AHSET.mushrepairGear < 1 then AHSET.mushrepairGear = 99 end
      if AHSET.mushrepairGear > 99 then AHSET.mushrepairGear = 1 end
      if (GUI:IsItemHovered()) then
        if language == 0 then
        GUI:SetTooltip("装備の修理です。\nHMDMの初期値は50なので60に設定していますが\nHMDMの設定値より上にして下さい。\n自分で修理するのでクラフター必須です")
        else
        GUI:SetTooltip("default HMDM value is 50, so i've set it to 60,\nyou can change,but please it should be higher than HMDM setting.\nyou'll need a crafter to do repairs yourself.")
        end 
     end
      GUI:BeginGroup()
      GUI:Checkbox("Exchange on Trust",mushTrustmode)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if GUI:IsMouseClicked(0) then
        mushlooptimer = 5000
        mushTrustmode = not mushTrustmode
        AHSET.DesynthTrust = true
        GCexchange = false
        sealstoitem = false
        end  
        GUI:SetTooltip("Enable\n\ntab will change to [Option] by itself")
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("オン\n\nタブが強制的に[Option]に切り替わります")
        end 
      end      
    end        
    GUI:End()
    
  end
  
end

---------------------------------------------------------------------------------------------------------------------------------------------------
--desyunth ilset tree GUI

function AetheryteHelper.desynthIL()
     GUI:Spacing()
     GUI:BeginGroup()
     GUI:Text("Desynthesis option")
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
           GUI:SetTooltip("turn on Desynthesis option\nto reflect the settings here")
           if (GUI:IsMouseDown(1)) then
           GUI:SetTooltip("分解のオプション設定を有効にする")
           end               
           end
     GUI:Spacing()
     GUI:Separator()
     GUI:Spacing()
     GUI:AlignFirstTextHeightToWidgets()
     GUI:BeginGroup()
     GUI:Checkbox("Crafter mode",AHSET.CrafterMode)
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
     if (GUI:IsMouseClicked(0)) then
        AHSET.CrafterMode = not AHSET.CrafterMode
        AetheryteHelper.SaveSettings()
        end   
        GUI:SetTooltip("Auto off in Crafter")
        if (GUI:IsMouseDown(1)) then
            GUI:SetTooltip("クラフターで分解をオフにします")
        end 
     end
     GUI:SameLine()
     GUI:AlignFirstTextHeightToWidgets()
     GUI:BeginGroup()
     GUI:Checkbox("Trust mode",AHSET.DesynthTrust)
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
     if (GUI:IsMouseClicked(0)) then
        AHSET.DesynthTrust = not AHSET.DesynthTrust
        AetheryteHelper.SaveSettings()
        end   
        GUI:SetTooltip("for use with the Trust addon")
        if (GUI:IsMouseDown(1)) then
            GUI:SetTooltip("Trustアドオンを使用するとき以外はオフ推奨")
        end 
     end
     if mushTrustmode == true then
     AHSET.DesynthTrust = true
     end
     GUI:Spacing()
     GUI:Separator()
     GUI:Spacing()
  if GUI:TreeNode("IL Setting##AetheryteHelper") then 
     GUI:BeginGroup()
     GUI:PushItemWidth(80)
     AHSET.dminil = GUI:InputInt("< IL",AHSET.dminil,1,500)
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
     AetheryteHelper.SaveSettings()
     GUI:SetTooltip("IL1-IL1000\nDesynth IL equipment larger than this number")              
     if (GUI:IsMouseDown(1)) then
     GUI:SetTooltip("IL1-IL1000\nこの数字より大きいIL装備を分解します")
     end 
     end
     GUI:SameLine()
     GUI:BeginGroup()
     AHSET.dmaxil = GUI:InputInt("> IL",AHSET.dmaxil,1,500)
     if (AHSET.dminil < 1) then AHSET.dminil = 1 end        
     if (AHSET.dmaxil < 5) then AHSET.dmaxil = 5 end
     if (AHSET.dmaxil > 1000) then AHSET.dmaxil = 1000 end
     if (AHSET.dminil > AHSET.dmaxil) then AHSET.dminil = AHSET.dmaxil end
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
     AetheryteHelper.SaveSettings()
     GUI:SetTooltip("IL5-IL1000\nDesynth any IL equipment\nless than this except IL1")              
     if (GUI:IsMouseDown(1)) then
     GUI:SetTooltip("IL1-IL1000\nIL1を除きこれ未満のIL装備を分解します")
     end 
     end
     GUI:BeginGroup()
     GUI:Button("Reset",40,20)
     GUI:EndGroup()
            if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
              AHSET.dminil = 5
              AHSET.dmaxil = 540
              AetheryteHelper.SaveSettings()
              end
              GUI:SetTooltip("Setting IL Reset")              
              if (GUI:IsMouseDown(1)) then
              GUI:SetTooltip("IL設定を初期化")
              end 
            end
      GUI:Spacing()
      GUI:Text("------------------------------")
      GUI:TreePop()
  end

      
      
if GUI:TreeNode("Required : Slot Setting##AetheryteHelper") then
      GUI:BeginGroup()  
      GUI:TextColored(1,0,0,1,"selection will be Desynthesis\nValuable equipment\nis in armoury chest" ) 
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("チェックを入れたものを分解します。\n大事な装備はアーマリーチェストへ入れましょう")
      end 
      end
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()      
      GUI:BeginGroup()
      GUI:PushItemWidth()
      GUI:Checkbox("Main", eqFilter.Main)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            eqFilter.Main = not  eqFilter.Main
           end
      AetheryteHelper.SaveSettings()
      GUI:SetTooltip("Primary")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("武器・主道具")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Sub", eqFilter.Sub)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            eqFilter.Sub = not  eqFilter.Sub
           end
      AetheryteHelper.SaveSettings()
      GUI:SetTooltip("Secondary & Shield")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("盾・副道具")
      end
      end

      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Head", eqFilter.Head)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            eqFilter.Head = not  eqFilter.Head
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Head")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("頭装備")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Earrings", eqFilter.Earrings)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            eqFilter.Earrings = not  eqFilter.Earrings
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Earrings")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("耳アクセ")
      end
      end

      GUI:Spacing()
      
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Body", eqFilter.Body)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            eqFilter.Body = not  eqFilter.Body
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Body")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("胴装備")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Necklace", eqFilter.Necklace)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            eqFilter.Necklace = not  eqFilter.Necklace
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Necklace")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("首アクセ")
      end
      end

      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Hand", eqFilter.Hand)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            eqFilter.Hand = not  eqFilter.Hand
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Hand")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("手装備")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Bracelets", eqFilter.Bracelets)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            eqFilter.Bracelets = not  eqFilter.Bracelets
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Bracelets")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("腕輪（アクセ）")
      end
      end
      
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Legs", eqFilter.Legs)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            eqFilter.Legs = not  eqFilter.Legs
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Legs")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("脚装備")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Ring", eqFilter.Ring)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            eqFilter.Ring = not  eqFilter.Ring
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Ring")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("指輪")
      end
      end
      
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Feet", eqFilter.Feet)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            eqFilter.Feet = not  eqFilter.Feet
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Feet")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("足装備")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Button("Quick Change",100,20)
      GUI:EndGroup()
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
      GUI:SetTooltip("Left click : all on\nRight click : Reverse\n\n右クリックで全選択\n左クリックで反転")              
      end

     GUI:Spacing()
     GUI:TreePop()
  end


  if GUI:TreeNode("Option : Job Setting##AetheryteHelper") then
      GUI:TextColored(1,0,0,1,"selection will be Desynthesis" ) 
      GUI:Spacing()
      GUI:TextColored(0,1,1,1,"・Armor & Accessories" ) 
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()      
      GUI:BeginGroup()
      GUI:PushItemWidth()
      GUI:Checkbox("Tank", AHeqjob.Tank)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.Tank = not  AHeqjob.Tank
           end
      AetheryteHelper.SaveSettings()
      GUI:SetTooltip("PLD / WAR / DRK / GNB")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("タンク共通装備")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Healer", AHeqjob.Healer)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.Healer = not  AHeqjob.Healer
           end
      AetheryteHelper.SaveSettings()
      GUI:SetTooltip("WHM / SCH / AST / SGE")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("ヒーラー共通装備")
      end
      end

      GUI:Spacing()
      
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Slaying", AHeqjob.Slaying)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.Slaying = not  AHeqjob.Slaying
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Accessories :\nMNK / DRG / SAM / RPR")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("アタッカーアクセ")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Aiming", AHeqjob.Aiming)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.Aiming = not  AHeqjob.Aiming
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("BRD / MCN / DNC")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("レンジ共通装備")
      end
      end

      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Striking", AHeqjob.Striking)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.Striking = not  AHeqjob.Striking
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("MNK / SAM")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("ストライカー装備（モンク・侍）")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Sorcerer", AHeqjob.Sorcerer)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.Sorcerer = not  AHeqjob.Sorcerer
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("BLM / SMN / RDM")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("キャスター共通装備")
      end
      end

      GUI:Spacing()
     
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Maiming", AHeqjob.Maiming)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.Maiming = not  AHeqjob.Maiming
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("DRG / RPR")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("スレイヤー装備（竜・鎌）")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("All Job", AHeqjob.ALL)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.ALL = not  AHeqjob.ALL
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("All Job")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("低レベル用の全ジョブ対応装備")
      end
      end

      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Scouting", AHeqjob.Scouting)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.Scouting = not  AHeqjob.Scouting
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("NIN")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("スカウト装備(忍)")
      end
      end
      
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Button("Quick Change",100,20)
      GUI:EndGroup()
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
      GUI:SetTooltip("Left click : all on\nRight click : Reverse\n\n右クリックで全選択\n左クリックで反転")              
      end

      GUI:Spacing()
      GUI:Text("------------------------------")
      GUI:Spacing()
      GUI:TextColored(0,1,1,1,"・Arms" ) 
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("PLD", AHeqjob.PLD)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.PLD = not  AHeqjob.PLD
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary / Secondary")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("剣/盾")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("WHM", AHeqjob.WHM)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.WHM = not  AHeqjob.WHM
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary / Secondary")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("白杖/盾")
      end
      end

      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("WAR", AHeqjob.WAR)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.WAR = not  AHeqjob.WAR
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("斧")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("SCH", AHeqjob.SCH)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.SCH = not  AHeqjob.SCH
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("学本")
      end
      end
      
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("DRK", AHeqjob.DRK)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.DRK = not  AHeqjob.DRK
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("大剣")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("AST", AHeqjob.AST)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.AST = not  AHeqjob.AST
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("天球儀")
      end
      end
      
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("GNB", AHeqjob.GNB)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.GNB = not  AHeqjob.GNB
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("ガンブレード")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("SGE", AHeqjob.SGE)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.SGE = not  AHeqjob.SGE
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("賢具")
      end
      end
      
      GUI:Spacing()
   
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("MNK", AHeqjob.MNK)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.MNK = not  AHeqjob.MNK
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("格闘武器")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("BRD", AHeqjob.BRD)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.BRD = not  AHeqjob.BRD
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("弓")
      end
      end
      
      GUI:Spacing()      

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("DRG", AHeqjob.DRG)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.DRG = not  AHeqjob.DRG
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("槍")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("MCN", AHeqjob.MCN)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.MCN = not  AHeqjob.MCN
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("銃")
      end
      end
      
      GUI:Spacing()      

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("NIN", AHeqjob.NIN)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.NIN = not  AHeqjob.NIN
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("双剣")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("DNC", AHeqjob.DNC)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.DNC = not  AHeqjob.DNC
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("投擲武器")
      end
      end
      
      GUI:Spacing()      

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("SAM", AHeqjob.SAM)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.SAM = not  AHeqjob.SAM
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("刀")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("BLM", AHeqjob.BLM)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.BLM = not  AHeqjob.BLM
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary / Secondary")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("黒杖/盾")
      end
      end
      
      GUI:Spacing()      
      
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("RPR", AHeqjob.RPR)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.RPR = not  AHeqjob.RPR
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("鎌")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("SMN", AHeqjob.SMN)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.SMN = not  AHeqjob.SMN
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("召本")
      end
      end

      GUI:Spacing()

      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("RDM", AHeqjob.RDM)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.RDM = not  AHeqjob.RDM
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("レイピア")
      end
      end
     
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:EndGroup()
            
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Button("Quick Change",100,20)
      GUI:EndGroup()
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
      GUI:SetTooltip("Left click : all on\nRight click : Reverse\n\n右クリックで全選択\n左クリックで反転")              
      end
      GUI:Spacing()
      GUI:Text("Desynthesis option")
      GUI:Spacing()
      GUI:Spacing()
      GUI:TextColored(0,1,1,1,"・Tool & Armor & Accessories" ) 
      GUI:Spacing()
      
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Crafter", AHeqjob.Crafter)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.Crafter = not  AHeqjob.Crafter
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Tool & Armor & Accessories")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("クラフターの道具・防具・アクセサリー")
      end
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Gatherer", AHeqjob.Gatherer)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AHeqjob.Gatherer = not  AHeqjob.Gatherer
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Tool & Armor & Accessories")              
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("ギャザラーの道具・防具・アクセサリー")
      end
      end

     GUI:Spacing()
     GUI:TreePop()
  end
     GUI:Spacing()
     GUI:Separator()
     GUI:Spacing()
     GUI:BeginGroup()
     GUI:Text("GCexchange option")
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
           GUI:SetTooltip("Exchange seals for items")             
           if (GUI:IsMouseDown(1)) then
           GUI:SetTooltip("軍票をアイテムに交換")
           end
     end
     GUI:Spacing()
     GUI:Separator()
     GUI:Spacing()
 
     GUI:AlignFirstTextHeightToWidgets()
     GUI:BeginGroup()
     GUI:Checkbox("Trun in", sealstoitem )
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
           mushlooptimer = 500
           sealstoitem = not sealstoitem
           GCexchange = false
           mushtoItemstep = 0

        end
       GUI:SetTooltip("Trun in")
       if (GUI:IsMouseDown(1)) then
       GUI:SetTooltip("軍票をアイテムに交換")
       end
     end
     if mushTrustmode == true then sealstoitem = false end
     GUI:SameLine(130)
     GUI:AlignFirstTextHeightToWidgets()
     GUI:BeginGroup()
     GUI:Checkbox("adjust off", mushadjustoff )
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          mushadjustoff = not mushadjustoff
        end
       GUI:SetTooltip("Quantity adjustment off")
       if (GUI:IsMouseDown(1)) then
       GUI:SetTooltip("現在の軍票所持量で交換数量の上限を決めず\n交換開始軍票を数量の上限にします")
       end
     end
     GUI:Spacing()
     GUI:BeginGroup()
     GUI:Text("Start amount")
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
       GUI:SetTooltip("amount to start trun in")
       if (GUI:IsMouseDown(1)) then
       GUI:SetTooltip("軍票がこれ以上になると交換を開始")
       end
     end
     
     GUI:AlignFirstTextHeightToWidgets()
     GUI:BeginGroup()
     GUI:PushItemWidth(120)
     AHSET.syojigunpyou = GUI:InputInt("seals",AHSET.syojigunpyou,100,10000)
     AetheryteHelper.SaveSettings()
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
       GUI:SetTooltip("enter 0 to get the max value")
       if (GUI:IsMouseDown(1)) then
       GUI:SetTooltip("0を入力すると最大値になります")
       end
     end
     for k,v in pairs(mushPlayerGCrank) do
     if (k == Player.GrandCompanyRank) then mushmaxseal = v
     if AHSET.syojigunpyou < 1 then AHSET.syojigunpyou = tonumber(mushmaxseal.max) end
     if AHSET.syojigunpyou > tonumber(mushmaxseal.max) then AHSET.syojigunpyou = tonumber(mushmaxseal.max) end
     if mushTrustmode == true then AHSET.syojigunpyou = tonumber(mushmaxseal.max)*0.95 end
     end
     end
     GUI:Spacing()
     GUI:AlignFirstTextHeightToWidgets()
     GUI:BeginGroup()
     GUI:PushItemWidth(80)
     AHSET.hosiikazu = GUI:InputInt("Quantity",AHSET.hosiikazu,1,10000)
     AetheryteHelper.SaveSettings()
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
       GUI:SetTooltip("number want(auto adjustment)")
       if (GUI:IsMouseDown(1)) then
       GUI:SetTooltip("交換数(自動で最大値になります)")
       end
     end
     GUI:AlignFirstTextHeightToWidgets()
     GUI:BeginGroup()
     GUI:PushItemWidth(170)
     if language == 0 then
     AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.jp,5)
     AetheryteHelper.SaveSettings()
     else 
     AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.En,5)   
     AetheryteHelper.SaveSettings()
     end
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
       GUI:SetTooltip("Note that if you do not meet GC rank,\nyou cannot trun in")
       if (GUI:IsMouseDown(1)) then
       GUI:SetTooltip("交換に必要なGCランクに満たないものを選ぶと\nチェックが外れます")
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
       GUI:SetTooltip("Required seals/have seals")
       if (GUI:IsMouseDown(1)) then
       GUI:SetTooltip("交換に必要な軍票/現在の軍票")
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
       GUI:SetTooltip("Required seals/have seals")
       if (GUI:IsMouseDown(1)) then
       GUI:SetTooltip("交換に必要な軍票/現在の軍票")
       end
     end
     end
     mushitemid = GCexchangeItems.id[AHSET.koukanhin]
     mushhosiikazu = AHSET.hosiikazu


    
end

---------------------------------------------------------------------------------------------------------------------------------------------------
--materia option tree GUI

function AetheryteHelper.extractOption()
  if GUI:TreeNode("Extract Option##AetheryteHelper") then
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##Potion", AHSET.isPotionEnabled)
      GUI:SameLine()
      GUI:Text("Spiritbond Potion")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          mushlooptimer = 1000
          AHSET.isPotionEnabled = not AHSET.isPotionEnabled
          AetheryteHelper.SaveSettings()         
        end
       GUI:SetTooltip("auto use potion")
       if (GUI:IsMouseDown(1)) then
       GUI:SetTooltip("錬精薬の自動使用")
       end
      end
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Text("---")
      GUI:SameLine()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:Checkbox("##Poption", AHSET.isBotStatusP)
      GUI:SameLine()      
      GUI:Text("Link to Bot Status")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AHSET.isBotStatusP = not AHSET.isBotStatusP
          AetheryteHelper.SaveSettings()
        end
        GUI:SetTooltip("Automatically uncheck option(Potion)\nwhen Bot status:Not Running") 
       if (GUI:IsMouseDown(1)) then
       GUI:SetTooltip("minionに連動してオンオフする\nminionから独立して動くアドオンは不可")
       end
      end    
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##Manual", AHSET.isManualEnabled)
      GUI:SameLine()      
      GUI:Text("Spiritbond Manual")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          mushlooptimer = 1000
          AHSET.isManualEnabled = not AHSET.isManualEnabled
          AetheryteHelper.SaveSettings()
        end
        GUI:SetTooltip("auto use spiritbond manual") 
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("スピリットマニュアルの自動使用")
        end
      end
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Text("---")
      GUI:SameLine()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:Checkbox("##Moption", AHSET.isBotStatusM)
      GUI:SameLine()      
      GUI:Text("Link to Bot Status")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AHSET.isBotStatusM = not AHSET.isBotStatusM
          AetheryteHelper.SaveSettings()
        end
        GUI:SetTooltip("Automatically uncheck option(Manual)\nwhen Bot status:Not Running") 
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("minionに連動してオンオフする\nminionから独立して動くアドオンは不可")
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


      GUI:TreePop()

     
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

function AetheryteHelper.GCseals()
     GUI:BeginGroup()
     GUI:Text("GC")
     GUI:EndGroup()
     GUI:AlignFirstTextHeightToWidgets()
     GUI:BeginGroup()
     GUI:PushItemWidth(100)
     if language == 0 then
     AHSET.selectGC = GUI:Combo("GCseals:",Player.GrandCompany,mushGCJP,1)
     else
     AHSET.selectGC = GUI:Combo("GCseals:",Player.GrandCompany,mushGCEN,1)
     end
     if Player.GrandCompany == 0 then 
     AHSET.selectGC = GUI:Combo("GCseals:",4,mushGCEN,1) end
     AetheryteHelper.SaveSettings()
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
        GUI:SetTooltip("Your GC\nautomatically select\n\nMaelst(Limsa)/Adders(Gridania)/Flames(Uldah)") 
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("所属GCが自動で選ばれます\n\n黒渦団(リムサ)/双蛇党(グリダニア)/不滅隊(ウルダハ)")
        end
     end
     GUI:SameLine()
     GUI:BeginGroup()
     if AHSET.selectGC == 1 then mushGseals = Inventory:Get(2000):GetList()[2] 
     elseif Inventory:Get(2000):GetList()[2] == nil then mushGseals = nil end
     if AHSET.selectGC == 2 then mushGseals = Inventory:Get(2000):GetList()[3]
     elseif Inventory:Get(2000):GetList()[2] == nil then mushGseals = nil end
     if AHSET.selectGC == 3 then mushGseals = Inventory:Get(2000):GetList()[4]
     elseif Inventory:Get(2000):GetList()[2] == nil then mushGseals = nil end
     if AHSET.selectGC == 4 then mushGseals  = nil end  

     for k,v in pairs(mushPlayerGCrank) do
     if (k == Player.GrandCompanyRank) then mushmaxseal = v
     if mushGseals == nil then
     GUI:TextColored(1,1,1,.8,"0/"..mushmaxseal.max)
     elseif mushGseals.count == mushmaxseal.max then
     GUI:TextColored(1,0,0,.8,tostring(mushGseals.count).."/"..mushmaxseal.max)
     elseif mushGseals.count < mushmaxseal.max/2 then
     GUI:TextColored(0,1,1,.8,tostring(mushGseals.count).."/"..mushmaxseal.max)
     elseif mushGseals.count ~= mushmaxseal.max then
     GUI:TextColored(1,1,0,.8,tostring(mushGseals.count).."/"..mushmaxseal.max)
     elseif Player.GrandCompany == 0 then GUI:Text("GCseals:---/---")
     end
     end
     end
     GUI:EndGroup()

end


function AetheryteHelper.DrawSubtool()
      AetheryteHelper.Inventoryfree()
      GUI:Spacing()      
      GUI:BeginGroup()
      GUI:Text("Useful tools for items")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        GUI:SetTooltip("Materia Extract / Desynthesis / Exchange for GC seals / Aetherial Reduction")
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("マテリア錬成/装備分解/GCへの希少品納品/精選")
        end
      end

      GUI:Spacing()
      GUI:Separator()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      local seisen = ActionList:Get(5,14)
      if seisen.usable == false then GUI:TextColored(1,0,0,1,"Complete Quests get Skill!")
      elseif (mushPbtotal < 2) then AHSET.isMateriaEnabled = false GUI:TextColored(1,0,0,1,"inventory full!")
      elseif seisen.usable == true then GUI:TextColored(0,1,0,1,"usable skill") end
      GUI:Spacing()
      GUI:Checkbox("##Materia", AHSET.isMateriaEnabled)
      GUI:SameLine()
      GUI:Text("Materia Extract")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AHSET.isMateriaEnabled = not AHSET.isMateriaEnabled
          mushlooptimer = 2000
        end
        GUI:SetTooltip("in non combat")
        AetheryteHelper.SaveSettings()
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("非戦闘状態で装備品からマテリアを錬精します")
        end
      end
      AetheryteHelper.extractOption() 
    
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      local bunkai = ActionList:Get(5,5)
      if bunkai.usable == false then GUI:TextColored(1,0,0,1,"Complete Quests get Skill!")
      elseif (mushPbtotal < 2) then AHSET.isSalvageEnabled = false GUI:TextColored(1,0,0,1,"inventory full!")
      elseif bunkai.usable == true then GUI:TextColored(0,1,0,1,"usable skill") end
      GUI:Spacing()
      GUI:Checkbox("##Desynthesis", AHSET.isSalvageEnabled)
      GUI:SameLine()
      GUI:Text("Desynthesis equipment in Bag")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AHSET.isSalvageEnabled = not AHSET.isSalvageEnabled
          GCexchange = false
          AetheryteHelper.SaveSettings()
        end
        GUI:SetTooltip("desynthesis all equipment in your inventory\nWarning: Turning on this option will desynthesis\nall equipment in your inventory\nHowever, IL1 equipment will not be desynthesis")
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("インベントリの中の装備を分解\n警告:オンにするとインベントリ内の装備を全て分解します\nただし、IL1の装備は分解しません")
        end
      end
      if AHSET.CrafterMode == true then
        if (Player.Job == 8 or Player.Job == 9 or Player.Job == 10 or Player.Job == 11 or
        Player.Job == 12 or Player.Job == 13 or Player.Job == 14 or Player.Job == 15) then
         AHSET.isSalvageEnabled = false
        end
      end
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Text("---")
      GUI:SameLine()
      GUI:Checkbox("##use option", AHSET.isReductionOption)
      GUI:SameLine()
      GUI:Text("use settings")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AHSET.isReductionOption = not AHSET.isReductionOption
          
        end
        GUI:SetTooltip("use settings in Option Tab")
        AetheryteHelper.SaveSettings()
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("オプションタブの設定を有効にする")
        end
      end
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()    
      if Player.GrandCompanyRank < 6 then GUI:TextColored(1,0,0,1,"need GC rank 6 over")
      else GUI:TextColored(0,1,0,1,"available") end
      GUI:Spacing()
      GUI:Checkbox("##Exchange", GCexchange)
      GUI:SameLine()
      GUI:Text("Exchange gear in Bag")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          mushlooptimer = 1000
          mushEXstep = 0
          GCexchange = not GCexchange
          sealstoitem = false
          if mushTrustmode == true then GCexchange = false end
          if Player.GrandCompanyRank < 6 then GCexchange = false end

          if tonumber(mushGseals.count) == tonumber(mushmaxseal.max) then GCexchange = false end
          AHSET.isSalvageEnabled = false
          AetheryteHelper.SaveSettings()
        end
        GUI:SetTooltip("for GC seals ")
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("GCの希少品納品")
        end
      end
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Text("---")
      GUI:SameLine()
      GUI:Checkbox("##AutoMoveGC", AutoMoveGC)
      GUI:SameLine()
      GUI:Text("Auto Move to GC")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          mushlooptimer = 1000
          AutoMoveGC = not AutoMoveGC
          AHSET.isSalvageEnabled = false
        end
        GUI:SetTooltip("You'd better move yourself")
        AetheryteHelper.SaveSettings()
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("自動でGCに移動して納品します\n自分で移動したほうがいいときもある")
        end
      end
      GUI:SameLine(200)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Button("X",20,20)
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
           Player:Stop()
           mushlooptimer = 1000
           AutoMoveGC = false
        end
        GUI:SetTooltip("move to stop")
        AetheryteHelper.SaveSettings()
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("自動移動を停止")
        end
      end
      GUI:EndGroup()

if GUI:TreeNode("check before exchange") then
      GUI:BeginGroup() 
      GUI:Text("---")
      GUI:SameLine()
      GUI:Checkbox("##lessmax", AHSET.GCexlessmax)
      GUI:SameLine()
      GUI:Text("less max")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AHSET.GCexlessmax = not AHSET.GCexlessmax
        end
        GUI:SetTooltip("not done exchange over max seals")
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("軍票の最大を超えて納品しない")
        end
      end
      GUI:Spacing()
      GUI:BeginGroup() 
      GUI:Text("---")
      GUI:SameLine()
      GUI:Checkbox("##Remateria", Remateria)
      GUI:SameLine()
      GUI:TextColored(1,0,0,1,"Retrieve Materia")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          Remateria = not Remateria
          mushlooptimer = 2000
        end
        GUI:SetTooltip("Remove materia from equipment in inventory")
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("カバンの中の装備のマテリアを外す")
        end
      end
      GUI:TreePop()
      end



      GUI:Spacing()           
      AetheryteHelper.GCseals()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      local seisen = ActionList:Get(5,21)
      if seisen.usable == false then GUI:TextColored(1,0,0,1,"Complete Quests get Skill!")
      elseif (mushPbtotal < 1) then AHSET.isReductionEnabled = false GUI:TextColored(1,0,0,1,"inventory full!")
      elseif seisen.usable == true then GUI:TextColored(0,1,0,1,"usable skill") end
      GUI:Spacing()
      GUI:Checkbox("##AetherialReduction", AHSET.isReductionEnabled)
      GUI:SameLine()
      GUI:Text("Aetherial Reduction in Bag")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AHSET.isReductionEnabled = not AHSET.isReductionEnabled
          mushlooptimer = 2000
          AHSET.isQuestmode = false
          AetheryteHelper.SaveSettings()
        end
        GUI:SetTooltip("Aetherial Reduction\nStop when there is no more space in inventory")
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("精選\nカバンの空きが0になると動作しません")
        end
      end
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##Qmode", AHSET.isQuestmode)
      GUI:SameLine()      
      GUI:Text("Aetherial Reduction:QuestMode")
      GUI:TextColored(1,0,0,1,"   ---features for FFXIVminion")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AHSET.isQuestmode = not AHSET.isQuestmode
          mushlooptimer = 1000
          if (mushPbtotal < 1) then AHSET.isQuestmode = false end
          AHSET.isReductionEnabled = false
          AetheryteHelper.SaveSettings()
        end
        GUI:SetTooltip("Stop Bot before inventory is low space.\nPerform Aetherial Reduction & Running Bot again.\nneed at least 5 free spaces in inventory") 
        if (GUI:IsMouseDown(1)) then
        GUI:SetTooltip("minion連動\nカバンの空きが4以下になるとボットを停止し、精選を始めます。\n全て精選が終わると再びminionをオンにします")
        end
      end
      GUI:Spacing()

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
         io.popen([[cmd /c start "" "]]..Links.link2..[["]]):close()
      elseif GUI:IsItemClicked(1) then
         io.popen([[cmd /c start "" "]]..Links.link3..[["]]):close()
      end
      GUI:SetTooltip(Links.tooltip2)
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
            io.popen([[cmd /c start "" "]]..Links.link1..[["]]):close()
      end
      GUI:SetTooltip(Links.tooltip1)
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
     GUI:PushItemWidth(100)
     
     if ( gRegion == 1) then 
        AHSET.selectDC = GUI:Combo( "DC", AHSET.selectDC,FFXIVDClist,1)
        --AetheryteHelper.SaveSettings()
     end
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
     GUI:SetTooltip("Auto select DC")
     if (GUI:IsMouseDown(1)) then
     GUI:SetTooltip("DCは自動で選択されます")
     end
     end
     GUI:SameLine(150)
     GUI:BeginGroup()
     GUI:Checkbox("MB",AHSET.mushmovetoMB)
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
       if GUI:IsItemClicked(0) then
       AHSET.mushmovetoMB = not AHSET.mushmovetoMB
       end 
       GUI:SetTooltip("move to MB")
     if (GUI:IsMouseDown(1)) then
     GUI:SetTooltip("マケボへ移動")
     end
     end
     if AHSET.mushmovetoMB == false then
      if mushMBlim == true then mushMBlim = false Player:Stop() end
      if mushMBgri == true then mushMBgri = false Player:Stop() end
      if mushMBul == true then mushMBul = false Player:Stop() end
     end
     GUI:Text("select server(World Visit)")
     GUI:BeginGroup()
     GUI:PushItemWidth(180)
     if (table.valid(FFXIVServerlist[AHSET.selectDC])) then
     selectSVR = GUI:Combo( "server",selectSVR,MushmoveServerlist,height or 20)
     --d("num:"..selectSVR)
     else
     GUI:Combo( "DC",1,noDClist,1)
     GUI:Combo( "server",1,FFXIVServerlist[11],1)
     end
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
       GUI:SetTooltip("Select Server")
     if (GUI:IsMouseDown(1)) then
     GUI:SetTooltip("移動先のサーバーを選択")
     end
     end
     isServer = selectSVR

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

      if mushTrustmode == true then
      AetheryteHelper.GUI.tabs[1].isselected = false
      AetheryteHelper.GUI.tabs[2].isselected = false
      AetheryteHelper.GUI.tabs[3].isselected = true
      AetheryteHelper.GUI.tabs[4].isselected = false
      AetheryteHelper.desynthIL()

      elseif (AetheryteHelper.GUI.tabs[1].isselected) then
      AetheryteHelper.Drawinsselect() ----main 
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      
      AetheryteHelper.DCSVselect()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      AetheryteHelper.GLUtelepo() ----telepo
      AetheryteHelper.homeDCinfo()---info
      GUI:SameLine(180,0)
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Image(ImageFolder..[[kofi.png]],90,25)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if GUI:IsItemClicked(0) then
            io.popen([[cmd /c start "" "]]..kinokoProject.HELP.mykofi..[["]]):close()
      end
      GUI:SetTooltip("please support me to make good\n\nfor my cat....")
      if (GUI:IsMouseDown(1)) then
      GUI:SetTooltip("良い物を作るためにサポートしてください\n\nうちのねこのご飯が豪華になります")
      end
      end



      --AetheryteHelper.DrawInside()  ---tree    

      elseif (AetheryteHelper.GUI.tabs[2].isselected) then
      AetheryteHelper.DrawSubtool()

      elseif (AetheryteHelper.GUI.tabs[3].isselected) then

      AetheryteHelper.desynthIL()

      elseif (AetheryteHelper.GUI.tabs[4].isselected) then
   
      AetheryteHelper.DrawadWIP() ------button

      end
--------------------------------------------------------------------
--close Button
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:Separator()
      GUI:Spacing(5)
      if GUI:Button("Mini##"..Windows.Name,(GUI:GetWindowSize()), 40, 20) then
         Windows.Open = false
         minikinoko.Open = true
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
  AetheryteHelper.TMwindow()
  AetheryteHelper.minimush()
  AetheryteHelper.insSelecterWindow()
end


---------------------------------------------------------------------------------------------------------------------------------------------------
-- main function

function AetheryteHelper.insselect()
--d("[AetheryteHelper]---".."autheStep---"..autheStep.."---modechg---"..modechg.."---".."---isServer:"..isServer) ----debug
  if autheVar == nil then
    autheVar = true
    autheStep = 0
    isTime = 0
    else
    autheVar = not autheVar
  end

  --[[if (not Update.Timer or ticks - Update.Timer > Update.Pulse) then
    Update.Timer = ticks   
  end]]
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
                      Player:Stop()
                      Player:SetTarget(aetheID)
                      Player:Interact(aetheID)
                      UseControlAction("Aetheryte") 
                      if IsControlOpen("SelectString") then
                         GetControl("SelectString"):Action("SelectIndex",1)
                         autheStep = 6
                      end
              end
              if autheStep == 6 then
                        GetControl("WorldTravelSelect"):Action("SelectIndex",isServer)
                        UseControlAction("SelectYesno")
                     if IsControlOpen("SelectYesno") then
                        UseControlAction("SelectYesno","Yes")
                           moveSVR = not moveSVR
                           selectins = not selectins
                           autooff = not autooff
                           autheStep = 4
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
                  autheStep = 1
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
  --if (not Update.Timer or ticks - Update.Timer > Update.Pulse) then
  --  Update.Timer = ticks   
  --end

  if(selectins == true) and (Player.localmapid == 130) then
      --d("[AetheryteHelper]--".."["..Player.localmapid.."]".."WorldvisitOK")
      moveSVR = true
      modechg = 2
      autooff = false
      AetheryteHelper.insselect()
  elseif (selectins == true) and (Player.localmapid == 129) then
      --d("[AetheryteHelper]--".."["..Player.localmapid.."]".."WorldvisitOK")
      moveSVR = true
      modechg = 2
      autooff = false
      AetheryteHelper.insselect()
  elseif (selectins == true) and (Player.localmapid == 132) then
      --d("[AetheryteHelper]--".."["..Player.localmapid.."]".."WorldvisitOK")
      moveSVR = true
      modechg = 2
      autooff = false
      AetheryteHelper.insselect()
  elseif (selectins == true) then
      --d("[AetheryteHelper]--".."["..Player.localmapid.."]".."WorldvisitNG")
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
                isins = 0,
                selectins = false,
                autheStep = 0
            }
        end
    end
 end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--move to GC
function AetheryteHelper.movetoGCAll()
      if ( AutoMoveGC) then
        mushlooptimer = 1000
        if (AHSET.selectGC == 1) then
          AetheryteHelper.movetoCOMPANYlimsa()
        elseif (AHSET.selectGC == 2) then
          AetheryteHelper.movetoCOMPANYgridania()
        elseif (AHSET.selectGC == 3) then
          etheryteHelper.movetoCOMPANYuldah()
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
                      if dis < 5 then
                      GCStep = 1
                      end
              end
              if (GCStep == 1) then
                     Player:Interact(4298661156)                      
                     if IsControlOpen("SelectString") then
                     GetControl("SelectString"):Action("SelectIndex",0)
                     GCStep = 2
                     end
                     
              end
              if (GCStep == 2) then                      
                     if IsControlOpen("TelepotTown") then
                        GetControl("TelepotTown"):Action("Teleport",1)
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
                       mushlooptimer = 500
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
                       mushlooptimer = 500
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
                       mushlooptimer = 500
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
                  mushlooptimer = 1000
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
                  mushlooptimer = 1000
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
                  mushlooptimer = 1000
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
             if Player.GrandCompany == 1 then GCID1 = tonumber(mushCD1.limsa)   
             elseif Player.GrandCompany == 2 then GCID1 = tonumber(mushCD1.Gridania) 
             elseif Player.GrandCompany  == 3 then GCID1 = tonumber(mushCD1.Uldah) 
             else GCexchange = false
             end
       if (GCexchange)then
              if( mushEXstep == 0) then
                 d("[AH][Exchange]step:"..mushEXstep)
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
                d("[AH][Exchange]step:"..mushEXstep)
                  if IsControlOpen("GrandCompanySupplyList") then
                  GetControl("GrandCompanySupplyList"):PushButton(25,4)
                  --GetControl("GrandCompanySupplyList"):Action("SelectCategory",2)
                  mushEXstep = 2
                  end
              end
              if (mushEXstep == 2) then
                d("[AH][Exchange]step:"..mushEXstep)
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
                d("[AH][Exchange]step:"..mushEXstep)
                  if GetControl("GrandCompanySupplyList"):GetRawData()[347].value == 2 or 3 then
                  mushEXstep = 4
                  else
                  mushEXstep = 10
                  end
              end
              if (mushEXstep == 4) then
                d("[AH][Exchange]step:"..mushEXstep)
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
                d("[AH][Exchange]step:"..mushEXstep)
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
                d("[AH][Exchange]step:"..mushEXstep)
                  if IsControlOpen("GrandCompanySupplyList") then
                  mushEXstep = 2
                  elseif IsControlOpen("SelectYesno") then
                  mushEXstep = 7
                  end 
              end
              if (mushEXstep == 7) then
                d("[AH][Exchange]step:"..mushEXstep)
                 if AHSET.GCexlessmax == true then
                    mushEXstep = 8
                 elseif AHSET.GCexlessmax == false then
                    mushEXstep = 9
                 end 
              end
              if (mushEXstep == 8) then
                d("[AH][Exchange]step:"..mushEXstep)
                  if IsControlOpen("SelectYesno") then
                     UseControlAction("SelectYesno","No")
                      mushEXstep = 10
                  end   
              end
              if (mushEXstep == 9) then
                d("[AH][Exchange]step:"..mushEXstep)
                  if IsControlOpen("SelectYesno") then
                     UseControlAction("SelectYesno","Yes")
                      mushEXstep = 10
                  end   
              end
              if (mushEXstep == 10) then
                d("[AH][Exchange]step:"..mushEXstep)
                  if IsControlOpen("GrandCompanySupplyList") then
                  UseControlAction("GrandCompanySupplyList","Close")
                  mushEXstep = 11
                  end 
              end
              if (mushEXstep == 11 ) then
                d("[AH][Exchange]step:"..mushEXstep)
                  if IsControlOpen("SelectString") then
                  UseControlAction("SelectString","Close")
                  Player:ClearTarget()
                  mushEXstep = 0
                  mushlooptimer = 1000
                  GCexchange = false
                  end
              end
              if Player:GetTarget() == nil then
                 mushlooptimer = 1000
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
  local step = 0
  local nohinsoubi = 0
  if(mushTrustmode == true and AHSET.DesynthTrust == true ) then
           mushlooptimer = 5000
         if Duty:IsQueued() == true then
               local equip = {1000}
               for _, e in pairs(equip) do
               local equip_item = Inventory:Get(e)
               if (table.valid(equip_item)) then
               local equiplist = equip_item:GetList()
               if (table.valid(equiplist)) then
               for _, item in pairs(equiplist) do
                      if item.Condition < AHSET.mushrepairGear then
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
           

                        if step == 0 then
                           if Duty:IsQueued() == true then
                              Dawncloser = nil
                              mushlooptimer = 5000
                              step = 1
                           elseif nohinsoubi < 1 and sealstoitemT == false and GCexchangeT == false and Duty:IsQueued() == false then
                              Dawncloser = false
                              mushlooptimer = 5000
                              step = 45
                           elseif nohinsoubi > 0 and Duty:IsQueued() == false then
                              Dawncloser = true
                              mushlooptimer = 1000
                              step = 2
                           end
                        end
                        if step == 1 then
                          if Dawncloser == nil then
                            d("[AH][Tmode]:standby:[itemcount:"..nohinsoubi.."]")
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
                               mushlooptimer = 500
                               sealstoitemT = true
                               step = 3
                            elseif nohinsoubi > 0 then 
                               mushlooptimer = 1000
                               GCexchangeT = true
                               step = 30
                            elseif nohinsoubi > 0 and AHSET.GCexlessmax == true then
                               step = 3
                            end
                          end
                        end
                        if step == 3 then
                           if (sealstoitemT == true and mushtruninGCitem == true and mushtruninGCseals == true) then
                             d("[AH][Tmode][Trunin]:GCselect")
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
                            d("[AH][Tmode][Trunin]:itemSelect")            
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
                            d("[AH][Tmode][Trunin]step:"..step)
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
                            d("[AH][Tmode][Trunin]step:"..step)
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
                            d("[AH][Tmode][Trunin]step:"..step)
                              if IsControlOpen("GrandCompanyExchange") then
                              GetControl("GrandCompanyExchange"):Action("SelectItem",0,mushhosiikazu)
                              step = 24
                              end
                        end
                        if step == 8 then
                            d("[AH][Tmode][Trunin]step:"..step)                          
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
                            d("[AH][Tmode][Trunin]step:"..step)                          
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
                            d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") then
                              GetControl("GrandCompanyExchange"):Action("SelectItem",2,mushhosiikazu)
                              step = 24
                              end
                        end
                        if step == 11 then
                            d("[AH][Tmode][Trunin]step:"..step)                          
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
                            d("[AH][Tmode][Trunin]step:"..step)                          
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
                            d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") then
                              GetControl("GrandCompanyExchange"):Action("SelectItem",1,mushhosiikazu)
                              step = 24
                              end
                        end
                        if step == 14 then
                            d("[AH][Tmode][Trunin]step:"..step)                          
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
                            d("[AH][Tmode][Trunin]step:"..step)                          
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
                            d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") then
                              GetControl("GrandCompanyExchange"):Action("SelectItem",35,mushhosiikazu)
                              step = 24
                              end
                        end
                        if step == 17 then
                            d("[AH][Tmode][Trunin]step:"..step)                          
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
                            d("[AH][Tmode][Trunin]step:"..step)                          
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
                            d("[AH][Tmode][Trunin]step:"..step)                          
                              if IsControlOpen("GrandCompanyExchange") then
                              GetControl("GrandCompanyExchange"):Action("SelectItem",36,mushhosiikazu)
                              step = 24
                              end
                        end
                        if step == 20 then
                            d("[AH][Tmode][Trunin]step:"..step)                          
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
                            d("[AH][Tmode][Trunin]step:"..step)                          
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
                            d("[AH][Tmode][Trunin]step:"..step)                          
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
                            d("[AH][Tmode][Trunin]step:"..step)
                              if IsControlOpen("GrandCompanyExchange") then
                              UseControlAction("GrandCompanyExchange","Close")
                              end
                              Player:ClearTarget()
                              mushlooptimer = 5000
                              sealstoitemT = false
                              step = 0
                        end
                        

                        if step == 30 then
                             d("[AH][Tmode][Exchange]step:"..step)
                             if (GCexchangeT == true) then
                                 if Player.GrandCompany == 1 then GCID1 = tonumber(mushCD1.limsa)   
                                 elseif Player.GrandCompany == 2 then GCID1 = tonumber(mushCD1.Gridania) 
                                 elseif Player.GrandCompany  == 3 then GCID1 = tonumber(mushCD1.Uldah) 
                                 else GCexchangeT = false
                                 end
                                 step = 31
                             end
                        end
                        if step == 31 then
                            d("[AH][Tmode][Exchange]step:"..step)
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
                            d("[AH][Tmode][Exchange]step:"..step)
                                if IsControlOpen("GrandCompanySupplyList") then
                                --GetControl("GrandCompanySupplyList"):PushButton(25,4)
                                GetControl("GrandCompanySupplyList"):Action("SelectCategory",2)
                                step = 33
                                end
                        end
                        if step == 33 then
                            d("[AH][Tmode][Exchange]step:"..step)
                                if IsControlOpen("GrandCompanySupplyList") then
                                   if GetControl("GrandCompanySupplyList"):GetRawData()[8].value == 0 then 
                                   GCexchange = false
                                   step = 0
                                   elseif GetControl("GrandCompanySupplyList"):GetData().category ~= 2 then
                                   step = 32 
                                   elseif GetControl("GrandCompanySupplyList"):GetData().category == 2 then
                                   GetControl("GrandCompanySupplyList"):Action("SelectFilterIndex",2)
                                   step = 34
                                   end
                                end
                        end            
                        if step == 34 then
                            d("[AH][Tmode][Exchange]step:"..step)
                                if GetControl("GrandCompanySupplyList"):GetRawData()[347].value == 2 or 3 then
                                step = 35
                                else
                                step = 42
                                end
                        end
                        if step == 35 then
                            d("[AH][Tmode][Exchange]step:"..step)
                                if IsControlOpen("GrandCompanySupplyList") then
                                GetControl("GrandCompanySupplyList"):Action("CompleteDelivery",0)
                                step = 36
                                else
                                step = 33
                                end
                        end
                        if step == 36 then
                            d("[AH][Tmode][Exchange]step:"..step)
                                if IsControlOpen("GrandCompanySupplyList") then
                                step = 42
                                elseif IsControlOpen("GrandCompanySupplyReward") then
                                GetControl("GrandCompanySupplyReward"):Action("Deliver")
                                step = 33
                                
                                end
                        end
                         if step == 42 then
                          d("[AH][Tmode][Exchange]step:"..step)
                               if IsControlOpen("GrandCompanySupplyList") then
                               UseControlAction("GrandCompanySupplyList","Close")
                               step = 43
                               end
                        end
                         if step == 43 then
                          d("[AH][Tmode][Exchange]step:"..step)
                               if IsControlOpen("SelectString") then
                               UseControlAction("SelectString","Close")
                               step = 44
                               end
                        end
                        if step == 44 then
                          d("[AH][Tmode][Exchange]step:"..step)
                               Player:ClearTarget()
                               mushlooptimer = 1000
                               GCexchange = false
                               step = 0
                        end


                       if step == 45 then
                              if Dawncloser == false then
                         d("[AH][TMode]:trust Que waiting")
                                if IsControlOpen("GrandCompanySupplyList") then
                                UseControlAction("GrandCompanySupplyList","Close")
                                step = 45
                                elseif IsControlOpen("SelectString") then
                                UseControlAction("SelectString","Close")
                                end
                              Player:ClearTarget()
                              GCexchangeT = false
                              mushlooptimer = 5000
                              step = 0
                              end
                       end
        end
        end
        end
        end        
  end
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--
function AetheryteHelper.undersizeIDswitch()
   if mushundersize == true then    
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
          mushGSjcpstep = 3
       end
       --d("mushGSjcpstep"..mushGSjcpstep)
     end

     if mushGSjcpstep == 3 then
       if IsControlOpen("LotteryWeeklyInput")then 
          mushGSjcpstep = 4
       elseif IsControlOpen("LotteryWeeklyRewardList") then 
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
            mushGSjcpstep = 37
        --d("mushGSjcpstep"..mushGSjcpstep)
       end
     end
     if mushGSjcpstep == 37 then
         if IsControlOpen("SelectYesno") then
         UseControlAction("SelectYesno","Yes")
         mushGSjcpstep = 37
         elseif IsControlOpen("SelectString") then 
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
             UseControlAction("Talk", "Destroy")
             mushGSjcpstep = 40             
             --d("mushGSjcpstep"..mushGSjcpstep)
             mushlooptimer = 1000  
             mushJumbocactpothelper = false
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
-- sub function
function AetheryteHelper.mushMaterialize()
   if (AHSET.DesynthTrust == true ) then
         if (AHSET.isMateriaEnabled and Player.IsMounted == false and Player:GetTarget() == nil and Duty:IsQueued() == true ) then 
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
   elseif (AHSET.DesynthTrust == false ) then
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
           mushtoItemstep = 2000
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
       if (AHSET.isSalvageEnabled and Player.IsMounted == false and Player:GetTarget() == nil and not IsControlOpen("Trade") and Duty:IsQueued() == true ) then
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


function AetheryteHelper.mushTextCommands()
    mushlooptimer = 500
    local log = GetChatLines()
    local logmatch = nil
    local mushtextstep = 0
    local logmatchtime = 0
    for _, command in pairs(log) do  
      if command.line:match("AHmode 114") and command.code == 56 then
           logmatch = command.line
           mushlogtime = command.timestamp
           mushtextstep = 1
           logmatchtime = 30
      end
      if command.line:match("AHMB limsa") and command.code == 56 then
           logmatch = command.line
           mushlogtime = command.timestamp
           mushtextstep = 10
           logmatchtime = 30
      end
      if command.line:match("AHMB gridania") and command.code == 56 then
           logmatch = command.line
           mushlogtime = command.timestamp
           mushtextstep = 20
           logmatchtime = 30
      end
      if command.line:match("AHMB uldah") and command.code == 56 then
           logmatch = command.line
           mushlogtime = command.timestamp
           mushtextstep = 30
           logmatchtime = 30
      end
    end
    if mushtextstep == 1 then
       if AetheryteHelper.insSelectGUI.open == true then
       mushtext114 = false
       logmatch = nil
       mushtextstep = 0
       else
       mushtextstep = 2
       end
    end
    if mushtextstep == 2 then
       if logmatch then        
          if mushlogtime > os.time()-logmatchtime then
          mushtext114 = true
          mushtextstep = 3
          else
          mushtext114 = false
          mushtextstep = 0
          end
       end
     end
     if mushtextstep == 3 then
        if mushtext114 then
           AetheryteHelper.insSelectGUI.open = true
           AHSET.delay = 150
           SendTextCommand("/e \x02\x13\x06\xfe\xff\x11\x99\x11 [AH][insSelecter Mini]:open")
           if language == 0 then
           SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\x11\x11 注意! \xee\x81\xaf ウィンドウは5秒ほど閉じることができません")
           mushtextstep = 99
           else
           SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\x11\x11 Caution! \xee\x81\xaf can't close it for about 5 sec to window")
           mushtextstep = 99
           end
        end
     end
     if mushtextstep == 10 then
       if AHSET.mushmovetoMB == true and mushMBlim == true then
       mushtextMBlim = false
       logmatch = nil
       mushtextstep = 0
       else
       mushtextstep = 11
       end
    end
    if mushtextstep == 11 then
       if logmatch then        
          if mushlogtime > os.time()-logmatchtime then
          mushtextMBlim = true
          mushtextstep = 12
          else
          mushtextMBlim = false
          mushtextstep = 0
          end
       end
     end
     if mushtextstep == 12 then
        if mushtextMBlim then
           AHSET.mushmovetoMB = true
           mushMBlim = true
           SendTextCommand("/e \x02\x13\x06\xfe\xff\x11\x99\x11 [AH][MB][Limsa]:ON")
           mushtextstep = 99
        end
     end
     if mushtextstep == 20 then
       if AHSET.mushmovetoMB == true and mushMBgri == true then
       mushtextMBgri = false
       logmatch = nil
       mushtextstep = 0
       else
       mushtextstep = 21
       end
    end
    if mushtextstep == 21 then
       if logmatch then        
          if mushlogtime > os.time()-logmatchtime then
          mushtextMBgri = true
          mushtextstep = 22
          else
          mushtextMBgri = false
          mushtextstep = 0
          end
       end
     end
     if mushtextstep == 22 then
        if mushtextMBgri then
           AHSET.mushmovetoMB = true
           mushMBgri = true
           SendTextCommand("/e \x02\x13\x06\xfe\xff\x11\x99\x11 [AH][MB][Gridania]:ON")
           mushtextstep = 99
        end
     end
     if mushtextstep == 30 then
       if AHSET.mushmovetoMB == true and mushMBul == true then
       mushtextMBul = false
       logmatch = nil
       mushtextstep = 0
       else
       mushtextstep = 31
       end
    end
    if mushtextstep == 31 then
       if logmatch then        
          if mushlogtime > os.time()-logmatchtime then
          mushtextMBul = true
          mushtextstep = 32
          else
          mushtextMBul = false
          mushtextstep = 0
          end
       end
     end
     if mushtextstep == 32 then
        if mushtextMBul then
           AHSET.mushmovetoMB = true
           mushMBul = true
           SendTextCommand("/e \x02\x13\x06\xfe\xff\x11\x99\x11 [AH][MB][Ul'dah]:ON")
           mushtextstep = 99
        end
     end          
     if mushtextstep == 99 then
        mushlogtime = os.time()
        mushtext114 = false
        mushtextMBlim = false
        mushtextMBgri = false
        mushtextMBul = false
        logmatch = nil
      d("[AH][textcommand]:success")
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