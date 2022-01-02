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

mushroom#8009
]]
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------



---------------------------------------------------------------------------------------------------------------------------------
AetheryteHelper = {}
-----------------------------------------------------------------------------------------------------------------
--table
local kinokoProject = {
  Addon  = {
      Folder =        "AetheryteHelper",
      Name =          "Aetheryte Helper",
      Version =         "1.1.3",   
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

                    },
      
  },
--  ---------------
  HELP   = {
      entext =       { "・Code optimization\n・language switching\n\nlink:", }, 
      jptext =       { "・コードの最適化\n・各項目のローカライズ\n\nlink:", },
      linkjp = [[https://github.com/mushroom8009/AutheryteHelper/wiki/Autheryte-Helper%E3%81%AE%E4%BD%BF%E3%81%84%E6%96%B9]],
      linken = [[https://github.com/mushroom8009/AutheryteHelper/wiki/How-to-use-%22-Autheryte-Helper-%22-in-minion]],
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
      Name =          "AetheryteHelper",
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
      Visible =         false,
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
      name = "[tool]"
    },
    [3] = {
      isselected = false,
      name = "[-wip-]"
    },
  },
  tabstyle = {
        selected = {r =.1, g = 1 , b =.1 , a = 1},
        hovered = {r =.4, g = .7, b = .1, a = 1 },
        normal = {r = 1, g = 1, b = 1, a = 1},
  },
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
    isBotStatusP = false,
    isBotStatusM = false,
    --autoDCchk = true,
    dminil = 5,
    dmaxil = 600,
    selectDC = 1,
    Pcurrnt = Player.currentworld
    
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
             
  },




}
-------------------
Links = {
      Name = "Minion Discord JP",
       link1 = [[https://discord.com/channels/127540472812929024/335225564803891210]],
       link2 = [[https://github.com/mushroom8009/AetheryteHelper]],
       link3 = [[https://github.com/mushroom8009/AutheryteHelper/releases]],
      tooltip1 = "it's a hobby,\nso i don't know if it's possible,\nbut let me know if you have any requests.\n\n不具合とかあれば教えて下さい",
      tooltip2 = "Github link,\nLeft click:home\nRight click:Release",

      

}

----------------------------------------------------


FFXIVDClist = { "------", "Elemental", "Gaia", "Mana", "Aether", "Primal", "Chaos", "Light", "Crystal" }
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
    [10] = { "not support region" },
  }

--DCID = { 1 = "Elemental", 2 = "Gaia", 3 = "Mana", 4 = "Aether", 5 = "Primal", 6 = "Chaos", 7 = "Light", 8 = "Crystal" }

WorldID = {
{id=1,Name="Unknown",DC="-"},{id=2,Name="Unknown",DC="-"},{id=3,Name="Unknown",DC="-"},{id=4,Name="Unknown",DC="-"},{id=5,Name="Unknown",DC="-"},{id=6,Name="Unknown",DC="-"},{id=7,Name="Unknown",DC="-"},{id=8,Name="Unknown",DC="-"},
{id=9,Name="Unknown",DC="-"},{id=10,Name="Unknown",DC="-"},{id=11,Name="Unknown",DC="-"},{id=12,Name="Unknown",DC="-"},{id=13,Name="Unknown",DC="-"},{id=14,Name="Unknown",DC="-"},{id=15,Name="Unknown",DC="-"},{id=16,Name="Unknown",DC="-"},
{id=17,Name="Unknown",DC="-"},{id=18,Name="Unknown",DC="-"},{id=19,Name="Unknown",DC="-"},{id=20,Name="Unknown",DC="-"},{id=21,Name="Unknown",DC="-"},{id=22,Name="Unknown",DC="-"},{id=23,Name="Asura",DC="Mana"},{id=24,Name="Belias",DC="Mana"},
{id=25,Name="Chaos",DC="-"},{id=26,Name="Hecatoncheir",DC="-"},{id=27,Name="Moomba",DC="-"},{id=28,Name="Pandaemonium",DC="Mana"},{id=29,Name="Shinryu",DC="Mana"},{id=30,Name="Unicorn",DC="Elemental"},{id=31,Name="Yojimbo",DC="Gaia"},
{id=32,Name="Zeromus",DC="Gaia"},{id=33,Name="Twintania",DC="Light"},{id=34,Name="Brynhildr",DC="Crystal"},{id=35,Name="Famfrit",DC="Primal"},{id=36,Name="Lich",DC="Light"},{id=37,Name="Mateus",DC="Crystal"},{id=38,Name="Shemhazai",DC="-"},
{id=39,Name="Omega",DC="Chaos"},{id=40,Name="Jenova",DC="Aether"},{id=41,Name="Zalera",DC="Crystal"},{id=42,Name="Zodiark",DC="Light"},{id=43,Name="Alexander",DC="Gaia"},{id=44,Name="Anima",DC="Mana"},{id=45,Name="Carbuncle",DC="Elemental"},
{id=46,Name="Fenrir",DC="Gaia"},{id=47,Name="Hades",DC="Mana"},{id=48,Name="Ixion",DC="Mana"},{id=49,Name="Kujata",DC="Elemental"},{id=50,Name="Typhon",DC="Elemental"},{id=51,Name="Ultima",DC="Gaia"},{id=52,Name="Valefor",DC="Gaia"},
{id=53,Name="Exodus",DC="Primal"},{id=54,Name="Faerie",DC="Aether"},{id=55,Name="Lamia",DC="Primal"},{id=56,Name="Phoenix",DC="Light"},{id=57,Name="Siren",DC="Aether"},{id=58,Name="Garuda",DC="Elemental"},{id=59,Name="Ifrit",DC="Gaia"},
{id=60,Name="Ramuh",DC="Elemental"},{id=61,Name="Titan",DC="Mana"},{id=62,Name="Diabolos",DC="Crystal"},{id=63,Name="Gilgamesh",DC="Aether"},{id=64,Name="Leviathan",DC="Primal"},{id=65,Name="Midgardsormr",DC="Aether"},
{id=66,Name="Odin",DC="Light"},{id=67,Name="Shiva",DC="Light"},{id=68,Name="Atomos",DC="Elemental"},{id=69,Name="Bahamut",DC="Gaia"},{id=70,Name="Chocobo",DC="Mana"},{id=71,Name="Moogle",DC="Chaos"},{id=72,Name="Tonberry",DC="Elemental"},
{id=73,Name="Adamantoise",DC="Aether"},{id=74,Name="Coeurl",DC="Crystal"},{id=75,Name="Malboro",DC="Crystal"},{id=76,Name="Tiamat",DC="Gaia"},{id=77,Name="Ultros",DC="Primal"},{id=78,Name="Behemoth",DC="Primal"},{id=79,Name="Cactuar",DC="Aether"},
{id=80,Name="Cerberus",DC="Chaos"},{id=81,Name="Goblin",DC="Crystal"},{id=82,Name="Mandragora",DC="Mana"},{id=83,Name="Louisoix",DC="Chaos"},{id=84,Name="Syldra",DC="-"},{id=85,Name="Spriggan",DC="Chaos"},{id=90,Name="Aegis",DC="Elemental"},
{id=91,Name="Balmung",DC="Crystal"},{id=92,Name="Durandal",DC="Gaia"},{id=93,Name="Excalibur",DC="Primal"},{id=94,Name="Gungnir",DC="Elemental"},{id=95,Name="Hyperion",DC="Primal"},{id=96,Name="Masamune",DC="Mana"},{id=97,Name="Ragnarok",DC="Chaos"},
{id=98,Name="Ridill",DC="Gaia"},{id=99,Name="Sargatanas",DC="Aether"}, 
}
MoveServer = { 132, 129, 130 }
ploc = { 956, 957, 958, 959, 960, 961 }
local uuid = GetUUID()
AetheryteHelper.savefile = GetStartupPath() .. '\\LuaMods\\AetheryteHelper\\UserSettings\\' ..'CharacterID'..uuid.. '_setting.lua'
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

local selectSVR = 1
----------------------------------------
--subtool local
local lastUpdatePulse = 0

----------------------------------------
--wip local
local PTadd = false


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
end
---------------------------------------------------------------------------------------------------------------------------------------------------
--save fanction
AetheryteHelper.LoadSettings()
function AetheryteHelper.SaveSettings()
  persistence.store(AetheryteHelper.savefile, AetheryteHelper.settings)
  
end
---------------------------------------------------------------------------------------------------------------------------------------------------
-- ins select GUI
function AetheryteHelper.Drawinsselect()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Text("Tips : use MobHunt & Rare F.A.T.E")      
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        GUI:SetTooltip("--instance select--\nonly use EW area\n・Labyrinthos\n・Thavnair\n・Garlemald\n・Mare Lamentorum\n・Elpis\n・Ultima Thule\n--move server--\n・Gridania\n・Limsa\n・Uldah")
      end
  
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:SameLine()
      GUI:Checkbox("##select_ins", selectins)
      GUI:SameLine(30)
      GUI:Text("Helper Enable")
      GUI:EndGroup()      
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          selectins = not selectins
          autheStep = 0
        if ( moveSVR == false ) then  modechg = 3 end 
          end       
         GUI:SetTooltip("Auto on/off\nOnly possible in front of Aetheryte")
      end
      
      GUI:Spacing()
      
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
      end           
      GUI:Separator()    
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      local changed
        AetheryteHelper.settings.SET.delay, changed = GUI:SliderInt("ms",AetheryteHelper.settings.SET.delay,100,1000)
        
        if (GUI:IsItemHovered()) then
        GUI:SetTooltip("access delay\n100ms-1000ms")
        AetheryteHelper.SaveSettings()
        end

      GUI:EndGroup()
      --GUI:Spacing() 
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button( "Reset",40, 20)
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AetheryteHelper.settings.SET.delay = 200
          AetheryteHelper.SaveSettings()
          autheStep = 0
        end
        GUI:SetTooltip("delay RESET")
        end
      GUI:EndGroup()
      
      GUI:Separator()
      GUI:Spacing()
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button( "ins 1", 55, 20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          if AetheryteHelper.settings.SET.delay == 114 then selectins = true end
          isins = 1
          --if (selectins)then GetControl("SelectString"):Action("SelectIndex",1) end     
       end
      GUI:SetTooltip("go to instance 1\nrepeate click")
      end
      
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button( "ins 2", 55, 20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
           if AetheryteHelper.settings.SET.delay == 114 then selectins = true end
         isins = 2
        --if (selectins)then GetControl("SelectString"):Action("SelectIndex",2) end
        end
        GUI:SetTooltip("go to instance 2\nrepeate click")
      end
      
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button( "ins 3", 55, 20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          if AetheryteHelper.settings.SET.delay == 114 then selectins = true end
         isins = 3
        --if (selectins)then GetControl("SelectString"):Action("SelectIndex",3) end
        end
        GUI:SetTooltip("go to instance 3\nrepeate click")
      end
      
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()      
      GUI:Button( "free", 55, 20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          if AetheryteHelper.settings.SET.delay == 114 then selectins = true end
        isins = 0
       --if (selectins)then GetControl("SelectString"):Action("SelectIndex",0) end       
        end
        GUI:SetTooltip("auto select")
      end
end
-------------------------------------------------------------------------------------------------------------------------------------
-- telepo button GUI

function AetheryteHelper.GLUtelepo()
      GUI:BeginGroup()
      GUI:Text("Go to Gridania, Limsa Lominsa, Ul'dah")
      GUI:EndGroup()
            if (GUI:IsItemHovered()) then
            GUI:SetTooltip("available from the central aetheryte")
            end
      GUI:BeginGroup()  
      GUI:Button("Gridania",80,20)
      GUI:EndGroup()
            if (GUI:IsItemHovered()) then
            if ((GUI:IsMouseClicked(0)) and ( Player.localmapid ~= 132)) then
              Player:Teleport(2,0)
              moveSVR = true
              autooff = false
              modechg = 2
            end
            GUI:SetTooltip("Teleport to Gridania")
            end
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button("Limsa",80,20)
      GUI:EndGroup()
            if (GUI:IsItemHovered()) then
            if ((GUI:IsMouseClicked(0)) and ( Player.localmapid ~= 129)) then
              Player:Teleport(8,0)
              moveSVR = true
              autooff = false
              modechg = 2
            end
            GUI:SetTooltip("Teleport to Limsa")
            end
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button("Uldah",80,20)
      GUI:EndGroup()
            if (GUI:IsItemHovered()) then
            if ((GUI:IsMouseClicked(0)) and ( Player.localmapid ~= 130)) then
              Player:Teleport(9,0)
              moveSVR = true
              autooff = false
              modechg = 2
            end
            GUI:SetTooltip("Teleport to Uldah")
            end
end

---------------------------------------------------------------------------------------------------------------------------------------------------
-- wip tab3 button GUI

function AetheryteHelper.DrawadButton()
      GUI:Separator()
      GUI:Spacing(10)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Button("flag",40,20)
      GUI:EndGroup()
            if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
              SendTextCommand("/e <flag>")
              end
              GUI:SetTooltip("Send TextCommand in Game>> /e <flag>")              
            end
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
     GUI:EndGroup()
end

--------------------------------------------------------------------------------------------------------------------------------------------------
--help tree GUI

function AetheryteHelper.Drawhelp(_entext)
  if GUI:TreeNode("Upcoming Features##AetheryteHelper") then
    for id, e in pairs(_entext) do
      GUI:Text(e)
      GUI:BeginGroup()
      GUI:TextColored( 1,1,0,1,"How to use  Autheryte Helper" )
      GUI:EndGroup()
      if GUI:IsItemClicked(0) then
            io.popen([[cmd /c start "" "]]..kinokoProject.HELP.linken..[["]]):close()
      end
    end
    GUI:Text("--------------------------------")
    GUI:TreePop()
  end
end

function AetheryteHelper.Drawhelp(_jptext)
  if GUI:TreeNode("今後の予定##AetheryteHelper") then
    for id, e in pairs(_jptext) do
      GUI:Text(e)
      GUI:BeginGroup()
      GUI:TextColored( 1,1,0,1,"Autheryte Helperの使い方" )
      GUI:EndGroup()
   if GUI:IsItemClicked(0) then
            io.popen([[cmd /c start "" "]]..kinokoProject.HELP.linkjp..[["]]):close()
      end

    end
    GUI:Text("--------------------------------")
    GUI:TreePop()
  end
end

function AetheryteHelper.DrawInside()
  if kinokoProject.Windows.MainWindows.Open == false then
        GUI:Text("--------------------------------")
  end 
  ----
  if language == 0 then
      AetheryteHelper.Drawhelp(kinokoProject.HELP.jptext)
      
  else
      AetheryteHelper.Drawhelp(kinokoProject.HELP.entext)
 
  ----  
  end
end

---------------------------------------------------------------------------------------------------------------------------------------------------
--desyunth ilset tree GUI

function AetheryteHelper.desynthIL(Event, ticks)
  if GUI:TreeNode("IL Setting##AetheryteHelper") then 
     GUI:BeginGroup()
     GUI:PushItemWidth(80)
     AetheryteHelper.settings.SET.dminil = GUI:InputInt("< IL",AetheryteHelper.settings.SET.dminil,1,500)
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
     AetheryteHelper.SaveSettings()
           GUI:SetTooltip("IL1-IL1000\nこの数字より大きいIL装備を分解します")              
            end
     GUI:SameLine()
     GUI:BeginGroup()
     AetheryteHelper.settings.SET.dmaxil = GUI:InputInt("> IL",AetheryteHelper.settings.SET.dmaxil,1,500)
     if (AetheryteHelper.settings.SET.dminil < 1) then AetheryteHelper.settings.SET.dminil = 1 end        
     if (AetheryteHelper.settings.SET.dmaxil < 5) then AetheryteHelper.settings.SET.dmaxil = 5 end
     if (AetheryteHelper.settings.SET.dmaxil > 1000) then AetheryteHelper.settings.SET.dmaxil = 1000 end
     if (AetheryteHelper.settings.SET.dminil > AetheryteHelper.settings.SET.dmaxil) then AetheryteHelper.settings.SET.dminil = AetheryteHelper.settings.SET.dmaxil end
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then
     AetheryteHelper.SaveSettings()
           GUI:SetTooltip("IL5-IL1000\nIL1を除きこれ未満のIL装備を分解します")              
            end
      GUI:BeginGroup()
      GUI:Button("Reset",40,20)
      GUI:EndGroup()
            if (GUI:IsItemHovered()) then
            if (GUI:IsMouseClicked(0)) then
              AetheryteHelper.settings.SET.dminil = 5
              AetheryteHelper.settings.SET.dmaxil = 600
              AetheryteHelper.SaveSettings()
              end
              GUI:SetTooltip("Setting IL Reset")              
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
          GUI:SetTooltip("チェックを入れたものを分解します。\n大事な装備はアーマリーチェストへ入れましょう")              
      end
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()      
      GUI:BeginGroup()
      GUI:PushItemWidth()
      GUI:Checkbox("Main", AetheryteHelper.settings.Filter.Main)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Filter.Main = not  AetheryteHelper.settings.Filter.Main
           end
      AetheryteHelper.SaveSettings()
      GUI:SetTooltip("Primary")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Sub", AetheryteHelper.settings.Filter.Sub)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Filter.Sub = not  AetheryteHelper.settings.Filter.Sub
           end
      AetheryteHelper.SaveSettings()
      GUI:SetTooltip("Secondary & Shield")              
      end

      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Head", AetheryteHelper.settings.Filter.Head)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Filter.Head = not  AetheryteHelper.settings.Filter.Head
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Head")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Earrings", AetheryteHelper.settings.Filter.Earrings)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Filter.Earrings = not  AetheryteHelper.settings.Filter.Earrings
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Earrings")              
      end

      GUI:Spacing()
      
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Body", AetheryteHelper.settings.Filter.Body)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Filter.Body = not  AetheryteHelper.settings.Filter.Body
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Body")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Necklace", AetheryteHelper.settings.Filter.Necklace)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Filter.Necklace = not  AetheryteHelper.settings.Filter.Necklace
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Necklace")              
      end

      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Hand", AetheryteHelper.settings.Filter.Hand)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Filter.Hand = not  AetheryteHelper.settings.Filter.Hand
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Hand")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Bracelets", AetheryteHelper.settings.Filter.Bracelets)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Filter.Bracelets = not  AetheryteHelper.settings.Filter.Bracelets
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Bracelets")              
      end
      
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Legs", AetheryteHelper.settings.Filter.Legs)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Filter.Legs = not  AetheryteHelper.settings.Filter.Legs
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Legs")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Ring", AetheryteHelper.settings.Filter.Ring)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Filter.Ring = not  AetheryteHelper.settings.Filter.Ring
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Ring")              
      end
      
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Feet", AetheryteHelper.settings.Filter.Feet)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Filter.Feet = not  AetheryteHelper.settings.Filter.Feet
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Feet")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Button("Quick Change",100,20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Filter.Main = true
            AetheryteHelper.settings.Filter.Sub = true 
            AetheryteHelper.settings.Filter.Head = true
           AetheryteHelper.settings.Filter.Body = true
           AetheryteHelper.settings.Filter.Hand = true
           AetheryteHelper.settings.Filter.Legs = true
           AetheryteHelper.settings.Filter.Feet = true
           AetheryteHelper.settings.Filter.Earrings = true
           AetheryteHelper.settings.Filter.Necklace = true
           AetheryteHelper.settings.Filter.Bracelets = true
           AetheryteHelper.settings.Filter.Ring = true
        AetheryteHelper.SaveSettings()
           end
        if (GUI:IsMouseClicked(1)) then
           AetheryteHelper.settings.Filter.Main = not AetheryteHelper.settings.Filter.Main
           AetheryteHelper.settings.Filter.Sub = not AetheryteHelper.settings.Filter.Sub
           AetheryteHelper.settings.Filter.Head = not AetheryteHelper.settings.Filter.Head
           AetheryteHelper.settings.Filter.Body = not AetheryteHelper.settings.Filter.Body
           AetheryteHelper.settings.Filter.Hand = not AetheryteHelper.settings.Filter.Hand
           AetheryteHelper.settings.Filter.Legs = not AetheryteHelper.settings.Filter.Legs
           AetheryteHelper.settings.Filter.Feet = not AetheryteHelper.settings.Filter.Feet
           AetheryteHelper.settings.Filter.Earrings = not AetheryteHelper.settings.Filter.Earrings
           AetheryteHelper.settings.Filter.Necklace = not AetheryteHelper.settings.Filter.Necklace
           AetheryteHelper.settings.Filter.Bracelets = not AetheryteHelper.settings.Filter.Bracelets
           AetheryteHelper.settings.Filter.Ring = not AetheryteHelper.settings.Filter.Ring
        AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Left click : all on\nRight click : Reverse")              
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
      GUI:Checkbox("Tank", AetheryteHelper.settings.Job.Tank)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.Tank = not  AetheryteHelper.settings.Job.Tank
           end
      AetheryteHelper.SaveSettings()
      GUI:SetTooltip("PLD / WAR / DRK / GNB")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Healer", AetheryteHelper.settings.Job.Healer)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.Healer = not  AetheryteHelper.settings.Job.Healer
           end
      AetheryteHelper.SaveSettings()
      GUI:SetTooltip("WHM / SCH / AST / SGE")              
      end

      GUI:Spacing()
      
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Slaying", AetheryteHelper.settings.Job.Slaying)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.Slaying = not  AetheryteHelper.settings.Job.Slaying
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Accessories :\nMNK / DRG / SAM / RPR")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Aiming", AetheryteHelper.settings.Job.Aiming)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.Aiming = not  AetheryteHelper.settings.Job.Aiming
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("BRD / MCN / DNC")              
      end

      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Striking", AetheryteHelper.settings.Job.Striking)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.Striking = not  AetheryteHelper.settings.Job.Striking
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("MNK / SAM")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Sorcerer", AetheryteHelper.settings.Job.Sorcerer)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.Sorcerer = not  AetheryteHelper.settings.Job.Sorcerer
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("BLM / SMN / RDM")              
      end

      GUI:Spacing()
     
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Maiming", AetheryteHelper.settings.Job.Maiming)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.Maiming = not  AetheryteHelper.settings.Job.Maiming
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("DRG / RPR")              
      end

      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Scouting", AetheryteHelper.settings.Job.Scouting)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.Scouting = not  AetheryteHelper.settings.Job.Scouting
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("NIN")              
      end
      
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Button("Quick Change",100,20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
           AetheryteHelper.settings.Job.Tank = true
           AetheryteHelper.settings.Job.Healer = true
           AetheryteHelper.settings.Job.Slaying = true
           AetheryteHelper.settings.Job.Aiming = true
           AetheryteHelper.settings.Job.Striking = true
           AetheryteHelper.settings.Job.Sorcerer = true
           AetheryteHelper.settings.Job.Maiming = true
           AetheryteHelper.settings.Job.Scouting = true
           AetheryteHelper.SaveSettings()
           end
        if (GUI:IsMouseClicked(1)) then
           AetheryteHelper.settings.Job.Tank = not  AetheryteHelper.settings.Job.Tank
           AetheryteHelper.settings.Job.Healer = not  AetheryteHelper.settings.Job.Healer
           AetheryteHelper.settings.Job.Slaying = not  AetheryteHelper.settings.Job.Slaying
           AetheryteHelper.settings.Job.Aiming = not  AetheryteHelper.settings.Job.Aiming
           AetheryteHelper.settings.Job.Striking = not  AetheryteHelper.settings.Job.Striking
           AetheryteHelper.settings.Job.Sorcerer = not  AetheryteHelper.settings.Job.Sorcerer
           AetheryteHelper.settings.Job.Maiming = not  AetheryteHelper.settings.Job.Maiming
           AetheryteHelper.settings.Job.Scouting = not  AetheryteHelper.settings.Job.Scouting
           AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Left click : all on\nRight click : Reverse")              
      end

      GUI:Spacing()
      GUI:Text("------------------------------")
      GUI:Spacing()
      GUI:TextColored(0,1,1,1,"・Arms" ) 
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("PLD", AetheryteHelper.settings.Job.PLD)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.PLD = not  AetheryteHelper.settings.Job.PLD
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary / Secondary")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("WHM", AetheryteHelper.settings.Job.WHM)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.WHM = not  AetheryteHelper.settings.Job.WHM
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary / Secondary")              
      end

      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("WAR", AetheryteHelper.settings.Job.WAR)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.WAR = not  AetheryteHelper.settings.Job.WAR
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("SCH", AetheryteHelper.settings.Job.SCH)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.SCH = not  AetheryteHelper.settings.Job.SCH
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      end
      
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("DRK", AetheryteHelper.settings.Job.DRK)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.DRK = not  AetheryteHelper.settings.Job.DRK
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("AST", AetheryteHelper.settings.Job.AST)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.AST = not  AetheryteHelper.settings.Job.AST
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      end
      
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("GNB", AetheryteHelper.settings.Job.GNB)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.GNB = not  AetheryteHelper.settings.Job.GNB
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("SGE", AetheryteHelper.settings.Job.SGE)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.SGE = not  AetheryteHelper.settings.Job.SGE
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      end
      
      GUI:Spacing()
   
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("MNK", AetheryteHelper.settings.Job.MNK)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.MNK = not  AetheryteHelper.settings.Job.MNK
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("BRD", AetheryteHelper.settings.Job.BRD)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.BRD = not  AetheryteHelper.settings.Job.BRD
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      end
      
      GUI:Spacing()      

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("DRG", AetheryteHelper.settings.Job.DRG)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.DRG = not  AetheryteHelper.settings.Job.DRG
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("MCN", AetheryteHelper.settings.Job.MCN)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.MCN = not  AetheryteHelper.settings.Job.MCN
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      end
      
      GUI:Spacing()      

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("NIN", AetheryteHelper.settings.Job.NIN)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.NIN = not  AetheryteHelper.settings.Job.NIN
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("DNC", AetheryteHelper.settings.Job.DNC)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.DNC = not  AetheryteHelper.settings.Job.DNC
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      end
      
      GUI:Spacing()      

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("SAM", AetheryteHelper.settings.Job.SAM)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.SAM = not  AetheryteHelper.settings.Job.SAM
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("BLM", AetheryteHelper.settings.Job.BLM)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.BLM = not  AetheryteHelper.settings.Job.BLM
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary / Secondary")              
      end
      
      GUI:Spacing()      
      
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("RPR", AetheryteHelper.settings.Job.RPR)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.RPR = not  AetheryteHelper.settings.Job.RPR
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("SMN", AetheryteHelper.settings.Job.SMN)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.SMN = not  AetheryteHelper.settings.Job.SMN
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
      end

      GUI:Spacing()

      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("RDM", AetheryteHelper.settings.Job.RDM)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.RDM = not  AetheryteHelper.settings.Job.RDM
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Primary Weapon")              
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
            AetheryteHelper.settings.Job.PLD = true
            AetheryteHelper.settings.Job.WHM = true
            AetheryteHelper.settings.Job.WAR = true
            AetheryteHelper.settings.Job.SCH = true
            AetheryteHelper.settings.Job.DRK = true
            AetheryteHelper.settings.Job.AST = true
            AetheryteHelper.settings.Job.GNB = true
            AetheryteHelper.settings.Job.SGE = true
            AetheryteHelper.settings.Job.MNK = true
            AetheryteHelper.settings.Job.BRD = true
            AetheryteHelper.settings.Job.DRG = true
            AetheryteHelper.settings.Job.MCN = true
            AetheryteHelper.settings.Job.NIN = true
            AetheryteHelper.settings.Job.DNC = true
            AetheryteHelper.settings.Job.SAM = true
            AetheryteHelper.settings.Job.BLM = true
            AetheryteHelper.settings.Job.RPR = true
            AetheryteHelper.settings.Job.SMN = true
            AetheryteHelper.settings.Job.RDM = true
            AetheryteHelper.SaveSettings()
           end
        if (GUI:IsMouseClicked(1)) then
            AetheryteHelper.settings.Job.PLD = not  AetheryteHelper.settings.Job.PLD
            AetheryteHelper.settings.Job.WHM = not  AetheryteHelper.settings.Job.WHM
            AetheryteHelper.settings.Job.WAR = not  AetheryteHelper.settings.Job.WAR
            AetheryteHelper.settings.Job.SCH = not  AetheryteHelper.settings.Job.SCH
            AetheryteHelper.settings.Job.DRK = not  AetheryteHelper.settings.Job.DRK
            AetheryteHelper.settings.Job.AST = not  AetheryteHelper.settings.Job.AST
            AetheryteHelper.settings.Job.GNB = not  AetheryteHelper.settings.Job.GNB
            AetheryteHelper.settings.Job.SGE = not  AetheryteHelper.settings.Job.SGE
            AetheryteHelper.settings.Job.MNK = not  AetheryteHelper.settings.Job.MNK
            AetheryteHelper.settings.Job.BRD = not  AetheryteHelper.settings.Job.BRD
            AetheryteHelper.settings.Job.DRG = not  AetheryteHelper.settings.Job.DRG
            AetheryteHelper.settings.Job.MCN = not  AetheryteHelper.settings.Job.MCN
            AetheryteHelper.settings.Job.NIN = not  AetheryteHelper.settings.Job.NIN
            AetheryteHelper.settings.Job.DNC = not  AetheryteHelper.settings.Job.DNC
            AetheryteHelper.settings.Job.SAM = not  AetheryteHelper.settings.Job.SAM
            AetheryteHelper.settings.Job.BLM = not  AetheryteHelper.settings.Job.BLM
            AetheryteHelper.settings.Job.RPR = not  AetheryteHelper.settings.Job.RPR
            AetheryteHelper.settings.Job.SMN = not  AetheryteHelper.settings.Job.SMN
            AetheryteHelper.settings.Job.RDM = not  AetheryteHelper.settings.Job.RDM
            AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Left click : all on\nRight click : Reverse")              
      end
      GUI:Spacing()
      GUI:Text("------------------------------")
      GUI:Spacing()
      GUI:Spacing()
      GUI:TextColored(0,1,1,1,"・Tool & Armor & Accessories" ) 
      GUI:Spacing()
      
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Crafter", AetheryteHelper.settings.Job.Crafter)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.Crafter = not  AetheryteHelper.settings.Job.Crafter
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Tool & Armor & Accessories")              
      end
      GUI:SameLine(150)
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("Gatherer", AetheryteHelper.settings.Job.Gatherer)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
            AetheryteHelper.settings.Job.Gatherer = not  AetheryteHelper.settings.Job.Gatherer
      AetheryteHelper.SaveSettings()
           end
      GUI:SetTooltip("Tool & Armor & Accessories")              
      end

     GUI:Spacing()
     GUI:TreePop()
  end



end

---------------------------------------------------------------------------------------------------------------------------------------------------
--materia option tree GUI

function AetheryteHelper.extractOption(Event, ticks)
  if GUI:TreeNode("Extract Option##AetheryteHelper") then
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##Potion", AetheryteHelper.settings.SET.isPotionEnabled)
      GUI:SameLine()
      GUI:Text("Spiritbond Potion")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AetheryteHelper.settings.SET.isPotionEnabled = not AetheryteHelper.settings.SET.isPotionEnabled
          AetheryteHelper.SaveSettings()         
        end
        GUI:SetTooltip("錬精薬の自動使用")
        --GUI:SetTooltip("Automatic usage of a spiritbond potion whenever it expires")
      end
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Text("---")
      GUI:SameLine()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:Checkbox("##MPoption", AetheryteHelper.settings.SET.isBotStatusP)
      GUI:SameLine()      
      GUI:Text("Link to Bot Status")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AetheryteHelper.settings.SET.isBotStatusP = not AetheryteHelper.settings.SET.isBotStatusP
          AetheryteHelper.SaveSettings()
        end
        GUI:SetTooltip("Automatically uncheck option(Potion)\nwhen Bot status:Not Running") 
      end    
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##Manual", AetheryteHelper.settings.SET.isManualEnabled)
      GUI:SameLine()      
      GUI:Text("Spiritbond Manual")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AetheryteHelper.settings.SET.isManualEnabled = not AetheryteHelper.settings.SET.isManualEnabled
          AetheryteHelper.SaveSettings()
        end
        GUI:SetTooltip("スピリットマニュアルの自動使用") 
      end
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Text("---")
      GUI:SameLine()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:Checkbox("##MPoption", AetheryteHelper.settings.SET.isBotStatusM)
      GUI:SameLine()      
      GUI:Text("Link to Bot Status")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AetheryteHelper.settings.SET.isBotStatusM = not AetheryteHelper.settings.SET.isBotStatusM
          AetheryteHelper.SaveSettings()
        end
        GUI:SetTooltip("Automatically uncheck option(Manual)\nwhen Bot status:Not Running") 
      end
      if (FFXIV_Common_BotRunning == false) and (AetheryteHelper.settings.SET.isBotStatusP == true) then
        AetheryteHelper.settings.SET.isPotionEnabled = false
      elseif (FFXIV_Common_BotRunning == true) and (AetheryteHelper.settings.SET.isBotStatusP == true) then
        AetheryteHelper.settings.SET.isPotionEnabled = true

      end
      if (FFXIV_Common_BotRunning == false) and (AetheryteHelper.settings.SET.isBotStatusM == true) then
        AetheryteHelper.settings.SET.isManualEnabled = false
      elseif (FFXIV_Common_BotRunning == true) and (AetheryteHelper.settings.SET.isBotStatusM == true) then
        AetheryteHelper.settings.SET.isManualEnabled = true

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

function AetheryteHelper.DrawSubtool(event, ticks)
      AetheryteHelper.Inventoryfree()
      GUI:Spacing()      
      GUI:BeginGroup()
      GUI:Text("Materia Extract & Desynthesis")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        GUI:SetTooltip("Materia Extract & Desynthesis")
        --GUI:SetTooltip("Automatic materia extraction out of combat of spiritbonded items")
      end

      GUI:Spacing()
      GUI:Separator()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      local seisen = ActionList:Get(5,14)
      if seisen.usable == false then GUI:TextColored(1,0,0,1,"Complete Quests get Skill!")
      elseif (mushPbtotal < 2) then AetheryteHelper.settings.SET.isMateriaEnabled = false GUI:TextColored(1,0,0,1,"inventory full!")
      elseif seisen.usable == true then GUI:TextColored(0,1,0,1,"usable skill") end
      GUI:Checkbox("##Materia", AetheryteHelper.settings.SET.isMateriaEnabled)
      
      
      GUI:SameLine()
      GUI:Text("Materia Extract")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AetheryteHelper.settings.SET.isMateriaEnabled = not AetheryteHelper.settings.SET.isMateriaEnabled
        end
        GUI:SetTooltip("非戦闘状態で装備品からマテリアを錬精します")
        AetheryteHelper.SaveSettings()
      end
      AetheryteHelper.extractOption()
      
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      local bunkai = ActionList:Get(5,5)
      if bunkai.usable == false then GUI:TextColored(1,0,0,1,"Complete Quests get Skill!")
      elseif (mushPbtotal < 3) then AetheryteHelper.settings.SET.isSalvageEnabled = false GUI:TextColored(1,0,0,1,"inventory full!")
      elseif bunkai.usable == true then GUI:TextColored(0,1,0,1,"usable skill") end
      GUI:Checkbox("##Desynthesis", AetheryteHelper.settings.SET.isSalvageEnabled)
      GUI:SameLine()
      GUI:Text("Desynthesis equipment in Bag")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AetheryteHelper.settings.SET.isSalvageEnabled = not AetheryteHelper.settings.SET.isSalvageEnabled
          AetheryteHelper.SaveSettings()
        end
        GUI:SetTooltip("インベントリの中の装備を分解\n警告:オンにするとインベントリ内の装備を全て分解します\nただし、IL1の装備は分解しません")
      end
      GUI:Spacing()
      GUI:BeginGroup()
      GUI:Text("---")
      GUI:SameLine()
      GUI:Checkbox("##use option", AetheryteHelper.settings.SET.isReductionOption)
      GUI:SameLine()
      GUI:Text("use option")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AetheryteHelper.settings.SET.isReductionOption = not AetheryteHelper.settings.SET.isReductionOption
        end
        GUI:SetTooltip("use settings to Desynthesis")
        AetheryteHelper.SaveSettings()
      end

      AetheryteHelper.desynthIL()

            GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      local seisen = ActionList:Get(5,21)
      if seisen.usable == false then GUI:TextColored(1,0,0,1,"Complete Quests get Skill!")
      elseif (mushPbtotal < 1) then AetheryteHelper.settings.SET.isReductionEnabled = false GUI:TextColored(1,0,0,1,"inventory full!")
      elseif seisen.usable == true then GUI:TextColored(0,1,0,1,"usable skill") end
      GUI:Checkbox("##AetherialReduction", AetheryteHelper.settings.SET.isReductionEnabled)
      GUI:SameLine()
      GUI:Text("Aetherial Reduction in Bag (Beta)")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          AetheryteHelper.settings.SET.isReductionEnabled = not AetheryteHelper.settings.SET.isReductionEnabled
          AetheryteHelper.SaveSettings()
        end
        GUI:SetTooltip("Aetherial Reduction\n\n精選")
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
     if (AH_AutoDC == "Elemental") then AetheryteHelper.settings.SET.selectDC = 2
         elseif (AH_AutoDC == "Gaia" ) then AetheryteHelper.settings.SET.selectDC = 3
         elseif (AH_AutoDC == "Mana" ) then AetheryteHelper.settings.SET.selectDC = 4
         elseif (AH_AutoDC == "Aether" ) then AetheryteHelper.settings.SET.selectDC = 5
         elseif (AH_AutoDC == "Primal" ) then AetheryteHelper.settings.SET.selectDC = 6
         elseif (AH_AutoDC == "Chaos" ) then AetheryteHelper.settings.SET.selectDC = 7
         elseif (AH_AutoDC == "Light" ) then AetheryteHelper.settings.SET.selectDC = 8
         elseif (AH_AutoDC == "Crystal" ) then AetheryteHelper.settings.SET.selectDC = 9
         else AetheryteHelper.settings.SET.selectDC = 1
      end
end

-----------------------------------------------------------
--Player CurrentWorld save
local mushPcurrnt = AetheryteHelper.settings.SET.Pcurrnt
if mushPcurrnt ~= nil then AetheryteHelper.SaveSettings() end
-------------------------------------------------------------------------------------------------------------------------------------------
-- list GUI

function AetheryteHelper.Origin()
           Origin_list = {} 
           musholist = FFXIVServerlist[AetheryteHelper.settings.SET.selectDC]
           for k, v in ipairs(musholist) do
           Origin_list[k] = v
--d(Origin_list)
           end
end

function AetheryteHelper.DCSVselect()
            AetheryteHelper.Origin()
         if (mushPcerrnt ~= Player.currentworld) then
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
          end
     AetheryteHelper.autoDCset()
     GUI:BeginGroup()
     GUI:PushItemWidth(100)
     
     if ( gRegion == 1) then 
        AetheryteHelper.settings.SET.selectDC = GUI:Combo( "DC", AetheryteHelper.settings.SET.selectDC,FFXIVDClist,1)
        --AetheryteHelper.SaveSettings()
     end
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then GUI:SetTooltip("Auto select DC") end
     GUI:Text("select server(World Visit)")
     GUI:BeginGroup()
     GUI:PushItemWidth(180)
     if (table.valid(FFXIVServerlist[AetheryteHelper.settings.SET.selectDC])) then
     selectSVR = GUI:Combo( "server",selectSVR,MushmoveServerlist,height or 20)
     --d("num:"..selectSVR)
     else
     GUI:Combo( "DC",1,noDClist,1)
     GUI:Combo( "server",10,FFXIVServerlist[10],1)
     end
     GUI:EndGroup()
     if (GUI:IsItemHovered()) then GUI:SetTooltip("Select Server") end
     isServer = selectSVR

end

--------------------------------------------------------------------------------
-- header & All Drowcall GUI

function AetheryteHelper.DrawCall(event, ticks)
  local Windows = kinokoProject.Windows.MainWindows
  local Addon = kinokoProject.Addon

 if (Windows.Open) then
    GUI:SetNextWindowSize(280,350,GUI.SetCond_FirstUseEver)
    Windows.Visible, Windows.Open = GUI:Begin(Addon.Name.." - v"..Addon.Version.."##MainWindows_begin", Windows.Open, Windows.Option)
    if (Windows.Visible) then
      GUI:BeginGroup()
      GUI:Text("[")
      GUI:SameLine()
      GUI:TextColored(0.7,0.8,0.1,1,GetMapName(Player.localmapid))
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

      if (AetheryteHelper.GUI.tabs[1].isselected) then
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
      
      
      
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()            
      
      GUI:Separator()
      GUI:Spacing()
      AetheryteHelper.DrawInside()  ---tree    

      elseif (AetheryteHelper.GUI.tabs[2].isselected) then
      AetheryteHelper.DrawSubtool()
  
      elseif (AetheryteHelper.GUI.tabs[3].isselected) then
      GUI:BeginGroup()
      GUI:Text("wip\nなんか思いついたらつくるための空き地")
      GUI:EndGroup()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##PTadd", PTadd)
      GUI:SameLine()
      GUI:Text("test")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          PTadd = not PTadd
        end
      end    

      GUI:SameLine()
      AetheryteHelper.DrawadButton() ------button
      end
--------------------------------------------------------------------
--close Button
      GUI:AlignFirstTextHeightToWidgets()
      GUI:Spacing(5)
      GUI:Separator()
      if GUI:Button("Close##"..Windows.Name,(GUI:GetWindowSize()), 40, 20) then
         Windows.Open = false
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
end


---------------------------------------------------------------------------------------------------------------------------------------------------
-- main function

function AetheryteHelper.insselect(Event, ticks)
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
      if autheVar and TimeSince(isTime) > AetheryteHelper.settings.SET.delay then
              aetheID = 0
              local el = EntityList("nearest,type=5")
              if table.valid(el) then
                      for k,v in pairs(el) do
                              aetheID = v.id
                      end
              end
              if autheStep == 0 then
                      Player:SetTarget(aetheID)
                      Player:Interact(aetheID)
                      UseControlAction("Aetheryte") 
                      if IsControlOpen("SelectString") then
                         GetControl("SelectString"):Action("SelectIndex",modechg)
                         if (modechg == 3) then autheStep = 1 else autheStep = 2 end
                      end
              end
              if (autheStep == 1) then                      
                     if IsControlOpen("SelectYesno") then
                            UseControlAction("SelectYesno","No")
                            selectins = not selectins
                     elseif IsControlOpen("SelectString") then
                            GetControl("SelectString"):Action("SelectIndex",isins)
                            isTime = Now()
                            isins = 4
                            autheStep = 0
                     elseif Player:GetTarget() == nil then
                            isTime = Now()
                            autheStep = 0
                      end
              end
              if autheStep == 2 then
--                        Player:SetTarget(aetheID)
--                        Player:Interact(aetheID)
                        GetControl("WorldTravelSelect"):Action("SelectIndex",isServer)
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
         end  

      if Player:GetTarget() == nil then
         if( autooff ) then
          selectins = not selectins
        --else
        --autheStep = 0
         end
      end
    end
  end



---------------------------------------------------------------------------------------------------------------------------------------------------
--fix function

function AetheryteHelper.fixfunc(Event, ticks)
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

      if (item.equipslot > 0 and item.requiredlevel > 1 ) then
      item:Salvage()     
      return
      end
      end
         

      end
      end
      end
end



function AetheryteHelper.SalvageSlotfilter()
     local bags = {0, 1, 2, 3}
     for _, e in pairs(bags) do
     local bag = Inventory:Get(e)
     if (table.valid(bag)) then
     local ilist = bag:GetList()
     if (table.valid(ilist)) then
     for _, item in pairs(ilist) do

      if (AetheryteHelper.settings.Filter.Main) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13)) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Sub) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 2) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Head) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 3) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Body) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 4) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Hand) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 5) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Legs) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 7) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Feet) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 8) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Earrings) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 9) then
      item:Salvage()     
      return
      end
      end 
      if (AetheryteHelper.settings.Filter.Necklace) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 10) then
      item:Salvage()     
      return
      end
      end 
      if (AetheryteHelper.settings.Filter.Bracelets) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 11) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Ring) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 12) then
      item:Salvage()     
      return
      end
      end
         

      end
      end
      end
      end
