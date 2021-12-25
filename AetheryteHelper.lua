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
-------------------------
mushroom#8009
]]

AetheryteHelper = {}

local kinokoProject = {
  Addon  = {
      Folder =        "AetheryteHelper",
      Name =          "Aetheryte Helper",
      Version =         "0.9.5",   
      VersionList = { "[0.9.0] - Pre Release",
                      "[0.9.1] - hot fix",
                      "[0.9.5] - Add tool・UIchange", 

                    },
      
  },
--  ---------------
  HELP   = {
      entext =       { "wip\ndon't think\nfeel\nby Zodiark", }, 
      jptext =       { "準備中\nとりあえず感覚で使ってください\nサーバーセレクトは作成中なので\nリストが出たら手動で選択してください", },
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
-------------------
Links = {
      Name = "Minion Discord JP",
       link1 = [[https://discord.com/channels/127540472812929024/335225564803891210]],
       link2 = [[https://github.com/mushroom8009/AutheryteHelper/releases]],
      tooltip1 = "it's a hobby,\nso i don't know if it's possible,\nbut let me know if you have any requests.\n\n不具合とかあれば教えて下さい",
      tooltip2 = "Github link,\n\n更新確認はこちら",

}
-------------------
AetheryteHelper.GUI = {
  name = "AetheryteHelper###AetheryteHelper",
  open = false,
  visible = true,
  tabs = {
    [1] = {
      isselected = true,
      name = "[Main Helper]"
    },
    [2] = {
      isselected = false,
      name = "[other tool]"
    },
    [3] = {
      isselected = false,
      name = "[..wip..]"
    },
  },
  tabstyle = {
    selected = {r =.1, g = 1 , b =.1 , a = 1},
        hovered = {r =1, g = 1, b = 0, a = 1 },
        normal = {r = 1, g = 1, b = 1, a = 1},
  },
}




local gRegion = GetGameRegion()
local gstate = MGetGameState()
local language = GetGameLanguage()
--local nowServer = 
---------------------------------------------------------------------------------------------------------------------------------------------------
-- maintool local
local selectins = false
local autooff = true
local isins = 4
local delay = 250
local WVaetheID = 0
local moveSVR = false
local isServer = 0
--local pmap = Player.localmapid
local modechg = nil
--local MoveServer = { 132, 129, 130 }
--local ploc = { 956, 957, 958, 959, 960, 961 }
local Update = kinokoProject.Update
local aetheID = 0
local delay = 200
----------------------------------------
--subtool local
local isMateriaEnabled = false
local isSalvageEnabled = false
local isPotionEnabled = false
local isManualEnabled = false
local lastUpdatePulse = 0
----------------------------------------
--wip local
local PTadd = false


---------------------------------------------------------------------------------------------------------------------------------------------------
-- Fonction Menu MMOMinion 
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


---------------------------------------------------------------------------------------------------------------------------------------------------
-- 
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
-- tab
function AetheryteHelper.DrawTabs()
  local tabs = AetheryteHelper.GUI.tabs
  local tabstyle = AetheryteHelper.GUI.tabstyle

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
    end
end

---------------------------------------------------------------------------------------------------------------------------------------------------
-- main GUI
function AetheryteHelper.Drawinsselect()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Text("use MobHunt & Rare F.A.T.E")      
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        GUI:SetTooltip("--instance select--\nonly use EW area\n・Labyrinthos\n・Thavnair\n・Garlemald\n・Mare Lamentorum\n・Elpis\n・Ultima Thule\n--move server--\n・Gridania\n・Limsa\n・Uldah")
      end
  
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
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
         GUI:SetTooltip("on/off\nOnly possible in front of Aetheryte")
      end
      
      GUI:Spacing()
      
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##AutoOffmode", autooff)
      GUI:SameLine(30)
      GUI:Text("option：only once")
      GUI:EndGroup()      
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          autooff = not autooff
          moveSVR = not moveSVR
          modechg = 3  
        end       
        GUI:SetTooltip("Auto off")
        end  
      
      GUI:Separator()    
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      local changed
        delay, changed = GUI:SliderInt("ms",delay,100,1000)
        if (GUI:IsItemHovered()) then
        GUI:SetTooltip("access delay\n100ms-1000ms")
        end
      GUI:EndGroup()
      --GUI:Spacing() 
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button( "Reset",40, 20)
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          delay = 200
          autheStep = 0
        end
        GUI:SetTooltip("delay RESET")
        end
      GUI:EndGroup()
      
      GUI:Separator()
      GUI:Spacing(10)
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button( "ins 1", 55, 20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          isins = 1
          --if (selectins)then GetControl("SelectString"):Action("SelectIndex",1) end     
       end
      GUI:SetTooltip("go to instance1")
      end
      
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button( "ins 2", 55, 20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
         isins = 2
        --if (selectins)then GetControl("SelectString"):Action("SelectIndex",2) end
        end
        GUI:SetTooltip("go to instance2")
      end
      
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()
      GUI:Button( "ins 3", 55, 20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
         isins = 3
        --if (selectins)then GetControl("SelectString"):Action("SelectIndex",3) end
        end
        GUI:SetTooltip("go to instance3")
      end
      
      --GUI:AlignFirstTextHeightToWidgets()
      GUI:SameLine()
      GUI:BeginGroup()      
      GUI:Button( "free", 55, 20)
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
        isins = 0
       --if (selectins)then GetControl("SelectString"):Action("SelectIndex",0) end       
        end
        GUI:SetTooltip("auto select")
      end
end


function AetheryteHelper.DrawChangeServer()
      GUI:Separator()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()      
      GUI:Checkbox("##move_svr", moveSVR)
      GUI:SameLine()
      GUI:Text( "World Visit assist" )
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          moveSVR = not moveSVR
          autooff = not autooff
          --for i = 0,3,1 do 
          --if (pmap == MoveServer[i] ) then
          --     moveSVR = true
          --     else
          --      moveSVR = false 
          --    end
          --end
          if (moveSVR == true) then
            modechg = 2
            else
            modechg = 3 end
            autheStep = 0            
        end       
        GUI:SetTooltip("on/off\nWorld Visit Aetheryte")
        end       
      GUI:Separator()
      GUI:Spacing(10)
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
-- sub GUI

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
      GUI:BeginGroup()
      GUI:Text("coming soon...")
      GUI:EndGroup()      
end

function AetheryteHelper.Drawhelp(_entext)
  if GUI:TreeNode("HOW TO USE##AetheryteHelper") then
    for id, e in pairs(_entext) do
      GUI:Text(e)
    end
    GUI:Text("--------------------------------")
    GUI:TreePop()
  end
end

function AetheryteHelper.Drawhelp(_jptext)
  if GUI:TreeNode("HOW TO USE##AetheryteHelper") then
    for id, e in pairs(_jptext) do
      GUI:Text(e)
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
--materia UI
function AetheryteHelper.DrawSubtool(event, ticks)
      GUI:Spacing()      
      GUI:BeginGroup()
      GUI:Text("Materia Extract & Desynth\npowered by Rhakin#1093 // fix by mushroom")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          isMateriaEnabled = not isMateriaEnabled
        end
        GUI:SetTooltip("Materia Extract & Desynth")
        --GUI:SetTooltip("Automatic materia extraction out of combat of spiritbonded items")
      end

      GUI:Spacing()
      GUI:Separator()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##Materia", isMateriaEnabled)
      GUI:SameLine()
      GUI:Text("Materia Extract")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          isMateriaEnabled = not isMateriaEnabled
        end
        GUI:SetTooltip("非戦闘状態で装備品からマテリアを錬精します")
        --GUI:SetTooltip("Automatic materia extraction out of combat of spiritbonded items")
      end
      
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##Desynth", isSalvageEnabled)
      GUI:SameLine()
      GUI:Text("Desynth equipment in Bag")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          isSalvageEnabled = not isSalvageEnabled
        end
        GUI:SetTooltip("インベントリの中の装備を分解\n警告:オンにするとインベントリ内の装備を全て分解します\nただし、IL1の装備は分解しません")
        --GUI:SetTooltip("Automatic desynthesis of equipment in inventory\nWARNING: once enabled, all items in inventory will be desynthesized, make sure you do not have any items in inventory that you want to keep")
      end
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()

      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##Potion", isPotionEnabled)
      GUI:SameLine()
      GUI:Text("Spiritbond Potion")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          isPotionEnabled = not isPotionEnabled
        end
        GUI:SetTooltip("錬精薬の自動使用")
        --GUI:SetTooltip("Automatic usage of a spiritbond potion whenever it expires")
      end
      
      GUI:Spacing()
      GUI:AlignFirstTextHeightToWidgets()
      GUI:BeginGroup()
      GUI:Checkbox("##Manual", isManualEnabled)
      GUI:SameLine()      
      GUI:Text("Spiritbond Manual")
      GUI:EndGroup()
      if (GUI:IsItemHovered()) then
        if (GUI:IsMouseClicked(0)) then
          isManualEnabled = not isManualEnabled
        end
        GUI:SetTooltip("スピリットマニュアルの自動使用")
        --分離
      end
 end
-------------------------------------------------------------------------------------------------------------------------------------------
----footer
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
      
      --GUI:Image([[\AetheryteHelper\image\love_mushroom.png]], 20, 20) 
-------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------
-- list
function AetheryteHelper.Drawalist()
local DCvalue = 1  
local DC_list = {"---","DC1","DC2","DC3","DC4","DC5","DC6","DC7"} 
GUI:BeginGroup()
DCvalue = GUI:Combo( "##test", DCvalue, DC_list, 0)

GUI:EndGroup()
end


-------------------------------------------------------------------------------------------------------------------------------------------
-- call

function AetheryteHelper.DrawCall(event, ticks)
  local Windows = kinokoProject.Windows.MainWindows
  local Addon = kinokoProject.Addon

if (Windows.Open) then
    GUI:SetNextWindowSize(280,350,GUI.SetCond_FirstUseEver)
    Windows.Visible, Windows.Open = GUI:Begin(Addon.Name.." - "..Addon.Version.."##MainWindows_begin", Windows.Open, Windows.Option)
    if (Windows.Visible) then
      GUI:BeginGroup()
      GUI:Text("WoLdo"..":[")
      GUI:SameLine()
      GUI:TextColored(0.7,0.8,0.1,1,GetMapName(Player.localmapid))
      GUI:SameLine()
      GUI:Text("]:MAPID:"..tostring(Player.localmapid))
      GUI:EndGroup()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()

      AetheryteHelper.DrawTabs()
      GUI:Spacing()
      GUI:Separator()
      GUI:Spacing()


      if (AetheryteHelper.GUI.tabs[1].isselected) then
      AetheryteHelper.Drawinsselect()
      AetheryteHelper.DrawChangeServer()
      AetheryteHelper.DrawadButton()
      AetheryteHelper.Drawalist()
      AetheryteHelper.DrawInside()      

      elseif (AetheryteHelper.GUI.tabs[2].isselected) then
      AetheryteHelper.DrawSubtool()
  
      elseif (AetheryteHelper.GUI.tabs[3].isselected) then
      GUI:BeginGroup()
      GUI:Text("wip\nなんか思いついたらつくるための空き地")
      GUI:Spacing()
      GUI:Separator()
---------------------------------------------
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
      GUI:EndGroup()
      end
-------------------------------------------------------------------------------------------------------------------------------------------
--close Button
      GUI:AlignFirstTextHeightToWidgets()
      GUI:Spacing(20)
      GUI:Separator()
      if GUI:Button("Close##"..Windows.Name,(GUI:GetWindowSize()), 40, 20) then
        Windows.Open = false
      end
      GUI:SameLine(60)
      GUI:BeginGroup()
      GUI:Text("v."..kinokoProject.Addon.Version)
      GUI:EndGroup()

      AetheryteHelper.Drawafooter()
-------------------------------------------------------------------------------------------------------------------------------------------
    end
    GUI:End()
  end
end


---------------------------------------------------------------------------------------------------------------------------------------------------
-- mein function

function AetheryteHelper.Update(Event, ticks)
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
      if autheVar and TimeSince(isTime) > delay then
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
                      if IsControlOpen("SelectString") then
                         GetControl("SelectString"):Action("SelectIndex",isins)
                         isTime = Now()
                         isins = 4
                         autheStep = 0
                     elseif IsControlOpen("SelectYesno") then
                            UseControlAction("SelectYesno","No")
                            selectins = not selectins
                     elseif Player:GetTarget() == nil then
                            isTime = Now()
                            autheStep = 0
                      end
                    end
              if (autheStep == 2) then
                         Player:SetTarget(aetheID)
                         Player:Interact(aetheID)
                         UseControlAction("Aetheryte")
                         GetControl("SelectString"):Action("SelectIndex",isServer)
--                         GetControl("WorldTravelSelect"):Action("SelectIndex",isServer) ----wip
                         autheStep = 3
                       
              end
              if autheStep == 3 then
                        UseControlAction("SelectYesno")
                     if IsControlOpen("SelectYesno") then
                        UseControlAction("SelectYesno","Yes")
                           moveSVR = not moveSVR
                           selectins = not selectins
                           autooff = not autooff
                           --autheStep = 0

                           --autheStep = 0
                     elseif Player:GetTarget() == nil then
                           isTime = Now()
                           Player:SetTarget(aetheID)
                           Player:Interact(aetheID)
                           --isServer = 0
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
-- sub function
function AetheryteHelper.subUpdate(Event, ticks)
  if (GetGameState() == FFXIV.GAMESTATE.INGAME and TimeSince(lastUpdatePulse) > 3000) then
    lastUpdatePulse = Now()

    if (IsControlOpen("SalvageResult")) then
      UseControlAction("SalvageResult", "Close")
    end

    if (Player.incombat or Busy()) then
      return
    end

    if (isPotionEnabled and MissingBuffs(Player,"49")) then
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
    if (isManualEnabled and MissingBuffs(Player,"1083")) then
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
    if (isMateriaEnabled) then
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

    if (isSalvageEnabled) then
      if (IsControlOpen("SalvageDialog") and GetControlData("SalvageDialog")) then
        UseControlAction("SalvageDialog","Confirm")
        return
      end
      local bags = {0, 1, 2, 3}
      for _, e in pairs(bags) do
        local bag = Inventory:Get(e)
        if (table.valid(bag)) then
          local ilist = bag:GetList()
          if (table.valid(ilist)) then
            for _, item in pairs(ilist) do
              if ((item.equipslot > 0 and item.requiredlevel > 1) or item.searchcategory == 46) then
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
-- Register
RegisterEventHandler("Module.Initalize",AetheryteHelper.Init) 
RegisterEventHandler("Module.Initalize",AetheryteHelper.ModuleInit)
RegisterEventHandler("Gameloop.Draw", AetheryteHelper.DrawCall)
RegisterEventHandler("Gameloop.Update", AetheryteHelper.Update)
RegisterEventHandler("Gameloop.Update", AetheryteHelper.subUpdate)
---------------------------------------------------------------------------------------------------------------------------------------------------
-- Debug
--d("[AetheryteHelper]---".."autheStep---"..autheStep.."---modechg---"..modechg.."---".."---isServer:"..isServer) ----debug