end


function AetheryteHelper.SalvageJobTank()
     local bags = {0, 1, 2, 3}
     for _, e in pairs(bags) do
     local bag = Inventory:Get(e)
     if (table.valid(bag)) then
     local ilist = bag:GetList()
     if (table.valid(ilist)) then
     for _, item in pairs(ilist) do


      if (AetheryteHelper.settings.Filter.Head) and ( AetheryteHelper.settings.Job.Tank ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 3 and item.category == 59) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Body) and ( AetheryteHelper.settings.Job.Tank ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 4 and item.category == 59) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Hand) and ( AetheryteHelper.settings.Job.Tank ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 5 and item.category == 59) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Legs) and ( AetheryteHelper.settings.Job.Tank ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 7 and item.category == 59) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Feet) and ( AetheryteHelper.settings.Job.Tank ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 8 and item.category == 59) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Earrings) and ( AetheryteHelper.settings.Job.Tank ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 9 and item.category == 59) then
      item:Salvage()     
      return
      end
      end 
      if (AetheryteHelper.settings.Filter.Necklace) and ( AetheryteHelper.settings.Job.Tank ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 10 and item.category == 59) then
      item:Salvage()     
      return
      end
      end 
      if (AetheryteHelper.settings.Filter.Bracelets) and ( AetheryteHelper.settings.Job.Tank ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 11 and item.category == 59) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Ring) and ( AetheryteHelper.settings.Job.Tank )  then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 12 and item.category == 59) then
      item:Salvage()     
      return
      end
      end
         

      end
      end
      end
      end


end


function AetheryteHelper.SalvageJobHealer()
     local bags = {0, 1, 2, 3}
     for _, e in pairs(bags) do
     local bag = Inventory:Get(e)
     if (table.valid(bag)) then
     local ilist = bag:GetList()
     if (table.valid(ilist)) then
     for _, item in pairs(ilist) do


      if (AetheryteHelper.settings.Filter.Head) and ( AetheryteHelper.settings.Job.Healer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 3 and item.category == 64) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Body) and ( AetheryteHelper.settings.Job.Healer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 4 and item.category == 64) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Hand) and ( AetheryteHelper.settings.Job.Healer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 5 and item.category == 64) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Legs) and ( AetheryteHelper.settings.Job.Healer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 7 and item.category == 64) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Feet) and ( AetheryteHelper.settings.Job.Healer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 8 and item.category == 64) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Earrings) and ( AetheryteHelper.settings.Job.Healer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 9 and item.category == 64) then
      item:Salvage()     
      return
      end
      end 
      if (AetheryteHelper.settings.Filter.Necklace) and ( AetheryteHelper.settings.Job.Healer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 10 and item.category == 64) then
      item:Salvage()     
      return
      end
      end 
      if (AetheryteHelper.settings.Filter.Bracelets) and ( AetheryteHelper.settings.Job.Healer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 11 and item.category == 64) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Ring) and ( AetheryteHelper.settings.Job.Healer )  then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 12 and item.category == 64) then
      item:Salvage()     
      return
      end
      end
         

      end
      end
      end
      end


end

function AetheryteHelper.SalvageJobSlaying()
     local bags = {0, 1, 2, 3}
     for _, e in pairs(bags) do
     local bag = Inventory:Get(e)
     if (table.valid(bag)) then
     local ilist = bag:GetList()
     if (table.valid(ilist)) then
     for _, item in pairs(ilist) do

  
      if (AetheryteHelper.settings.Filter.Head) and ( AetheryteHelper.settings.Job.Slaying ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 3 and item.category == 84) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Body) and ( AetheryteHelper.settings.Job.Slaying ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 4 and item.category == 84) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Hand) and ( AetheryteHelper.settings.Job.Slaying ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 5 and item.category == 84) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Legs) and ( AetheryteHelper.settings.Job.Slaying ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 7 and item.category == 84) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Feet) and ( AetheryteHelper.settings.Job.Slaying ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 8 and item.category == 84) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Earrings) and ( AetheryteHelper.settings.Job.Slaying ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 9 and item.category == 84) then
      item:Salvage()     
      return
      end
      end 
      if (AetheryteHelper.settings.Filter.Necklace) and ( AetheryteHelper.settings.Job.Slaying ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 10 and item.category == 84) then
      item:Salvage()     
      return
      end
      end 
      if (AetheryteHelper.settings.Filter.Bracelets) and ( AetheryteHelper.settings.Job.Slaying ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 11 and item.category == 84) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Ring) and ( AetheryteHelper.settings.Job.Slaying )  then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 12 and item.category == 84) then
      item:Salvage()     
      return
      end
      end
         

      end
      end
      end
      end


end

function AetheryteHelper.SalvageJobStriking()
     local bags = {0, 1, 2, 3}
     for _, e in pairs(bags) do
     local bag = Inventory:Get(e)
     if (table.valid(bag)) then
     local ilist = bag:GetList()
     if (table.valid(ilist)) then
     for _, item in pairs(ilist) do

     
      if (AetheryteHelper.settings.Filter.Head) and ( AetheryteHelper.settings.Job.Striking ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 3 and item.category == 65) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Body) and ( AetheryteHelper.settings.Job.Striking ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 4 and item.category == 65) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Hand) and ( AetheryteHelper.settings.Job.Striking ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 5 and item.category == 65) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Legs) and ( AetheryteHelper.settings.Job.Striking ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 7 and item.category == 65) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Feet) and ( AetheryteHelper.settings.Job.Striking ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 8 and item.category == 65) then
      item:Salvage()     
      return
      end
      end
       

      end
      end
      end
      end


end

function AetheryteHelper.SalvageJobAiming()
     local bags = {0, 1, 2, 3}
     for _, e in pairs(bags) do
     local bag = Inventory:Get(e)
     if (table.valid(bag)) then
     local ilist = bag:GetList()
     if (table.valid(ilist)) then
     for _, item in pairs(ilist) do


      if (AetheryteHelper.settings.Filter.Head) and ( AetheryteHelper.settings.Job.Aiming ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 3 and item.category == 66) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Body) and ( AetheryteHelper.settings.Job.Aiming ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 4 and item.category == 66) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Hand) and ( AetheryteHelper.settings.Job.Aiming ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 5 and item.category == 66) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Legs) and ( AetheryteHelper.settings.Job.Aiming ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 7 and item.category == 66) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Feet) and ( AetheryteHelper.settings.Job.Aiming ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 8 and item.category == 66) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Earrings) and ( AetheryteHelper.settings.Job.Aiming ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 9 and item.category == 105) then
      item:Salvage()     
      return
      end
      end 
      if (AetheryteHelper.settings.Filter.Necklace) and ( AetheryteHelper.settings.Job.Aiming ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 10 and item.category == 105) then
      item:Salvage()     
      return
      end
      end 
      if (AetheryteHelper.settings.Filter.Bracelets) and ( AetheryteHelper.settings.Job.Aiming ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 11 and item.category == 105) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Ring) and ( AetheryteHelper.settings.Job.Aiming )  then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 12 and item.category == 105) then
      item:Salvage()     
      return
      end
      end
         

      end
      end
      end
      end


end

function AetheryteHelper.SalvageJobSorcerer()
     local bags = {0, 1, 2, 3}
     for _, e in pairs(bags) do
     local bag = Inventory:Get(e)
     if (table.valid(bag)) then
     local ilist = bag:GetList()
     if (table.valid(ilist)) then
     for _, item in pairs(ilist) do


      if (AetheryteHelper.settings.Filter.Head) and ( AetheryteHelper.settings.Job.Sorcerer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 3 and item.category == 63) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Body) and ( AetheryteHelper.settings.Job.Sorcerer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 4 and item.category == 63) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Hand) and ( AetheryteHelper.settings.Job.Sorcerer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 5 and item.category == 63) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Legs) and ( AetheryteHelper.settings.Job.Sorcerer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 7 and item.category == 63) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Feet) and ( AetheryteHelper.settings.Job.Sorcerer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 8 and item.category == 63) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Earrings) and ( AetheryteHelper.settings.Job.Sorcerer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 9 and item.category == 63) then
      item:Salvage()     
      return
      end
      end 
      if (AetheryteHelper.settings.Filter.Necklace) and ( AetheryteHelper.settings.Job.Sorcerer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 10 and item.category == 63) then
      item:Salvage()     
      return
      end
      end 
      if (AetheryteHelper.settings.Filter.Bracelets) and ( AetheryteHelper.settings.Job.Sorcerer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 11 and item.category == 63) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Ring) and ( AetheryteHelper.settings.Job.Sorcerer )  then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 12 and item.category == 63) then
      item:Salvage()     
      return
      end
      end
         

      end
      end
      end
      end


end

function AetheryteHelper.SalvageJobMaiming()
     local bags = {0, 1, 2, 3}
     for _, e in pairs(bags) do
     local bag = Inventory:Get(e)
     if (table.valid(bag)) then
     local ilist = bag:GetList()
     if (table.valid(ilist)) then
     for _, item in pairs(ilist) do


      if (AetheryteHelper.settings.Filter.Head) and ( AetheryteHelper.settings.Job.Maiming ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 3 and item.category == 76) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Body) and ( AetheryteHelper.settings.Job.Maiming ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 4 and item.category == 76) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Hand) and ( AetheryteHelper.settings.Job.Maiming ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 5 and item.category == 76) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Legs) and ( AetheryteHelper.settings.Job.Maiming ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 7 and item.category == 76) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Feet) and ( AetheryteHelper.settings.Job.Maiming ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 8 and item.category == 76) then
      item:Salvage()     
      return
      end
      end     

      end
      end
      end
      end


end

function AetheryteHelper.SalvageJobScouting()
     local bags = {0, 1, 2, 3}
     for _, e in pairs(bags) do
     local bag = Inventory:Get(e)
     if (table.valid(bag)) then
     local ilist = bag:GetList()
     if (table.valid(ilist)) then
     for _, item in pairs(ilist) do


      if (AetheryteHelper.settings.Filter.Head) and ( AetheryteHelper.settings.Job.Scouting ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 3 and item.category == 103) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Body) and ( AetheryteHelper.settings.Job.Scouting ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 4 and item.category == 103) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Hand) and ( AetheryteHelper.settings.Job.Scouting ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 5 and item.category == 103) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Legs) and ( AetheryteHelper.settings.Job.Scouting ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 7 and item.category == 103) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Feet) and ( AetheryteHelper.settings.Job.Scouting ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 8 and item.category == 103) then
      item:Salvage()     
      return
      end
      end     

      end
      end
      end
      end


end


function AetheryteHelper.SalvageJobGatherer()
     local bags = {0, 1, 2, 3}
     for _, e in pairs(bags) do
     local bag = Inventory:Get(e)
     if (table.valid(bag)) then
     local ilist = bag:GetList()
     if (table.valid(ilist)) then
     for _, item in pairs(ilist) do

      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.Gatherer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13)
        and (item.category == 17 or item.category == 18 or item.category == 19))then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Sub) and ( AetheryteHelper.settings.Job.Gatherer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 2
        and (item.category == 17 or item.category == 18 or item.category == 19)) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Head) and ( AetheryteHelper.settings.Job.Gatherer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 3  and item.category == 32 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Body) and ( AetheryteHelper.settings.Job.Gatherer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 4  and item.category == 32 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Hand) and ( AetheryteHelper.settings.Job.Gatherer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 5  and item.category == 32 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Legs) and ( AetheryteHelper.settings.Job.Gatherer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 7  and item.category == 32 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Feet) and ( AetheryteHelper.settings.Job.Gatherer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 8  and item.category == 32 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Earrings) and ( AetheryteHelper.settings.Job.Gatherer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 9  and item.category == 32 ) then
      item:Salvage()     
      return
      end
      end 
      if (AetheryteHelper.settings.Filter.Necklace) and ( AetheryteHelper.settings.Job.Gatherer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 10  and item.category == 32 ) then
      item:Salvage()     
      return
      end
      end 
      if (AetheryteHelper.settings.Filter.Bracelets) and ( AetheryteHelper.settings.Job.Gatherer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 11  and item.category == 32 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Ring) and ( AetheryteHelper.settings.Job.Gatherer ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 12  and item.category == 32 ) then
      item:Salvage()     
      return
      end
      end
         

      end
      end
      end
      end
end

function AetheryteHelper.SalvageJobCrafter()
     local bags = {0, 1, 2, 3}
     for _, e in pairs(bags) do
     local bag = Inventory:Get(e)
     if (table.valid(bag)) then
     local ilist = bag:GetList()
     if (table.valid(ilist)) then
     for _, item in pairs(ilist) do

      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.Crafter ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13)
        and (item.category == 9 or item.category == 10 or item.category == 11 or item.category == 12 or item.category == 13 or item.category == 14 or item.category == 15 or item.category == 16))then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Sub) and ( AetheryteHelper.settings.Job.Crafter ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 2
        and (item.category == 9 or item.category == 10 or item.category == 11 or item.category == 12 or item.category == 13 or item.category == 14 or item.category == 15 or item.category == 16)) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Head) and ( AetheryteHelper.settings.Job.Crafter ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 3  and item.category == 33 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Body) and ( AetheryteHelper.settings.Job.Crafter ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 4  and item.category == 33 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Hand) and ( AetheryteHelper.settings.Job.Crafter ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 5  and item.category == 33 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Legs) and ( AetheryteHelper.settings.Job.Crafter ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 7  and item.category == 33 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Feet) and ( AetheryteHelper.settings.Job.Crafter ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 8  and item.category == 33 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Earrings) and ( AetheryteHelper.settings.Job.Crafter ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 9  and item.category == 33 ) then
      item:Salvage()     
      return
      end
      end 
      if (AetheryteHelper.settings.Filter.Necklace) and ( AetheryteHelper.settings.Job.Crafter ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 10  and item.category == 33 ) then
      item:Salvage()     
      return
      end
      end 
      if (AetheryteHelper.settings.Filter.Bracelets) and ( AetheryteHelper.settings.Job.Crafter ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 11  and item.category == 33 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Ring) and ( AetheryteHelper.settings.Job.Crafter ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 12  and item.category == 33 ) then
      item:Salvage()     
      return
      end
      end
         

      end
      end
      end
      end
end


function AetheryteHelper.SalvageJobPrimary()
     local bags = {0, 1, 2, 3}
     for _, e in pairs(bags) do
     local bag = Inventory:Get(e)
     if (table.valid(bag)) then
     local ilist = bag:GetList()
     if (table.valid(ilist)) then
     for _, item in pairs(ilist) do

      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.PLD ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 38) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.WAR ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 44 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.DRK ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 98 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.GNB ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 149 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.WHM ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 53 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.SCH ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and (item.category == 29 or item.category == 68 )) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.AST ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 99 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.SGE ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 181 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.MNK ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 41 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.DRG ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 47 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.SAM ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 111 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.NIN ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 93 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.RPR ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 180 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.BRD ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 50 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.MCN ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 96 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.DNC ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 150 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.BLM ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 55 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.RDM ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and item.category == 112 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Main) and ( AetheryteHelper.settings.Job.SMN ) then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and (item.Equipslot == 1 or item.Equipslot == 13) and (item.category == 28 or item.category == 68 or item.category == 69 )) then
      item:Salvage()     
      return
      end
      end

      if (AetheryteHelper.settings.Filter.Sub) and ( AetheryteHelper.settings.Job.WHM ) or ( AetheryteHelper.settings.Job.BLM )then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 2 and item.category == 56 ) then
      item:Salvage()     
      return
      end
      end
      if (AetheryteHelper.settings.Filter.Sub) and ( AetheryteHelper.settings.Job.PLD )then                     
      if (item.equipslot > 0 and item.requiredlevel > 1 and item.level > AetheryteHelper.settings.SET.dminil and item.level < AetheryteHelper.settings.SET.dmaxil and item.Equipslot == 2 and item.category == 38 ) then
      item:Salvage()     
      return
      end
      end

      end
      end
      end
      end
end



---------------------------------------------------------------------------------------------------------------------------------------------------
-- materia function
function AetheryteHelper.materia(Event, ticks)

  if (GetGameState() == FFXIV.GAMESTATE.INGAME and TimeSince(lastUpdatePulse) > 2000) then
    lastUpdatePulse = Now()
       if (IsControlOpen("SalvageResult")) then
           UseControlAction("SalvageResult", "Close")
       end

       if (Player.incombat or Busy()) then
       return
       end

    if (AetheryteHelper.settings.SET.isPotionEnabled and MissingBuffs(Player,"49")) then
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
    if (AetheryteHelper.settings.SET.isManualEnabled and MissingBuffs(Player,"1083")) then
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
    if (AetheryteHelper.settings.SET.isMateriaEnabled) then
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
        item:Convert()
        return
        end
        end
        end
        end
      end
    end

    if (AetheryteHelper.settings.SET.isSalvageEnabled) then   
      if (IsControlOpen("SalvageDialog") and GetControlData("SalvageDialog")) then
        UseControlAction("SalvageDialog","Confirm")
        return
      end
       if (AetheryteHelper.settings.SET.isReductionOption)then    
          AetheryteHelper.SalvageJobTank()
          AetheryteHelper.SalvageJobHealer()
          AetheryteHelper.SalvageJobSlaying()
          AetheryteHelper.SalvageJobStriking()
          AetheryteHelper.SalvageJobAiming()
          AetheryteHelper.SalvageJobSorcerer()
          AetheryteHelper.SalvageJobMaiming()
          AetheryteHelper.SalvageJobScouting()  
          AetheryteHelper.SalvageJobPrimary()   
          AetheryteHelper.SalvageJobGatherer() 
          AetheryteHelper.SalvageJobCrafter()
    else
          AetheryteHelper.SalvageAll()
    --      AetheryteHelper.SalvageSlotfilter()
    end
    end
    
    if (AetheryteHelper.settings.SET.isReductionEnabled == true) then
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

        
        if( item.IsCollectable == true and item.IsBinding == true and Player.IsMounted == false) then
         item:Purify()
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
-- Register
RegisterEventHandler("Module.Initalize",AetheryteHelper.Init,"AetheryteHelper.Init") 
RegisterEventHandler("Module.Initalize",AetheryteHelper.ModuleInit,"AetheryteHelper.ModuleInit")
RegisterEventHandler("Gameloop.Draw", AetheryteHelper.DrawCall,"AetheryteHelper.DrawCall")
RegisterEventHandler("Gameloop.Update", AetheryteHelper.fixfunc,"AetheryteHelper.fixfunc")
RegisterEventHandler("Gameloop.Update", AetheryteHelper.materia,"AetheryteHelper.materia")
---------------------------------------------------------------------------------------------------------------------------------------------------
-- Debug
--d("[AetheryteHelper]---".."autheStep---"..autheStep.."---modechg---"..modechg.."---".."---isServer:"..isServer) ----debug