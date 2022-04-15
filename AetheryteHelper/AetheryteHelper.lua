-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--[[
this module is open source and anyone may modify it as they wish.
however, please refrain from claiming that you created it all.
that would be very embarrassing.
i started making them as a hobby for myself, but people from all walks of life seem to like them.
i did not intend to provide support, but now i provide some support as well.

i also created a Discord server for support
if you need support and haven't joined us yet, please do.

[mushroom's Room]
https://discord.gg/kCp95cpprd

and here comes the most important part...

who advised me and consulted with me in the creation of this module.
Madao#2970
denvo#5217

some functions were created by kali#3326

Chinese translation was done by 长院张#1544

I am so grateful to them!


and now for you, who are using this module
thank you usasing it
]]
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
AetheryteHelper = {}
-----------------------------------------------------------------------------------------------------------------
--table
local kinokoProject = {
  Addon  = {
	  Folder =        "AetheryteHelper",
	  Name =          "AH(mushroom tools)",
	  Version =         "1.8.4",
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
					  "[1.6.6] - Adjusted AR for some items.",
					  "[1.7.0] - add automatic Item collection.",
					  "[1.7.1] - adjustment automatic Item collection.",
					  "[1.7.2] - Support for moving items from FCchest.",
					  "[1.7.5] - add new function.",
					  "[1.7.6] - add AetheryteTicket settings.",
					  "[1.7.7] - Supports display of retainer bag deployment.",
            "[1.7.8] - Supports CN・KR Server.",
            "[1.8.0] - bug fix & Many additional features.",
            "[1.8.1] - change CN ServerList.",
            "[1.8.2] - Added ability to change tooltip language.",
            "[1.8.3] - bug fix & add API.",
            "[1.8.4] - add API & gil amount setting to ticket",
            "          add Auto Updater",

					},

  },
--  ---------------
  HELP   = {
	  linkjp = [[https://github.com/mushroom8009/AutheryteHelper/wiki/Autheryte-Helper%E3%81%AE%E4%BD%BF%E3%81%84%E6%96%B9]],
	  linken = [[https://github.com/mushroom8009/AutheryteHelper/wiki/How-to-use-%22-Autheryte-Helper-%22-in-minion]],
	  mykofi = [[https://ko-fi.com/mushroom8009]],
	  mypatreon = [[https://www.patreon.com/mushroom8009]],
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
	  name = "[Toys]"
	},
	[4] = {
	  isselected = false,
	  name = "[Jank]"
	},
	[5] = {
	  isselected = false,
	  name = "[ GC ]"
	},
	[6] = {
	  isselected = false,
	  name = "[ Bag ]"
	},
	[7] = {
	  isselected = false,
	  name = "[TCmd]"
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
AetheryteHelper.RadarWindow = {
  name = "RadarWindow###AetheryteHelper",
  open = false,
  visible = true,
  locked = false,
}
AetheryteHelper.miniRadarWindow = {
  name = "miniRadarWindow###AetheryteHelper",
  open = false,
  visible = true,
  locked = false,
}
AetheryteHelper.CreateButton = {
  name = "CBWindow###AetheryteHelper",
  open = false,
  visible = true,
  locked = false,
}
AetheryteHelper.CBcodeEditor = {
  name = "CBcodeEditorWindow###AetheryteHelper",
  open = false,
  visible = true,
  locked = false,
}
AetheryteHelper.userbutton = {
	  name = "userfunc###AetheryteHelper",
	  open =  false,
	  visible = true,
	  locked = false,
}
AetheryteHelper.selectlanguage = {
  name = "selectlanguage###AetheryteHelper",
  open = false,
  visible = true,
  locked = false,
}
AetheryteHelper.UpdateConfig = {
  name = "UpdateConfig###AetheryteHelper",
  open = false,
  visible = true,
  locked = false,
}
AetheryteHelper.settingsSET = {
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
	mushitemSearch = false,
	syokuzai = false,
	sekizai = false,
	kinzoku = false,
	mokuzai = false,
	nuno = false,
	kawa = false,
	hone = false,
	renkin = false,
	AutoLegacy = true,
	Pcurrnt = Player.currentworld,
	AutoUpdate = false,
	}
AetheryteHelper.UpdateTimeSince = {}
AetheryteHelper.settingsFilter = {
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
	}

AetheryteHelper.settingsJob = {

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
AetheryteHelper.ATuse = {
  ATuseEnable = false,
  gil = 300,
}

AetheryteHelper.RadarSettings = {
	   RadarEnable = false,
	   mydot = false,
	   mydotsize = 3,
	   dot = false,
	   dotsize = 3,
	   line = true,
	   linethick = 2,
	   TPline = true,
	   TPlinethick = 2,
	   TMline = true,
	   TMlinethick = 2,
	   Player = false,
	   Attackable = false,
	   NPC = false,
	   chest = false,
	   object = false,
	   kagu = false,
	   Gathernode = false,
	   Aetheryte = false,
	   fumyaku = false,
	   minion = false,
	   tori = false,
	   pet = false,
	   hunt = true,
	   indutyoff = false,
	   cutoff = true,
	   gposeoff = true,
	   ARRB = false,
	   ARRA = true,
	   ARRS = true,
	   ARRFate = false,
	   HWB = false,
	   HWA = true,
	   HWS = true,
	   HWFate = false,
	   StBB = false,
	   StBA = true,
	   StBS = true,
	   StBFate = false,
	   ShBB = false,
	   ShBA = true,
	   ShBS = true,
	   ShBFate = false,
	   EWB = false,
	   EWA = true,
	   EWS = true,
	   EWFate = true,
}

AetheryteHelper.RadarColor = {
Colormydot = {r = 1, g = 0, b = 0, a = 1, U32 = 4278190335 },
ColorTPline = {r = 1, g = 0.5, b = 0, a = 1, U32 = 4294934783},
ColorTMline = {r = 1, g = 0, b = 0, a = 1, U32 = 4278190335 },
ColorPlayer = {r = 0, g = 0.5, b = 1, a = 1, U32 = 4294934528 },
ColorAttackable = {r = 1, g = 0, b = 0, a = 1, U32 = 4278190335 },
Colortori = {r = 1, g = 1, b = 0, a = 1, U32 = 4278255615 },
Colorpet = {r = 1, g = 1, b = 1, a = 1, U32 = 4294967295 },
ColorNPC = {r = 0.1, g = 0.7, b = 0, a = 1, U32 = 4278235930 },
Colorchest = {r = 1, g = 1, b = 1, a = 1, U32 = 4294967295 },
Colorobject = {r = 0.5, g = 0.5, b = 0.5, a = 1, U32 = 4286611584 },
Colorkagu = {r = 1, g = 0.5, b = 0, a = 1, U32 = 4294934783},
ColorGathernode = {r = 1, g = 1, b = 1, a = 1, U32 = 4294967295 },
ColorAetheryte = {r = 0.5, g = 1, b = 0.8, a = 1, U32 = 4291624832 },
Colorfumyaku = {r = 0.5, g = 1, b = 0.5, a = 1, U32 = 4286644096 },
Colorminion = {r = 1, g = 1, b = 1, a = 1, U32 = 4294967295 },

ARRBC = {r = 1, g = 1, b = 1, a = 1, U32 = 4294967295 },
ARRAC = {r = 1, g = 1, b = 0, a = 1, U32 = 4278255615 },
ARRSC = {r = 1, g = 0, b = 0, a = 1, U32 = 4278190335 },
ARRFC = {r = 1, g = 0, b = 1, a = 1, U32 = 4294902015 },

HWBC = {r = 1, g = 1, b = 1, a = 1, U32 = 4294967295 },
HWAC = {r = 1, g = 1, b = 0, a = 1, U32 = 4278255615 },
HWSC = {r = 1, g = 0, b = 0, a = 1, U32 = 4278190335 },
HWFC = {r = 1, g = 0, b = 1, a = 1, U32 = 4294902015 },

StBBC = {r = 1, g = 1, b = 1, a = 1, U32 = 4294967295 },
StBAC = {r = 1, g = 1, b = 0, a = 1, U32 = 4278255615 },
StBSC = {r = 1, g = 0, b = 0, a = 1, U32 = 4278190335 },
StBFC = {r = 1, g = 0, b = 1, a = 1, U32 = 4294902015 },

ShBBC = {r = 1, g = 1, b = 1, a = 1, U32 = 4294967295 },
ShBAC = {r = 1, g = 1, b = 0, a = 1, U32 = 4278255615 },
ShBSC = {r = 1, g = 0, b = 0, a = 1, U32 = 4278190335 },
ShBFC = {r = 1, g = 0, b = 1, a = 1, U32 = 4294902015 },

EWBC = {r = 1, g = 1, b = 1, a = 1, U32 = 4294967295 },
EWAC = {r = 1, g = 1, b = 0, a = 1, U32 = 4278255615 },
EWSC = {r = 1, g = 0, b = 0, a = 1, U32 = 4278190335 },
EWFC = {r = 1, g = 0, b = 1, a = 1, U32 = 4294902015 },
}

AetheryteHelper.RadarCustomList = {}
AetheryteHelper.RadarHuntList = {
ARR = {
	   B = {2919,2920,2921,2922,2923,2924,2925,2926,2927,2928,2929,2930,2931,2932,2933,2934,2935},
	   A = {2936,2937,2938,2939,2940,2941,2942,2943,2945,2946,2947,2948,2949,2950,2951,2952},
	   S = {2953,2954,2955,2956,2957,2958,2959,2960,2961,2962,2963,2964,2965,2966,2967,2968,2969},
	   F = {887,655},
	  },
HW = {
	   B = {4350,4351,4352,4353,4354,4356,4357,4358,4359,4360,4361},
	   A = {4362,4363,4364,4365,4367,4368,4369,4370,4371,4372,4373},
	   S = {4374,4375,4376,4377,4378,4380},
	   F = {3789,3783},
	  },
StB = {
	   B = {6002,6003,6004,6005,6006,6007,6008,6009,6010,6011,6012,6013},
	   A = {5990,5991,5992,5993,5994,5995,5996,5997,5998,5999,6000,6001},
	   S = {5948,5985,5986,5987,5988,5989},
	   F = {6290,6392,6395},
	  },
ShB = {
	   B = {8656,8657,8893,8894,8898,889,8903,8904,8908,8909,8913,8914},
	   A = {8654,8655,8891,8892,8896,8897,8901,8902,8906,8907,8911,8912},
	   S = {8653,8890,8895,8900,8905,8910,8915,8916},
	   F = {8822,8234},
	  },
EW = {
	   B = {10635,10636,10637,10638,10639,10640,10641,10642,10643,10644,10645,10646},
	   A = {10623,10624,10625,10626,10627,10628,10629,10630,10631,10632,10633,10634},
	   S = {10617,10618,10619,10620,10621,10622,10615,10616},
	   F = {10400,10269},
	  },

}
AetheryteHelper.AetherCurrents = {
  HW = {
		2005536,2006187,2006190,2006189,
		2006195,2006204,2006197,2006201,
		6006216,6006217,2006224,2006218,
		2006228,2006229,2006234,2006231,
		2006210,2006214,2006205,2006208,
		2007965,2007967,2007971,2007972,
	  },
  StB = {
		2008008,2008013,2008011,2008007,
		2007999,2008002,2007995,2008004,
		2007976,2007978,2007981,2007984,
		2008015,2008017,2008019,2008022,
		2007987,2007992,2007994,2007993,
	  },
  ShB = {
		2010028,2010024,2010031,2010032,
		2010059,2010062,2010063,2010056,
		2010034,2010038,2010042,2010041,
		2010044,2010050,2010047,2010052,
		2010066,2010064,2010069,2010073,
		2010079,2010074,2010076,2010083,
	  },
  EW = {
		2011990,2011991,2011992,2011993,2011994,2011995,2011996,2011997,2011998,2011999,
		2011980,2011981,2011982,2011983,8011984,2011985,2011986,2011987,2011988,2011989,
		2012000,2012001,2012002,2012003,2012004,2012005,2012006,2012007,2012008,2012009,
		2012010,2012011,2012012,2012013,2012014,2012015,2012016,2012017,2012018,2012019,
		2012020,2012021,2012022,2012023,2012024,2012025,2012026,2012027,2012028,2012029,
		2012030,2012031,2012032,2012033,2012034,2012035,2012036,2012037,2012038,2012039
	  },
}

AetheryteHelper.explorerEW = {
  2011854,2011855,2011856,2011857,2011858,
  2011859,2011860,2011861,2011862,2011863,
  2011864,2011865,2011866,2012691,2011867,
  2011868,2011869,2011870,2011871,2011872,
  2011873,2011874,2011875,2011876,2011877,
  2011878,2011879,2011880,2011881,2011882,
  2011883,2011884,2011885,2011886,2011887,
  2011888,2011889,2011890,2011891,2011892,
  2011893,2011894,2011895,2011896,2011897,
  2011898,
}

AetheryteHelper.userCustomfunc = {}
-------------------
local AHLinks = {
	  Name = "Minion Discord JP",
	   link1 = [[https://discord.gg/kCp95cpprd]],
	   link2 = [[https://github.com/mushroom8009/AetheryteHelper]],
	   link3 = [[https://github.com/mushroom8009/AutheryteHelper/releases]],
	   link4 = [[https://youtube.com/playlist?list=PLS5EIB6BeDoKSRglypQIr_g9-MF6Cvbqh]],
}

AetheryteHelper.mushAHlanguage = {
	JP = false,
	EN = false,
	DE = false,
	FR = false,
	CN = false,
	KR = false,
}

local mushtooltips = {
  jp = { 
  	 tip00 = "対象エリア外",
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
		 tip32 = "IL5-IL1000\nIL1を除きこれ未満のIL装備を分解します",
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
		 tip80 = "交換に必要なGCランクに満たないものを選ぶと\nオフになります",
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
		 tip109 = "ツールチップの表示/非表示\n右クリックで言語選択",
		 tip110 = "右クリックでコピーできます",
		 tip111 = "安定を重視したため、コマンドの受付までに最大3秒程度かかります\n受理されるとカラーメッセージ(エコー)でお知らせします\n進捗はコンソールで確認できます。",
		 tip112 = "MIPアシスト",
		 tip113 = "自分を除くパーティリストの順番です\nアイコンはソロでCFを使った場合の参考程度です",
		 tip114 = "オン/オフ",
		 tip115 = "パーティチャットに発言します",
		 tip116 = "ゲーム内のテキストコマンドが使えます",
		 tip117 = "[/e <pos>]を実行\nインスタンスの確認にどうぞ",
		 tip118 = "自動よろおつ",
		 tip119 = "カバン整理\nスタックできるものをまとめます",
		 tip120 = "整理中",
		 tip121 = "XIVQuickLauncherアドオン、QoLBar用のシェアボタンです\nクリックでコピーされるのでQoLBarでインポートしてください",
		 tip122 = "アイテムサーチ\nオン/オフ\n\n[所持品を検索]\n[レシピ検索]をすると自動で探します",
		 tip123 = "リテイナー",
		 tip124 = "チョコボカバン",
		 tip125 = "カンパニーチェスト",
		 tip126 = "HQをNQにする（所持品のみ対応）\nカバン整理を行うと同時に実行されます",
		 tip127 = "食材",
		 tip128 = "石材",
		 tip129 = "金属",
		 tip130 = "木材",
		 tip131 = "布材",
		 tip132 = "皮革",
		 tip133 = "骨材",
		 tip134 = "錬金素材",
		 tip135 = "リテイナーから受け取り",
		 tip136 = "リテイナーへ受け渡し",
		 tip137 = "リテイナーバッグの整理\nスタックできるものをまとめます",
		 tip138 = "チョコボカバンから受け取り",
		 tip139 = "チョコボカバンへ受け渡し",
		 tip140 = "チョコボカバンの整理\nスタックできるものをまとめます",
		 tip141 = "カンパニーチェストから受け取り",
		 tip142 = "カンパニーチェストへ収納",
		 tip143 = "AH レーダー\n左クリックで標準ウィンドウ/右クリックでミニウィンドウ",
		 tip144 = "プレイヤー",
		 tip145 = "モンスター",
		 tip146 = "NPC",
		 tip147 = "宝箱",
		 tip148 = "F.A.T.E",
		 tip149 = "家具",
		 tip150 = "エーテライト",
		 tip151 = "その他オブジェクト",
		 tip152 = "不明\nユーザー入力データ",
		 tip153 = "バディチョコボ",
		 tip154 = "ペット",
		 tip155 = "採集地点",
		 tip156 = "ミニオン",
		 tip157 = "レーダー オン/オフ",
		 tip158 = "自分にドットを表示",
		 tip159 = "ドットを表示",
		 tip160 = "線を表示",
		 tip161 = "他プレイヤーからのターゲット線を表示",
		 tip162 = "モンスターからのターゲット線を表示",
		 tip163 = "カットシーン中は表示しない",
		 tip164 = "グルポ中は表示しない",
		 tip165 = "IDでは表示しない",
		 tip166 = "色変更",
		 tip167 = "自分のドットサイズと色",
		 tip168 = "他のドットサイズ",
		 tip169 = "線の太さ",
		 tip170 = "リスキーモブ",
		 tip171 = "新生",
		 tip172 = "蒼天",
		 tip173 = "紅蓮",
		 tip174 = "漆黒",
		 tip175 = "暁月",
		 tip176 = "Bモブ",
		 tip177 = "Aモブ",
		 tip178 = "S/SSモブ",
		 tip179 = "特殊FATE",
		 tip180 = "ターゲットの情報を取得",
		 tip181 = "カスタムリストに追加",
		 tip182 = "カスタムリストから削除",
		 tip183 = "ContentIDを入力(必須)",
		 tip184 = "名前を入力(必須)",
		 tip185 = "カスタムリスト表示",
		 tip186 = "リスキーモブ設定",
		 tip187 = "全般設定",
		 tip188 = "風脈の泉",
		 tip189 = "左クリックでカスタムリストに追加\n右クリックでキャンセル",
		 tip190 = "AH レーダー\n標準ウィンドウ",
		 tip191 = "転送網利用券を使用",
		 tip192 = "金額設定",
		 tip193 = "コンテンツID",
		 tip194 = "名前",
		 tip195 = "メモ欄",
		 tip196 = "他プレイヤーからのターゲット線の色変更",
		 tip197 = "モンスターからのターゲット線の色変更",
		 tip198 = "Normal(通常)/Hazard(警戒)切り替え",
		 tip199 = "この距離に対象プレイヤーがいる場合、BOTの移動を停止\nギャザラーでの使用を推奨",
		 tip200 = "カスタムボタンの作成",
		 tip201 = "テキストコマンドボタン",
		 tip202 = "クリックボタン",
		 tip203 = "オン/オフボタン",
		 tip204 = "ボタンの追加",
		 tip205 = "入力項目のリセット",
		 tip206 = "ボタンの名前(必須)",
		 tip207 = "ボタンに使用する画像\nAetheryteHelper\\CustomImage\\内のファイル名を入力",
		 tip208 = "ツールチップ",
		 tip209 = "左クリック時のコマンド",
		 tip210 = "右クリック時のコマンド",
		 tip211 = "左クリック時の実行コード\n右クリックでコピーできます",
		 tip212 = "右クリック時の実行コード\n右クリックでコピーできます",
		 tip213 = "コードのパルスタイム\n0-3000\n\nAHPulseは他の機能と共有しているので、同時に実行すると影響を受けます",
		 tip214 = "ボタンがオンの時の実行コード\n右クリックでコピーできます",
		 tip215 = "ボタンの削除",
		 tip216 = "ボタンの内容を更新",
		 tip217 = "ボタンの設定を呼び出し",
		 tip218 = "ボタンの表示/非表示",
		 tip219 = "移動モードの切り替え\nレガシー/スタンダード",
		 tip220 = "モジュールのアップデート",
		 tip221 = "ダウンロード",
		 tip222 = "更新を確認",
		 tip223 = "新しいバージョンがリリースされています",
		 tip224 = "自動確認(2時間ごと)",

  },
  en = { 
  	 tip00 = "Outside of use area",
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
		 tip57 = "SCH's Arm",
		 tip58 = "DRK's Arm",
		 tip59 = "AST's Arm",
		 tip60 = "GNB's Arm",
		 tip61 = "SGE's Arm",
		 tip62 = "MNK's Arm",
		 tip63 = "BRD's Arm",
		 tip64 = "DRG's Arm",
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
		 tip109 = "tooltips Show/hide\nRight-click to select language",
		 tip110 = "Right click to copy",
		 tip111 = "Due to the importance of stability,\nit may take a about 3 sec for the command to be accepted.\nit will be notified with a color message when it is accepted.\nProgress can be checked in the console.",
		 tip112 = "Auto Commendation",
		 tip113 = "index of party member in exclud you.\nthe side icon are just for reference when used DF for solo.",
		 tip114 = "Enable/Disable",
		 tip115 = "Send only in Party Chat.",
		 tip116 = "Can use ingame text commands",
		 tip117 = "[/e <pos>]:Check your instance.",
		 tip118 = "Auto Start and End Call in Duty",
		 tip119 = "organize inventory\nput together stackable items.",
		 tip120 = "Now working...",
		 tip121 = "This is share button for XIVQuickLauncher addon, QoLBar\nClick to copy and import it in QoLBar",
		 tip122 = "ItemSearch\nON/OFF\n\nAuto retrieval\n[Search for Item]\n[Search Recipes]",
		 tip123 = "Retainer",
		 tip124 = "Saddlebag",
		 tip125 = "FC Chest",
		 tip126 = "HQ to NQ (only inventory)\nIt will be executed as soon as you organize inventory.",
		 tip127 = "Ingredients",
		 tip128 = "Stone",
		 tip129 = "Metal",
		 tip130 = "Lumber",
		 tip131 = "Cloth",
		 tip132 = "Leather",
		 tip133 = "Bone",
		 tip134 = "Reagents",
		 tip135 = "from Retainer",
		 tip136 = "to Retainer",
		 tip137 = "Organizing the Retainer bag\nput together stackable items.",
		 tip138 = "from Saddlebag",
		 tip139 = "to Saddlebag",
		 tip140 = "Organizing the Saddlebag\nput together stackable items.",
		 tip141 = "from FCchest",
		 tip142 = "to FCchest",
		 tip143 = "AH Radar\nLeft-click for standard window\nRight-click for mini window",
		 tip144 = "Player",
		 tip145 = "Monster",
		 tip146 = "NPC",
		 tip147 = "chest",
		 tip148 = "F.A.T.E",
		 tip149 = "furniture",
		 tip150 = "Aetheryte",
		 tip151 = "object",
		 tip152 = "Unknown\nUser input data",
		 tip153 = "buddy",
		 tip154 = "pet",
		 tip155 = "gathering node",
		 tip156 = "minions",
		 tip157 = "Radar Enable/Disable",
		 tip158 = "Drow Player Dot",
		 tip159 = "Drow Other Dots",
		 tip160 = "Drow Line",
		 tip161 = "Target Lines from Other Players",
		 tip162 = "Target Lines from mob",
		 tip163 = "Disabled during cutscenes",
		 tip164 = "Disabled during gpose",
		 tip165 = "Disabled during in Duty",
		 tip166 = "Color Change",
		 tip167 = "Self dot size & Color",
		 tip168 = "Other dot size",
		 tip169 = "line thickness",
		 tip170 = "Hunt",
		 tip171 = "ARR(2.x)",
		 tip172 = "HW(3.x)",
		 tip173 = "StB(4.x)",
		 tip174 = "ShB(5.x)",
		 tip175 = "EW(6.x)",
		 tip176 = "B Ranks",
		 tip177 = "A Ranks",
		 tip178 = "S/SS Ranks",
		 tip179 = "FATEs",
		 tip180 = "Retrieve target information",
		 tip181 = "Add to CustomList",
		 tip182 = "Remove from CustomList",
		 tip183 = "ContentID (required)",
		 tip184 = "Name (required)",
		 tip185 = "View CustomList",
		 tip186 = "Hunts Settings",
		 tip187 = "General settings",
		 tip188 = "Aether Currents",
		 tip189 = "Left-click to Add to CustomList\nRight-click to Cancel",
		 tip190 = "AH Radar\nopen to standard window",
		 tip191 = "Use AetheryteTicket",
		 tip192 = "Amount Setting",
		 tip193 = "ContentID",
		 tip194 = "name",
		 tip195 = "note",
		 tip196 = "Color Change for Target Lines from Other Players",
		 tip197 = "Color Change for Target Lines from mob",
		 tip198 = "Normal/Hazard",
		 tip199 = "Stops BOT move if target player is within this distance,\nrecommended for use with gatherer",
		 tip200 = "Creat Buttons",
		 tip201 = "Text Command Button",
		 tip202 = "Click Button(Custom Function)",
		 tip203 = "ON/OFF Button(Custom Function)",
		 tip204 = "Add Button",
		 tip205 = "Initialization of input items",
		 tip206 = "Button Name(must)",
		 tip207 = "Image to use for Button\nEnter the name of file in \"AetheryteHelper\\CustomImage\\\" folder",
		 tip208 = "tooltip",
		 tip209 = "TextCommands to be executed by Left-click",
		 tip210 = "TextCommands to be executed by Right-click",
		 tip211 = "Execution code on Left-click\nRight click to copy",
		 tip212 = "Execution code on Right-click\nRight click to copy",
		 tip213 = "Pulse time of code\n0-3000\n\nAHPulse is shared with other functions and will be affected if executed at the same time",
		 tip214 = "Execution code when button is on\nRight click to copy",
		 tip215 = "Delete Button",
		 tip216 = "Change of Button content",
		 tip217 = "Load of Button settings",
		 tip218 = "Show/hide Buttons",
		 tip219 = "MovementSetting\nLegacy/Standard",
		 tip220 = "Module Update",
		 tip221 = "Download",
		 tip222 = "Check for update",
		 tip223 = "New version released",
		 tip224 = "Auto confirmat\n(every 2h)",
  },
  fr = { 
  	 tip00 = "En dehors de la zone couverte",
		 tip01 = "AH On/Off",
		 tip02 = "L'intervalle d'accès peut être sélectionné\nentre 100 ms et 1 seconde",
		 tip03 = "Exécutez la commande texte [ /e <flag> ]",
		 tip04 = "Quartier résidentiel\nActivez cette option si vous n'avez pas terminé la quête",
		 tip05 = "Réinitialiser la valeur du délai à la valeur par défaut",
		 tip06 = "Vous pouvez voir le nombre de personnes dans l'instance",
		 tip07 = "Passez à l'instance 1",
		 tip08 = "Passez à l'instance 2",
		 tip09 = "Passez à l'instance 3",
		 tip10 = "Téléportation à Gridania",
		 tip11 = "Aller au Tableau des ventes de Gridania",
		 tip12 = "Téléportation à Limsa",
		 tip13 = "Aller au Tableau des ventes de Limsa",
		 tip14 = "Téléportation à Ul'dah",
		 tip15 = "Aller au Tableau des ventes de Ul'dah",
		 tip16 = "Passage de la téléportation à la Tableau des ventes",
		 tip17 = "Aide à la saisie de Méga Cactpot",
		 tip18 = "Switching [Sans restriction]",
		 tip19 = "Switching [Mode exploration]",
		 tip20 = "Lien vers la vidéo de présentation de la fonction",
		 tip21 = "Double-cliquez pour ouvrir",
		 tip22 = "fermer une fenêtre",
		 tip23 = "Acheter par numéro aléatoire",
		 tip24 = "Dites-moi si cela ne fonctionne pas correctement",
		 tip25 = "Réparation des l'équipements\nArtisans requis car ils réparent leur propre matériel",
		 tip26 = "Activation/désactivation du mode de confiance.\n\nL'onglet est fixé sur [GC]",
		 tip27 = "Cliquez pour activer/désactiver le Recyclage\nCliquez avec le bouton droit de activer ou désactiver les filtres",
		 tip28 = "Désactiver le recyclage chez les Disciples de la main",
		 tip29 = "Exécutez Recyclage et Matérialisation uniquement en Donjon",
		 tip30 = "Niveau d'objet1-1000\nSi le Niveau objet est supérieur à ce chiffre,\nRecyclage l'article",
		 tip31 = "réinitialiser",
		 tip32 = "Niveau d'objet5-1000\nRecyclage Niveau objet moins que cela sauf Nv objet1",
		 tip33 = "Recyclage de la sélection\nMettez votre objet de valeur dans le Arsenal de l'armurerie",
		 tip34 = "Armes/Outil principal",
		 tip35 = "Bouclier/Outil secondaire",
		 tip36 = "Tête",
		 tip37 = "Boucle d'oreille",
		 tip38 = "Torse",
		 tip39 = "Collier",
		 tip40 = "Mains",
		 tip41 = "Bracelet",
		 tip42 = "Jambes",
		 tip43 = "Bague",
		 tip44 = "Pieds",
		 tip45 = "Cliquez avec le bouton droit de tout sélectionner\nCliquez avec le bouton gauche pour faire marche arrière",
		 tip46 = "Tanks",
		 tip47 = "Soigneurs",
		 tip48 = "mêlée",
		 tip49 = "physiques à distance",
		 tip50 = "d'agresseur",
		 tip51 = "magiques à distance",
		 tip52 = "d'abatteur",
		 tip53 = "Toutes les classes(Faible Nv)",
		 tip54 = "d'éclaireur",
		 tip55 = "Arme d'élémentaliste(à deux mains)/Bouclier",
		 tip56 = "Arme de maraudeur",
		 tip57 = "Arme d'érudit",
		 tip58 = "Arme de chevalier noir",
		 tip59 = "Arme d'astromancien",
		 tip60 = "Arme de pistosabreur",
		 tip61 = "Arme de sage",
		 tip62 = "Arme de pugiliste",
		 tip63 = "Arme d'archer",
		 tip64 = "Arme d'hast",
		 tip65 = "Arme de machiniste",
		 tip66 = "Arme de surineur",
		 tip67 = "Arme de danseur",
		 tip68 = "Arme de samouraï",
		 tip69 = "Arme d'occultiste(à deux mains)/Bouclier",
		 tip70 = "Arme de faucheur",
		 tip71 = "Arme d'arcaniste",
		 tip72 = "Arme de mage rouge",
		 tip73 = "Disciples de la main(Tous les équipements)",
		 tip74 = "Disciples de la terre(Tous les équipements)",
		 tip75 = "Sceaux de compagnie d'échange pour les articles",
		 tip76 = "Activation/désactivation du réglage automatique",
		 tip77 = "Sceaux de compagnie a ce chiffre.\nCommence à remplacer quand il dépasse",
		 tip78 = "Entrez 0 pour la valeur maximale",
		 tip79 = "Nombre d'échanges (automatiquement max.)",
		 tip80 = "La fonction est désactivée si\nle rang sélectionné est inférieur au rang GC requis pour l'échange.",
		 tip81 = "Sceaux de compagnie requise pour le remplacement/Sceaux de compagnie actuelle",
		 tip82 = "Utilisation automatique de l'Essence de symbiose\nClic droit pour basculer vers/depuis le lien avec les minion",
		 tip83 = "Utilisation automatique de Manuel militaire de méditation\nClic droit pour activer/désactiver la liaison des minion.",
		 tip84 = "Le GC auquel vous appartenez est automatiquement sélectionné.",
		 tip85 = "Matérialisation",
		 tip86 = "Recyclage les équipements de l'inventaire\nCliquez avec le bouton droit de activer ou désactiver les filtres.",
		 tip87 = "Livraison de marchandises rares pour le GC",
		 tip88 = "Automatiquement déplacé vers GC pour la livraison.",
		 tip89 = "Arrêt du mouvement automatique.",
		 tip90 = "Ne pas livrer plus que le maximum de Sceaux de compagnie",
		 tip91 = "Retirez le Matéria de l'équipement dans le sac.",
		 tip92 = "utilisant l'éthérolyse\nNe fonctionne pas lorsque l'espace du sac atteint zéro.\nClic droit pour basculer vers/depuis le lien avec les minion",
		 tip93 = "DC est automatiquement sélectionné.",
		 tip94 = "Allez au panneau du marché ou passez en téléportation.",
		 tip95 = "Sélectionner le monde de destination",
		 tip96 = "Veuillez soutenir mes activités.\n\nLa nourriture de mon chat sera magnifique.",
		 tip97 = "DM moi si vous avez des problèmes ou des demandes.\nJe suis motivé par les louanges.",
		 tip98 = "Clic gauche vers l'accueil AH de github\nFaites un clic gauche pour aller à la page Release.",
		 tip99 = "La compétence n'est pas disponible car la quête n'est pas terminée.",
		 tip100 = "[MEx]=Matérialisation\n[SbP]=l'Essence de symbiose\n[SbM]=Manuel militaire de méditation",
		 tip101 = "[Dsy]=Recyclage\n[Fil]=filtres\n[Cft]=Désactiver le recyclage chez les Disciples de la main\n[IDm]=Exécutez Recyclage et Matérialisable uniquement en Donjon",
		 tip102 = "[AR]=utilisant l'éthérolyse\n[Link]=Lié à des minion",
		 tip103 = "[Ex]=Prises de guerre(Missions de ravitaillement)\n[M2G]=Déplacement vers le GC\n[LM]=Ne pas livrer plus que le maximum de Sceaux de compagnie\n[RM]=Retirez le Matéria de l'équipement dans le sac.",
		 tip104 = "Arme de gladiateur/Bouclier",
		 tip105 = "Pas assez de temps.",
		 tip106 = "Ne me piquez pas",
		 tip107 = "Le Méga Cactpot Acheter trois billets",
		 tip108 = "Option de recyclage ouverte",
		 tip109 = "Afficher/masquer les infobulles\nCliquez avec le bouton droit de sélectionner la langue",
		 tip110 = "Cliquez avec le bouton droit de copier.",
		 tip111 = "En raison de l'accent mis sur la stabilité,\nl'acceptation d'une commande peut prendre jusqu'à 3 secondes.\nVous informe par un message en couleur (écho) de l'acceptation de la demande.\nLa progression peut être suivie dans la console.",
		 tip112 = "envoyer les honneurs",
		 tip113 = "Ordre de la liste des partis,\nà l'exclusion de vous-même.\nLes icônes sont données à titre\nde référence uniquement pour une utilisation en solo avec mission.",
		 tip114 = "On/Off",
		 tip115 = "Je vais en parler dans le chat du parti.",
		 tip116 = "Les commandes textuelles du jeu peuvent être utilisées.",
		 tip117 = "Exécutez la commande texte [/e <pos>]",
		 tip118 = "Déclarations automatiques au début et à la fin",
		 tip119 = "Organiser son sac\nRésumez ce qui peut être empilé.",
		 tip120 = "en cours de triage",
		 tip121 = "Bouton de partage pour le module complémentaire XIVQuickLauncher, QoLBar.\nCliquez pour copier et importer avec QoLBar",
		 tip122 = "Recherche objects\nOn/Off\n\n[Nombre Possédé]\n[Recettes associées] le trouvera automatiquement.",
		 tip123 = "Servants",
		 tip124 = "Sacoche chocobo",
		 tip125 = "Coffre de compagnie libre",
		 tip126 = "Baisser la qualité(uniquement l'inventaire)\nIl sera exécuté dès que vous aurez organisé l'inventaire.",
		 tip127 = "Ingrédient",
		 tip128 = "Pierre",
		 tip129 = "Métal",
		 tip130 = "Bois",
		 tip131 = "Tissu",
		 tip132 = "Cuir",
		 tip133 = "Os",
		 tip134 = "Réactif",
		 tip135 = "Recevez des objets de Servants",
		 tip136 = "Déposer des objets dans un Servants",
		 tip137 = "Organizing the Retainer bag\nput together stackable items.",
		 tip138 = "Recevez des objets de Sacoche chocobo",
		 tip139 = "Déposer des objets dans un Sacoche chocobo",
		 tip140 = "Organizing the Saddlebag\nput together stackable items.",
		 tip141 = "Recevez des objets de Coffre de compagnie libre",
		 tip142 = "Déposer des objets dans un Coffre de compagnie libre",
		 tip143 = "AH Radar\nCliquez avec le bouton gauche de ouvrir une\nfenêtre standard\nCliquez avec le bouton droit de ouvrir\nune mini-fenêtre.",
		 tip144 = "Joueur",
		 tip145 = "Ennemis",
		 tip146 = "PNJ",
		 tip147 = "Coffre au trésor",
		 tip148 = "ALÉA",
		 tip149 = "meubles",
		 tip150 = "Vents éthérite",
		 tip151 = "Autres objets",
		 tip152 = "inconnu\ndonnées d'entrée de l'utilisateur",
		 tip153 = "Compagnon",
		 tip154 = "familiers",
		 tip155 = "gathering node",
		 tip156 = "Mascotte",
		 tip157 = "Radar On/Off",
		 tip158 = "Montrez-vous un point.",
		 tip159 = "Afficher d'autres points",
		 tip160 = "Dessiner des lignes",
		 tip161 = "Lignes cibles des autres joueurs",
		 tip162 = "Lignes cibles de la Ennemis",
		 tip163 = "Désactivé pendant les cutscenes",
		 tip164 = "Désactivé pendant la Pose de Groupe",
		 tip165 = "Désactivé pendant la mission",
		 tip166 = "Changement de couleur",
		 tip167 = "Modifier la taille et la couleur de ses propres points",
		 tip168 = "Modification des autres tailles de points",
		 tip169 = "Modifier l'épaisseur du trait",
		 tip170 = "chasser",
		 tip171 = "2.0",
		 tip172 = "3.0",
		 tip173 = "4.0",
		 tip174 = "5.0",
		 tip175 = "6.0",
		 tip176 = "Rang B",
		 tip177 = "Rang A",
		 tip178 = "Rang S/SS",
		 tip179 = "ALÉA spéciale",
		 tip180 = "Obtenir des informations sur la cible.",
		 tip181 = "Ajouter à une liste personnalisée",
		 tip182 = "Supprimé de la liste personnalisée",
		 tip183 = "Entrez ContentID (obligatoire).",
		 tip184 = "Entrez votre nom (obligatoire)",
		 tip185 = "affichage de listes personnalisées",
		 tip186 = "Réglage de la chasser",
		 tip187 = "Paramètres généraux",
		 tip188 = "Vents éthérés",
		 tip189 = "Cliquez avec le bouton gauche de ajouter à la liste personnalisée\nCliquez avec le bouton droit de annuler.",
		 tip190 = "AH Radar\nfenêtre standard",
		 tip191 = "Utilisez Billet de transport éthéré",
		 tip192 = "Fixer le montant de l'argent",
		 tip193 = "ContentID",
		 tip194 = "Nom",
		 tip195 = "boîte à mémos",
		 tip196 = "Changement de couleur pour les lignes cibles des autres joueurs",
		 tip197 = "Changement de couleur des lignes cibles de la Ennemis",
		 tip198 = "Normal/Dangereux",
		 tip199 = "Si le joueur cible se trouve à cette distance,\nle BOT arrête de se déplacer",
		 tip200 = "Création de boutons personnalisés",
		 tip201 = "bouton de commande de texte",
		 tip202 = "bouton de clic",
		 tip203 = "Bouton marche/arrêt",
		 tip204 = "Ajouter un bouton",
		 tip205 = "Réinitialiser les entrées",
		 tip206 = "Nom du bouton (obligatoire)",
		 tip207 = "Image à utiliser pour le bouton\nAetheryteHelper\\CustomImage\\\nSaisissez le nom du fichier dans le dossier CustomImage",
		 tip208 = "infobulle",
		 tip209 = "Commandes lors d'un clic gauche",
		 tip210 = "Commandes lors d'un clic droit",
		 tip211 = "Code d'exécution sur le clic gauche.\nCliquez avec le bouton droit de copier.",
		 tip212 = "Code d'exécution lors d'un clic droit.\nCliquez avec le bouton droit de copier.",
		 tip213 = "Temps d'impulsion du code\n0-3000\n\nAHPulse est partagé avec d'autres fonctions et est affecté lorsqu'il est exécuté en même temps.",
		 tip214 = "Code d'exécution lorsque le bouton est activé.\nCliquez avec le bouton droit de copier.",
		 tip215 = "Bouton de suppression.",
		 tip216 = "Mettre à jour le contenu du bouton.",
		 tip217 = "Paramètres des boutons de chargement.",
		 tip218 = "Afficher/masquer les boutons",
		 tip219 = "Type de déplacement\nLegacy/Standard",
		 tip220 = "Mise à jour du module",
		 tip221 = "Téléchargement",
		 tip222 = "Vérifier les mises à jour",
		 tip223 = "Nouvelle version publiée",
		 tip224 = "Confirmation automatique\n(toutes les 2 heures)",
  },
  de = { 
  	 tip00 = "Außerhalb des Einsatzgebietes",
		 tip01 = "AH Aktivieren/Deaktivieren",
		 tip02 = "Zugriffsverzögerung\n100ms-1sec",
		 tip03 = "TextBefehl im Spiel senden>> /e <Flag>",
		 tip04 = "Wohnbezirk noch nicht geöffnet",
		 tip05 = "Verzögerung RESET",
		 tip06 = "Instanz-Information",
		 tip07 = "zur Instanz 1 gehen",
		 tip08 = "zur Instanz 2 gehen",
		 tip09 = "zur Instanz 3 gehen",
		 tip10 = "Teleport to Gridania",
		 tip11 = "Zu Marktbrett in Gridania gehen",
		 tip12 = "Teleport to Limsa",
		 tip13 = "Zu Marktbrett in Limsa gehen",
		 tip14 = "Teleport to Uldah",
		 tip15 = "Zu Marktbrett in Uldah gehen",
		 tip16 = "Vermittlung Marktbrett/Teleport",
		 tip17 = "Jumbo-Glückskaktor helfen",
		 tip18 = "Umschalten keine beschränkungen",
		 tip19 = "Umschalten Erkundungsmodus",
		 tip20 = "Einführung in AH",
		 tip21 = "offene AH\nDoppelklick",
		 tip22 = "schließen",
		 tip23 = "Zufällig",
		 tip24 = "Wenn es nicht gut funktioniert,\nmelden Sie es bitte",
		 tip25 = "Sie brauchen einen Handwerker,\num Reparaturen selbst durchzuführen.",
		 tip26 = "Verwenden Sie den Trust-Zusatz zum Austausch\nAktivieren/Deaktivieren\n\nDie Registerkarte wechselt von selbst zu [GC]",
		 tip27 = "Klicken Sie hier, um Materialverwertung ein/auszuschalten\nRechtsklick zum Ein- und Ausschalten des Filters",
		 tip28 = "Automatisch ausschalten in Handwerker für Materialverwertung",
		 tip29 = "Materialverwertung & Materia Extrahieren nur in ssuche",
		 tip30 = "Gegenstabdsstufe1-1000\nMaterialverwertung Gegenstabdsstufe-Geräte größer als diese Zahl",
		 tip31 = "Einstellung Gegenstabdsstufe Reset",
		 tip32 = "Gegenstabdsstufe5-1000\nMaterialverwertung beliebige Gegenstabdsstufe-Ausrüstung\nweniger als dies, außer Gegenstabdsstufe1",
		 tip33 = "Auswahl wird Materialverwertung sein\nWertvolle Ausrüstung\nbefindet sich in der Arsenal",
		 tip34 = "Haupthhand",
		 tip35 = "Nebenhand",
		 tip36 = "Kopf",
		 tip37 = "Ohren",
		 tip38 = "Rumpf",
		 tip39 = "Hals",
		 tip40 = "Hände",
		 tip41 = "Handgelenke",
		 tip42 = "Beine",
		 tip43 = "Finger",
		 tip44 = "Füße",
		 tip45 = "Linke Maustaste:alles ein\nRechtsklick:Umkehren",
		 tip46 = "Verteidiger",
		 tip47 = "Heiler",
		 tip48 = "Schlachtens",
		 tip49 = "Zielens",
		 tip50 = "Schlagens",
		 tip51 = "Magie",
		 tip52 = "Verstümmelns",
		 tip53 = "Alle Klassen",
		 tip54 = "Spähens",
		 tip55 = "Druiden-Zweihandwaffe(Waffe)/Schild",
		 tip56 = "Hauptwaffe der Marodeure",
		 tip57 = "Hauptwaffe der Gelehrten",
		 tip58 = "Hauptwaffe der Dunkelritter",
		 tip59 = "Hauptwaffe der Astrologen",
		 tip60 = "Hauptwaffe der Revolverklingen",
		 tip61 = "Hauptwaffe der Weisen",
		 tip62 = "Hauptwaffe der Faustkämpfer",
		 tip63 = "Hauptwaffe der Waldläufer",
		 tip64 = "Hauptwaffe der Pikeniere",
		 tip65 = "Hauptwaffe der Maschinisten",
		 tip66 = "Hauptwaffe der Schurken",
		 tip67 = "Hauptwaffe der Tänzer",
		 tip68 = "Hauptwaffe der Samurai",
		 tip69 = "Thaumaturgen-Zweihandwaffe(Waffe)/Schild",
		 tip70 = "Hauptwaffe der Schnitter",
		 tip71 = "Grimoire",
		 tip72 = "Hauptwaffe der Rotmagier",
		 tip73 = "Handwerker",
		 tip74 = "Sammler",
		 tip75 = "Tausche Staatstaler gegen Gegenstände",
		 tip76 = "Mengeneinstellung ein/aus",
		 tip77 = "Geldbetrag für den Beginn des Umtauschs",
		 tip78 = "0 eingeben, um den Maximalwert zu erhalten",
		 tip79 = "Benötigte Menge (automatische Anpassung)",
		 tip80 = "Beachten Sie, dass Sie,\nwenn Sie den GC-Rang nicht erreichen,\nAutomatisch ausgeschaltet",
		 tip81 = "Anzahl der erforderlichen Staatstaler\nAnzahl der derzeit im Besitz befindlichen Staatstaler",
		 tip82 = "Verwenden Sie den automatischen Trank der Bindung.\nKlicken Sie mit der rechten Maustaste,\num den Minion-Link ein- oder auszuschalten",
		 tip83 = "Verwenden Sie den automatischen Gesellschafts-Leitfaden „Materialeinsatz“\nKlicken Sie mit der rechten Maustaste,\num den Minion-Link ein- oder auszuschalten.",
		 tip84 = "Ihr GC\nautomatisch auswählen",
		 tip85 = "Materia-Extrakition",
		 tip86 = "Materialverwertung aller Geräte in Ihrem Invebtar\nKlicken Sie mit der rechten Maustaste,\num die Optionen ein- und auszuschalten.",
		 tip87 = "Experteneinsätza",
		 tip88 = "Automatische Übertragung an GC",
		 tip89 = "Nicht mehr bewegen",
		 tip90 = "nicht erfolgter Austausch über Max Staatstaler",
		 tip91 = "Entnahme von Materia aus der Ausrüstung im Inventar",
		 tip92 = "Raffinieren\nAnhalten, wenn kein Platz mehr im Inventar vorhanden ist\nRechtsklick zum Ein- und Ausschalten des Minion-Links",
		 tip93 = "Automatische Auswahl Datenzentrums",
		 tip94 = "Automatischer Umzug nach Marktbrett",
		 tip95 = "Welt wählen",
		 tip96 = "Bitte unterstützen Sie uns,\ndamit es gut wird.\n\nFür meine Katze...",
		 tip97 = "Bitte senden Sie mir ein DM,\nwenn Sie irgendwelche Probleme oder Wünsche haben.\nBitte fördern Sie auch die",
		 tip98 = "Github-Link,\nLinks klicken: Home\nRechtsklick: Loslassen",
		 tip99 = "Erhalte Fähigkeiten durch das Lösen von Quests!",
		 tip100 = "[MEx]=Materia-Extrakition\n[SbP]=Trank der Bindung\n[SbM]=Gesellschafts-Leitfaden „Materialeinsatz“",
		 tip101 = "[Dsy]=Materialverwertung\n[Fil]=Materialverwertung Optionen\n[Cft]=Materia-Extrakition und Materialverwertung in Handwerker deaktiviert.\n[IDm]=Materia-Extrakition und Materialverwertung nur im Dungeons",
		 tip102 = "[AR]=Raffinieren\n[Link]=Minion-Links",
		 tip103 = "[Ex]=Austausch\n[M2G]=Übertragung an GC\n[LM]=Nicht mehr als das Maximum\n[RM]=Beseitigung von Materia",
		 tip104 = "Hauptwaffe der Gladiatoren/Schild",
		 tip105 = "・・・Ich brauche mehr Zeit",
		 tip106 = "Bitte stupsen Sie mich nicht an...",
		 tip107 = "Kaufen Sie drei Tickets",
		 tip108 = "Materialverwertung Options",
		 tip109 = "Tooltip ein-/ausblenden\nRechtsklick zur Auswahl der Sprache",
		 tip110 = "Rechtsklick zum Kopieren",
		 tip111 = "Aufgrund der Bedeutung der Stabilität kann es bis zu drei Sekunden dauern,\nbis ein Befehl angenommen wird.\nWenn Sie angenommen werden,\nwerden Sie durch eine farbige Nachricht benachrichtigt.\nDer Fortschritt kann auf der Konsole überprüft werden.",
		 tip112 = "Ehrungen automatisch senden",
		 tip113 = "Zeigt einen Index der Gruppenmitglieder an,\ndie nicht Sie selbst sind.\nDie Symbole an der Seite dienen nur als Referenz bei der Verwendung des Inhaltssuche solo.",
		 tip114 = "Aktivieren/Deaktivieren",
		 tip115 = "Nur im Gruppenchat gesendet.",
		 tip116 = "Es können spielinterne Textbefehle verwendet werden.",
		 tip117 = "TextBefehl im Spiel senden>> /e <pos>",
		 tip118 = "Automatischer Beginn chat und Ende chat des Dungeons",
		 tip119 = "Inventar organisieren\nstapelbare Gegenstände zusammenstellen.",
		 tip120 = "Jetzt arbeiten...",
		 tip121 = "Dies ist die Freigabe-Schaltfläche für das XIVQuickLauncher-Addon, QoLBar\nZum Kopieren und Importieren in QoLBar anklicken",
		 tip122 = "GegenständeSuche\nEIN/AUS\n\nAutomatische Suche\n[Im Inbentar shchen]\n[Nach Rezept mit diesem Material suchen]",
		 tip123 = "Gehilfen",
		 tip124 = "Chocobo-Satteltasche",
		 tip125 = "Gesellschaftstruhe",
		 tip126 = "Qualitat mindern(inventar)\nSie wird ausgeführt, sobald Sie Inventar organisieren.",
		 tip127 = "Zutat",
		 tip128 = "Baustein",
		 tip129 = "Metall",
		 tip130 = "Nutzholz",
		 tip131 = "Stoff",
		 tip132 = "Leder",
		 tip133 = "Knochen/Horn",
		 tip134 = "Reagenz",
		 tip135 = "Vom Gehilfen erhalten",
		 tip136 = "Kaution an Gehilfen",
		 tip137 = "Organisieren Gehilfe Inventar\nFassen Sie zusammen, was gestapelt werden kann.",
		 tip138 = "Vom Chocobo-Satteltasche erhalten",
		 tip139 = "Kaution an Chocobo-Satteltasche",
		 tip140 = "Organisieren Chocobo-Satteltasche\nFassen Sie zusammen, was gestapelt werden kann.",
		 tip141 = "Vom Gesellschaftstruhe erhalten",
		 tip142 = "Kaution an Gesellschaftstruhe",
		 tip143 = "AH-Radar\nLinksklick zum Öffnen des Standardfensters\nKlicken Sie mit der rechten Maustaste,\num ein Minifenster zu öffnen",
		 tip144 = "PCs",
		 tip145 = "Feinde",
		 tip146 = "NPCs",
		 tip147 = "Schatztruhe",
		 tip148 = "FATE",
		 tip149 = "Möbel",
		 tip150 = "Ätheryt",
		 tip151 = "Andere Objekte",
		 tip152 = "unbekannt\nVom Benutzer eingegebene Daten",
		 tip153 = "Mitstreiter",
		 tip154 = "Familiare",
		 tip155 = "Sammelstelle",
		 tip156 = "Begleiter",
		 tip157 = "Radar ein/aus",
		 tip158 = "Zeigen Sie die Punkte zu Ihren Füßen an",
		 tip159 = "Andere Punkte anzeigen",
		 tip160 = "Zeile anzeigen",
		 tip161 = "Zeigen Sie eine Linie an, wenn Sie von anderen PCs beobachtet werden",
		 tip162 = "Eine Linie anzeigen, wenn der Feinde angreift",
		 tip163 = "Wird während der Zwischensequenzen nicht angezeigt",
		 tip164 = "Wird während der Gruppenfotos nicht angezeigt",
		 tip165 = "Wird in Dungeons nicht gezeigt",
		 tip166 = "Farbwechsel",
		 tip167 = "Ändern Sie ihre Punktgröße und Farbe.",
		 tip168 = "Andere Punktgrößen",
		 tip169 = "Linienstärke",
		 tip170 = "Hochwild",
		 tip171 = "2.0",
		 tip172 = "3.0",
		 tip173 = "4.0",
		 tip174 = "5.0",
		 tip175 = "6.0",
		 tip176 = "B Rank",
		 tip177 = "A Rank",
		 tip178 = "S/SS Rank",
		 tip179 = "FATEs",
		 tip180 = "Informieren Sie sich",
		 tip181 = "Zur benutzerdefinierten Liste hinzufügen",
		 tip182 = "Aus der benutzerdefinierten Liste entfernt",
		 tip183 = "ContentID eingeben (erforderlich)",
		 tip184 = "Namen ein (erforderlich)",
		 tip185 = "Benutzerdefinierte Listenanzeige",
		 tip186 = "Hochwild einrichten",
		 tip187 = "Allgemeine Einstellungen",
		 tip188 = "Windätherquellen",
		 tip189 = "Linksklick zum Hinzufügen zur benutzerdefinierten Liste\nRechtsklick zum Abbrechen",
		 tip190 = "AH Radar\nStandardfenster",
		 tip191 = "Verwenden Sie Teleport-Ticket",
		 tip192 = "Einrichten eines Gil",
		 tip193 = "ContentID",
		 tip194 = "Name",
		 tip195 = "Memo-Box",
		 tip196 = "Farbwechsel der linie von PCs",
		 tip197 = "Farbwechsel der linie von Feinde",
		 tip198 = "Umschaltung Normal/Gefahr",
		 tip199 = "Wenn sich der Zielspieler innerhalb dieser Entfernung befindet, hält der BOT an",
		 tip200 = "Benutzerdefinierte Schaltflächen erstellen",
		 tip201 = "Text-Befehlsschaltfläche",
		 tip202 = "Klick-Taste",
		 tip203 = "Ein/Aus-Taste",
		 tip204 = "Schaltfläche Hinzufügen",
		 tip205 = "Einträge zurücksetzen.",
		 tip206 = "Name der Schaltfläche (erforderlich)",
		 tip207 = "Bild, das für die Schaltfläche verwendet werden soll\nAetheryteHelper\\CustomImage\\Geben Sie den Namen der Datei im Ordner ein",
		 tip208 = "Tooltip",
		 tip209 = "Befehle beim Klicken mit der linken Maustaste",
		 tip210 = "Befehle beim Klicken mit der rechten Maustaste",
		 tip211 = "Ausführungscode bei Linksklick\nZum Kopieren mit der rechten Maustaste klicken",
		 tip212 = "Ausführungscode bei Rechtsklick\nZum Kopieren mit der rechten Maustaste klicken",
		 tip213 = "Impulszeit des Codes\n0-3000\n\nAHPulse wird mit anderen Funktionen geteilt und ist betroffen,\nwenn sie gleichzeitig ausgeführt werden",
		 tip214 = "Ausführungscode, wenn die Taste eingeschaltet ist.\nZum Kopieren mit der rechten Maustaste klicken",
		 tip215 = "Schaltfläche Löschen",
		 tip216 = "Aktualisieren Sie den Inhalt der Schaltfläche",
		 tip217 = "Einstellungen der Schaltfläche laden",
		 tip218 = "Schaltflächen ein-/ausblenden",
		 tip219 = "Bewegungsstruerung\nLegacy/Standard",
		 tip220 = "Aktualisierung des Moduls",
		 tip221 = "Herunterladen",
		 tip222 = "Auf Aktualisierung prüfen",
		 tip223 = "Neue Version veröffentlicht",
		 tip224 = "Automatische Bestätigung\n(alle 2h)",
  },
  cn = {
  	 tip00 = "不在可使用区域内",
     tip01 = "AH 开启/关闭",
     tip02 = "傳送时间间隔\n可在100ms~1s之间选择",
     tip03 = "在游戏中发送文本命令>> /e <flag>",
     tip04 = "冒险者居住区未開啟",
     tip05 = "恢复默认延迟设置",
     tip06 = "副本區-人数",
     tip07 = "一线",
     tip08 = "二线",
     tip09 = "三线",
     tip10 = "传送至森都",
     tip11 = "去森都的市场板",
     tip12 = "传送至海都",
     tip13 = "去海都的市场板",
     tip14 = "传送到沙都",
     tip15 = "去沙都的市场板",
     tip16 = "切换 市场板/大水晶",
     tip17 = "仙人仙彩助手",
     tip18 = "切换解限模式",
  	 tip19 = "切换自由探索",
  	 tip20 = "功能介绍视频链接",
  	 tip21 = "双击打开",
  	 tip22 = "关闭",
   	 tip23 = "按随机数购买",
  	 tip24 = "如果它出BUG了，请向我反饋",
  	 tip25 = "装备修理",
  	 tip26 = "亲信裝備交換\n\n开启之后,会固定在[GC]功能界面,如想使用其他功能,請关闭亲信裝備交換",
  	 tip27 = "道具分解\n右键开启或关闭过滤列表",
  	 tip28 = "在生產時关闭道具分解",
  	 tip29 = "只分解和精制副本内的装备和道具",
  	 tip30 = "品级:1-1000\n分解品级大于这个数字的裝备",
  	 tip31 = "重置品级設置",
  	 tip32 = "品级:5-1000\n分解任何低于这个数字的装备，除了品级1的装备",
  	 tip33 = "开启之后会分解装备\n开启前請確保背包內沒有重要的裝備",
  	 tip34 = "主手",
  	 tip35 = "副手",
  	 tip36 = "头部防具",
  	 tip37 = "耳饰",
  	 tip38 = "身体防具",
  	 tip39 = "项链",
  	 tip40 = "手部防具",
  	 tip41 = "手镯",
  	 tip42 = "腿部防具",
  	 tip43 = "戒指",
  	 tip44 = "脚部防具",
  	 tip45 = "右键全选\n左键全不选",
  	 tip46 = "通用T装备",
  	 tip47 = "通用奶装备",
  	 tip48 = "强攻装备",
  	 tip49 = "通用远敏装备",
  	 tip50 = "强袭装備",
  	 tip51 = "通用法系装备",
  	 tip52 = "制敌装備",
  	 tip53 = "全部职业装备",
  	 tip54 = "游击装備",
  	 tip55 = "白杖/盾",
  	 tip56 = "斧",
  	 tip57 = "学者书",
  	 tip58 = "大剑",
  	 tip59 = "占星盘",
  	 tip60 = "枪刃",
  	 tip61 = "贤具",
  	 tip62 = "格鬥武器",
  	 tip63 = "诗人弓",
  	 tip64 = "龙骑枪",
  	 tip65 = "机工火铳",
  	 tip66 = "忍者双剑",
  	 tip67 = "投擲武器",
  	 tip68 = "刀",
  	 tip69 = "黒杖/盾",
  	 tip70 = "镰刀",
  	 tip71 = "召唤书",
  	 tip72 = "赤魔杖",
  	 tip73 = "生产工具·防具·饰品",
  	 tip74 = "采集生产工具·防具·饰品",
  	 tip75 = "用军票兑换物品",
  	 tip76 = "兌換數量限制 开/关",
  	 tip77 = "军票超过此数字-开始兑换",
  	 tip78 = "0表示設置為軍票上限",
  	 tip79 = "兑换数量(默認是有多少換多少)",
  	 tip80 = "如果军衔等級不夠\n兑换不了",
  	 tip81 = "兑换物品需要的军票/现在持有军票",
  	 tip82 = "自动使用精炼药\n右键可以同步到Minion设置",
  	 tip83 = "自动军用精神学指南\n右键可以同步到Minion设置",
  	 tip84 = "自动选择所属的軍隊",
  	 tip85 = "精制魔晶石",
  	 tip86 = "精制所有装备\n右鍵打開精制設置",
  	 tip87 = "兑换军票",
  	 tip88 = "自动去兑换军票",
  	 tip89 = "停止自动移动",
  	 tip90 = "当军票超过上限时不做兑换",
  	 tip91 = "回收背包内装备的魔晶石",
  	 tip92 = "精選\n當背包沒有空位時停止\n右鍵同步到Minion設置",
  	 tip93 = "自動選擇大區",
  	 tip94 = "切换去市场板",
  	 tip95 = "选择服务器",
  	 tip96 = "我的猫猫想吃好吃的\n\n可以给牠投个币嗎QAQ",
  	 tip97 = "如果你有任何问题或要求，可以私聊我\n另外,你对我的鼓励是我最大的动力",
  	 tip98 = "Github页面\n左鍵是主頁\n右鍵是Release",
  	 tip99 = "请完成任务,解锁技能",
  	 tip100 = "[MEx]=精制魔晶石\n[SbP]=精煉藥\n[SbM]=精神学指南",
  	 tip101 = "[Dsy]=裝備分解\n[Fil]=分解过滤列表中的裝備\n[Cft]=生產模式\n[IDm]=副本模式",
  	 tip102 = "[AR]=精選\n[Link]=同步Minion設置",
  	 tip103 = "[Ex]=兌換軍票\n[M2G]=移動去軍隊\n[LM]=军票上限\n[RM]=回收魔晶石",
  	 tip104 = "單手劍/盾",
  	 tip105 = "敬請期待",
  	 tip106 = "不要戳我OWO",
  	 tip107 = "购买仙人彩",
  	 tip108 = "道具分解設置",
  	 tip109 = "功能說明 開/關\n右键单击选择语言",
  	 tip110 = "右键复制",
  	 tip111 = "為了穩定運行\n每條文本命令需要3秒時間來運行\n可以在控制台查看",
  	 tip112 = "自動給讚",
  	 tip113 = "按照小隊列表的顺序，不包括自己\n僅供参考",
  	 tip114 = "开/关",
  	 tip115 = "只在小隊聊天中說話",
  	 tip116 = "可以使用游戏中的文本命令",
  	 tip117 = "[/e <pos>]:查看你現在在幾線",
  	 tip118 = "在副本開始前和結束後喊話",
  	 tip119 = "整理背包\n将可堆叠的物品放在一起",
  	 tip120 = "整理中",
  	 tip121 = "XIVQuickLauncher插件、QoLBar的分享按钮\n点击复制并在QoLBar中导入",
  	 tip122 = "物品搜索\n開/關\n\n[查看持有情況]\n[搜索物品]自動搜索物品",
  	 tip123 = "雇員背包",
  	 tip124 = "陆行鸟背包",
  	 tip125 = "部隊箱",
  	 tip126 = "降低品質(背包)\n整理背包時就會降低品質",
  	 tip127 = "食材",
  	 tip128 = "石材",
  	 tip129 = "金属",
  	 tip130 = "木材",
  	 tip131 = "布材",
  	 tip132 = "皮革",
  	 tip133 = "骨材",
  	 tip134 = "煉金素材",
  	 tip135 = "從雇員背包里拿",
  	 tip136 = "放在雇員背包里",
  	 tip137 = "整理雇員背包\n将可堆叠的物品放在一起",
  	 tip138 = "從陆行鸟背包里拿",
  	 tip139 = "放在陆行鸟背包里",
  	 tip140 = "整理陆行鸟背包\n将可堆叠的物品放在一起",
  	 tip141 = "從部隊箱里拿",
  	 tip142 = "放在部隊箱里",
  	 tip143 = "AH 雷達\n左鍵標準界面/右鍵小界面",
  	 tip144 = "玩家",
  	 tip145 = "怪物",
  	 tip146 = "NPC",
  	 tip147 = "宝箱",
  	 tip148 = "F.A.T.E",
  	 tip149 = "家具",
  	 tip150 = "风脉點",
  	 tip151 = "其他",
  	 tip152 = "不明\n用户输入的数据",
  	 tip153 = "搭档",
  	 tip154 = "召唤兽",
  	 tip155 = "采集点",
  	 tip156 = "宠物",
  	 tip157 = "雷达开/关",
  	 tip158 = "显示自己的圆点",
  	 tip159 = "显示其他的圆点",
  	 tip160 = "显示连线",
  	 tip161 = "显示其他玩家的连线",
  	 tip162 = "显示怪物的连线",
  	 tip163 = "截圖時不显示",
  	 tip164 = "拍照模式時不显示",
  	 tip165 = "在副本中不显示",
  	 tip166 = "改变颜色",
  	 tip167 = "玩家小圆点大小",
  	 tip168 = "其他小圆点大小",
  	 tip169 = "连线粗細",
  	 tip170 = "狩獵",
  	 tip171 = "2.0",
  	 tip172 = "3.0",
  	 tip173 = "4.0",
  	 tip174 = "5.0",
  	 tip175 = "6.0",
  	 tip176 = "B怪",
  	 tip177 = "A怪",
  	 tip178 = "S/SS怪",
  	 tip179 = "特殊FATE",
  	 tip180 = "获取目标信息",
  	 tip181 = "添加到自定义列表",
  	 tip182 = "从自定义列表删除",
  	 tip183 = "输入物品id(必填)",
  	 tip184 = "输入名称(必填)",
  	 tip185 = "自定义列表显示",
  	 tip186 = "狩獵設置",
  	 tip187 = "常规设置",
  	 tip188 = "风脉泉",
  	 tip189 = "左键单击添加到自定义列表\n右键单击取消",
  	 tip190 = "AH 雷達\n打开雷达设置",
  	 tip191 = "使用传送券",
  	 tip192 = "设置金额",
  	 tip193 = "內容ID",
  	 tip194 = "名稱",
  	 tip195 = "备注",
  	 tip196 = "其他玩家連线的颜色改變",
  	 tip197 = "怪物連线的颜色改變",
  	 tip198 = "正常/危险",
  	 tip199 = "如果目标玩家在这个距离内，则停止腳本的移动\n建议与采集一起使用",
  	 tip200 = "创建按钮",
  	 tip201 = "文本命令按钮",
  	 tip202 = "点击按钮(自定义功能)",
  	 tip203 = "开/关按钮(自定义功能)",
  	 tip204 = "添加按钮",
  	 tip205 = "初始化输入项目",
  	 tip206 = "按钮名称(必须)",
  	 tip207 = "按钮要使用的图片\n圖片文件路徑在 \"AetheryteHelper\\CustomImage\\\" ",
  	 tip208 = "功能提示",
  	 tip209 = "通過点击左键执行文本命令",
  	 tip210 = "通過点击右键执行文本命令",
  	 tip211 = "左键点击时执行代码\n右键复制",
  	 tip212 = "右键点击时执行代码\n右键复制",
  	 tip213 = "Pulse 時間 of code\n0-3000\n\nAHPluse与其他函数共享，如果同时执行，将受到影响。",
  	 tip214 = "按钮开启时的执行代码\n右键复制",
  	 tip215 = "删除按钮",
  	 tip216 = "改变按钮的内容",
  	 tip217 = "加载按钮设置",
  	 tip218 = "显示/隐藏按钮",
  	 tip219 = "行走方式\n传统/标准",
  	 tip220 = "模块更新",
  	 tip221 = "下载",
		 tip222 = "检查更新",
		 tip223 = "一个新的版本已经发布",
		 tip224 = "自动确认（每2小时）",
  },
  kr = { 
  	 tip00 = "Outside of use area",
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
		 tip57 = "SCH's Arm",
		 tip58 = "DRK's Arm",
		 tip59 = "AST's Arm",
		 tip60 = "GNB's Arm",
		 tip61 = "SGE's Arm",
		 tip62 = "MNK's Arm",
		 tip63 = "BRD's Arm",
		 tip64 = "DRG's Arm",
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
		 tip109 = "tooltips Show/hide\nRight-click to select language",
		 tip110 = "Right click to copy",
		 tip111 = "Due to the importance of stability,\nit may take a about 3 sec for the command to be accepted.\nit will be notified with a color message when it is accepted.\nProgress can be checked in the console.",
		 tip112 = "Auto Commendation",
		 tip113 = "index of party member in exclud you.\nthe side icon are just for reference when used DF for solo.",
		 tip114 = "Enable/Disable",
		 tip115 = "Send only in Party Chat.",
		 tip116 = "Can use ingame text commands",
		 tip117 = "[/e <pos>]:Check your instance.",
		 tip118 = "Auto Start and End Call in Duty",
		 tip119 = "organize inventory\nput together stackable items.",
		 tip120 = "Now working...",
		 tip121 = "This is share button for XIVQuickLauncher addon, QoLBar\nClick to copy and import it in QoLBar",
		 tip122 = "ItemSearch\nON/OFF\n\nAuto retrieval\n[Search for Item]\n[Search Recipes]",
		 tip123 = "Retainer",
		 tip124 = "Saddlebag",
		 tip125 = "FC Chest",
		 tip126 = "HQ to NQ (only inventory)\nIt will be executed as soon as you organize inventory.",
		 tip127 = "Ingredients",
		 tip128 = "Stone",
		 tip129 = "Metal",
		 tip130 = "Lumber",
		 tip131 = "Cloth",
		 tip132 = "Leather",
		 tip133 = "Bone",
		 tip134 = "Reagents",
		 tip135 = "from Retainer",
		 tip136 = "to Retainer",
		 tip137 = "Organizing the Retainer bag\nput together stackable items.",
		 tip138 = "from Saddlebag",
		 tip139 = "to Saddlebag",
		 tip140 = "Organizing the Saddlebag\nput together stackable items.",
		 tip141 = "from FCchest",
		 tip142 = "to FCchest",
		 tip143 = "AH Radar\nLeft-click for standard window\nRight-click for mini window",
		 tip144 = "Player",
		 tip145 = "Monster",
		 tip146 = "NPC",
		 tip147 = "chest",
		 tip148 = "F.A.T.E",
		 tip149 = "furniture",
		 tip150 = "Aetheryte",
		 tip151 = "object",
		 tip152 = "Unknown\nUser input data",
		 tip153 = "buddy",
		 tip154 = "pet",
		 tip155 = "gathering node",
		 tip156 = "minions",
		 tip157 = "Radar Enable/Disable",
		 tip158 = "Drow Player Dot",
		 tip159 = "Drow Other Dots",
		 tip160 = "Drow Line",
		 tip161 = "Target Lines from Other Players",
		 tip162 = "Target Lines from mob",
		 tip163 = "Disabled during cutscenes",
		 tip164 = "Disabled during gpose",
		 tip165 = "Disabled during in Duty",
		 tip166 = "Color Change",
		 tip167 = "Self dot size & Color",
		 tip168 = "Other dot size",
		 tip169 = "line thickness",
		 tip170 = "Hunt",
		 tip171 = "ARR(2.x)",
		 tip172 = "HW(3.x)",
		 tip173 = "StB(4.x)",
		 tip174 = "ShB(5.x)",
		 tip175 = "EW(6.x)",
		 tip176 = "B Ranks",
		 tip177 = "A Ranks",
		 tip178 = "S/SS Ranks",
		 tip179 = "FATEs",
		 tip180 = "Retrieve target information",
		 tip181 = "Add to CustomList",
		 tip182 = "Remove from CustomList",
		 tip183 = "ContentID (required)",
		 tip184 = "Name (required)",
		 tip185 = "View CustomList",
		 tip186 = "Hunts Settings",
		 tip187 = "General settings",
		 tip188 = "Aether Currents",
		 tip189 = "Left-click to Add to CustomList\nRight-click to Cancel",
		 tip190 = "AH Radar\nopen to standard window",
		 tip191 = "Use AetheryteTicket",
		 tip192 = "Amount Setting",
		 tip193 = "ContentID",
		 tip194 = "name",
		 tip195 = "note",
		 tip196 = "Color Change for Target Lines from Other Players",
		 tip197 = "Color Change for Target Lines from mob",
		 tip198 = "Normal/Hazard",
		 tip199 = "Stops BOT move if target player is within this distance,\nrecommended for use with gatherer",
		 tip200 = "Creat Buttons",
		 tip201 = "Text Command Button",
		 tip202 = "Click Button(Custom Function)",
		 tip203 = "ON/OFF Button(Custom Function)",
		 tip204 = "Add Button",
		 tip205 = "Initialization of input items",
		 tip206 = "Button Name(must)",
		 tip207 = "Image to use for Button\nEnter the name of file in \"AetheryteHelper\\CustomImage\\\" folder",
		 tip208 = "tooltip",
		 tip209 = "TextCommands to be executed by Left-click",
		 tip210 = "TextCommands to be executed by Right-click",
		 tip211 = "Execution code on Left-click\nRight click to copy",
		 tip212 = "Execution code on Right-click\nRight click to copy",
		 tip213 = "Pulse time of code\n0-3000\n\nAHPulse is shared with other functions and will be affected if executed at the same time",
		 tip214 = "Execution code when button is on\nRight click to copy",
		 tip215 = "Delete Button",
		 tip216 = "Change of Button content",
		 tip217 = "Load of Button settings",
		 tip218 = "Show/hide Buttons",
		 tip219 = "MovementSetting\nLegacy/Standard",
		 tip220 = "Module Update",
		 tip221 = "Download",
		 tip222 = "Check for update",
		 tip223 = "New version released",
		 tip224 = "Auto confirmat\n(every 2h)",
  },

}

local AHitemsortError = {
	title01 = "AH ItemSort",
	J01 = "例外が発生したのでソートを停止します",
	E01 = "An error has occurred\nstop organizing items.",
	D01 = "Es ist ein Fehler aufgetreten\nHören Sie auf, Gegenstände zu organisieren.",
	F01 = "Une erreur s'est produite\narrêtez d'organiser les objets.",
	C01 = "发生了一个错误,停止整理物品",
	K01 = "오류가 발생했습니다\n항목 정리 중지",
	
	title02 = "AH ItemSearch",
	J02 = "このアイテムはひとつしか持てません",
	E02 = "You can only have one of this item.",
	D02 = "Sie können nur ein Exemplar dieses Artikels besitzen.",
	F02 = "Vous ne pouvez avoir qu'une seule de ces choses.",
	C02 = "你只能拥有其中一个项目",
	K02 = "오류가 발생했습니다\n항목 정리 중지",
}

local AHnormalError = {
	title01 = "Create Button",
	J01 = "ボタンは50個までしか表示できません",
	E01 = "Only 50 buttons can be displayed",
	D01 = "Es können nur 50 Schaltflächen angezeigt werden",
	F01 = "Seuls 50 boutons au maximum peuvent être affichés.",
	C01 = "最多只能显示50个按钮",
	K01 = "버튼은 50개까지만 표시할 수 있습니다.",
}
----------------------------------------------------


local FFXIVDClist = { "------", "Elemental", "Gaia", "Mana", "Aether", "Primal", "Chaos", "Light", "Crystal","Materia", "豆豆柴", "猫小胖", "莫古力", "陆行鸟", "KR"}
--FFXIVDClist = { "------", "Elemental", "Gaia", "Mana", "Meteor", "Aether", "Primal", "Chaos", "Light", "Crystal","Materia", "豆豆柴", "猫小胖", "莫古力", "陆行鸟", "KR"}
local noDClist = { "sorry" }

local FFXIVServerlist = {
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
  [11] = { "------", "水晶塔", "银泪湖","太阳海岸","伊修加德","红茶川",},
  [12] = { "------", "延夏", "摩杜纳","柔风海湾","海猫茶屋","琥珀原","紫水栈桥","静语庄园",},
  [13] = { "------", "拂晓之间", "旅人栈桥","梦羽宝境","潮风亭","白金幻象","白银乡","神拳痕","龙巢神殿",},
  [14] = { "------", "宇宙和音", "幻影群岛","拉诺西亚","晨曦王座","沃仙曦染","神意之地","红玉海","萌芽池",},
	[15] = { "------", "모그리","초코보","카벙클","톤베리","펜리르",},
  [16] = { "Error" },
  --[[
	[1] = { "------" },
	[2] = { "------", "Aegis", "Atomos", "Carbuncle", "Garuda", "Gungnir", "Kujata", "Tonberry", "Typhon" },
	[3] = { "------", "Alexander", "Bahamut", "Durandal", "Fenrir", "Ifrit", "Ridill", "Tiamat", "Ultima" },
	[4] = { "------", "Anima", "Asura", "Chocobo", "Hades", "Ixion", "Masamune", "Pandaemonium", "Titan" },
	[5] = { "------", "Ramuh", "Unicorn", "Valefor", "Yojimbo", "Zeromus", "Belias", "Mandragora", "Shinryu" },
	[6] = { "------", "Adamantoise", "Cactuar", "Faerie", "Gilgamesh", "Jenova", "Midgardsormr", "Sargatanas", "Siren" },
	[7] = { "------", "Behemoth", "Excalibur", "Exodus", "Famfrit", "Hyperion", "Lamia", "Leviathan", "Ultros" },
	[8] = { "------", "Cerberus", "Louisoix", "Moogle", "Omega", "Ragnarok" ,"Spriggan" },
	[9] = { "------", "Lich", "Odin", "Phoenix","Shiva","Twintania","Zodiark" },
	[10] = { "------", "Balmung", "Brynhildr", "Coeurl", "Diabolos", "Goblin", "Malboro", "Mateus", "Zalera" },
	[11] = { "------", "Bismarck", "Ravana", "Sephirot", "Sophia", "Zurvan"},
	[12] = { "------", "水晶塔", "银泪湖","太阳海岸","伊修加德","红茶川",},
  [13] = { "------", "延夏", "摩杜纳","柔风海湾","海猫茶屋","琥珀原","紫水栈桥","静语庄园",},
  [14] = { "------", "拂晓之间", "旅人栈桥","梦羽宝境","潮风亭","白金幻象","白银乡","神拳痕","龙巢神殿",},
  [15] = { "------", "宇宙和音", "幻影群岛","拉诺西亚","晨曦王座","沃仙曦染","神意之地","红玉海","萌芽池",},
  [16] = { "------", "모그리","초코보","카벙클","톤베리","펜리르",},
  [17] = { "Error" },
  ]]
  }

local WorldID = {
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
{id=24,Name="Belias",DC="Mana"}, --"Meteor"
{id=25,Name="Chaos",DC="-"},
{id=26,Name="Hecatoncheir",DC="-"},
{id=27,Name="Moomba",DC="-"},
{id=28,Name="Pandaemonium",DC="Mana"},
{id=29,Name="Shinryu",DC="Mana"}, --"Meteor"
{id=30,Name="Unicorn",DC="Elemental"}, --"Meteor"
{id=31,Name="Yojimbo",DC="Gaia"}, --"Meteor"
{id=32,Name="Zeromus",DC="Gaia"}, --"Meteor"
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
{id=60,Name="Ramuh",DC="Elemental"}, --"Meteor"
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
{id=82,Name="Mandragora",DC="Mana"}, --"Meteor"
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
--CN
{id=1042,Name="拉诺西亚",DC="陆行鸟"},
{id=1043,Name="紫水栈桥",DC="猫小胖"},
{id=1044,Name="幻影群岛",DC="陆行鸟"},
{id=1045,Name="摩杜纳",DC="猫小胖"},
{id=1048,Name="太阳海岸",DC="豆豆柴"},
{id=1050,Name="银泪湖",DC="豆豆柴"},
{id=1056,Name="红茶川",DC="豆豆柴"},
{id=1057,Name="伊修加德",DC="豆豆柴"},
{id=1060,Name="萌芽池",DC="陆行鸟"},
{id=1074,Name="水晶塔",DC="豆豆柴"},
{id=1076,Name="白金幻象",DC="莫古力"},
{id=1081,Name="神意之地",DC="陆行鸟"},
{id=1106,Name="静语庄园",DC="猫小胖"},
{id=1113,Name="旅人栈桥",DC="莫古力"},
{id=1121,Name="拂晓之间",DC="莫古力"},
{id=1166,Name="龙巢神殿",DC="莫古力"},
{id=1167,Name="红玉海",DC="陆行鸟"},
{id=1169,Name="延夏",DC="猫小胖"},
{id=1170,Name="潮风亭",DC="莫古力"},
{id=1171,Name="神拳痕",DC="莫古力"},
{id=1172,Name="白银乡",DC="莫古力"},
{id=1173,Name="宇宙和音",DC="陆行鸟"},
{id=1174,Name="沃仙曦染",DC="陆行鸟"},
{id=1175,Name="晨曦王座",DC="陆行鸟"},
{id=1176,Name="梦羽宝境",DC="莫古力"},
{id=1177,Name="海猫茶屋",DC="猫小胖"},
{id=1178,Name="柔风海湾",DC="猫小胖"},
{id=1179,Name="琥珀原",DC="猫小胖"},
--KR
{id=2075,Name="카벙클",DC="KR"},
{id=2076,Name="초코보",DC="KR"},
{id=2077,Name="모그리",DC="KR"},
{id=2078,Name="톤베리",DC="KR"},
{id=2080,Name="펜리르",DC="KR"},

}
local mushPlayerGCrank = {
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
local mushCD1 = {limsa = 4299025540, Gridania = 4298942321, Uldah = 4298610756 }
local mushCD2 = {limsa = 4299025544, Gridania = 4298942322, Uldah = 4298610755 }
local mushGCEN = {"Maelst","Adders","Flames","------"}
local mushGCJP = {"黒渦団","双蛇党","不滅隊","------"}
local mushGCDE = {"Mahlstrom","Bruderschaft","Legion","------"}
local mushGCFR = {"Le Maelstrom","Deux Vipères","Immortels","------"}
local mushGCCN = {"黑涡团","双蛇党","恒辉队","------"}
local mushGCKR = {"흑와단","쌍사당","불멸대","------"}
local GCexchangeItems = {
		 jp = {"ベンチャースクリップ","ダークマターG8","グラスファイバー","特別支給コンテナ(新生・蒼天)","特別支給コンテナ(紅蓮)","転送網利用券(GC)"}, ---0
		 En = {"Ventures","G8DarkMatter","GlassFiber","MaterielContainer3.0","MaterielContainer4.0","AetheryteTicket(GC)"},---1
		 De = {"Wertmarken","G8Dunkelmaterie ","Glasfasern","Sonderziehungstruhe(ARR/HW)","Sonderziehungstruhe(SB) ","Teleport-Ticket(GC)"},---2
		 Fr = {"Jetons de tâche","Matière sombre G8","Fibre de verre","Malle-surprise(ARR/HW)","Malle-surprise(SB)","Billet de transport éthéré(GC)"},---3
		 Cn = {"探险币","8级暗物质","玻璃纤维","特殊配给货箱（重生/苍穹）","特殊配给货箱（红莲）","传送网使用券(军队)"},
		 Kr = {"집사 급료","8등급 암흑물질","유리섬유","MaterielContainer3.0","MaterielContainer4.0","전송망 이용권(총사령부)"},
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

local FCactionName = {
	jpG1 = {"討伐経験値アップ","採集経験値アップ","製作経験値アップ","バディ経験値アップ","対人戦績アップ","軍票アップ","ビギナーボーナス","獲得力アップ","技術力アップ","作業精度アップ","加工精度アップ","錬精度上昇量アップ","食事効果時間延長","装備品劣化低減","都市内スプリント効果時間延長","テレポ割引","MGPアップ"},
	jpG2 = {"討伐経験値アップII ","採集経験値アップII","製作経験値アップII","バディ経験値アップII","対人戦績アップII","軍票アップII","ビギナーボーナスII","獲得力アップII","技術力アップII","作業精度アップII","加工精度アップII","錬精度上昇量アップII","食事効果時間延長II","装備品劣化低減II","都市内スプリント効果時間延長II","テレポ割引II","MGPアップII"},
	jpG3 = {"討伐経験値アップIII","採集経験値アップIII","製作経験値アップIII","バディ経験値アップIII","対人戦績アップIII","軍票アップIII","獲得力アップIII","技術力アップIII","作業精度アップIII","加工精度アップIII","錬精度上昇量アップIII","食事効果時間延長III","装備品劣化低減III","テレポ割引III","MGPアップIII"},
	enG1 = {"The Heat of Battle","Earth and Water","Helping Hand"," A Man's Best Friend","Mark Up"," Seal Sweetener","Brave New World ","Live off the Land","What You See","Eat from the Hand","In Control","That Which Binds Us","Meat and Mead","Proper Care","Fleet-footed","Reduced Rates","Jackpot"},
	enG2 = {"The Heat of Battle II","Earth and Water II","Helping Hand II","A Man's Best Friend II","Mark Up II","Seal Sweetener II","Brave New World II","Live off the Land II","What You See II","Eat from the Hand II","In Control II","That Which Binds Us II","Meat and Mead II","Proper Care II","Fleet-footed II","Reduced Rates II","Jackpot II"},
	enG3 = {"The Heat of Battle III","Earth and Water III","Helping Hand III"," A Man's Best Friend III","Mark Up III"," Seal Sweetener III","Live off the Land III","What You See III","Eat from the Hand III","In Control III","That Which Binds Us III","Meat and Mead III","Proper Care III","Reduced Rates III","Jackpot III"},
	deG1 = {"Kampfroutine-Bonus","Sammelroutine-Bonus","Syntheseroutine-Bonus","Mitstreiterroutine-Bonus","Wolfsmarken-Bonus","Staatstaler-Bonus","Startbonus","Sammelgeschick-Bonus","Wahrnehmungsbonus","Kunstfertigkeitsbonus","Kontrolle-Bonus","Bindungsbonus","Längere Nahrungseffekte","Verminderter Verschleiß","Stadtsprint-Bonus","Vergünstigter Teleport","MGP-Bonus"},
	deG2 = {"Kampfroutine-Bonus II","Sammelroutine-Bonus II","Syntheseroutine-Bonus II","Mitstreiterroutine-Bonus II","Wolfsmarken-Bonus II","Staatstaler-Bonus II","Startbonus II","Sammelgeschick-Bonus II","Wahrnehmungsbonus II","Kunstfertigkeitsbonus II","Kontrolle-Bonus II","Bindungsbonus II","Längere Nahrungseffekte II","Verminderter Verschleiß II","Stadtsprint-Bonus II","Vergünstigter Teleport II","MGP-Bonus II"},
	deG3 = {"Kampfroutine-Bonus","Sammelroutine-Bonus","Syntheseroutine-Bonus","Mitstreiterroutine-Bonus","Wolfsmarken-Bonus","Staatstaler-Bonus","Sammelgeschick-Bonus","Wahrnehmungsbonus","Kunstfertigkeitsbonus","Kontrolle-Bonus","Bindungsbonus","Längere Nahrungseffekte","Verminderter Verschleiß","Vergünstigter Teleport","MGP-Bonus"},
	frG1 = {"Feu du combat","Terre et eau","Être en bonnes mains","Meilleur ami de l'homme","Marque des vainqueurs","Solde accrue","Un nouveau monde","Vivre de la terre","Avoir le coup d'œil","La main qui nourrit","Passer maître","Union parfaite","À boire et à manger","Protections protégées","La grande forme","Prix d'ami","Gros lot"},
	frG2 = {"Feu du combat II","Terre et eau II","Être en bonnes mains II","Meilleur ami de l'homme II","Marque des vainqueurs II","Solde accrue II","Un nouveau monde II","Vivre de la terre II","Avoir le coup d'œil II","La main qui nourrit II","Passer maître II","Union parfaite II","À boire et à manger II","Protections protégées II","La grande forme II","Prix d'ami II","Gros lot II"},
	frG3 = {"Feu du combat III","Terre et eau III","Être en bonnes mains III","Meilleur ami de l'homme III","Marque des vainqueurs III","Solde accrue III","Vivre de la terre III","Avoir le coup d'œil III","La main qui nourrit III","Passer maître III","Union parfaite III","À boire et à manger III","Protections protégées III","Prix d'ami III","Gros lot III"},
	cnG1 = {"讨伐经验值提高","采集经验值提高","制作经验值提高","搭档经验值提高","对战战绩提高","军票提高","鼓励新人","获得力提高","鉴别力提高","作业精度提高","加工精度提高","精炼度增加量提高","食物效果时间延长","装备损耗降低","城内冲刺时间延长","传送优惠","金碟币提高",},
	cnG2 = {"讨伐经验值提高II","采集经验值提高II","制作经验值提高II","搭档经验值提高II","对战战绩提高II","军票提高II","鼓励新人II","获得力提高II","鉴别力提高II","作业精度提高II","加工精度提高II","精炼度增加量提高II","食物效果时间延长II","装备损耗降低II","城内冲刺时间延长II","传送优惠II","金碟币提高II",},
	cnG3 = {"讨伐经验值提高III","采集经验值提高III","制作经验值提高III","搭档经验值提高III","对战战绩提高III","军票提高III","获得力提高III","鉴别力提高III","作业精度提高III","加工精度提高III","精炼度增加量提高III","食物效果时间延长III","装备损耗降低III","传送优惠III","金碟币提高III",},
	krG1 = {"처치 경험치 상승","채집 경험치 상승","제작 경험치 상승","버디 경험치 상승","버디 경험치 상승","군표 증가","초보자 지원","획득력 상승","감별력 상승","작업 숙련도 상승","가공 숙련도 상승","결속도 증가량 향상","식사 지속시간 연장","장비 소모 절감","쇠약 시간 단축","텔레포 할인","MGP 증가"},
	krG2 = {"처치 경험치 상승 2","채집 경험치 상승 2","제작 경험치 상승 2","버디 경험치 상승 2","버디 경험치 상승 2","군표 증가 2","초보자 지원 2","획득력 상승 2","감별력 상승 2","작업 숙련도 상승 2","가공 숙련도 상승 2","결속도 증가량 향상 2","식사 지속시간 연장 2","장비 소모 절감 2","쇠약 시간 단축 2","텔레포 할인 2","MGP 증가 2"},
	krG3 = {"처치 경험치 상승 3","채집 경험치 상승 3","제작 경험치 상승 3","버디 경험치 상승 3","버디 경험치 상승 3","군표 증가 3","획득력 상승 3","감별력 상승 3","작업 숙련도 상승 3","가공 숙련도 상승 3","결속도 증가량 향상 3","식사 지속시간 연장 3","장비 소모 절감 3","쇠약 시간 단축 3","텔레포 할인 3","MGP 증가 3"},
--365 367 368 366 413 414 353 354 355 356 357 361 360 362 2932 364 902
}


local MoveServer = { 132, 129, 130 }
local ploc = { 956, 957, 958, 959, 960, 961 }
local mushnoAH = { 132, 129, 130, 956, 957, 958, 959, 960, 961 }
local uuid = GetUUID()
AetheryteHelper.settingfile = GetStartupPath() .. '\\LuaMods\\AetheryteHelper\\UserSettings\\' ..'userID'..uuid.. '_setting.lua'
AetheryteHelper.jobfile = GetStartupPath() .. '\\LuaMods\\AetheryteHelper\\UserSettings\\' ..'userJob.lua'
AetheryteHelper.filterfile = GetStartupPath() .. '\\LuaMods\\AetheryteHelper\\UserSettings\\' ..'userfilter.lua'
AetheryteHelper.winset = GetStartupPath() .. '\\LuaMods\\AetheryteHelper\\UserSettings\\' ..'kinoko_setting.lua'
AetheryteHelper.Dutyfile = GetStartupPath() .. '\\LuaMods\\AetheryteHelper\\UserSettings\\' ..'userDuty.lua'
AetheryteHelper.Radarfile = GetStartupPath() .. '\\LuaMods\\AetheryteHelper\\UserSettings\\' ..'Radarsettings.lua'
AetheryteHelper.huntlistfile = GetStartupPath() .. '\\LuaMods\\AetheryteHelper\\UserSettings\\' ..'userCustomList.lua'
AetheryteHelper.RCfile = GetStartupPath() .. '\\LuaMods\\AetheryteHelper\\UserSettings\\' ..'RadarColor.lua'
AetheryteHelper.ATfile = GetStartupPath() .. '\\LuaMods\\AetheryteHelper\\UserSettings\\' ..'AetheryteTicket.lua'
AetheryteHelper.userfunc = GetStartupPath() .. '\\LuaMods\\AetheryteHelper\\UserSettings\\' ..'userCustomfunction.lua'
AetheryteHelper.language = GetStartupPath() .. '\\LuaMods\\AetheryteHelper\\UserSettings\\' ..'Customlanguage.lua'
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
local userImage = ModulePath .. [[CustomImage\]]
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
local mushlooptimer = mushlooptimer or 1000
local GCexchangeT = false
local sealstoitemT = false
local mushMBinterat = false
local IDUSstep = 0
local IDexstep = 0
local MIPstep = 0
local AHitemsort = false
local AHitemsortR = false
local AHitemsortB = false
local itemID = 0
local itemhqID = 0
local nhitemID = 0
local nhitemhqID = 0
local ISstep = 0
local ritebel = 0
local FCchest = 0
local ritekazu = 0
local mybagslot = 0
local mybagtype = 0
local itemcount = 0
local itemmax = 0
local syojisu = 0
local itemunique = nil
local mushiS_rite = true
local mushiS_tori = false
local mushiS_FC = false
local mushaccelerator = true
local mushRitekazu = 0
local AuL = AetheryteHelper.mushAHlanguage
local AHSET = AetheryteHelper.settingsSET
local eqFilter = AetheryteHelper.settingsFilter
local AHeqjob = AetheryteHelper.settingsJob
------------------
--Radar
local Rcid = ""
local Rid = 0
local Rname = ""
local Rtype = 0
local Rwid = 0
local Rget = 0
local Rswitch = 1
local Rthicks = 2
local Rfate = 0
local Rnote = "Note"
local Rattack = ""
AetheryteHelper.Colour = { r = 1.0, g = 1.0, b = 1.0, a = 1.0 }
local Colour = AetheryteHelper.Colour
local ColourU32 = GUI:ColorConvertFloat4ToU32(Colour.r,Colour.g,Colour.b,Colour.a)
local tempCustomlist = {}
local AHRadarGeneral = false
local AHRadarhunt = false
local AHRadarCustomList = true
local AHRadarBlockList = false
local R = AetheryteHelper.RadarColor
local Rset = AetheryteHelper.RadarSettings
local Rwroldname = ""

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
--load fanction
function AetheryteHelper.LoadSettings()
  if FileExists(AetheryteHelper.settingfile) then
	local setting = persistence.load(AetheryteHelper.settingfile)
	if (ValidTable(setting)) then
	  table.merge(AetheryteHelper.settingsSET,setting)
	end
  end
  
  if FileExists(AetheryteHelper.filterfile) then
	local filter = persistence.load(AetheryteHelper.filterfile)
	if (ValidTable(filter)) then
	  table.merge(AetheryteHelper.settingsFilter,filter)
	end
  end
  
  if FileExists(AetheryteHelper.jobfile) then
	local job = persistence.load(AetheryteHelper.jobfile)
	if (ValidTable(job)) then
	  table.merge(AetheryteHelper.settingsJob,job)
	end
  end

  if FileExists(AetheryteHelper.winset) then
	local Window = persistence.load(AetheryteHelper.winset)
	if (ValidTable(window)) then
	  table.merge(kinokoProject.Windows,Window)
	end
  end
  if FileExists(AetheryteHelper.Dutyfile) then
	local dutys = persistence.load(AetheryteHelper.Dutyfile)
	if (ValidTable(dutys)) then
	  table.merge(AetheryteHelper.DutyPlay,dutys)
	end
  end
  if FileExists(AetheryteHelper.Radarfile) then
	local Radar = persistence.load(AetheryteHelper.Radarfile)
	if (ValidTable(Radar)) then
	  table.merge(AetheryteHelper.RadarSettings,Radar)
	end
  end
  if FileExists(AetheryteHelper.huntlistfile) then
	local list = persistence.load(AetheryteHelper.huntlistfile)
	if (ValidTable(list)) then
	  table.merge(AetheryteHelper.RadarCustomList,list)
	end
  end
  if FileExists(AetheryteHelper.RCfile) then
	local RC = persistence.load(AetheryteHelper.RCfile)
	if (ValidTable(RC)) then
	  table.merge(AetheryteHelper.RadarColor,RC)
	end
  end
  if FileExists(AetheryteHelper.ATfile) then
	local AT = persistence.load(AetheryteHelper.ATfile)
	if (ValidTable(AT)) then
	  table.merge(AetheryteHelper.ATuse,AT)
	end
  end
  if FileExists(AetheryteHelper.userfunc) then
	local userfunc = persistence.load(AetheryteHelper.userfunc)
	if (ValidTable(userfunc)) then
	  table.merge(AetheryteHelper.userCustomfunc,userfunc)
	end
  end
  if FileExists(AetheryteHelper.language) then
	local userlanguage = persistence.load(AetheryteHelper.language)
	if (ValidTable(userlanguage)) then
	  table.merge(AetheryteHelper.language,userlanguage)
	end
  end
end
---------------------------------------------------------------------------------------------------------------------------------------------------
--save fanction
AetheryteHelper.LoadSettings()
function AetheryteHelper.SaveSettings()
  persistence.store(AetheryteHelper.settingfile, AetheryteHelper.settingsSET)
  persistence.store(AetheryteHelper.jobfile, AetheryteHelper.settingsJob)
  persistence.store(AetheryteHelper.filterfile, AetheryteHelper.settingsFilter)
  persistence.store(AetheryteHelper.winset, kinokoProject.Windows)
  persistence.store(AetheryteHelper.Dutyfile, AetheryteHelper.DutyPlay)
  persistence.store(AetheryteHelper.Radarfile, AetheryteHelper.RadarSettings)
  persistence.store(AetheryteHelper.huntlistfile, AetheryteHelper.RadarCustomList)
  persistence.store(AetheryteHelper.RCfile, AetheryteHelper.RadarColor)
  persistence.store(AetheryteHelper.ATfile, AetheryteHelper.ATuse)
  persistence.store(AetheryteHelper.userfunc, AetheryteHelper.userCustomfunc)
  persistence.store(AetheryteHelper.language, AetheryteHelper.mushAHlanguage)
end
---------------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------------------------------
-- api

function AHSwitchOpen(mado)
	  if mado == "main" then
		  if kinokoProject.Windows.minibutton.Open == false and kinokoProject.Windows.MainWindows.Open == false then
      kinokoProject.Windows.MainWindows.Open = not kinokoProject.Windows.MainWindows.Open
      else
      kinokoProject.Windows.MainWindows.Open = not kinokoProject.Windows.MainWindows.Open
      kinokoProject.Windows.minibutton.Open = not kinokoProject.Windows.minibutton.Open
  	  end
    end
  	if mado == "mI" then
  	AetheryteHelper.insSelectGUI.open = not AetheryteHelper.insSelectGUI.open
  	end
  	if mado == "mWV" then
  	AetheryteHelper.miniWV.open = not AetheryteHelper.miniWV.open
  	end
  	if mado == "Rd" then
  	AetheryteHelper.RadarWindow.open = not AetheryteHelper.RadarWindow.open
  	end
  	if mado == "mRd" then
  	AetheryteHelper.miniRadarWindow.open = not AetheryteHelper.miniRadarWindow.open
  	end
  	if mado == "JcA" then
  	AetheryteHelper.Jumbocactpot.open = not AetheryteHelper.Jumbocactpot.open
  	end
  	if mado == "mip" then
  	AetheryteHelper.mip.open = not AetheryteHelper.mip.open
  	end
  	if mado == "call" then
  	AetheryteHelper.yoro_otu.open = not AetheryteHelper.yoro_otu.open
  	end
  	if mado == nil then
  	io.popen([[cmd /c start "" "https://discord.com/channels/961235833124450374/961251151737679972"]]):close()
  	end
return tostring(mado)
end

function AHfuncSwitch(kinou,bool)
	if kinou == "GC" and bool ~= nil then
		 AutoMoveGC = bool
	end
	if kinou == "MB" and bool ~= nil then
		 AHSET.mushmovetoMB = bool
		 mushMBlim = false
     mushMBgri = false
     mushMBul = false
	end
	if kinou == "MBlimsa" and bool ~= nil then
		 AHSET.mushmovetoMB = bool
		 mushMBlim = bool
     mushMBgri = false
     mushMBul = false
	end
	if kinou == "MBgridania" and bool ~= nil then
		 AHSET.mushmovetoMB = bool
		 mushMBlim = false
     mushMBgri = bool
     mushMBul = false
	end
	if kinou == "MBuldah" and bool ~= nil then
		 AHSET.mushmovetoMB = bool
		 mushMBlim = false
     mushMBgri = false
     mushMBul = bool
	end
	if kinou == "MateriaExtract" and bool ~= nil then
		 AHSET.isMateriaEnabled = bool
	end
	if kinou == "Salvage" and bool ~= nil then
		 AHSET.isSalvageEnabled = bool
		 AHSET.isReductionOption = false
		 if bool == true then
		 GCexchange = false
		 end
	end
	if kinou == "fil" and bool ~= nil then
		 AHSET.isReductionOption = bool
	end
	if kinou == "Salvage,fil" and bool ~= nil then
		 AHSET.isSalvageEnabled = bool
		 AHSET.isReductionOption = bool
		 if bool == true then
		 GCexchange = false
		 end
	end
	if kinou == "SPpotion" and bool ~= nil then
		 AHSET.isMateriaEnabled = bool
		 AHSET.isPotionEnabled = bool
	end
	if kinou == "SPmanual" and bool ~= nil then
		 AHSET.isMateriaEnabled = bool
		 AHSET.isManualEnabled = bool
	end
	if kinou == "AR" and bool ~= nil then
		 AHSET.isReductionEnabled = bool
	end
return tostring(kinou),bool
end

function AHCustomButtonAutoOFF(name,bool)
   for k,v in pairs(AetheryteHelper.userCustomfunc) do
			if v[2] == name and v[7] == 2 then
				if v[10] == 1 then
				   v[10] = 0
				   AetheryteHelper.SaveSettings()
				end
				if bool == false and v[1] == 0 then
					v[1] = 1
					AetheryteHelper.SaveSettings()
				elseif bool == true and v[1] == 1 then
					v[1] = 0
					AetheryteHelper.SaveSettings()
				end
			elseif v[2] == name and v[7] ~= 2 then
				if bool == false and v[1] == 0 then
					v[1] = 1
					AetheryteHelper.SaveSettings()
				elseif bool == true and v[1] == 1 then
					v[1] = 0
					AetheryteHelper.SaveSettings()
				end
	  	end
    end
return tostring(name),bool
end

function AHCustomButtonAutoON(name,bool)
   for k,v in pairs(AetheryteHelper.userCustomfunc) do
			if v[2] == name and v[7] == 2 then
				if v[10] == 0 then
				   v[10] = 1
				   AetheryteHelper.SaveSettings()
				end
				if bool == true and v[1] == 0 then
					v[1] = 1
					AetheryteHelper.SaveSettings()
				elseif bool == false and v[1] == 1 then
					v[1] = 0
					AetheryteHelper.SaveSettings()
				end
			elseif v[2] == name and v[7] ~= 2 then
				if bool == true and v[1] == 0 then
					v[1] = 1
					AetheryteHelper.SaveSettings()
				elseif bool == false and v[1] == 1 then
					v[1] = 0
					AetheryteHelper.SaveSettings()
				end
	  	end
    end
return tostring(name),bool
end

function AHButtonSwitchDrow(name)
   for k,v in pairs(AetheryteHelper.userCustomfunc) do
			if v[2] == name then
				 if v[1] == 0 then
					v[1] = 1
					AetheryteHelper.SaveSettings()
				 elseif v[1] == 1 then
					v[1] = 0
					AetheryteHelper.SaveSettings()
				 end
	  	end
    end
return tostring(name)
end

---------------------------------------------------------------------------------------------------------------------------------------------------
local mJTp = mushtooltips.jp
local mETp = mushtooltips.en
local mDTp = mushtooltips.de
local mFTp = mushtooltips.fr
local mCTp = mushtooltips.cn
local mKTp = mushtooltips.kr
function AetheryteHelper.SetToolTips(tipsJ,tipsE,tipsD,tipsF,tipsC,tipsK)
		if AuL.JP == true then
			  GUI:SetTooltip(tipsJ)
		elseif AuL.EN == true then
			  GUI:SetTooltip(tipsE)
		elseif AuL.DE == true then
			  GUI:SetTooltip(tipsD)
		elseif AuL.FR == true then
			  GUI:SetTooltip(tipsF)
		elseif AuL.CN == true then
			  GUI:SetTooltip(tipsC)
		elseif AuL.KR == true then
			  GUI:SetTooltip(tipsK)
		elseif language == 0 and gRegion == 1 then
			  GUI:SetTooltip(tipsJ)
		elseif language == 1 and gRegion == 1 then
			  GUI:SetTooltip(tipsE)
		elseif language == 2 and gRegion == 1 then
			  GUI:SetTooltip(tipsD)
		elseif language == 3 and gRegion == 1 then
			  GUI:SetTooltip(tipsF)
		elseif gRegion == 2 then
			  GUI:SetTooltip(tipsC)
		elseif gRegion == 3 then
			  GUI:SetTooltip(tipsK)
		else
			  GUI:SetTooltip(tipsE)
		end
	return tipsJ,tipsE,tipsD,tipsF,tipsC,tipsK
end


function AetheryteHelper.IssueNotice(title,J,E,D,F,C,K)
	  if AuL.JP == true then
			  ffxiv_dialog_manager.IssueNotice(title,J)
		elseif AuL.EN == true then
			  ffxiv_dialog_manager.IssueNotice(title,E)
		elseif AuL.DE == true then
			  ffxiv_dialog_manager.IssueNotice(title,D)
		elseif AuL.FR == true then
			  ffxiv_dialog_manager.IssueNotice(title,F)
		elseif AuL.CN == true then
			  ffxiv_dialog_manager.IssueNotice(title,C)
		elseif AuL.KR == true then
			  ffxiv_dialog_manager.IssueNotice(title,K)
		elseif language == 0 and gRegion == 1 then
			  ffxiv_dialog_manager.IssueNotice(title,J)
		elseif language == 1 and gRegion == 1 then
			  ffxiv_dialog_manager.IssueNotice(title,E)
		elseif language == 2 and gRegion == 1 then
			  ffxiv_dialog_manager.IssueNotice(title,D)
		elseif language == 3 and gRegion == 1 then
			  ffxiv_dialog_manager.IssueNotice(title,F)
		elseif gRegion == 2 then
			  ffxiv_dialog_manager.IssueNotice(title,C)
		elseif gRegion == 3 then
			  ffxiv_dialog_manager.IssueNotice(title,K)
		else
			  ffxiv_dialog_manager.IssueNotice(title,E)
		end
	return title,J,E,D,F,C,K
end

function AetheryteHelper.Teleport(id,levelid)
	  local alist = Player:GetAetheryteList()
	  local ap = tonumber(ap) or 0
	  for i,a in pairs(alist) do
        if a.id == id then
           ap = a.price
        end
    end
	  local bags = {0,1,2,3}
	  for _, e in pairs(bags) do
		local bag = Inventory:Get(e)
  		if (table.valid(bag)) then
	  	local ilist = bag:GetList()
		    if (table.valid(ilist)) then
		       for _, item in pairs(ilist) do
		          if item.hqid == 7569 then
	            	if item.count > 0 then
                   if ap > AetheryteHelper.ATuse.gil then
      	             Player:Teleport(id,levelid,true)
                   else
      	             Player:Teleport(id,levelid,false)
                   end
                else
    	             Player:Teleport(id,levelid,false)
		            end
		          end
		       end
		    end
		  end
	  end
	return id,levelid
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
		  if (i == 2) then
			  GUI:SameLine()
		  elseif (i == 3) then
			  GUI:SameLine()
		  elseif (i == 4) then
			  GUI:SameLine()
		  elseif (i == 5) then
			  GUI:Spacing(10)
		  elseif (i == 6) then
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
			  AetheryteHelper.SetToolTips(mJTp.tip01,mETp.tip01,mDTp.tip01,mFTp.tip01,mCTp.tip01,mKTp.tip01)
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
			  AetheryteHelper.SetToolTips(mJTp.tip01,mETp.tip01,mDTp.tip01,mFTp.tip01,mCTp.tip01,mKTp.tip01)
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
			   AetheryteHelper.SetToolTips(mJTp.tip01,mETp.tip01,mDTp.tip01,mFTp.tip01,mCTp.tip01,mKTp.tip01)
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
			  AetheryteHelper.SetToolTips(mJTp.tip01,mETp.tip01,mDTp.tip01,mFTp.tip01,mCTp.tip01,mKTp.tip01)
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
			  AetheryteHelper.SetToolTips(mJTp.tip00,mETp.tip00,mDTp.tip00,mFTp.tip00,mCTp.tip00,mKTp.tip00)
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
			  AetheryteHelper.SetToolTips(mJTp.tip06,mETp.tip06,mDTp.tip06,mFTp.tip06,mCTp.tip06,mKTp.tip06)
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
			  AetheryteHelper.SetToolTips(mJTp.tip07,mETp.tip07,mDTp.tip07,mFTp.tip07,mCTp.tip07,mKTp.tip07)
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
			  AetheryteHelper.SetToolTips(mJTp.tip08,mETp.tip08,mDTp.tip08,mFTp.tip08,mCTp.tip08,mKTp.tip08)
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
			  AetheryteHelper.SetToolTips(mJTp.tip09,mETp.tip09,mDTp.tip09,mFTp.tip09,mCTp.tip09,mKTp.tip09)
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
	  GUI:BeginGroup()
	  GUI:PushItemWidth(120)
	  local changed
		AHSET.delay, changed = GUI:SliderInt("ms",AHSET.delay,100,1000)
		if changed then
		AetheryteHelper.SaveSettings()
	  end
		if (GUI:IsItemHovered()) then
		   if AHSET.mushtooltips == true then
		   AetheryteHelper.SetToolTips(mJTp.tip02,mETp.tip02,mDTp.tip02,mFTp.tip02,mCTp.tip02,mKTp.tip02)
		   end
		end
	  GUI:PopItemWidth()
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
			  AetheryteHelper.SetToolTips(mJTp.tip05,mETp.tip05,mDTp.tip05,mFTp.tip05,mCTp.tip05,mKTp.tip05)
			end
		end
	  GUI:EndGroup()
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if AHSET.AutoLegacy == true then
	  GUI:Image(ImageFolder..[[Al_on.png]],20,20)
	  else
	  GUI:Image(ImageFolder..[[Al_off.png]],20,20)
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
	  	if GUI:IsMouseClicked(0) then
	  		AHSET.AutoLegacy = not AHSET.AutoLegacy
	  		AetheryteHelper.SaveSettings()
	  	end
	  	if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip219,mETp.tip219,mDTp.tip219,mFTp.tip219,mCTp.tip219,mKTp.tip219)
			end
	  end
end

-------------------------------------------------------------------------------------------------------------------------------------
-- telepo button GUI

function AetheryteHelper.GLUtelepo()
	  GUI:Dummy(10,10)
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if AetheryteHelper.ATuse.ATuseEnable == true then
	  GUI:Image(ImageFolder..[[ACon.png]],20,20)
			  if (GUI:IsItemHovered()) then
			  if (GUI:IsMouseClicked(0)) then
			  AetheryteHelper.ATuse.ATuseEnable = not AetheryteHelper.ATuse.ATuseEnable
			  AetheryteHelper.SaveSettings()
			  end
			  end
	  elseif AetheryteHelper.ATuse.ATuseEnable == false then
	  GUI:Image(ImageFolder..[[ACoff.png]],20,20)
			  if (GUI:IsItemHovered()) then
			  if (GUI:IsMouseClicked(0)) then
			  AetheryteHelper.ATuse.ATuseEnable = not AetheryteHelper.ATuse.ATuseEnable
			  AetheryteHelper.SaveSettings()
			  end
			  end
	  end
	  GUI:EndGroup()
	  if (GUI:IsItemHovered()) then
			 if AHSET.mushtooltips == true then
		   AetheryteHelper.SetToolTips(mJTp.tip191,mETp.tip191,mDTp.tip191,mFTp.tip191,mCTp.tip191,mKTp.tip191)
		   end
	  end
	  local mushAT = {}
	  local bags = {0,1,2,3}
	  for _, e in pairs(bags) do
		local bag = Inventory:Get(e)
		if (table.valid(bag)) then
		local ilist = bag:GetList()
		if (table.valid(ilist)) then
		for _, item in pairs(ilist) do
		if item.hqid == 7569 then
		table.insert(mushAT,item)
		if #mushAT > 0 then
		GUI:SameLine()
		GUI:Text(item.count)
		end
		end
		end
		end
		end
	  end
	  if #mushAT == 0 then
		GUI:SameLine()
		GUI:Text("0")
		AetheryteHelper.ATuse.ATuseEnable = false
	  end
	  GUI:SameLine()
	  GUI:AlignFirstTextHeightToWidgets()
	  GUI:BeginGroup()
	  GUI:PushItemWidth(120)
	  AetheryteHelper.ATuse.gil, changed = GUI:SliderInt("Gil",AetheryteHelper.ATuse.gil,50,1000)
	  if changed then
	  AetheryteHelper.ATuse.gil = AetheryteHelper.ATuse.gil
	  AetheryteHelper.SaveSettings()
	  end
	  if (GUI:IsItemHovered()) then
		if AHSET.mushtooltips == true then
		   AetheryteHelper.SetToolTips(mJTp.tip192,mETp.tip192,mDTp.tip192,mFTp.tip192,mCTp.tip192,mKTp.tip192)
		   end
		end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  GUI:Spacing()
	  --GUI:SameLine(10)
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
			  AetheryteHelper.SetToolTips(mJTp.tip16,mETp.tip16,mDTp.tip16,mFTp.tip16,mCTp.tip16,mKTp.tip16)
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
			  AetheryteHelper.SetToolTips(mJTp.tip16,mETp.tip16,mDTp.tip16,mFTp.tip16,mCTp.tip16,mKTp.tip16)
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
			  AetheryteHelper.SetToolTips(mJTp.tip11,mETp.tip11,mDTp.tip11,mFTp.tip11,mCTp.tip11,mKTp.tip11)
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
			  AetheryteHelper.SetToolTips(mJTp.tip10,mETp.tip10,mDTp.tip10,mFTp.tip10,mCTp.tip10,mKTp.tip10)
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
			  AetheryteHelper.SetToolTips(mJTp.tip13,mETp.tip13,mDTp.tip13,mFTp.tip13,mCTp.tip13,mKTp.tip13)
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
			  AetheryteHelper.SetToolTips(mJTp.tip12,mETp.tip12,mDTp.tip12,mFTp.tip12,mCTp.tip12,mKTp.tip12)
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
			  AetheryteHelper.SetToolTips(mJTp.tip15,mETp.tip15,mDTp.tip15,mFTp.tip15,mCTp.tip15,mKTp.tip15)
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
			  AetheryteHelper.SetToolTips(mJTp.tip14,mETp.tip14,mDTp.tip14,mFTp.tip14,mCTp.tip14,mKTp.tip14)
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
-- toy GUI

function AetheryteHelper.DrawadWIP()
	  GUI:Spacing(10)
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[jumbo.png]],30,30)
	  if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			 AetheryteHelper.Jumbocactpot.open = not AetheryteHelper.Jumbocactpot.open
			  end
			  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip17,mETp.tip17,mDTp.tip17,mFTp.tip17,mCTp.tip17,mKTp.tip17)
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
			  AetheryteHelper.SetToolTips(mJTp.tip18,mETp.tip18,mDTp.tip18,mFTp.tip18,mCTp.tip18,mKTp.tip18)
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
			  AetheryteHelper.SetToolTips(mJTp.tip19,mETp.tip19,mDTp.tip19,mFTp.tip19,mCTp.tip19,mKTp.tip19)
			end
	  end
	  GUI:EndGroup()
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[yoro.png]],30,30)
	  if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			AetheryteHelper.yoro_otu.open = not AetheryteHelper.yoro_otu.open
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip118,mETp.tip118,mDTp.tip118,mFTp.tip118,mCTp.tip118,mKTp.tip118)
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
			  AetheryteHelper.SetToolTips(mJTp.tip112,mETp.tip112,mDTp.tip112,mFTp.tip112,mCTp.tip112,mKTp.tip112)
			end
	  end
	  GUI:EndGroup()
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[CustomButton.png]],30,30)
	  if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			AetheryteHelper.CreateButton.open = not AetheryteHelper.CreateButton.open
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip200,mETp.tip200,mDTp.tip200,mFTp.tip200,mCTp.tip200,mKTp.tip200)
		  end
	  end
	  GUI:EndGroup()
	  GUI:Spacing()

end

---------------------------------------------------------------------------------------------------------------------------------------------------
-- jank

function AetheryteHelper.Drawadjank()
	  GUI:Spacing(10)
	  GUI:Dummy(90,30)
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[tube.png]],30,30)
	  if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			io.popen([[cmd /c start "" "]]..AHLinks.link4..[["]]):close()
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip20,mETp.tip20,mDTp.tip20,mFTp.tip20,mCTp.tip20,mKTp.tip20)
			end
	  end
	  GUI:EndGroup()
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[love_mushroom.png]],30,30)
	  if (GUI:IsItemHovered()) then
		if GUI:IsItemClicked(0)then
		  AetheryteHelper.VersionList.open = not AetheryteHelper.VersionList.open
		end
		if GUI:IsMouseDown(0) then
		AetheryteHelper.SetToolTips(mJTp.tip106,mETp.tip106,mDTp.tip106,mFTp.tip106,mCTp.tip106,mKTp.tip106)
		else
		AetheryteHelper.SetToolTips(mJTp.tip105,mETp.tip105,mDTp.tip105,mFTp.tip105,mCTp.tip105,mKTp.tip105)
	  end
	  end
	  GUI:EndGroup()

	  GUI:Spacing()

end

---------------------------------------------------------------------------------------------------------------------------------------------------
-- items
local mushISinbag = {}
function AetheryteHelper.DrawadItems()
	  GUI:Spacing(10)
	  GUI:Columns(2)
	  GUI:SetColumnOffset(1, 80) GUI:SetColumnOffset(2, 300)
	  GUI:BeginGroup()
	  GUI:Dummy(40,40)
	  if AHSET.mushitemSearch == true then
			GUI:SameLine(10,-40)
			GUI:Image(ImageFolder..[[is_inv.png]],40,40)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			   AHSET.mushitemSearch = not AHSET.mushitemSearch
			   AetheryteHelper.SaveSettings()
			   itemID = 0
			   itemhqID = 0
			   nhitemID = 0
			   nhitemhqID = 0
			   ISstep = 0
			   ritebel = 0
			   FCchest = 0
			   ritekazu = 0
			   mybagslot = 0
			   mybagtype = 0
			   itemcount = 0
			   itemmax = 0
			   mushISinbag = {}
			   mushrite1uke = false
			   mushrite1azuke = false
			   mushrite2uke = false
			   mushrite2azuke = false
			   mushrite3uke = false
			   mushrite3azuke = false
			   mushrite4uke = false
			   mushrite4azuke = false
			   mushrite5uke = false
			   mushrite5azuke = false
			   mushrite6uke = false
			   mushrite6azuke = false
			   mushrite7uke = false
			   mushrite7azuke = false
			   mushrite8uke = false
			   mushrite8azuke = false
			   mushrite9uke = false
			   mushrite9azuke = false
			   mushrite10uke = false
			   mushrite10azuke = false
			   mushRitekazu = 0
			   mushitemname = nil
			   itemunique = nil
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip122,mETp.tip122,mDTp.tip122,mFTp.tip122,mCTp.tip122,mKTp.tip122)
		  end
			end
	  elseif AHSET.mushitemSearch == false then
			GUI:SameLine(10,-40)
			GUI:Image(ImageFolder..[[is_inv_non.png]],40,40)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			  AHSET.mushitemSearch = not AHSET.mushitemSearch
			  AetheryteHelper.SaveSettings()
			   itemID = 0
			   itemhqID = 0
			   nhitemID = 0
			   nhitemhqID = 0
			   ISstep = 0
			   ritebel = 0
			   FCchest = 0
			   ritekazu = 0
			   mybagslot = 0
			   mybagtype = 0
			   itemcount = 0
			   itemmax = 0
			   mushISinbag = {}
			   mushrite1uke = false
			   mushrite1azuke = false
			   mushrite2uke = false
			   mushrite2azuke = false
			   mushrite3uke = false
			   mushrite3azuke = false
			   mushrite4uke = false
			   mushrite4azuke = false
			   mushrite5uke = false
			   mushrite5azuke = false
			   mushrite6uke = false
			   mushrite6azuke = false
			   mushrite7uke = false
			   mushrite7azuke = false
			   mushrite8uke = false
			   mushrite8azuke = false
			   mushrite9uke = false
			   mushrite9azuke = false
			   mushrite10uke = false
			   mushrite10azuke = false
			   mushRitekazu = 0
			   mushitemname = nil
			   itemunique = nil
			   end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip122,mETp.tip122,mDTp.tip122,mFTp.tip122,mCTp.tip122,mKTp.tip122)
			end
			end
	  end
	  GUI:EndGroup()
	  GUI:NextColumn()
	  GUI:BeginGroup()
	  GUI:Dummy(40,40)
	  if AHSET.mushitemSearch == true and mushiS_rite == true then
			GUI:SameLine(10,-40)
			GUI:Image(ImageFolder..[[is_r.png]],40,40)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			  mushiS_rite = true
			  mushiS_tori = false
			  mushiS_FC = false
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip123,mETp.tip123,mDTp.tip123,mFTp.tip123,mCTp.tip123,mKTp.tip123)
		  end
			end
	  elseif AHSET.mushitemSearch == false or mushiS_rite == false then
			GUI:SameLine(10,-40)
			GUI:Image(ImageFolder..[[is_r_non.png]],40,40)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			  mushiS_rite = true
			  mushiS_tori = false
			  mushiS_FC = false
			  end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip123,mETp.tip123,mDTp.tip123,mFTp.tip123,mCTp.tip123,mKTp.tip123)
			end
			end
	  end
	  GUI:EndGroup()
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Dummy(40,40)
	  if AHSET.mushitemSearch == true and mushiS_tori == true then
			GUI:SameLine(10,-40)
			GUI:Image(ImageFolder..[[is_tori.png]],40,40)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			  mushiS_tori = true
			  mushiS_rite = false
			  mushiS_FC = false
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip124,mETp.tip124,mDTp.tip124,mFTp.tip124,mCTp.tip124,mKTp.tip124)
		  end
			end
	  elseif AHSET.mushitemSearch == false or mushiS_tori == false then
			GUI:SameLine(10,-40)
			GUI:Image(ImageFolder..[[is_tori_non.png]],40,40)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			  mushiS_tori = true
			  mushiS_rite = false
			  mushiS_FC = false
			  end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip124,mETp.tip124,mDTp.tip124,mFTp.tip124,mCTp.tip124,mKTp.tip124)
		  end
			end
	  end
	  GUI:EndGroup()
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Dummy(40,40)
	  if AHSET.mushitemSearch == true and mushiS_FC == true then
			GUI:SameLine(10,-40)
			GUI:Image(ImageFolder..[[is_c.png]],40,40)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			  mushiS_FC = true
			  mushiS_tori = false
			  mushiS_rite = false
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip125,mETp.tip125,mDTp.tip125,mFTp.tip125,mCTp.tip125,mKTp.tip125)
		  end
			end
	  elseif AHSET.mushitemSearch == false or mushiS_FC == false then
			GUI:SameLine(10,-40)
			GUI:Image(ImageFolder..[[is_c_non.png]],40,40)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			  mushiS_FC = true
			  mushiS_tori = false
			  mushiS_rite = false
			  end
			if AHSET.mushtooltips == true then
        AetheryteHelper.SetToolTips(mJTp.tip125,mETp.tip125,mDTp.tip125,mFTp.tip125,mCTp.tip125,mKTp.tip125)
			end
			end
	  end
	  GUI:EndGroup()
	  GUI:Columns()
	  GUI:Spacing()
	  GUI:Separator()
	  GUI:Spacing()
	  if AHSET.mushitemSearch == true and mushiS_rite == true then
		 GUI:Dummy(30,30)
		 GUI:SameLine()
		 GUI:BeginGroup()
		 GUI:Image(ImageFolder..[[is_p.png]],30,30)
		 GUI:EndGroup()
		 GUI:SameLine()
		 GUI:BeginGroup()
		 GUI:Dummy(30,30)
		 if mushaccelerator == true then
		 GUI:SameLine(5,-30)
		 GUI:Image(ImageFolder..[[is_RL.png]],30,30)
		 if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			  mushaccelerator = not mushaccelerator
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip135,mETp.tip135,mDTp.tip135,mFTp.tip135,mCTp.tip135,mKTp.tip135)
			end
			end
		 elseif mushaccelerator == false then
			GUI:SameLine(5,-30)
			GUI:Image(ImageFolder..[[is_LR.png]],30,30)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			 mushaccelerator = not mushaccelerator
			  end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip136,mETp.tip136,mDTp.tip136,mFTp.tip136,mCTp.tip136,mKTp.tip136)
		  end
			end
		 end
		 GUI:EndGroup()
		 GUI:SameLine()
		 GUI:BeginGroup()
		 GUI:Image(ImageFolder..[[is_r.png]],30,30)
		 GUI:EndGroup()
		 GUI:SameLine()
		 GUI:BeginGroup()
		 GUI:Image(ImageFolder..[[quantity.png]],30,30)
		if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			   AHitemsortR = not AHitemsortR
			   if IsControlOpen("InventoryRetainer") == false and IsControlOpen("InventoryRetainerLarge") == false then
				if language == 0 then
				SendTextCommand("/e [AH][notice]: \x02\x13\x06\xfe\xff\xff\x11\x11 ソートしたいリテイナーのカバンを開いて下さい")
				AHitemsortR = false
				else
				SendTextCommand("/e [AH][notice]: \x02\x13\x06\xfe\xff\xff\x11\x11 Please open a retainer bag that need sort.")
				AHitemsortR = false
				end
			   end
			   if IsControlOpen("InventoryRetainer") == true and AHitemsortR == true or IsControlOpen("InventoryRetainerLarge") == true and AHitemsortR == true then
			   SendTextCommand("/e [AH][Itemsort]:R-Inventory")
			   end
			end
			if AHSET.mushtooltips == true then
			  if AHitemsortR == false then
				AetheryteHelper.SetToolTips(mJTp.tip137,mETp.tip137,mDTp.tip137,mFTp.tip137,mCTp.tip137,mKTp.tip137)
				else
				AetheryteHelper.SetToolTips(mJTp.tip120,mETp.tip120,mDTp.tip120,mFTp.tip120,mCTp.tip120,mKTp.tip120)
				end
			end
		end
		GUI:EndGroup()
		GUI:Separator()
		GUI:BeginGroup()
		if IsControlOpen("ItemFinder") then
			table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[7].value)
			table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[8].value)
			if GetControl("ItemFinder"):GetRawData()[49] ~= nil then
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[49].value)
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[50].value)
			end
			if GetControl("ItemFinder"):GetRawData()[56] ~= nil then
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[56].value)
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[57].value)
			end
			if GetControl("ItemFinder"):GetRawData()[63] ~= nil then
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[63].value)
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[64].value)
			end
			if GetControl("ItemFinder"):GetRawData()[70] ~= nil then
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[70].value)
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[71].value)
			end
			if GetControl("ItemFinder"):GetRawData()[77] ~= nil then
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[77].value)
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[78].value)
			end
			if GetControl("ItemFinder"):GetRawData()[84] ~= nil then
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[84].value)
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[85].value)
			end
			if GetControl("ItemFinder"):GetRawData()[91] ~= nil then
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[91].value)
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[92].value)
			end
			if GetControl("ItemFinder"):GetRawData()[98] ~= nil then
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[98].value)
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[99].value)
			end
			if GetControl("ItemFinder"):GetRawData()[105] ~= nil then
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[105].value)
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[106].value)
			end
			if GetControl("ItemFinder"):GetRawData()[112] ~= nil then
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[112].value)
				table.insert(mushISinbag,GetControl("ItemFinder"):GetRawData()[113].value)
			end
		end
		local bags = {0,1,2,3}
		local itemname = {}
		for _, e in pairs(bags) do
		local bag = Inventory:Get(e)
		if (table.valid(bag)) then
		local ilist = bag:GetList()
		if (table.valid(ilist)) then
		for _, item in pairs(ilist) do
		  table.insert(itemname,item)
		end
		end
		end
		end
		if IsControlOpen("ItemFinder") then
		local mono = GetControl("ItemFinder"):GetRawData()[1].value
		for i = 1,tonumber(#itemname),1 do
		for k,v in pairs(itemname) do
				if k == i then
				  if mono:match(v.name) then
					 mushitemname = v.name
				  end
				end
			  end
			end
		  end
		if mushitemname ~= nil then
		GUI:Text(tostring(mushitemname))
		end
		if IsControlOpen("RetainerList") then
		mushRitekazu = GetControl("RetainerList"):GetRawData()[3].value
		end
		for k,v in pairs(mushISinbag) do
		if k == 1 then GUI:Text(tostring(v)..":") end
		if k == 2 then GUI:SameLine() GUI:Text(tostring(v)) end

		if mushRitekazu > 0 then
		if mushaccelerator == true and mushrite1uke == true then
		if k == 3 then GUI:Text(tostring(v)..":") end
		if k == 4 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		elseif mushaccelerator == false and mushrite1azuke == true then
		if k == 3 then GUI:Text(tostring(v)..":") end
		if k == 4 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		else
		if k == 3 then GUI:Text(tostring(v)..":") end
		if k == 4 then GUI:SameLine() GUI:Text(tostring(v)) end
		end
		end
		if mushRitekazu > 1 then
		if mushaccelerator == true and mushrite2uke == true then
		if k == 5 then GUI:Text(tostring(v)..":") end
		if k == 6 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		elseif mushaccelerator == false and mushrite2azuke == true then
		if k == 5 then GUI:Text(tostring(v)..":") end
		if k == 6 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		else
		if k == 5 then GUI:Text(tostring(v)..":") end
		if k == 6 then GUI:SameLine() GUI:Text(tostring(v)) end
		end
		end
		if mushRitekazu > 2 then
		if mushaccelerator == true and mushrite3uke == true then
		if k == 7 then GUI:Text(tostring(v)..":") end
		if k == 8 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		elseif mushaccelerator == false and mushrite3azuke == true then
		if k == 7 then GUI:Text(tostring(v)..":") end
		if k == 8 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		else
		if k == 7 then GUI:Text(tostring(v)..":") end
		if k == 8 then GUI:SameLine() GUI:Text(tostring(v)) end
		end
		end
		if mushRitekazu > 3 then
		if mushaccelerator == true and mushrite4uke == true then
		if k == 9 then GUI:Text(tostring(v)..":") end
		if k == 10 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		elseif mushaccelerator == false and mushrite4azuke == true then
		if k == 9 then GUI:Text(tostring(v)..":") end
		if k == 10 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		else
		if k == 9 then GUI:Text(tostring(v)..":") end
		if k == 10 then GUI:SameLine() GUI:Text(tostring(v)) end
		end
		end
		if mushRitekazu > 4 then
		if mushaccelerator == true and mushrite5uke == true then
		if k == 11 then GUI:Text(tostring(v)..":") end
		if k == 12 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		elseif mushaccelerator == false and mushrite5azuke == true then
		if k == 11 then GUI:Text(tostring(v)..":") end
		if k == 12 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		else
		if k == 11 then GUI:Text(tostring(v)..":") end
		if k == 12 then GUI:SameLine() GUI:Text(tostring(v)) end
		end
		end
		if mushRitekazu > 5 then
		if mushaccelerator == true and mushrite6uke == true then
		if k == 13 then GUI:Text(tostring(v)..":") end
		if k == 14 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		elseif mushaccelerator == false and mushrite6azuke == true then
		if k == 13 then GUI:Text(tostring(v)..":") end
		if k == 14 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		else
		if k == 13 then GUI:Text(tostring(v)..":") end
		if k == 14 then GUI:SameLine() GUI:Text(tostring(v)) end
		end
		end
		if mushRitekazu > 6 then
		if mushaccelerator == true and mushrite7uke == true then
		if k == 15 then GUI:Text(tostring(v)..":") end
		if k == 16 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		elseif mushaccelerator == false and mushrite7azuke == true then
		if k == 15 then GUI:Text(tostring(v)..":") end
		if k == 16 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		else
		if k == 15 then GUI:Text(tostring(v)..":") end
		if k == 16 then GUI:SameLine() GUI:Text(tostring(v)) end
		end
		end
		if mushRitekazu > 7 then
		if mushaccelerator == true and mushrite8uke == true then
		if k == 17 then GUI:Text(tostring(v)..":") end
		if k == 18 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		elseif mushaccelerator == false and mushrite8azuke == true then
		if k == 17 then GUI:Text(tostring(v)..":") end
		if k == 18 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		else
		if k == 17 then GUI:Text(tostring(v)..":") end
		if k == 18 then GUI:SameLine() GUI:Text(tostring(v)) end
		end
		end
		if mushRitekazu > 8 then
		if mushaccelerator == true and mushrite9uke == true then
		if k == 19 then GUI:Text(tostring(v)..":") end
		if k == 20 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		elseif mushaccelerator == false and mushrite9azuke == true then
		if k == 19 then GUI:Text(tostring(v)..":") end
		if k == 20 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		else
		if k == 19 then GUI:Text(tostring(v)..":") end
		if k == 20 then GUI:SameLine() GUI:Text(tostring(v)) end
		end
		end
		if mushRitekazu > 9 then
		if mushaccelerator == true and mushrite10uke == true then
		if k == 21 then GUI:Text(tostring(v)..":") end
		if k == 22 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		elseif mushaccelerator == false and mushrite10azuke == true then
		if k == 21 then GUI:Text(tostring(v)..":") end
		if k == 22 then GUI:SameLine() GUI:Text(tostring(v)) GUI:SameLine() GUI:TextColored(0,1,0,1,"/checked") end
		else
		if k == 21 then GUI:Text(tostring(v)..":") end
		if k == 22 then GUI:SameLine() GUI:Text(tostring(v)) end
		end
		end

		end
		GUI:EndGroup()

	  elseif AHSET.mushitemSearch == true and mushiS_tori == true then
		 GUI:Dummy(30,30)
		 GUI:SameLine()
		 GUI:BeginGroup()
		 GUI:Image(ImageFolder..[[is_p.png]],30,30)
		 GUI:EndGroup()
		 GUI:SameLine()
		 GUI:BeginGroup()
		 GUI:Dummy(30,30)
		 if mushaccelerator == true then
		 GUI:SameLine(5,-30)
		 GUI:Image(ImageFolder..[[is_RL.png]],30,30)
		 if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			  mushaccelerator = not mushaccelerator
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip138,mETp.tip138,mDTp.tip138,mFTp.tip138,mCTp.tip138,mKTp.tip138)
			end
			end
		 elseif mushaccelerator == false then
			GUI:SameLine(5,-30)
			GUI:Image(ImageFolder..[[is_LR.png]],30,30)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			 mushaccelerator = not mushaccelerator
			  end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip139,mETp.tip139,mDTp.tip139,mFTp.tip139,mCTp.tip139,mKTp.tip139)
			end
			end
		 end
		 GUI:EndGroup()
		 GUI:SameLine()
		 GUI:BeginGroup()
		 GUI:Image(ImageFolder..[[is_tori.png]],30,30)
		 GUI:EndGroup()
		 GUI:SameLine()
		 GUI:BeginGroup()
		 GUI:Image(ImageFolder..[[quantity.png]],30,30)
		if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			   AHitemsortB = not AHitemsortB
			   if AHitemsortB == true then
			   SendTextCommand("/e [AH][Itemsort]:B-Inventory")
			   end
			   if ActionList:Get(10,77):IsReady() == true then
			   ActionList:Get(10,77):Cast()
			   end
			end
			if AHSET.mushtooltips == true then
				if AHitemsortR == false then
				AetheryteHelper.SetToolTips(mJTp.tip140,mETp.tip140,mDTp.tip140,mFTp.tip140,mCTp.tip140,mKTp.tip140)
				else
				AetheryteHelper.SetToolTips(mJTp.tip120,mETp.tip120,mDTp.tip120,mFTp.tip120,mCTp.tip120,mKTp.tip120)
				end
			end
		end
		GUI:EndGroup()
	  elseif AHSET.mushitemSearch == true and mushiS_FC == true then
		 GUI:Dummy(60,30)
		 GUI:SameLine()
		 GUI:BeginGroup()
		 GUI:Image(ImageFolder..[[is_p.png]],30,30)
		 GUI:EndGroup()
		 GUI:SameLine()
		 GUI:BeginGroup()
		 GUI:Dummy(30,30)
		 if mushaccelerator == true then
		 GUI:SameLine(5,-30)
		 GUI:Image(ImageFolder..[[is_RL.png]],30,30)
		 if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			  mushaccelerator = not mushaccelerator
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip141,mETp.tip141,mDTp.tip141,mFTp.tip141,mCTp.tip141,mKTp.tip141)
		  end
			end
		 elseif mushaccelerator == false then
			GUI:SameLine(5,-30)
			GUI:Image(ImageFolder..[[is_LR.png]],30,30)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			 mushaccelerator = not mushaccelerator
			  end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip142,mETp.tip142,mDTp.tip142,mFTp.tip142,mCTp.tip142,mKTp.tip142)
		  end
			end
		 end
		 GUI:EndGroup()
		 GUI:SameLine()
		 GUI:BeginGroup()
		 GUI:Image(ImageFolder..[[is_c.png]],30,30)
		 GUI:EndGroup()


	  else
	  GUI:Dummy(90,30)
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[is_p.png]],30,30)
	  GUI:SameLine()
	  GUI:Image(ImageFolder..[[quantity.png]],30,30)
	  if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			AHitemsort = not AHitemsort
			   if AHitemsort == true then
			   SendTextCommand("/e [AH][Itemsort]:Inventory")
			   end
			end
			if AHSET.mushtooltips == true then
				if AHitemsort == false then
				AetheryteHelper.SetToolTips(mJTp.tip119,mETp.tip119,mDTp.tip119,mFTp.tip119,mCTp.tip119,mKTp.tip119)
				else
				AetheryteHelper.SetToolTips(mJTp.tip120,mETp.tip120,mDTp.tip120,mFTp.tip120,mCTp.tip120,mKTp.tip120)
				end
		  end
	  end
	  GUI:EndGroup()
	  GUI:Spacing()
		GUI:Separator()
		GUI:Spacing()
		GUI:Dummy(90,15)
		GUI:SameLine()
		GUI:BeginGroup()
		GUI:Image(ImageFolder..[[is_hq.png]],15,15)
		GUI:SameLine()
		GUI:Text(">>")
		GUI:SameLine()
		GUI:Image(ImageFolder..[[is_nq.png]],15,15)
		GUI:EndGroup()
		if (GUI:IsItemHovered()) then
			if AHSET.mushtooltips == true then
				AetheryteHelper.SetToolTips(mJTp.tip126,mETp.tip126,mDTp.tip126,mFTp.tip126,mCTp.tip126,mKTp.tip126)
			end
		end
		GUI:Spacing()
		GUI:BeginGroup()
		 GUI:Dummy(20,20)
		 if AHSET.syokuzai == true then
		 GUI:SameLine(5,-20)
		 GUI:Image(ImageFolder..[[is_syokuzai.png]],20,20)
		 if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			  AHSET.syokuzai = not AHSET.syokuzai
			  AetheryteHelper.SaveSettings()
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip127,mETp.tip127,mDTp.tip127,mFTp.tip127,mCTp.tip127,mKTp.tip127)
			  end
			end
		 elseif AHSET.syokuzai == false then
			GUI:SameLine(5,-20)
			GUI:Image(ImageFolder..[[is_syokuzai_non.png]],20,20)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			 AHSET.syokuzai = not AHSET.syokuzai
			 AetheryteHelper.SaveSettings()
			  end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip127,mETp.tip127,mDTp.tip127,mFTp.tip127,mCTp.tip127,mKTp.tip127)
			  end
			end
		 end
		 GUI:EndGroup()
		 GUI:SameLine()
		GUI:BeginGroup()
		 GUI:Dummy(20,20)
		 if AHSET.sekizai == true then
		 GUI:SameLine(5,-20)
		 GUI:Image(ImageFolder..[[is_sekizai.png]],20,20)
		 if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			  AHSET.sekizai = not AHSET.sekizai
			  AetheryteHelper.SaveSettings()
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip128,mETp.tip128,mDTp.tip128,mFTp.tip128,mCTp.tip128,mKTp.tip128)
			  end
			end
		 elseif AHSET.sekizai == false then
			GUI:SameLine(5,-20)
			GUI:Image(ImageFolder..[[is_sekizai_non.png]],20,20)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			 AHSET.sekizai = not AHSET.sekizai
			 AetheryteHelper.SaveSettings()
			  end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip128,mETp.tip128,mDTp.tip128,mFTp.tip128,mCTp.tip128,mKTp.tip128)
			  end
			end
		 end
		 GUI:EndGroup()
		 GUI:SameLine()
		 GUI:BeginGroup()
		 GUI:Dummy(20,20)
		 if AHSET.kinzoku == true then
		 GUI:SameLine(5,-20)
		 GUI:Image(ImageFolder..[[is_kinzoku.png]],20,20)
		 if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			  AHSET.kinzoku = not AHSET.kinzoku
			  AetheryteHelper.SaveSettings()
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip129,mETp.tip129,mDTp.tip129,mFTp.tip129,mCTp.tip129,mKTp.tip129)
			  end
			end
		 elseif AHSET.kinzoku == false then
			GUI:SameLine(5,-20)
			GUI:Image(ImageFolder..[[is_kinzoku_non.png]],20,20)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			 AHSET.kinzoku = not AHSET.kinzoku
			 AetheryteHelper.SaveSettings()
			  end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip129,mETp.tip129,mDTp.tip129,mFTp.tip129,mCTp.tip129,mKTp.tip129)
			  end
			end
		 end
		 GUI:EndGroup()
		 GUI:SameLine()
		 GUI:BeginGroup()
		 GUI:Dummy(20,20)
		 if AHSET.mokuzai == true then
		 GUI:SameLine(5,-20)
		 GUI:Image(ImageFolder..[[is_mokuzai.png]],20,20)
		 if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			  AHSET.mokuzai = not AHSET.mokuzai
			  AetheryteHelper.SaveSettings()
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip130,mETp.tip130,mDTp.tip130,mFTp.tip130,mCTp.tip130,mKTp.tip130)
			  end
			end
		 elseif AHSET.mokuzai == false then
			GUI:SameLine(5,-20)
			GUI:Image(ImageFolder..[[is_mokuzai_non.png]],20,20)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			 AHSET.mokuzai = not AHSET.mokuzai
			 AetheryteHelper.SaveSettings()
			  end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip130,mETp.tip130,mDTp.tip130,mFTp.tip130,mCTp.tip130,mKTp.tip130)
			  end
			end
		 end
		 GUI:EndGroup()
		 GUI:SameLine()
		 GUI:BeginGroup()
		 GUI:Dummy(20,20)
		 if AHSET.nuno == true then
		 GUI:SameLine(5,-20)
		 GUI:Image(ImageFolder..[[is_nunozai.png]],20,20)
		 if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			  AHSET.nuno = not AHSET.nuno
			  AetheryteHelper.SaveSettings()
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip131,mETp.tip131,mDTp.tip131,mFTp.tip131,mCTp.tip131,mKTp.tip131)
			  end
			end
		 elseif AHSET.nuno == false then
			GUI:SameLine(5,-20)
			GUI:Image(ImageFolder..[[is_nunozai_non.png]],20,20)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			 AHSET.nuno = not AHSET.nuno
			 AetheryteHelper.SaveSettings()
			  end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip131,mETp.tip131,mDTp.tip131,mFTp.tip131,mCTp.tip131,mKTp.tip131)
			  end
			end
		 end
		 GUI:EndGroup()
		 GUI:SameLine()
		 GUI:BeginGroup()
		 GUI:Dummy(20,20)
		 if AHSET.kawa == true then
		 GUI:SameLine(5,-20)
		 GUI:Image(ImageFolder..[[is_kawa.png]],20,20)
		 if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			  AHSET.kawa = not AHSET.kawa
			  AetheryteHelper.SaveSettings()
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip132,mETp.tip132,mDTp.tip132,mFTp.tip132,mCTp.tip132,mKTp.tip132)
			  end
			end
		 elseif AHSET.kawa == false then
			GUI:SameLine(5,-20)
			GUI:Image(ImageFolder..[[is_kawa_non.png]],20,20)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			 AHSET.kawa = not AHSET.kawa
			 AetheryteHelper.SaveSettings()
			  end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip132,mETp.tip132,mDTp.tip132,mFTp.tip132,mCTp.tip132,mKTp.tip132)
			  end
			end
		 end
		 GUI:EndGroup()
		 GUI:SameLine()
		 GUI:BeginGroup()
		 GUI:Dummy(20,20)
		 if AHSET.hone == true then
		 GUI:SameLine(5,-20)
		 GUI:Image(ImageFolder..[[is_hone.png]],20,20)
		 if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			  AHSET.hone = not AHSET.hone
			  AetheryteHelper.SaveSettings()
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip133,mETp.tip133,mDTp.tip133,mFTp.tip133,mCTp.tip133,mKTp.tip133)
			  end
			end
		 elseif AHSET.hone == false then
			GUI:SameLine(5,-20)
			GUI:Image(ImageFolder..[[is_hone_non.png]],20,20)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			 AHSET.hone = not AHSET.hone
			 AetheryteHelper.SaveSettings()
			  end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip133,mETp.tip133,mDTp.tip133,mFTp.tip133,mCTp.tip133,mKTp.tip133)
			  end
			end
		 end
		 GUI:EndGroup()
		 GUI:SameLine()
		 GUI:BeginGroup()
		 GUI:Dummy(20,20)
		 if AHSET.renkin == true then
		 GUI:SameLine(5,-20)
		 GUI:Image(ImageFolder..[[is_renkin.png]],20,20)
		 if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			  AHSET.renkin = not AHSET.renkin
			  AetheryteHelper.SaveSettings()
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip134,mETp.tip134,mDTp.tip134,mFTp.tip134,mCTp.tip134,mKTp.tip134)
			  end
			end
		 elseif AHSET.renkin == false then
			GUI:SameLine(5,-20)
			GUI:Image(ImageFolder..[[is_renkin_non.png]],20,20)
			if (GUI:IsItemHovered()) then
			if (GUI:IsMouseClicked(0)) then
			 AHSET.renkin = not AHSET.renkin
			 AetheryteHelper.SaveSettings()
			  end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip134,mETp.tip134,mDTp.tip134,mFTp.tip134,mCTp.tip134,mKTp.tip134)
			  end
			end
		 end
		 GUI:EndGroup()
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
		 		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip21,mETp.tip21,mDTp.tip21,mFTp.tip21,mCTp.tip21,mKTp.tip21)
	   		end
	  	end
	  end
	  GUI:End()
   end
end
--------------------------------------------------------------------------------------------------------------------------------------------------





















--------------------------------------------------------------------------------------------------------------------------------------------------
function AetheryteHelper.TCListHeader()
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[howto.png]],20,20)
	  if GUI:IsItemHovered() then
		AetheryteHelper.SetToolTips(mJTp.tip111,mETp.tip111,mDTp.tip111,mFTp.tip111,mCTp.tip111,mKTp.tip111)
	  end
	  GUI:EndGroup()
	  GUI:SameLine()
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
	  GUI:EndGroup()
	  GUI:SameLine()
	  GUI:Dummy(20,20)
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Button("QoLBar",60,20)
	  if GUI:IsItemHovered() then
		if GUI:IsMouseClicked(0) then
		  GUI:SetClipboardText("H4sIAAAAAAAACqWTUWuDMBCA/0q47FFcorF1easyWsrKoIP6MPogNWyBRovawij977uMrUSwYywPIbnPy3cHOc9w138cFEhQEEAXgTxfCUYB1HiQkvOI0tkC4x4kx8QnkK+jmRMmkphSXXeIdojuFZktTFMpwrlApp/xKgtZgGuL4RqkjWD3csAPaSC2l+A3c7FxxcWGGF1rP28ymVK6ylzvKiN7bbrSV5yOiN9aXZW19nY/jLiP+6p89xInjAlK57krnufENCfl6Z1ySrOl682WpD4aH61IIzsTSj2Wrpj8EJ9pszOve2VI17T9wG7pN/x3Ac4FY9i7Hd+mHuivyKP7r1e0onVZle3gX3TgHwpYfCurABnbPQeZDLuCE5aLwjjERLh8AqF5j4BmBAAA")
		  if language == 0 then
		  SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]コピーしました")
		  else
		  SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]Code was copied in clip board")
		  end
		end
			  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip121,mETp.tip121,mDTp.tip121,mFTp.tip121,mCTp.tip121,mKTp.tip121)
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
end




function AetheryteHelper.TCListwindow()
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[AHon.png]],30,40)
	  GUI:EndGroup()
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Text("mini ins selecter")
	  GUI:PushItemWidth(180)
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
			AetheryteHelper.SetToolTips(mJTp.tip110,mETp.tip110,mDTp.tip110,mFTp.tip110,mCTp.tip110,mKTp.tip110)
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
	  GUI:PushItemWidth(180)
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
			AetheryteHelper.SetToolTips(mJTp.tip110,mETp.tip110,mDTp.tip110,mFTp.tip110,mCTp.tip110,mKTp.tip110)
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
	  GUI:Text("World Visit(ex:/e AHWV:Asura)")
	  GUI:PushItemWidth(180)
	  GUI:InputText("###WVcmd","/e AHWV:ServerName",GUI.InputTextFlags_ReadOnly + GUI.InputTextFlags_AutoSelectAll)
	  if GUI:IsItemHovered() then
		if GUI:IsItemClicked(1) then
		  GUI:SetClipboardText("/e AHWV:")
		  if language == 0 then
		  SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]コピーしました")
		  else
		  SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]text was copied in clip board")
		  end
		 end
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip110,mETp.tip110,mDTp.tip110,mFTp.tip110,mCTp.tip110,mKTp.tip110)
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
	  GUI:PushItemWidth(180)
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
			AetheryteHelper.SetToolTips(mJTp.tip110,mETp.tip110,mDTp.tip110,mFTp.tip110,mCTp.tip110,mKTp.tip110)
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
	  GUI:PushItemWidth(180)
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
			AetheryteHelper.SetToolTips(mJTp.tip110,mETp.tip110,mDTp.tip110,mFTp.tip110,mCTp.tip110,mKTp.tip110)
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
	  GUI:PushItemWidth(180)
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
			AetheryteHelper.SetToolTips(mJTp.tip110,mETp.tip110,mDTp.tip110,mFTp.tip110,mCTp.tip110,mKTp.tip110)
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
	  GUI:PushItemWidth(180)
	  GUI:InputText("###GC","/e AHGC move",GUI.InputTextFlags_ReadOnly + GUI.InputTextFlags_AutoSelectAll)
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
			AetheryteHelper.SetToolTips(mJTp.tip110,mETp.tip110,mDTp.tip110,mFTp.tip110,mCTp.tip110,mKTp.tip110)
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
	  GUI:PushItemWidth(180)
	  GUI:InputText("###BJ","/e AHBJ num",GUI.InputTextFlags_ReadOnly + GUI.InputTextFlags_AutoSelectAll)
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
			AetheryteHelper.SetToolTips(mJTp.tip110,mETp.tip110,mDTp.tip110,mFTp.tip110,mCTp.tip110,mKTp.tip110)
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
	  GUI:PushItemWidth(180)
	  GUI:InputText("###WeeEa","/e AH WeeEa ",GUI.InputTextFlags_ReadOnly + GUI.InputTextFlags_AutoSelectAll)
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
			AetheryteHelper.SetToolTips(mJTp.tip110,mETp.tip110,mDTp.tip110,mFTp.tip110,mCTp.tip110,mKTp.tip110)
		end
	  end
	  GUI:EndGroup()
	  GUI:Spacing()
	  GUI:Separator()
	  GUI:Spacing()
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[quantity.png]],30,30)
	  GUI:EndGroup()
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Text("Inventory Sort")
	  GUI:PushItemWidth(180)
	  GUI:InputText("###itemsort","/e AH itemsort",GUI.InputTextFlags_ReadOnly + GUI.InputTextFlags_AutoSelectAll)
	  if GUI:IsItemHovered() then
		if GUI:IsItemClicked(1) then
		  GUI:SetClipboardText("/e AH itemsort")
		  if language == 0 then
		  SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]コピーしました")
		  else
		  SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]text was copied in clip board")
		  end
		  end
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip110,mETp.tip110,mDTp.tip110,mFTp.tip110,mCTp.tip110,mKTp.tip110)
		end
	  end
	  GUI:EndGroup()
	  GUI:Spacing()
	  GUI:Separator()
	  GUI:Spacing()
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[Radar.png]],30,30)
	  GUI:EndGroup()
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Text("miniRadar")
	  GUI:PushItemWidth(180)
	  GUI:InputText("###itemsort","/e AHminiRadar",GUI.InputTextFlags_ReadOnly + GUI.InputTextFlags_AutoSelectAll)
	  if GUI:IsItemHovered() then
		if GUI:IsItemClicked(1) then
		  GUI:SetClipboardText("/e AHminiRadar")
		  if language == 0 then
		  SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]コピーしました")
		  else
		  SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]text was copied in clip board")
		  end
		  end
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip110,mETp.tip110,mDTp.tip110,mFTp.tip110,mCTp.tip110,mKTp.tip110)
		end
	  end
	  GUI:EndGroup()
	  GUI:Spacing()
	  GUI:Separator()
	  GUI:Spacing()
	  GUI:BeginGroup()
	  GUI:Image(GetStartupPath().."\\GUI\\UI_Textures\\minion.png",30,30)
	  GUI:EndGroup()
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Text("Minion on/off")
	  GUI:PushItemWidth(180)
	  GUI:InputText("###minion","/e AH minion",GUI.InputTextFlags_ReadOnly + GUI.InputTextFlags_AutoSelectAll)
	  if GUI:IsItemHovered() then
		if GUI:IsItemClicked(1) then
		  GUI:SetClipboardText("/e AH minion")
		  if language == 0 then
		  SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]コピーしました")
		  else
		  SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]text was copied in clip board")
		  end
		  end
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip110,mETp.tip110,mDTp.tip110,mFTp.tip110,mCTp.tip110,mKTp.tip110)
		end
	  end
	  GUI:EndGroup()
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
			  AetheryteHelper.SetToolTips(mJTp.tip22,mETp.tip22,mDTp.tip22,mFTp.tip22,mCTp.tip22,mKTp.tip22)
			  end
	  end
	  GUI:Separator()
	  --GUI:BeginGroup()
	  --GUI:TextColored(1,0,0,1,"Probably (350) is limit")
	  --GUI:EndGroup()

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
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
local AHuserfuncCode01 = [[--Lclick function]]
local AHuserfuncCode02 = [[--Rclick function]]
local AHuserfuncCode03 = [[--on/off function]].."\n\n"..[[--Can't be too complicated]]
local CBcode01 = [[]]
local CBcode02 = [[]]
local CBcode03 = [[]]
local CBname = ""
local CBImage01 = [[]]
local CBImage02 = [[]]
local CBImage03 = [[]]
local CBtip = ""
local CBtextL = ""
local CBtextR = ""
local CBmode = 0
local CBpulse = 1000
local CBmodetext = true
local CBmodeclick = false
local CBmodeonoff = false
local AHCBtmp = {}
local CBwindowx
local CBwindowy
local CBwindoww
local CBEsizex
local CBEsizey

function AetheryteHelper.CBReset()
	CBname = ""
	CBImage01 = [[]]
	CBImage02 = [[]]
	CBImage03 = [[]]
	CBtip = ""
	CBmode = 0
	CBtextL = ""
	CBtextR = ""
	AHuserfuncCode01 = [[--L-click function]]
	AHuserfuncCode02 = [[--R-click function]]
	AHuserfuncCode03 = [[--on/off function]].."\n\n"..[[--Can't be too complicated]]
	CBpulse = 1000
	CBcode01 = [[]]
	CBcode02 = [[]]
	CBcode03 = [[]]
	AHCBtmp = {}
end


function AetheryteHelper.CBcodeEditWindows()
  if (AetheryteHelper.CBcodeEditor.open) then
	local CBEflags =  GUI.WindowFlags_ShowBorders + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoFocusOnAppearing
	GUI:SetNextWindowSize(200,200,GUI.SetCond_FirstUseEver)
	if (AetheryteHelper.CreateButton.visible) then
	GUI:SetNextWindowPos(CBwindowx+CBwindoww,CBwindowy+20)
  else
  GUI:SetNextWindowPos(CBwindowx,CBwindowy+20)
  end
	 AetheryteHelper.CBcodeEditor.visible, AetheryteHelper.CBcodeEditor.open = GUI:Begin('Code Editor', AetheryteHelper.CBcodeEditor.open,CBEflags)
	if (AetheryteHelper.CBcodeEditor.visible) then
	CBEsizex,CBEsizey = GUI:GetWindowSize()
	GUI:BeginGroup()
	GUI:Text("Code Editor")
	GUI:EndGroup()
	if CBmodeclick == true then
		GUI:BeginGroup()
		GUI:Text("Left-click")
		GUI:EndGroup()
	  GUI:BeginGroup()
	  AHuserfuncCode01, changed = GUI:InputTextEditor("##CBeditor01", AHuserfuncCode01, CBEsizex-20, CBEsizey/2-40, GUI.InputTextFlags_AllowTabInput)
	  if changed then
				CBcode01 = AHuserfuncCode01
		end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
	  	if GUI:IsItemClicked(1) then
	  	GUI:SetClipboardText(AHuserfuncCode01)
	  	SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]text copied")
	  	end
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip211,mETp.tip211,mDTp.tip211,mFTp.tip211,mCTp.tip211,mKTp.tip211)
		end
	  end
	  GUI:Spacing()
	  GUI:BeginGroup()
		GUI:Text("Right-click")
		GUI:EndGroup()
	  GUI:BeginGroup()
	  AHuserfuncCode02, changed = GUI:InputTextEditor("##CBeditor02", AHuserfuncCode02, CBEsizex-20, CBEsizey/2-40, GUI.InputTextFlags_AllowTabInput)
	  if changed then
				CBcode02 = AHuserfuncCode02
		end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
	  	if GUI:IsItemClicked(1) then
	  	GUI:SetClipboardText(AHuserfuncCode02)
	  	SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]text copied")
	  	end
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip212,mETp.tip212,mDTp.tip212,mFTp.tip212,mCTp.tip212,mKTp.tip212)
		end
	  end
	  end

	  if CBmodeonoff == true then
	  GUI:BeginGroup()
	  AHuserfuncCode03, changed = GUI:InputTextEditor("##CBeditor03", AHuserfuncCode03, CBEsizex-20,CBEsizey-40, GUI.InputTextFlags_AllowTabInput)
	  if changed then
				CBcode03 = AHuserfuncCode03
		end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
	  	if GUI:IsItemClicked(1) then
	  	GUI:SetClipboardText(AHuserfuncCode03)
	  	SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][notice]text copied")
	  	end
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip214,mETp.tip214,mDTp.tip214,mFTp.tip214,mCTp.tip214,mKTp.tip214)
		end
	  end
	  end
	end
	GUI:End()
  end
  if AetheryteHelper.CreateButton.open == false then
  	 AetheryteHelper.CBcodeEditor.open = false
  elseif AetheryteHelper.CreateButton.open == true and CBmodeonoff == true or
  			 AetheryteHelper.CreateButton.open == true and CBmodeclick == true then
  	 AetheryteHelper.CBcodeEditor.open = true
  end
end
-------------------------------------------------------------------

function AetheryteHelper.CreateButtonWindows()
  if (AetheryteHelper.CreateButton.open) then
	local CBflags =  GUI.WindowFlags_ShowBorders + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoScrollbar
	GUI:SetNextWindowSize(300,450)
	 AetheryteHelper.CreateButton.visible, AetheryteHelper.CreateButton.open = GUI:Begin('User Create Button Editor', AetheryteHelper.CreateButton.open,CBflags)
	 CBwindowx, CBwindowy = GUI:GetWindowPos()
	 CBwindoww = GUI:GetWindowWidth()
	if (AetheryteHelper.CreateButton.visible) then
	  GUI:Spacing()
	  GUI:Columns(2)
	  GUI:SetColumnOffset(1, 150)
	  GUI:BeginGroup()
	  GUI:Text("Button Mode")
	  GUI:EndGroup()

	  GUI:BeginGroup()
	  if CBmodetext == true then
	  GUI:PushStyleColor(GUI.Col_Button,0,.5,0,1)
	  GUI:PushStyleColor(GUI.Col_ButtonHovered,0,.5,0,1)
	  GUI:ImageButton("##TextCommand",ImageFolder..[[free_chat.png]], 30,30)
	  GUI:PopStyleColor(2)
	  else
	  GUI:ImageButton("##TextCommand",ImageFolder..[[free_chat.png]], 30,30)
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
	 		if GUI:IsItemClicked(0) then
		  CBmodetext = true
		  CBmodeclick = false
		  CBmodeonoff = false
		  CBmode = 0
		  AetheryteHelper.CBcodeEditor.open = false
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip201,mETp.tip201,mDTp.tip201,mFTp.tip201,mCTp.tip201,mKTp.tip201)
			end
	  end

	  GUI:SameLine()
	  GUI:BeginGroup()
	  if CBmodeclick == true then
	  GUI:PushStyleColor(GUI.Col_Button,0,.5,0,1)
	  GUI:PushStyleColor(GUI.Col_ButtonHovered,0,.5,0,1)
	  GUI:ImageButton("##Click",ImageFolder..[[CB_click.png]], 30,30)
	  GUI:PopStyleColor(2)
	  else
	  GUI:ImageButton("##Click",ImageFolder..[[CB_click.png]], 30,30)
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
	 		if GUI:IsItemClicked(0) then
		  CBmodetext = false
		  CBmodeclick = true
		  CBmodeonoff = false
		  CBmode = 1
			AetheryteHelper.CBcodeEditor.open = true
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip202,mETp.tip202,mDTp.tip202,mFTp.tip202,mCTp.tip202,mKTp.tip202)
			end
	  end
	  
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if CBmodeonoff == true then
	  GUI:PushStyleColor(GUI.Col_Button,0,.5,0,1)
	  GUI:PushStyleColor(GUI.Col_ButtonHovered,0,.5,0,1)
	  GUI:ImageButton("##CB_onoff",ImageFolder..[[CB_onoff.png]], 30,30)
	  GUI:PopStyleColor(2)
	  else
  	GUI:ImageButton("##CB_onoff",ImageFolder..[[CB_onoff.png]], 30,30)
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
	 		if GUI:IsItemClicked(0) then
		  CBmodetext = false
		  CBmodeclick = false
		  CBmodeonoff = true
		  CBmode = 2
		  AetheryteHelper.CBcodeEditor.open = true
			end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip203,mETp.tip203,mDTp.tip203,mFTp.tip203,mCTp.tip203,mKTp.tip203)
			end
	  end
	  GUI:NextColumn()
	  GUI:BeginGroup()
	  GUI:Text("add/clear")
	  GUI:EndGroup()
	  GUI:BeginGroup()
	  GUI:ImageButton("##CB_add",ImageFolder..[[R_add.png]], 30,30)
	  if GUI:IsItemHovered() then
	 		if GUI:IsItemClicked(0) then
	 			if CBname ~= "" then
	 			table.insert(AHCBtmp,1)--[1]on1/off0
	 			table.insert(AHCBtmp,CBname)--[2]name
	 			table.insert(AHCBtmp,CBImage01)--[3]image
	 			table.insert(AHCBtmp,CBImage02)--[4]onimage
	 			table.insert(AHCBtmp,CBImage03)--[5]offimage
	 			table.insert(AHCBtmp,CBtip)--[6]tooltip
	 			table.insert(AHCBtmp,CBmode)--[7]mode
	 			table.insert(AHCBtmp,CBtextL)--[8]textcommandL
	 			table.insert(AHCBtmp,CBtextR)--[9]textcommandR
	 			table.insert(AHCBtmp,0)--[10]funconoff
	 			table.insert(AHCBtmp,CBcode01)--[11]clickfuncL
	 			table.insert(AHCBtmp,CBcode02)--[12]clickfuncR
	 			table.insert(AHCBtmp,CBpulse)--[13]pulse
	 			table.insert(AHCBtmp,CBcode03)--[14]onofffunc
	 			table.insert(AHCBtmp,0)--[15]Reserve
	 			table.insert(AHCBtmp,0)--[16]Reserve
	 			table.insert(AetheryteHelper.userCustomfunc,AHCBtmp)
		  	AetheryteHelper.SaveSettings()
		  	AetheryteHelper.CBReset()
		    end
		  end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip204,mETp.tip204,mDTp.tip204,mFTp.tip204,mCTp.tip204,mKTp.tip204)
			end
	  end
	  GUI:EndGroup()
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:ImageButton("##CB_clear",ImageFolder..[[CB_clear.png]], 30,30)
	  if GUI:IsItemHovered() then
	 		if GUI:IsItemClicked(0) then
	 			AetheryteHelper.CBReset()
		  end
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip205,mETp.tip205,mDTp.tip205,mFTp.tip205,mCTp.tip205,mKTp.tip205)
			end
	  end
	  GUI:EndGroup()
	  

	  GUI:Columns()
	  GUI:BeginGroup()
	  GUI:Text("Button Name")
	  CBname = GUI:InputText("##CBname",CBname)
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip206,mETp.tip206,mDTp.tip206,mFTp.tip206,mCTp.tip206,mKTp.tip206)
		end
	  end

	  if CBmodeonoff == false then
	  GUI:BeginGroup()
	  GUI:Text("Image")
	  GUI:PushItemWidth(100)
	  CBImage01 = GUI:InputText("##CBImage01",CBImage01)
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip207,mETp.tip207,mDTp.tip207,mFTp.tip207,mCTp.tip207,mKTp.tip207)
		end
	  end
	  elseif CBmodeonoff == true then
	  GUI:BeginGroup()
	  GUI:Text("ON Image")
	  GUI:PushItemWidth(100)
	  CBImage02 = GUI:InputText("##CBImage02",CBImage02)
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip207,mETp.tip207,mDTp.tip207,mFTp.tip207,mCTp.tip207,mKTp.tip207)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Text("OFF Image")
	  GUI:PushItemWidth(100)
	  CBImage03 = GUI:InputText("##CBImage03",CBImage03)
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip207,mETp.tip207,mDTp.tip207,mFTp.tip207,mCTp.tip207,mKTp.tip207)
		end
	  end
	  end

	  GUI:BeginGroup()
	  GUI:Text("tooltip")
	  CBtip = GUI:InputText("##CBtip",CBtip)
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip208,mETp.tip208,mDTp.tip208,mFTp.tip208,mCTp.tip208,mKTp.tip208)
		end
	  end
	  if CBmodetext == true then
	  GUI:BeginGroup()
	  GUI:Text("in game Text Command(L)")
	  CBtextL = GUI:InputText("##CBtextL",CBtextL)
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip209,mETp.tip209,mDTp.tip209,mFTp.tip209,mCTp.tip209,mKTp.tip209)
		end
	  end
	  GUI:EndGroup()
	  GUI:BeginGroup()
	  GUI:Text("in game Text Command(R)")
	  CBtextR = GUI:InputText("##CBtextR",CBtextR)
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip210,mETp.tip210,mDTp.tip210,mFTp.tip210,mCTp.tip210,mKTp.tip210)
		end
	  end
	  GUI:EndGroup()
	  end

	  if CBmodeonoff == true then
	  GUI:BeginGroup()
	  GUI:PushItemWidth(100)
	  GUI:Text("Pulse")
	  CBpulse = GUI:InputInt("##CBpulse",CBpulse,1,100)
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip213,mETp.tip213,mDTp.tip213,mFTp.tip213,mCTp.tip213,mKTp.tip213)
		end
	  end
	  if CBpulse < 0 then CBpulse = 0 end
	  if CBpulse > 3000 then CBpulse = 3000 end
	  GUI:EndGroup()
	  end

	  GUI:Spacing()
	  GUI:Separator()
	  GUI:Spacing()
	  if CBmodetext == true then
	  GUI:BeginChild("##AHCBlist", 0, GUI_GetFrameHeight(5), true)
	  elseif CBmodeclick == true then
	  GUI:BeginChild("##AHCBlist", 0, GUI_GetFrameHeight(9), true)
	  elseif CBmodeonoff == true then
	  GUI:BeginChild("##AHCBlist", 0, GUI_GetFrameHeight(7), true)
	  end
	  AetheryteHelper.CBlist()
	  GUI:EndChild()

	end
	GUI:End()
  end
end



function AetheryteHelper.CBlist()
	if #AetheryteHelper.userCustomfunc ~= 0 then
		for k,v in pairs(AetheryteHelper.userCustomfunc) do
			GUI:Columns(3)
			GUI:SetColumnOffset(1, 35) GUI:SetColumnOffset(2, 200)
			GUI:BeginGroup()
   		if v[1] == 1 then
	  	GUI:Image(ImageFolder..[[CB_view.png]],20,20)
	  		if GUI:IsItemHovered() then
	  		if GUI:IsItemClicked(0) then
	  		v[1] = 0
	  		AetheryteHelper.SaveSettings()
	  		end
	  		end
   		elseif v[1] == 0 then
	  	GUI:Image(ImageFolder..[[CB_view_non.png]],20,20)
	  		if GUI:IsItemHovered() then
	  		if GUI:IsItemClicked(0) then
	  		v[1] = 1
	  		AetheryteHelper.SaveSettings()
	  		end
	  		end
   		end
   		GUI:EndGroup()
   		if GUI:IsItemHovered() then
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip218,mETp.tip218,mDTp.tip218,mFTp.tip218,mCTp.tip218,mKTp.tip218)
			end
	  	end
			GUI:NextColumn()
      if v[7] == 0 then
			GUI:BeginGroup()
			GUI:Image(ImageFolder..[[free_chat.png]], 20,20)
			GUI:EndGroup()
			if GUI:IsItemHovered() then
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip201,mETp.tip201,mDTp.tip201,mFTp.tip201,mCTp.tip201,mKTp.tip201)
			end
	  	end
			elseif v[7] == 1 then
			GUI:BeginGroup()
			GUI:Image(ImageFolder..[[CB_click.png]], 20,20)
			GUI:EndGroup()
			if GUI:IsItemHovered() then
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip202,mETp.tip202,mDTp.tip202,mFTp.tip202,mCTp.tip202,mKTp.tip202)
			end
	  	end
			elseif v[7] == 2 then
		  GUI:BeginGroup()
		  GUI:Image(ImageFolder..[[CB_onoff.png]], 20,20)
		  GUI:EndGroup()
		  if GUI:IsItemHovered() then
			if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip203,mETp.tip203,mDTp.tip203,mFTp.tip203,mCTp.tip203,mKTp.tip203)
			end
	  	end
		  end
		  GUI:SameLine()
			GUI:BeginGroup()
			GUI:Button(v[2],120,20)
			if GUI:IsItemHovered() then
				if GUI:IsItemClicked(0) then
					if v[7] == 0 then
						CBmodetext = true
						CBmodeclick = false
						CBmodeonoff = false
						AetheryteHelper.CBcodeEditor.open = false
					elseif v[7] == 1 then
						CBmodetext = false
		  			CBmodeclick = true
		  			CBmodeonoff = false
		  		elseif v[7] == 2 then
		  			CBmodetext = false
		  			CBmodeclick = false
		  			CBmodeonoff = true
		  		end
					CBname = v[2]
					CBImage01 = v[3]
					CBImage02 = v[4]
					CBImage03 = v[5]
					CBtip = v[6]
					CBmode = v[7]
					CBtextL = v[8]
					CBtextR = v[9]
					AHuserfuncCode01 = v[11]
					AHuserfuncCode02 = v[12]
					CBpulse = v[13]
					AHuserfuncCode03 = v[14]
				end
				if AHSET.mushtooltips == true then
			  	AetheryteHelper.SetToolTips("["..v[2].."]\n"..mJTp.tip217,"["..v[2].."]\n"..mETp.tip217,"["..v[2].."]\n"..mDTp.tip217,"["..v[2].."]\n"..mFTp.tip217,"["..v[2].."]\n"..mCTp.tip217,"["..v[2].."]\n"..mKTp.tip217)
				end
			end
			GUI:EndGroup()
			GUI:NextColumn()
			GUI:BeginGroup()
			GUI:ImageButton("##CBedit",ImageFolder..[[CB_edit.png]], 15,15)
   		if GUI:IsItemHovered() then
	  		if GUI:IsItemClicked(0) then
	  			if CBname ~= "" then 
	  			 v[2] = CBname
					 v[3] = CBImage01
					 v[4] = CBImage02
					 v[5] = CBImage03
					 v[6] = CBtip
					 v[7] = CBmode
					 v[8] = CBtextL
					 v[9] = CBtextR
					 v[11] = AHuserfuncCode01
					 v[12] = AHuserfuncCode02
					 v[13] = CBpulse
					 v[14] = AHuserfuncCode03
	  			 AetheryteHelper.SaveSettings()
	  			end
	  		end
	  		if AHSET.mushtooltips == true then
				AetheryteHelper.SetToolTips(mJTp.tip216,mETp.tip216,mDTp.tip216,mFTp.tip216,mCTp.tip216,mKTp.tip216)
	  		end
   		end
			GUI:EndGroup()
			GUI:SameLine()
			GUI:BeginGroup()
			GUI:ImageButton("##CBdel",ImageFolder..[[R_trash.png]], 15,15)
   		if GUI:IsItemHovered() then
	  		if GUI:IsItemClicked(0) then
	  		table.remove(AetheryteHelper.userCustomfunc,k)
	  		AetheryteHelper.SaveSettings()
	  		end
	  		if AHSET.mushtooltips == true then
				AetheryteHelper.SetToolTips(mJTp.tip215,mETp.tip215,mDTp.tip215,mFTp.tip215,mCTp.tip215,mKTp.tip215)
	  		end
   		end
			GUI:EndGroup()
			GUI:Columns()
			GUI:Separator()

		end
	else
		GUI:BeginGroup()
		GUI:Text("Button not found")
		GUI:EndGroup()
	end
end

--------------------------------------------------------
function AetheryteHelper.userButtonAllDrow()
	local btndrowA = 0
	local btndrowB = 0
	local childH = 1.35
  for k,v in pairs(AetheryteHelper.userCustomfunc) do
	  	if v[1] == 1 then
	  	btndrowA = btndrowA + 1
	    end
	end
  if (btndrowA > 0) then
  AetheryteHelper.userbutton.open = true
  else
  AetheryteHelper.userbutton.open = false
  end
  local sizex = 40*btndrowA
  local sizey = 75
  if btndrowA == 1 then sizex = 50
  elseif btndrowA > 30 then sizex = 210
  elseif sizex > 195 then sizex = 195 end 
  if btndrowA > 25 then sizey = 230 childH = 1.35*6
  elseif btndrowA > 20 then sizey = 200 childH = 1.35*5
  elseif btndrowA > 15 then sizey = 170 childH = 1.35*4
  elseif btndrowA > 10 then sizey = 140 childH = 1.35*3
  elseif btndrowA > 5 then sizey = 110 childH = 1.35*2 end
  if AetheryteHelper.userbutton.open then
	local UBflags = GUI.WindowFlags_NoFocusOnAppearing + GUI.WindowFlags_NoBringToFrontOnFocus + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_AlwaysAutoResize  
	GUI:SetNextWindowSize(sizex+10,sizey)
  AetheryteHelper.userbutton.visible, AetheryteHelper.userbutton.open = GUI:Begin('User Button', AetheryteHelper.userbutton.open,UBflags)
	if (AetheryteHelper.userbutton.visible) then
		GUI:Separator()
		GUI:Spacing()
		GUI:BeginChild("##UBTN", 0, GUI_GetFrameHeight(childH), true)
		for k,v in pairs(AetheryteHelper.userCustomfunc) do
		if v[1] == 1 then
			btndrowB = btndrowB + 1
			if btndrowB > 50 then
				 AetheryteHelper.IssueNotice(AHnormalError.title01,AHnormalError.J01,AHnormalError.E01,AHnormalError.D01,AHnormalError.F01,AHnormalError.C01,AHnormalError.K01)
				 v[1] = 0
				 AetheryteHelper.SaveSettings()
			end
			if v[7] == 0 then
		    if btndrowB/5 == 1 or btndrowB/5 == 2 or btndrowB/5 == 3 or btndrowB/5 == 4 or btndrowB/5 == 5 or
		    	 btndrowB/5 == 6  or btndrowB/5 == 7 or btndrowB/5 == 8 or btndrowB/5 == 9 or btndrowB/5 == 10 then
		    AetheryteHelper.UBDmode01(v[2],v[3],v[6],v[8],v[9],[[free_chat.png]])
		    else
		    AetheryteHelper.UBDmode01(v[2],v[3],v[6],v[8],v[9],[[free_chat.png]])
	      GUI:SameLine()
	      end
	  	end
	  	if v[7] == 1 then
		    if btndrowB/5 == 1 or btndrowB/5 == 2 or btndrowB/5 == 3 or btndrowB/5 == 4 or btndrowB/5 == 5 or
		    	 btndrowB/5 == 6  or btndrowB/5 == 7 or btndrowB/5 == 8 or btndrowB/5 == 9 or btndrowB/5 == 10 then
		    AetheryteHelper.UBDmode02(v[2],v[3],v[6],v[11],v[12],[[CB_click.png]])
		    else
		    AetheryteHelper.UBDmode02(v[2],v[3],v[6],v[11],v[12],[[CB_click.png]])
	      GUI:SameLine()
	      end
	  	end
	  	if v[7] == 2 then
		    if btndrowB/5 == 1 or btndrowB/5 == 2 or btndrowB/5 == 3 or btndrowB/5 == 4 or btndrowB/5 == 5 or
		    	 btndrowB/5 == 6  or btndrowB/5 == 7 or btndrowB/5 == 8 or btndrowB/5 == 9 or btndrowB/5 == 10 then
		    	if v[10] == 1 then
		      AetheryteHelper.UBDmode03on(v[2],v[4],v[6],[[R_on.png]])
		      	if GUI:IsItemHovered() then
		      	if GUI:IsItemClicked(0) then
			      v[10] = 0
			      AetheryteHelper.SaveSettings()
		      	end
		        end
		      elseif v[10] == 0 then
		      AetheryteHelper.UBDmode03off(v[2],v[5],v[6],[[R_off.png]])
		        if GUI:IsItemHovered() then
		      	if GUI:IsItemClicked(0) then
			      v[10] = 1
			      AetheryteHelper.SaveSettings()
		      	end
		        end
		      end
		    else
		    	if v[10] == 1 then
		      AetheryteHelper.UBDmode03on(v[2],v[4],v[6],[[R_on.png]])
		        if GUI:IsItemHovered() then
		      	if GUI:IsItemClicked(0) then
			      v[10] = 0
			      AetheryteHelper.SaveSettings()
		      	end
		        end
		      GUI:SameLine()
		      elseif v[10] == 0 then
		      AetheryteHelper.UBDmode03off(v[2],v[5],v[6],[[R_off.png]])
		        if GUI:IsItemHovered() then
		      	if GUI:IsItemClicked(0) then
			      v[10] = 1
			      AetheryteHelper.SaveSettings()
		      	end
		        end
		      GUI:SameLine()
		      end
	      end
	  	end
	  end
		end
		GUI:EndChild()
		GUI:Spacing()
		GUI:Separator()
	end
	GUI:End()
  end
end


function AetheryteHelper.UBDmode01(name,image,tips,Lcmd,Rcmd,icon)
 GUI:BeginGroup()
 if image == "" or image == nil then
 GUI:ImageButton("###",ImageFolder..icon,20,20)
 elseif image ~= "" or image ~= nil then
 GUI:ImageButton("###",userImage..image,20,20)
 end
 GUI:EndGroup()
 if GUI:IsItemHovered() then
		if Lcmd ~= "" then
			if GUI:IsItemClicked(0) then
				SendTextCommand(Lcmd)
			end
		else
			if GUI:IsItemClicked(0) then
			AetheryteHelper.CreateButton.open = not AetheryteHelper.CreateButton.open
			end
		end
		if Rcmd ~= "" then
			if GUI:IsItemClicked(1) then
				SendTextCommand(Rcmd)
			end
		else
			if GUI:IsItemClicked(1) then
			AetheryteHelper.CreateButton.open = not AetheryteHelper.CreateButton.open
			end
		end
		if AHSET.mushtooltips == true then
			if tips ~= "" then
			GUI:SetTooltip(tips)
		  else
		  GUI:SetTooltip(name)
		  end
 		end
 end
 
 return name,image,tips,Lcmd,Rcmd,icon
end


function AetheryteHelper.UBDmode02(name,image,tips,Lcode,Rcode,icon)
 GUI:BeginGroup()
 if image == "" or image == nil then
 GUI:ImageButton("###",ImageFolder..icon,20,20)
 elseif image ~= "" or image ~= nil then
 GUI:ImageButton("###",userImage..image,20,20)
 end
 GUI:EndGroup()
 if GUI:IsItemHovered() then
		if Lcode ~= "" then
			if GUI:IsItemClicked(0) then
			   local codeL = assert(loadstring(Lcode))
			   codeL()
			end
		else
			if GUI:IsItemClicked(0) then
			AetheryteHelper.CreateButton.open = not AetheryteHelper.CreateButton.open
			end
		end
		if Rcode ~= "" then
			if GUI:IsItemClicked(1) then
				 local codeR = assert(loadstring(Rcode))
			   codeR()
			end
		else
			if GUI:IsItemClicked(1) then
			AetheryteHelper.CreateButton.open = not AetheryteHelper.CreateButton.open
			end
		end
		if AHSET.mushtooltips == true then
			if tips ~= "" then
			GUI:SetTooltip(tips)
		  else
		  GUI:SetTooltip(name)
		  end
 		end
 end
 
 return name,image,tips,Lcode,Rcode,icon
end




function AetheryteHelper.UBDmode03off(name,offimage,tips,officon)
 	  GUI:BeginGroup()
  	GUI:PushStyleColor(GUI.Col_Button,.3,0,0,1)
	  GUI:PushStyleColor(GUI.Col_ButtonHovered,.3,0,0,1)
  	if offimage == "" or offimage == nil then
 		GUI:ImageButton("###",ImageFolder..officon,20,20)
 		elseif offimage ~= "" or offimage ~= nil then
 		GUI:ImageButton("###",userImage..offimage,20,20)
 		end
 		GUI:PopStyleColor(2)
 	  GUI:EndGroup()
 			if GUI:IsItemHovered() then	
			if GUI:IsItemClicked(1) then
			AetheryteHelper.CreateButton.open = not AetheryteHelper.CreateButton.open
			end
			if AHSET.mushtooltips == true then
				if tips ~= "" then
				GUI:SetTooltip(tips)
		  	else
		  	GUI:SetTooltip(name)
		  	end
 			end
			end
 return name,offimage,tips,officon
end

function AetheryteHelper.UBDmode03on(name,onimage,tips,onicon)
  	GUI:BeginGroup()	
 	  GUI:PushStyleColor(GUI.Col_Button,0,.3,0,1)
	  GUI:PushStyleColor(GUI.Col_ButtonHovered,0,.3,0,1)
 	  if onimage == "" or onimage == nil then
 		GUI:ImageButton("###",ImageFolder..onicon,20,20)
  	elseif onimage ~= "" or onimage ~= nil then
 		GUI:ImageButton("###",userImage..onimage,20,20)
 		end
 		GUI:PopStyleColor(2)
	  GUI:EndGroup()
 			if GUI:IsItemHovered() then	
			if GUI:IsItemClicked(1) then
			AetheryteHelper.CreateButton.open = not AetheryteHelper.CreateButton.open
			end
			if AHSET.mushtooltips == true then
				if tips ~= "" then
				GUI:SetTooltip(tips)
		  	else
		  	GUI:SetTooltip(name)
		  	end
 			end
			end
 return name,onimage,tips,onicon
end



-------------------------------------------------------------------------------------------------------------------------------------------------------------------

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
			  AetheryteHelper.SetToolTips(mJTp.tip22,mETp.tip22,mDTp.tip22,mFTp.tip22,mCTp.tip22,mKTp.tip22)
		end
	  end
	  GUI:EndGroup()
	end
	GUI:End()
  end
end
--------------------------------------------------------------------------------------------------------------------------------------------------

local NewVtext,tagtext,NowVtext
local mushVC = false
local mushVUP = false

function AetheryteHelper.UpdateWindow()
  if (AetheryteHelper.UpdateConfig.open) then
 	local UCflags = GUI.WindowFlags_NoFocusOnAppearing + GUI.WindowFlags_NoBringToFrontOnFocus + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoScrollbar
 	GUI:SetNextWindowSize(180,100)
 	AetheryteHelper.UpdateConfig.visible, AetheryteHelper.UpdateConfig.open = GUI:Begin('AH Update Checker', AetheryteHelper.UpdateConfig.open,UCflags)
 	if (AetheryteHelper.UpdateConfig.visible) then
 	GUI:Columns(2)
 	GUI:SetColumnOffset(1,120)
 	GUI:Text("Updater Config")
 	GUI:AlignFirstTextHeightToWidgets()
 	GUI:BeginGroup()
 	AHSET.AutoUpdate,changed = GUI:Checkbox("AutoCheck##AutoCheck", AHSET.AutoUpdate)
 	if changed then
 		AetheryteHelper.SaveSettings()
 	end
 	if (GUI:IsItemHovered()) then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip224,mETp.tip224,mDTp.tip224,mFTp.tip224,mCTp.tip224,mKTp.tip224)
		end
	end
 	GUI:EndGroup()
 	GUI:NextColumn()
	   if mushVC == true and mushVUP == true then
  	   GUI:BeginGroup()
  	   GUI:PushStyleColor(GUI.Col_Button,.8,0,0,1)
  	   GUI:ImageButton("###download",ImageFolder..[[download.png]], 30,30)
 	     GUI:PopStyleColor()
 	     if GUI:IsItemHovered() then
 		      if GUI:IsMouseClicked(0) then
 		      AetheryteHelper.AutoUpdate()
 		      mushVUP = nil
 		      end
 		      if AHSET.mushtooltips == true then
			       AetheryteHelper.SetToolTips(mJTp.tip221,mETp.tip221,mDTp.tip221,mFTp.tip221,mCTp.tip221,mKTp.tip221)
		      end
 	     end
 	     GUI:EndGroup()
     elseif mushVC == false and mushVUP == false then
       GUI:BeginGroup()
 	     GUI:PushStyleColor(GUI.Col_Button,0,.8,0,1)
 	     GUI:ImageButton("###UpdateCheck",ImageFolder..[[CB_clear.png]], 30,30)
 	     GUI:PopStyleColor()
 	     if GUI:IsItemHovered() then
 		     if GUI:IsMouseClicked(0) then
 		     AetheryteHelper.VersionCheck()
 		     end
 		     if AHSET.mushtooltips == true then
			      AetheryteHelper.SetToolTips(mJTp.tip222,mETp.tip222,mDTp.tip222,mFTp.tip222,mCTp.tip222,mKTp.tip222)
		     end
 	     end
 	     GUI:EndGroup()
 	   else
 	   	 GUI:BeginGroup()
 	     GUI:PushStyleColor(GUI.Col_Button,.5,.5,0,1)
 	     GUI:ImageButton("###UpdateCheck",ImageFolder..[[loading.png]], 30,30)
 	     GUI:PopStyleColor()
 	     if GUI:IsItemHovered() then
 		     if AHSET.mushtooltips == true then
			      AetheryteHelper.SetToolTips(mJTp.tip222,mETp.tip222,mDTp.tip222,mFTp.tip222,mCTp.tip222,mKTp.tip222)
		     end
 	     end
 	     GUI:EndGroup()
 	   end
 	     GUI:Columns()
 	     GUI:Separator()
 	     if mushVC == true and mushVUP == true then
 	     GUI:TextColored(0,.8,0,1,NewVtext.." Release")
 	     elseif mushVC == true and mushVUP == nil then
 	     GUI:TextColored(.8,0,0,1,"Processing....")
 	     elseif NowVtext ~= nil then
 	     GUI:Text(NowVtext.." is latest")
 	     else
 	     GUI:Text("Not confirmed")
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
 		if gRegion == 1 and Player.localmapid == 957 then
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
			  AetheryteHelper.SetToolTips(mJTp.tip01,mETp.tip01,mDTp.tip01,mFTp.tip01,mCTp.tip01,mKTp.tip01)
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
			  AetheryteHelper.SetToolTips(mJTp.tip01,mETp.tip01,mDTp.tip01,mFTp.tip01,mCTp.tip01,mKTp.tip01)
			  end
			  end
	  end
 		elseif gRegion == 2 and Player.localmapid == 956 or gRegion == 2 and Player.localmapid == 957 or gRegion == 2 and Player.localmapid == 958 or
	         gRegion == 2 and Player.localmapid == 959 or gRegion == 2 and Player.localmapid == 960 or gRegion == 2 and Player.localmapid == 961 then
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
			  AetheryteHelper.SetToolTips(mJTp.tip01,mETp.tip01,mDTp.tip01,mFTp.tip01,mCTp.tip01,mKTp.tip01)
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
			  AetheryteHelper.SetToolTips(mJTp.tip01,mETp.tip01,mDTp.tip01,mFTp.tip01,mCTp.tip01,mKTp.tip01)
			  end
			  end
	  end
	  else
	  	  GUI:SameLine(-5,-20)
			  GUI:Image(ImageFolder..[[AH_non.png]],20,20)
			  if (GUI:IsItemHovered()) then
			  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip00,mETp.tip00,mDTp.tip00,mFTp.tip00,mCTp.tip00,mKTp.tip00)
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
			  AetheryteHelper.SetToolTips(mJTp.tip07,mETp.tip07,mDTp.tip07,mFTp.tip07,mCTp.tip07,mKTp.tip07)
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
			  AetheryteHelper.SetToolTips(mJTp.tip08,mETp.tip08,mDTp.tip08,mFTp.tip08,mCTp.tip08,mKTp.tip08)
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
			  AetheryteHelper.SetToolTips(mJTp.tip09,mETp.tip09,mDTp.tip09,mFTp.tip09,mCTp.tip09,mKTp.tip09)
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
			  AetheryteHelper.SetToolTips(mJTp.tip22,mETp.tip22,mDTp.tip22,mFTp.tip22,mCTp.tip22,mKTp.tip22)
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
			  AetheryteHelper.SetToolTips(mJTp.tip23,mETp.tip23,mDTp.tip23,mFTp.tip23,mCTp.tip23,mKTp.tip23)
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
			  AetheryteHelper.SetToolTips(mJTp.tip23,mETp.tip23,mDTp.tip23,mFTp.tip23,mCTp.tip23,mKTp.tip23)
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
			  AetheryteHelper.SetToolTips(mJTp.tip23,mETp.tip23,mDTp.tip23,mFTp.tip23,mCTp.tip23,mKTp.tip23)
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
			  AetheryteHelper.SetToolTips(mJTp.tip107,mETp.tip107,mDTp.tip107,mFTp.tip107,mCTp.tip107,mKTp.tip107)
			  end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:TextColored(1,0,0,1,"[[Warning]]")
	  GUI:EndGroup()
	  if (GUI:IsItemHovered()) then
		 if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip24,mETp.tip24,mDTp.tip24,mFTp.tip24,mCTp.tip24,mKTp.tip24)
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
			  AetheryteHelper.SetToolTips(mJTp.tip114,mETp.tip114,mDTp.tip114,mFTp.tip114,mCTp.tip114,mKTp.tip114)
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
			  AetheryteHelper.SetToolTips(mJTp.tip113,mETp.tip113,mDTp.tip113,mFTp.tip113,mCTp.tip113,mKTp.tip113)
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
			  AetheryteHelper.SetToolTips(mJTp.tip114,mETp.tip114,mDTp.tip114,mFTp.tip114,mCTp.tip114,mKTp.tip114)
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
			  AetheryteHelper.SetToolTips(mJTp.tip115,mETp.tip115,mDTp.tip115,mFTp.tip115,mCTp.tip115,mKTp.tip115)
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
			  AetheryteHelper.SetToolTips(mJTp.tip116,mETp.tip116,mDTp.tip116,mFTp.tip116,mCTp.tip116,mKTp.tip116)
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
			  AetheryteHelper.SetToolTips(mJTp.tip114,mETp.tip114,mDTp.tip114,mFTp.tip114,mCTp.tip114,mKTp.tip114)
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
			  AetheryteHelper.SetToolTips(mJTp.tip115,mETp.tip115,mDTp.tip115,mFTp.tip115,mCTp.tip115,mKTp.tip115)
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
			  AetheryteHelper.SetToolTips(mJTp.tip116,mETp.tip116,mDTp.tip116,mFTp.tip116,mCTp.tip116,mKTp.tip116)
		end
	  end
	  GUI:EndGroup()


	end
	GUI:End()
  end
end
--------------------------------------------------------------------------------------------------------------------------------------------------

function AetheryteHelper.Radarinitialize()
   Rcid = ""
   Rid = 0
   Rname = ""
   Rtype = 0
   Rwid = 0
   Rget = 0
   Rfate = 0
   tempCustomlist = {}
end

function AetheryteHelper.Radaradd()
	  if #AetheryteHelper.RadarCustomList ~= 0 then
	  	for _,v in pairs(AetheryteHelper.RadarCustomList) do
	  		if v[1] == tonumber(Rcid) and v[3] == Rname then
	  			AetheryteHelper.Radarinitialize()
	  		end
	  	end
	  end
	  if Rcid ~= "" and Rname ~= "" and Rid ~= Player.id and Rname ~= Player.name then
		  table.insert(tempCustomlist,tonumber(Rcid))--1
		  table.insert(tempCustomlist,Rid)--2
		  table.insert(tempCustomlist,Rname)--3
		  table.insert(tempCustomlist,Rwid)--4
		  table.insert(tempCustomlist,Rtype)--5
		  table.insert(tempCustomlist,ColourU32)--6
		  table.insert(tempCustomlist,Colour.r)--7
		  table.insert(tempCustomlist,Colour.g)--8
		  table.insert(tempCustomlist,Colour.b)--9
		  table.insert(tempCustomlist,Colour.a)--10
		  table.insert(tempCustomlist,Rswitch)--11
		  table.insert(tempCustomlist,Rget)--12
		  table.insert(tempCustomlist,Rthicks)--13
		  table.insert(tempCustomlist,Rnote)--14
		  table.insert(tempCustomlist,Rattack)--15
		  table.insert(tempCustomlist,Rfate)--16
		  table.insert(tempCustomlist,0)--17Reserve
		  table.insert(tempCustomlist,0)--18Reserve
		  table.insert(AetheryteHelper.RadarCustomList,1,tempCustomlist)
		  AetheryteHelper.SaveSettings()
		  AetheryteHelper.Radarinitialize()
	  else
		  AetheryteHelper.Radarinitialize()
	  end
end

function AetheryteHelper.Radarget()
  if Player:GetTarget() ~= nil then
	  Rcid = Player:GetTarget().contentid
	  Rid = Player:GetTarget().id
	  Rname = Player:GetTarget().name
	  Rtype = Player:GetTarget().type
	  Rwid = Player:GetTarget().homeworld
	  Rfate = Player:GetTarget().fateid
	  Rget = 1
	  Rattack = Player:GetTarget().attackable
  end
end

---------------------------------------------------------------------------------------------------

function AetheryteHelper.RadarGeneralDrow()
	GUI:BeginGroup()
	GUI:Image(ImageFolder..[[R_Pdot_on.png]],20,20)
	GUI:SameLine()
	GUI:PushItemWidth(200)
	GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	R.Colormydot.r,R.Colormydot.g,R.Colormydot.b,R.Colormydot.a,changed = GUI:ColorEdit4("##Colourmydot",R.Colormydot.r,R.Colormydot.g,R.Colormydot.b,R.Colormydot.a)
	if (changed) then R.Colormydot.U32 = GUI:ColorConvertFloat4ToU32(R.Colormydot.r,R.Colormydot.g,R.Colormydot.b,R.Colormydot.a)
	AetheryteHelper.SaveSettings()
	end
	GUI:PopItemWidth()
	GUI:SameLine()
	GUI:PushItemWidth(70)
	Rset.mydotsize,changed = GUI:InputInt("##mydotsize",Rset.mydotsize,1,1)
	if (changed) then
	Rset.mydotsize = Rset.mydotsize
	AetheryteHelper.SaveSettings()
	end
	if Rset.mydotsize < 1 then Rset.mydotsize = 1 end
	if Rset.mydotsize > 10 then Rset.mydotsize = 10 end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip167,mETp.tip167,mDTp.tip167,mFTp.tip167,mCTp.tip167,mKTp.tip167)
		end
	end
	GUI:BeginGroup()
	GUI:Image(ImageFolder..[[R_dot_on.png]],20,20)
	GUI:SameLine()
	GUI:PushItemWidth(70)
	Rset.dotsize,changed = GUI:InputInt("##dotsize",Rset.dotsize,1,1)
	if (changed) then
	Rset.dotsize = Rset.dotsize
	AetheryteHelper.SaveSettings()
	end
	if Rset.dotsize < 1 then Rset.dotsize = 1 end
	if Rset.dotsize > 10 then Rset.dotsize = 10 end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip168,mETp.tip168,mDTp.tip168,mFTp.tip168,mCTp.tip168,mKTp.tip168)
		end
	end
	GUI:SameLine()
	GUI:BeginGroup()
	GUI:Image(ImageFolder..[[R_line_on.png]],20,20)
	GUI:SameLine()
	GUI:PushItemWidth(70)
	Rset.linethick,changed = GUI:InputInt("##linethick",Rset.linethick,1,1)
	if (changed) then
	Rset.linethick = Rset.linethick
	AetheryteHelper.SaveSettings()
	end
	if Rset.linethick < 1 then Rset.linethick = 1 end
	if Rset.linethick > 10 then Rset.linethick = 10 end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip169,mETp.tip169,mDTp.tip169,mFTp.tip169,mCTp.tip169,mKTp.tip169)
		end
	end
	GUI:BeginGroup()
	GUI:Image(ImageFolder..[[R_TP_on.png]],20,20)
	GUI:SameLine()
	GUI:PushItemWidth(200)
	GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	R.ColorTPline.r,R.ColorTPline.g,R.ColorTPline.b,R.ColorTPline.a,changed = GUI:ColorEdit4("##ColourTPline",R.ColorTPline.r,R.ColorTPline.g,R.ColorTPline.b,R.ColorTPline.a)
	if (changed) then R.ColorTPline.U32 = GUI:ColorConvertFloat4ToU32(R.ColorTPline.r,R.ColorTPline.g,R.ColorTPline.b,R.ColorTPline.a)
	AetheryteHelper.SaveSettings()
	end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip196,mETp.tip196,mDTp.tip196,mFTp.tip196,mCTp.tip196,mKTp.tip196)
		end
	end
	GUI:SameLine()
	GUI:BeginGroup()
	GUI:PushItemWidth(70)
	Rset.TPlinethick,changed = GUI:InputInt("##TPlinethick",Rset.TPlinethick,1,1)
	if (changed) then
	Rset.TPlinethick = Rset.TPlinethick
	AetheryteHelper.SaveSettings()
	end
	if Rset.TPlinethick < 1 then Rset.TPlinethick = 1 end
	if Rset.TPlinethick > 10 then Rset.TPlinethick = 10 end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip169,mETp.tip169,mDTp.tip169,mFTp.tip169,mCTp.tip169,mKTp.tip169)
		end
	end
	GUI:BeginGroup()
	GUI:Image(ImageFolder..[[R_TM_on.png]],20,20)
	GUI:SameLine()
	GUI:PushItemWidth(200)
	GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	R.ColorTMline.r,R.ColorTMline.g,R.ColorTMline.b,R.ColorTMline.a,changed = GUI:ColorEdit4("##ColourTMline",R.ColorTMline.r,R.ColorTMline.g,R.ColorTMline.b,R.ColorTMline.a)
	if (changed) then R.ColorTMline.U32 = GUI:ColorConvertFloat4ToU32(R.ColorTMline.r,R.ColorTMline.g,R.ColorTMline.b,R.ColorTMline.a)
	AetheryteHelper.SaveSettings()
	end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip197,mETp.tip197,mDTp.tip197,mFTp.tip197,mCTp.tip197,mKTp.tip197)
		end
	end
	GUI:SameLine()
	GUI:BeginGroup()
	GUI:PushItemWidth(70)
	Rset.TMlinethick,changed = GUI:InputInt("##TMlinethick",Rset.TMlinethick,1,1)
	if (changed) then
	Rset.TMlinethick = Rset.TMlinethick
	AetheryteHelper.SaveSettings()
	end
	if Rset.TMlinethick < 1 then Rset.TMlinethick = 1 end
	if Rset.TMlinethick > 10 then Rset.TMlinethick = 10 end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip169,mETp.tip169,mDTp.tip169,mFTp.tip169,mCTp.tip169,mKTp.tip169)
		end
	end
	GUI:Spacing()
	GUI:Separator()
	GUI:Spacing()
	GUI:BeginGroup()
	GUI:Image(ImageFolder..[[R_icon_Player.png]],20,20)
	GUI:SameLine()
	GUI:PushItemWidth(200)
	GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	R.ColorPlayer.r,R.ColorPlayer.g,R.ColorPlayer.b,R.ColorPlayer.a,changed = GUI:ColorEdit4("##ColourPlayer",R.ColorPlayer.r,R.ColorPlayer.g,R.ColorPlayer.b,R.ColorPlayer.a)
	if (changed) then R.ColorPlayer.U32 = GUI:ColorConvertFloat4ToU32(R.ColorPlayer.r,R.ColorPlayer.g,R.ColorPlayer.b,R.ColorPlayer.a)
	AetheryteHelper.SaveSettings()
	end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		end
	end
	GUI:BeginGroup()
	GUI:Image(ImageFolder..[[R_icon_tori.png]],20,20)
	GUI:SameLine()
	GUI:PushItemWidth(200)
	GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	R.Colortori.r,R.Colortori.g,R.Colortori.b,R.Colortori.a,changed = GUI:ColorEdit4("##Colourtori",R.Colortori.r,R.Colortori.g,R.Colortori.b,R.Colortori.a)
	if (changed) then R.Colortori.U32 = GUI:ColorConvertFloat4ToU32(R.Colortori.r,R.Colortori.g,R.Colortori.b,R.Colortori.a)
	AetheryteHelper.SaveSettings()
	end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		end
	end
	GUI:BeginGroup()
	GUI:Image(ImageFolder..[[R_icon_pet.png]],20,20)
	GUI:SameLine()
	GUI:PushItemWidth(200)
	GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	R.Colorpet.r,R.Colorpet.g,R.Colorpet.b,R.Colorpet.a,changed = GUI:ColorEdit4("##Colourpet",R.Colorpet.r,R.Colorpet.g,R.Colorpet.b,R.Colorpet.a)
	if (changed) then R.Colorpet.U32 = GUI:ColorConvertFloat4ToU32(R.Colorpet.r,R.Colorpet.g,R.Colorpet.b,R.Colorpet.a)
	AetheryteHelper.SaveSettings()
	end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		end
	end
	GUI:BeginGroup()
	GUI:Image(ImageFolder..[[R_icon_mob.png]],20,20)
	GUI:SameLine()
	GUI:PushItemWidth(200)
	GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	R.ColorAttackable.r,R.ColorAttackable.g,R.ColorAttackable.b,R.ColorAttackable.a,changed = GUI:ColorEdit4("##ColourAttackable",R.ColorAttackable.r,R.ColorAttackable.g,R.ColorAttackable.b,R.ColorAttackable.a)
	if (changed) then R.ColorAttackable.U32 = GUI:ColorConvertFloat4ToU32(R.ColorAttackable.r,R.ColorAttackable.g,R.ColorAttackable.b,R.ColorAttackable.a)
	AetheryteHelper.SaveSettings()
	end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		end
	end
	GUI:BeginGroup()
	GUI:Image(ImageFolder..[[R_icon_npc.png]],20,20)
	GUI:SameLine()
	GUI:PushItemWidth(200)
	GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	R.ColorNPC.r,R.ColorNPC.g,R.ColorNPC.b,R.ColorNPC.a,changed = GUI:ColorEdit4("##ColourNPC",R.ColorNPC.r,R.ColorNPC.g,R.ColorNPC.b,R.ColorNPC.a)
	if (changed) then R.ColorNPC.U32 = GUI:ColorConvertFloat4ToU32(R.ColorNPC.r,R.ColorNPC.g,R.ColorNPC.b,R.ColorNPC.a)
	AetheryteHelper.SaveSettings()
	end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		end
	end
	GUI:BeginGroup()
	GUI:Image(ImageFolder..[[R_icon_chest.png]],20,20)
	GUI:SameLine()
	GUI:PushItemWidth(200)
	GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	R.Colorchest.r,R.Colorchest.g,R.Colorchest.b,R.Colorchest.a,changed = GUI:ColorEdit4("##Colourchest",R.Colorchest.r,R.Colorchest.g,R.Colorchest.b,R.Colorchest.a)
	if (changed) then R.Colorchest.U32 = GUI:ColorConvertFloat4ToU32(R.Colorchest.r,R.Colorchest.g,R.Colorchest.b,R.Colorchest.a)
	AetheryteHelper.SaveSettings()
	end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		end
	end
	GUI:BeginGroup()
	GUI:Image(ImageFolder..[[R_icon_aetheryte.png]],20,20)
	GUI:SameLine()
	GUI:PushItemWidth(200)
	GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	R.ColorAetheryte.r,R.ColorAetheryte.g,R.ColorAetheryte.b,R.ColorAetheryte.a,changed = GUI:ColorEdit4("##ColourAetheryte",R.ColorAetheryte.r,R.ColorAetheryte.g,R.ColorAetheryte.b,R.ColorAetheryte.a)
	if (changed) then R.ColorAetheryte.U32 = GUI:ColorConvertFloat4ToU32(R.ColorAetheryte.r,R.ColorAetheryte.g,R.ColorAetheryte.b,R.ColorAetheryte.a)
	AetheryteHelper.SaveSettings()
	end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		end
	end
	GUI:BeginGroup()
	GUI:Image(ImageFolder..[[R_icon_node.png]],20,20)
	GUI:SameLine()
	GUI:PushItemWidth(200)
	GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	R.ColorGathernode.r,R.ColorGathernode.g,R.ColorGathernode.b,R.ColorGathernode.a,changed = GUI:ColorEdit4("##ColourGathernode",R.ColorGathernode.r,R.ColorGathernode.g,R.ColorGathernode.b,R.ColorGathernode.a)
	if (changed) then R.ColorGathernode.U32 = GUI:ColorConvertFloat4ToU32(R.ColorGathernode.r,R.ColorGathernode.g,R.ColorGathernode.b,R.ColorGathernode.a)
	AetheryteHelper.SaveSettings()
	end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		end
	end
	GUI:BeginGroup()
	GUI:Image(ImageFolder..[[R_icon_AC.png]],20,20)
	GUI:SameLine()
	GUI:PushItemWidth(200)
	GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	R.Colorfumyaku.r,R.Colorfumyaku.g,R.Colorfumyaku.b,R.Colorfumyaku.a,changed = GUI:ColorEdit4("##Colourfumyaku",R.Colorfumyaku.r,R.Colorfumyaku.g,R.Colorfumyaku.b,R.Colorfumyaku.a)
	if (changed) then R.Colorfumyaku.U32 = GUI:ColorConvertFloat4ToU32(R.Colorfumyaku.r,R.Colorfumyaku.g,R.Colorfumyaku.b,R.Colorfumyaku.a)
	AetheryteHelper.SaveSettings()
	end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		end
	end
	GUI:BeginGroup()
	GUI:Image(ImageFolder..[[R_icon_minion.png]],20,20)
	GUI:SameLine()
	GUI:PushItemWidth(200)
	GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	R.Colorminion.r,R.Colorminion.g,R.Colorminion.b,R.Colorminion.a,changed = GUI:ColorEdit4("##Colourminion",R.Colorminion.r,R.Colorminion.g,R.Colorminion.b,R.Colorminion.a)
	if (changed) then R.Colorminion.U32 = GUI:ColorConvertFloat4ToU32(R.Colorminion.r,R.Colorminion.g,R.Colorminion.b,R.Colorminion.a)
	AetheryteHelper.SaveSettings()
	end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		end
	end
	GUI:BeginGroup()
	GUI:Image(ImageFolder..[[R_icon_kagu.png]],20,20)
	GUI:SameLine()
	GUI:PushItemWidth(200)
	GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	R.Colorkagu.r,R.Colorkagu.g,R.Colorkagu.b,R.Colorkagu.a,changed = GUI:ColorEdit4("##Colourkagu",R.Colorkagu.r,R.Colorkagu.g,R.Colorkagu.b,R.Colorkagu.a)
	if (changed) then R.Colorkagu.U32 = GUI:ColorConvertFloat4ToU32(R.Colorkagu.r,R.Colorkagu.g,R.Colorkagu.b,R.Colorkagu.a)
	AetheryteHelper.SaveSettings()
	end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		end
	end
	GUI:BeginGroup()
	GUI:Image(ImageFolder..[[R_icon_object.png]],20,20)
	GUI:SameLine()
	GUI:PushItemWidth(200)
	GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	R.Colorobject.r,R.Colorobject.g,R.Colorobject.b,R.Colorobject.a,changed = GUI:ColorEdit4("##Colourobject",R.Colorobject.r,R.Colorobject.g,R.Colorobject.b,R.Colorobject.a)
	if (changed) then R.Colorobject.U32 = GUI:ColorConvertFloat4ToU32(R.Colorobject.r,R.Colorobject.g,R.Colorobject.b,R.Colorobject.a)
	AetheryteHelper.SaveSettings()
	end
	GUI:PopItemWidth()
	GUI:EndGroup()
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		end
	end

end

---------------------------------------------------------------------------------------

function AetheryteHelper.RadarhuntDrow()
	GUI:BeginGroup()
	GUI:Image(ImageFolder..[[FF14_ARR.png]],72,25)
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip171,mETp.tip171,mDTp.tip171,mFTp.tip171,mCTp.tip171,mKTp.tip171)
		end
	end
	GUI:EndGroup()
	GUI:SameLine()
	GUI:BeginGroup()
	  if Rset.ARRB == true then
		GUI:Image(ImageFolder..[[R_mobB_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.ARRB = not Rset.ARRB
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.ARRB == false then
		GUI:Image(ImageFolder..[[R_mobB_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.ARRB = not Rset.ARRB
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip176,mETp.tip176,mDTp.tip176,mFTp.tip176,mCTp.tip176,mKTp.tip176)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.ARRA == true then
		GUI:Image(ImageFolder..[[R_mobA_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.ARRA = not Rset.ARRA
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.ARRA == false then
		GUI:Image(ImageFolder..[[R_mobA_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.ARRA = not Rset.ARRA
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip177,mETp.tip177,mDTp.tip177,mFTp.tip177,mCTp.tip177,mKTp.tip177)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.ARRS == true then
		GUI:Image(ImageFolder..[[R_mobS_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.ARRS = not Rset.ARRS
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.ARRS == false then
		GUI:Image(ImageFolder..[[R_mobS_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.ARRS = not Rset.ARRS
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip178,mETp.tip178,mDTp.tip178,mFTp.tip178,mCTp.tip178,mKTp.tip178)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.ARRFate == true then
		GUI:Image(ImageFolder..[[R_mobF_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.ARRFate = not Rset.ARRFate
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.ARRFate == false then
		GUI:Image(ImageFolder..[[R_mobF_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.ARRFate = not Rset.ARRFate
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip179,mETp.tip179,mDTp.tip179,mFTp.tip179,mCTp.tip179,mKTp.tip179)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	GUI:Image(ImageFolder..[[FF14_HW.png]],72,25)
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip172,mETp.tip172,mDTp.tip172,mFTp.tip172,mCTp.tip172,mKTp.tip172)
		end
	end
	GUI:EndGroup()
	GUI:SameLine()
	GUI:BeginGroup()
	  if Rset.HWB == true then
		GUI:Image(ImageFolder..[[R_mobB_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.HWB = not Rset.HWB
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.HWB == false then
		GUI:Image(ImageFolder..[[R_mobB_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.HWB = not Rset.HWB
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip176,mETp.tip176,mDTp.tip176,mFTp.tip176,mCTp.tip176,mKTp.tip176)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.HWA == true then
		GUI:Image(ImageFolder..[[R_mobA_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.HWA = not Rset.HWA
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.HWA == false then
		GUI:Image(ImageFolder..[[R_mobA_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.HWA = not Rset.HWA
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip177,mETp.tip177,mDTp.tip177,mFTp.tip177,mCTp.tip177,mKTp.tip177)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.HWS == true then
		GUI:Image(ImageFolder..[[R_mobS_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.HWS = not Rset.HWS
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.HWS == false then
		GUI:Image(ImageFolder..[[R_mobS_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.HWS = not Rset.HWS
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip178,mETp.tip178,mDTp.tip178,mFTp.tip178,mCTp.tip178,mKTp.tip178)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.HWFate == true then
		GUI:Image(ImageFolder..[[R_mobF_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.HWFate = not Rset.HWFate
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.HWFate == false then
		GUI:Image(ImageFolder..[[R_mobF_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.HWFate = not Rset.HWFate
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip179,mETp.tip179,mDTp.tip179,mFTp.tip179,mCTp.tip179,mKTp.tip179)
		end
	  end
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobB.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.ARRBC.r,R.ARRBC.g,R.ARRBC.b,R.ARRBC.a,changed = GUI:ColorEdit4("##RARRBC",R.ARRBC.r,R.ARRBC.g,R.ARRBC.b,R.ARRBC.a)
	  if (changed) then R.ARRBC.U32 = GUI:ColorConvertFloat4ToU32(R.ARRBC.r,R.ARRBC.g,R.ARRBC.b,R.ARRBC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobB.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.HWBC.r,R.HWBC.g,R.HWBC.b,R.HWBC.a,changed = GUI:ColorEdit4("##RHWBC",R.HWBC.r,R.HWBC.g,R.HWBC.b,R.HWBC.a)
	  if (changed) then R.HWBC.U32 = GUI:ColorConvertFloat4ToU32(R.HWBC.r,R.HWBC.g,R.HWBC.b,R.HWBC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobA.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.ARRAC.r,R.ARRAC.g,R.ARRAC.b,R.ARRAC.a,changed = GUI:ColorEdit4("##RARRAC",R.ARRAC.r,R.ARRAC.g,R.ARRAC.b,R.ARRAC.a)
	  if (changed) then R.ARRAC.U32 = GUI:ColorConvertFloat4ToU32(R.ARRAC.r,R.ARRAC.g,R.ARRAC.b,R.ARRAC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobA.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.HWAC.r,R.HWAC.g,R.HWAC.b,R.HWAC.a,changed = GUI:ColorEdit4("##RHWAC",R.HWAC.r,R.HWAC.g,R.HWAC.b,R.HWAC.a)
	  if (changed) then R.HWAC.U32 = GUI:ColorConvertFloat4ToU32(R.HWAC.r,R.HWAC.g,R.HWAC.b,R.HWAC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobS.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.ARRSC.r,R.ARRSC.g,R.ARRSC.b,R.ARRSC.a,changed = GUI:ColorEdit4("##RARRSC",R.ARRSC.r,R.ARRSC.g,R.ARRSC.b,R.ARRSC.a)
	  if (changed) then R.ARRSC.U32 = GUI:ColorConvertFloat4ToU32(R.ARRSC.r,R.ARRSC.g,R.ARRSC.b,R.ARRSC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobS.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.HWSC.r,R.HWSC.g,R.HWSC.b,R.HWSC.a,changed = GUI:ColorEdit4("##RHWSC",R.HWSC.r,R.HWSC.g,R.HWSC.b,R.HWSC.a)
	  if (changed) then R.HWSC.U32 = GUI:ColorConvertFloat4ToU32(R.HWSC.r,R.HWSC.g,R.HWSC.b,R.HWSC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobF.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.ARRFC.r,R.ARRFC.g,R.ARRFC.b,R.ARRFC.a,changed = GUI:ColorEdit4("##RARRFC",R.ARRFC.r,R.ARRFC.g,R.ARRFC.b,R.ARRFC.a)
	  if (changed) then R.ARRFC.U32 = GUI:ColorConvertFloat4ToU32(R.ARRFC.r,R.ARRFC.g,R.ARRFC.b,R.ARRFC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobF.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.HWFC.r,R.HWFC.g,R.HWFC.b,R.HWFC.a,changed = GUI:ColorEdit4("##RHWFC",R.HWFC.r,R.HWFC.g,R.HWFC.b,R.HWFC.a)
	  if (changed) then R.HWFC.U32 = GUI:ColorConvertFloat4ToU32(R.HWFC.r,R.HWFC.g,R.HWFC.b,R.HWFC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:Spacing()
	  GUI:BeginGroup()
	GUI:Image(ImageFolder..[[FF14_StB.png]],72,25)
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip173,mETp.tip173,mDTp.tip173,mFTp.tip173,mCTp.tip173,mKTp.tip173)
		end
	end
	GUI:EndGroup()
	GUI:SameLine()
	GUI:BeginGroup()
	  if Rset.StBB == true then
		GUI:Image(ImageFolder..[[R_mobB_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.StBB = not Rset.StBB
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.StBB == false then
		GUI:Image(ImageFolder..[[R_mobB_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.StBB = not Rset.StBB
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip176,mETp.tip176,mDTp.tip176,mFTp.tip176,mCTp.tip176,mKTp.tip176)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.StBA == true then
		GUI:Image(ImageFolder..[[R_mobA_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.StBA = not Rset.StBA
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.StBA == false then
		GUI:Image(ImageFolder..[[R_mobA_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.StBA = not Rset.StBA
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip177,mETp.tip177,mDTp.tip177,mFTp.tip177,mCTp.tip177,mKTp.tip177)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.StBS == true then
		GUI:Image(ImageFolder..[[R_mobS_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.StBS = not Rset.StBS
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.StBS == false then
		GUI:Image(ImageFolder..[[R_mobS_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.StBS = not Rset.StBS
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip178,mETp.tip178,mDTp.tip178,mFTp.tip178,mCTp.tip178,mKTp.tip178)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.StBFate == true then
		GUI:Image(ImageFolder..[[R_mobF_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.StBFate = not Rset.StBFate
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.StBFate == false then
		GUI:Image(ImageFolder..[[R_mobF_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.StBFate = not Rset.StBFate
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip179,mETp.tip179,mDTp.tip179,mFTp.tip179,mCTp.tip179,mKTp.tip179)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	GUI:Image(ImageFolder..[[FF14_ShB.png]],72,25)
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip174,mETp.tip174,mDTp.tip174,mFTp.tip174,mCTp.tip174,mKTp.tip174)
		end
	end
	GUI:EndGroup()
	GUI:SameLine()
	GUI:BeginGroup()
	  if Rset.ShBB == true then
		GUI:Image(ImageFolder..[[R_mobB_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.ShBB = not Rset.ShBB
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.ShBB == false then
		GUI:Image(ImageFolder..[[R_mobB_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.ShBB = not Rset.ShBB
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip176,mETp.tip176,mDTp.tip176,mFTp.tip176,mCTp.tip176,mKTp.tip176)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.ShBA == true then
		GUI:Image(ImageFolder..[[R_mobA_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.ShBA = not Rset.ShBA
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.ShBA == false then
		GUI:Image(ImageFolder..[[R_mobA_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.ShBA = not Rset.ShBA
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip177,mETp.tip177,mDTp.tip177,mFTp.tip177,mCTp.tip177,mKTp.tip177)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.ShBS == true then
		GUI:Image(ImageFolder..[[R_mobS_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.ShBS = not Rset.ShBS
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.ShBS == false then
		GUI:Image(ImageFolder..[[R_mobS_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.ShBS = not Rset.ShBS
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip178,mETp.tip178,mDTp.tip178,mFTp.tip178,mCTp.tip178,mKTp.tip178)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.ShBFate == true then
		GUI:Image(ImageFolder..[[R_mobF_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.ShBFate = not Rset.ShBFate
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.ShBFate == false then
		GUI:Image(ImageFolder..[[R_mobF_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.ShBFate = not Rset.ShBFate
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip179,mETp.tip179,mDTp.tip179,mFTp.tip179,mCTp.tip179,mKTp.tip179)
		end
	  end
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobB.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.StBBC.r,R.StBBC.g,R.StBBC.b,R.StBBC.a,changed = GUI:ColorEdit4("##RStBBC",R.StBBC.r,R.StBBC.g,R.StBBC.b,R.StBBC.a)
	  if (changed) then R.StBBC.U32 = GUI:ColorConvertFloat4ToU32(R.StBBC.r,R.StBBC.g,R.StBBC.b,R.StBBC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobB.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.ShBBC.r,R.ShBBC.g,R.ShBBC.b,R.ShBBC.a,changed = GUI:ColorEdit4("##RShBBC",R.ShBBC.r,R.ShBBC.g,R.ShBBC.b,R.ShBBC.a)
	  if (changed) then R.ShBBC.U32 = GUI:ColorConvertFloat4ToU32(R.ShBBC.r,R.ShBBC.g,R.ShBBC.b,R.ShBBC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobA.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.StBAC.r,R.StBAC.g,R.StBAC.b,R.StBAC.a,changed = GUI:ColorEdit4("##RStBAC",R.StBAC.r,R.StBAC.g,R.StBAC.b,R.StBAC.a)
	  if (changed) then R.StBAC.U32 = GUI:ColorConvertFloat4ToU32(R.StBAC.r,R.StBAC.g,R.StBAC.b,R.StBAC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobA.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.ShBAC.r,R.ShBAC.g,R.ShBAC.b,R.ShBAC.a,changed = GUI:ColorEdit4("##RShBAC",R.ShBAC.r,R.ShBAC.g,R.ShBAC.b,R.ShBAC.a)
	  if (changed) then R.ShBAC.U32 = GUI:ColorConvertFloat4ToU32(R.ShBAC.r,R.ShBAC.g,R.ShBAC.b,R.ShBAC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobS.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.StBSC.r,R.StBSC.g,R.StBSC.b,R.StBSC.a,changed = GUI:ColorEdit4("##RStBSC",R.StBSC.r,R.StBSC.g,R.StBSC.b,R.StBSC.a)
	  if (changed) then R.StBSC.U32 = GUI:ColorConvertFloat4ToU32(R.StBSC.r,R.StBSC.g,R.StBSC.b,R.StBSC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobS.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.ShBSC.r,R.ShBSC.g,R.ShBSC.b,R.ShBSC.a,changed = GUI:ColorEdit4("##RShBSC",R.ShBSC.r,R.ShBSC.g,R.ShBSC.b,R.ShBSC.a)
	  if (changed) then R.ShBSC.U32 = GUI:ColorConvertFloat4ToU32(R.ShBSC.r,R.ShBSC.g,R.ShBSC.b,R.ShBSC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobF.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.StBFC.r,R.StBFC.g,R.StBFC.b,R.StBFC.a,changed = GUI:ColorEdit4("##RStBFC",R.StBFC.r,R.StBFC.g,R.StBFC.b,R.StBFC.a)
	  if (changed) then R.StBFC.U32 = GUI:ColorConvertFloat4ToU32(R.StBFC.r,R.StBFC.g,R.StBFC.b,R.StBFC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobF.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.ShBFC.r,R.ShBFC.g,R.ShBFC.b,R.ShBFC.a,changed = GUI:ColorEdit4("##RShBFC",R.ShBFC.r,R.ShBFC.g,R.ShBFC.b,R.ShBFC.a)
	  if (changed) then R.ShBFC.U32 = GUI:ColorConvertFloat4ToU32(R.ShBFC.r,R.ShBFC.g,R.ShBFC.b,R.ShBFC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:BeginGroup()
	  GUI:Spacing()
	GUI:Image(ImageFolder..[[FF14_EW.png]],72,25)
	if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			AetheryteHelper.SetToolTips(mJTp.tip175,mETp.tip175,mDTp.tip175,mFTp.tip175,mCTp.tip175,mKTp.tip175)
		end
	end
	GUI:EndGroup()
	GUI:SameLine()
	GUI:BeginGroup()
	  if Rset.EWB == true then
		GUI:Image(ImageFolder..[[R_mobB_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.EWB = not Rset.EWB
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.EWB == false then
		GUI:Image(ImageFolder..[[R_mobB_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.EWB = not Rset.EWB
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip176,mETp.tip176,mDTp.tip176,mFTp.tip176,mCTp.tip176,mKTp.tip176)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.EWA == true then
		GUI:Image(ImageFolder..[[R_mobA_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.EWA = not Rset.EWA
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.EWA == false then
		GUI:Image(ImageFolder..[[R_mobA_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.EWA = not Rset.EWA
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip177,mETp.tip177,mDTp.tip177,mFTp.tip177,mCTp.tip177,mKTp.tip177)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.EWS == true then
		GUI:Image(ImageFolder..[[R_mobS_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.EWS = not Rset.EWS
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.EWS == false then
		GUI:Image(ImageFolder..[[R_mobS_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.EWS = not Rset.EWS
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip178,mETp.tip178,mDTp.tip178,mFTp.tip178,mCTp.tip178,mKTp.tip178)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.EWFate == true then
		GUI:Image(ImageFolder..[[R_mobF_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.EWFate = not Rset.EWFate
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.EWFate == false then
		GUI:Image(ImageFolder..[[R_mobF_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.EWFate = not Rset.EWFate
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip179,mETp.tip179,mDTp.tip179,mFTp.tip179,mCTp.tip179,mKTp.tip179)
		end
	  end
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobB.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.EWBC.r,R.EWBC.g,R.EWBC.b,R.EWBC.a,changed = GUI:ColorEdit4("##REWBC",R.EWBC.r,R.EWBC.g,R.EWBC.b,R.EWBC.a)
	  if (changed) then R.EWBC.U32 = GUI:ColorConvertFloat4ToU32(R.EWBC.r,R.EWBC.g,R.EWBC.b,R.EWBC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobA.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.EWAC.r,R.EWAC.g,R.EWAC.b,R.EWAC.a,changed = GUI:ColorEdit4("##REWAC",R.EWAC.r,R.EWAC.g,R.EWAC.b,R.EWAC.a)
	  if (changed) then R.EWAC.U32 = GUI:ColorConvertFloat4ToU32(R.EWAC.r,R.EWAC.g,R.EWAC.b,R.EWAC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobS.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.EWSC.r,R.EWSC.g,R.EWSC.b,R.EWSC.a,changed = GUI:ColorEdit4("##REWSC",R.EWSC.r,R.EWSC.g,R.EWSC.b,R.EWSC.a)
	  if (changed) then R.EWSC.U32 = GUI:ColorConvertFloat4ToU32(R.EWSC.r,R.EWSC.g,R.EWSC.b,R.EWSC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[R_icon_mobF.png]],20,20)
	  GUI:SameLine()
	  GUI:PushItemWidth(180)
	  GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  R.EWFC.r,R.EWFC.g,R.EWFC.b,R.EWFC.a,changed = GUI:ColorEdit4("##REWFC",R.EWFC.r,R.EWFC.g,R.EWFC.b,R.EWFC.a)
	  if (changed) then R.EWFC.U32 = GUI:ColorConvertFloat4ToU32(R.EWFC.r,R.EWFC.g,R.EWFC.b,R.EWFC.a)
	  AetheryteHelper.SaveSettings()
	  end
	  GUI:PopItemWidth()
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		  end
	  end
end

------------------------------------------------------------------------------------------------

function AetheryteHelper.RadarCustomListDrow()
	  GUI:Columns(2) GUI:SetColumnOffset(1, 360)
	  GUI:AlignFirstTextHeightToWidgets()
	  GUI:Text("ContentID/Name/Color/Line Thicks")
	  GUI:BeginGroup()
	  GUI:PushItemWidth(60)
	  Rcid = GUI:InputText( "##Cid", Rcid,GUI.InputTextFlags_CharsDecimal)
	  GUI:PopItemWidth()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip183,mETp.tip183,mDTp.tip183,mFTp.tip183,mCTp.tip183,mKTp.tip183)
		end
	  end
	  GUI:EndGroup()
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:PushItemWidth(150)
	  Rname = GUI:InputText( "##name", Rname)
	  GUI:PopItemWidth()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip184,mETp.tip184,mDTp.tip184,mFTp.tip184,mCTp.tip184,mKTp.tip184)
		end
	  end
	  GUI:EndGroup()
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:PushItemWidth()
	  GUI:ColorEditMode(GUI.ColorEditMode_NoInputs+GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions+GUI.ColorEditMode_NoTooltip)
	  Colour.r,Colour.g,Colour.b,Colour.a,changed = GUI:ColorEdit4("##Colour",Colour.r,Colour.g,Colour.b,Colour.a)
	  if (changed) then ColourU32 = GUI:ColorConvertFloat4ToU32(Colour.r,Colour.g,Colour.b,Colour.a) end
	  GUI:PopItemWidth()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		end
	  end
	  GUI:EndGroup()
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:PushItemWidth(70)
	  Rthicks = GUI:InputInt("##thicks",Rthicks,1,1)
	  GUI:PopItemWidth()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip169,mETp.tip169,mDTp.tip169,mFTp.tip169,mCTp.tip169,mKTp.tip169)
		end
	  end
	  if Rthicks < 1 then Rthicks = 1 end
	  if Rthicks > 10 then Rthicks = 10 end
	  GUI:EndGroup()
	  GUI:NextColumn()
	  GUI:AlignFirstTextHeightToWidgets()
	  GUI:Text("Get/Add")
	  GUI:BeginGroup()
	  GUI:ImageButton("###Rget",ImageFolder..[[R_get.png]], 20,20)
	  if GUI:IsItemHovered() then
		 if GUI:IsItemClicked(0) then
		 AetheryteHelper.Radarget()
		 end
		 if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip180,mETp.tip180,mDTp.tip180,mFTp.tip180,mCTp.tip180,mKTp.tip180)
		end
	  end
	  GUI:EndGroup()
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:ImageButton("###Radd",ImageFolder..[[R_add.png]], 20,20)
	  if GUI:IsItemHovered() then
		 if GUI:IsItemClicked(0) then
		 AetheryteHelper.Radaradd()
		 end
		 if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip181,mETp.tip181,mDTp.tip181,mFTp.tip181,mCTp.tip181,mKTp.tip181)
		end
	  end
	  GUI:EndGroup()
	  GUI:Columns()

	  GUI:Separator()
	  GUI:Spacing()
	  GUI:BeginChild("##AHRadarlist", 0, GUI_GetFrameHeight(14), true)
	  AetheryteHelper.Radarlist()
	  GUI:EndChild()
	  GUI:Spacing()
	  GUI:Separator()
end


--------------------------------------------------------------------------------------------------------------------
function AetheryteHelper.miniRadar()
  if (AetheryteHelper.miniRadarWindow.open) then
	local Rflags =  GUI.WindowFlags_NoTitleBar +  GUI.WindowFlags_NoFocusOnAppearing + GUI.WindowFlags_NoBringToFrontOnFocus + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoScrollbar
	GUI:SetNextWindowSize(120,40)
	 AetheryteHelper.miniRadarWindow.visible, AetheryteHelper.miniRadarWindow.open = GUI:Begin('AHminiRadar', AetheryteHelper.miniRadarWindow.open,Rflags)
	if (AetheryteHelper.miniRadarWindow.visible) then
	  GUI:BeginGroup()
	  if Rset.RadarEnable == true then
		GUI:Image(ImageFolder..[[R_on.png]],20,20)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.RadarEnable = not Rset.RadarEnable
		  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.RadarEnable == false then
		GUI:Image(ImageFolder..[[R_off.png]],20,20)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.RadarEnable = not Rset.RadarEnable
		  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip157,mETp.tip157,mDTp.tip157,mFTp.tip157,mCTp.tip157,mKTp.tip157)
		end
	  end
	  GUI:SameLine()
	  if Rcid == "" and Rname == "" then
	  GUI:BeginGroup()
	  GUI:ImageButton("###Rget",ImageFolder..[[R_get.png]], 20,20)
	  if GUI:IsItemHovered() then
		 if GUI:IsItemClicked(0) then
		 AetheryteHelper.Radarget()
		 end
		 if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip180,mETp.tip180,mDTp.tip180,mFTp.tip180,mCTp.tip180,mKTp.tip180)
		end
	  end
	  GUI:EndGroup()
	  elseif Rcid ~= nil and Rname ~= nil then
	  GUI:BeginGroup()
	  GUI:ImageButton("###Radd",ImageFolder..[[R_add.png]], 20,20)
	  if GUI:IsItemHovered() then
		 if GUI:IsItemClicked(0) then
		 AetheryteHelper.Radaradd()
		 end
		 if GUI:IsItemClicked(1) then
		 AetheryteHelper.Radarinitialize()
		 end
		 if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip189,mETp.tip189,mDTp.tip189,mFTp.tip189,mCTp.tip189,mKTp.tip189)
		end
	  end
	  GUI:EndGroup()
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:ImageButton("###Radar",ImageFolder..[[Radar.png]], 20,20)
	  if GUI:IsItemHovered() then
		 if GUI:IsItemClicked(0) then
		 AetheryteHelper.RadarWindow.open = not AetheryteHelper.RadarWindow.open
		 end
		 if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip190,mETp.tip190,mDTp.tip190,mFTp.tip190,mCTp.tip190,mKTp.tip190)
		end
	  end
	  GUI:EndGroup()

	end
  GUI:End()
  end
end

function AetheryteHelper.Radar()
  if (AetheryteHelper.RadarWindow.open) then
	local Rflags =  GUI.WindowFlags_ShowBorders + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoScrollbar
	GUI:SetNextWindowSize(440,600)
	 AetheryteHelper.RadarWindow.visible, AetheryteHelper.RadarWindow.open = GUI:Begin('AH Radar', AetheryteHelper.RadarWindow.open,Rflags)
	if (AetheryteHelper.RadarWindow.visible) then
	  GUI:BeginGroup()
	  if Rset.RadarEnable == true then
		GUI:Image(ImageFolder..[[R_on.png]],40,40)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.RadarEnable = not Rset.RadarEnable
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.RadarEnable == false then
		GUI:Image(ImageFolder..[[R_off.png]],40,40)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.RadarEnable = not Rset.RadarEnable
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip157,mETp.tip157,mDTp.tip157,mFTp.tip157,mCTp.tip157,mKTp.tip157)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.mydot == true then
		GUI:Image(ImageFolder..[[R_Pdot_on.png]],40,40)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.mydot = not Rset.mydot
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.mydot == false then
		GUI:Image(ImageFolder..[[R_Pdot_off.png]],40,40)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.mydot = not Rset.mydot
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip158,mETp.tip158,mDTp.tip158,mFTp.tip158,mCTp.tip158,mKTp.tip158)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.dot == true then
		GUI:Image(ImageFolder..[[R_dot_on.png]],40,40)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.dot = not Rset.dot
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.dot == false then
		GUI:Image(ImageFolder..[[R_dot_off.png]],40,40)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.dot = not Rset.dot
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip159,mETp.tip159,mDTp.tip159,mFTp.tip159,mCTp.tip159,mKTp.tip159)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.line == true then
		GUI:Image(ImageFolder..[[R_line_on.png]],40,40)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.line = not Rset.line
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.line == false then
		GUI:Image(ImageFolder..[[R_line_off.png]],40,40)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.line = not Rset.line
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip160,mETp.tip160,mDTp.tip160,mFTp.tip160,mCTp.tip160,mKTp.tip160)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.TPline == true then
		GUI:Image(ImageFolder..[[R_TP_on.png]],40,40)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.TPline = not Rset.TPline
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.TPline == false then
		GUI:Image(ImageFolder..[[R_TP_off.png]],40,40)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.TPline = not Rset.TPline
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip161,mETp.tip161,mDTp.tip161,mFTp.tip161,mCTp.tip161,mKTp.tip161)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.TMline == true then
		GUI:Image(ImageFolder..[[R_TM_on.png]],40,40)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.TMline = not Rset.TMline
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.TMline == false then
		GUI:Image(ImageFolder..[[R_TM_off.png]],40,40)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.TMline = not Rset.TMline
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip162,mETp.tip162,mDTp.tip162,mFTp.tip162,mCTp.tip162,mKTp.tip162)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.cutoff == true then
		GUI:Image(ImageFolder..[[R_cut_on.png]],40,40)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.cutoff = not Rset.cutoff
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.cutoff == false then
		GUI:Image(ImageFolder..[[R_cut_off.png]],40,40)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.cutoff = not Rset.cutoff
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip163,mETp.tip163,mDTp.tip163,mFTp.tip163,mCTp.tip163,mKTp.tip163)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.gposeoff == true then
		GUI:Image(ImageFolder..[[R_gp_on.png]],40,40)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.gposeoff = not Rset.gposeoff
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.gposeoff == false then
		GUI:Image(ImageFolder..[[R_gp_off.png]],40,40)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.gposeoff = not Rset.gposeoff
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip164,mETp.tip164,mDTp.tip164,mFTp.tip164,mCTp.tip164,mKTp.tip164)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.indutyoff == true then
		GUI:Image(ImageFolder..[[R_id_on.png]],40,40)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.indutyoff = not Rset.indutyoff
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.indutyoff == false then
		GUI:Image(ImageFolder..[[R_id_off.png]],40,40)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.indutyoff = not Rset.indutyoff
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip165,mETp.tip165,mDTp.tip165,mFTp.tip165,mCTp.tip165,mKTp.tip165)
		end
	  end
	  GUI:Spacing()
	  GUI:Separator()
	  GUI:Spacing()
	  GUI:BeginGroup()
	  if Rset.Player == true then
		GUI:Image(ImageFolder..[[R_Player_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.Player = not Rset.Player
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.Player == false then
		GUI:Image(ImageFolder..[[R_Player_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.Player = not Rset.Player
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip144,mETp.tip144,mDTp.tip144,mFTp.tip144,mCTp.tip144,mKTp.tip144)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.tori == true then
		GUI:Image(ImageFolder..[[R_tori_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.tori = not Rset.tori
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.tori == false then
		GUI:Image(ImageFolder..[[R_tori_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.tori = not Rset.tori
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip153,mETp.tip153,mDTp.tip153,mFTp.tip153,mCTp.tip153,mKTp.tip153)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.pet == true then
		GUI:Image(ImageFolder..[[R_pet_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.pet = not Rset.pet
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.pet == false then
		GUI:Image(ImageFolder..[[R_pet_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.pet = not Rset.pet
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip154,mETp.tip154,mDTp.tip154,mFTp.tip154,mCTp.tip154,mKTp.tip154)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.Attackable == true then
		GUI:Image(ImageFolder..[[R_mob_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.Attackable = not Rset.Attackable
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.Attackable == false then
		GUI:Image(ImageFolder..[[R_mob_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.Attackable = not Rset.Attackable
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip145,mETp.tip145,mDTp.tip145,mFTp.tip145,mCTp.tip145,mKTp.tip145)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.NPC == true then
		GUI:Image(ImageFolder..[[R_npc_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.NPC = not Rset.NPC
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.NPC == false then
		GUI:Image(ImageFolder..[[R_npc_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.NPC = not Rset.NPC
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip146,mETp.tip146,mDTp.tip146,mFTp.tip146,mCTp.tip146,mKTp.tip146)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.chest == true then
		GUI:Image(ImageFolder..[[R_chest_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.chest = not Rset.chest
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.chest == false then
		GUI:Image(ImageFolder..[[R_chest_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.chest = not Rset.chest
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip147,mETp.tip147,mDTp.tip147,mFTp.tip147,mCTp.tip147,mKTp.tip147)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.Aetheryte == true then
		GUI:Image(ImageFolder..[[R_aetheryte_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.Aetheryte = not Rset.Aetheryte
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.Aetheryte == false then
		GUI:Image(ImageFolder..[[R_aetheryte_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.Aetheryte = not Rset.Aetheryte
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip150,mETp.tip150,mDTp.tip150,mFTp.tip150,mCTp.tip150,mKTp.tip150)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.Gathernode == true then
		GUI:Image(ImageFolder..[[R_node_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.Gathernode = not Rset.Gathernode
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.Gathernode == false then
		GUI:Image(ImageFolder..[[R_node_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.Gathernode = not Rset.Gathernode
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip155,mETp.tip155,mDTp.tip155,mFTp.tip155,mCTp.tip155,mKTp.tip155)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.fumyaku == true then
		GUI:Image(ImageFolder..[[R_AC_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.fumyaku = not Rset.fumyaku
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.fumyaku == false then
		GUI:Image(ImageFolder..[[R_AC_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.fumyaku = not Rset.fumyaku
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip188,mETp.tip188,mDTp.tip188,mFTp.tip188,mCTp.tip188,mKTp.tip188)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.minion == true then
		GUI:Image(ImageFolder..[[R_minion_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.minion = not Rset.minion
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.minion == false then
		GUI:Image(ImageFolder..[[R_minion_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.minion = not Rset.minion
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip156,mETp.tip156,mDTp.tip156,mFTp.tip156,mCTp.tip156,mKTp.tip156)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.kagu == true then
		GUI:Image(ImageFolder..[[R_kagu_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.kagu = not Rset.kagu
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.kagu == false then
		GUI:Image(ImageFolder..[[R_kagu_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.kagu = not Rset.kagu
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip149,mETp.tip149,mDTp.tip149,mFTp.tip149,mCTp.tip149,mKTp.tip149)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.object == true then
		GUI:Image(ImageFolder..[[R_object_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.object = not Rset.object
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.object == false then
		GUI:Image(ImageFolder..[[R_object_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.object = not Rset.object
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip151,mETp.tip151,mDTp.tip151,mFTp.tip151,mCTp.tip151,mKTp.tip151)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if Rset.hunt == true then
		GUI:Image(ImageFolder..[[R_hunt_on.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.hunt = not Rset.hunt
	  AetheryteHelper.SaveSettings()
		  end
		end
	  elseif Rset.hunt == false then
		GUI:Image(ImageFolder..[[R_hunt_off.png]],25,25)
		if GUI:IsItemHovered() then
		  if GUI:IsItemClicked(0) then
		  Rset.hunt = not Rset.hunt
	  AetheryteHelper.SaveSettings()
		  end
		end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip170,mETp.tip170,mDTp.tip170,mFTp.tip170,mCTp.tip170,mKTp.tip170)
		end
	  end

	  GUI:Spacing()
	  GUI:Separator()
	  GUI:Spacing()
	  GUI:AlignFirstTextHeightToWidgets()
	  GUI:Text("Advanced Settings")
	  if Rset.fumyaku == true and Rset.chest == true then
	  GUI:SameLine()
	  GUI:TextColored(1,1,0,1,"Drow Sightseeing Log for EW")
	  end
	  GUI:Spacing()
	  GUI:BeginGroup()
	  if AHRadarGeneral == true then
	  GUI:PushStyleColor(GUI.Col_Button,1,0,0,1)
	  GUI:PushStyleColor(GUI.Col_ButtonHovered,1,0,0,1)
	  GUI:Button("General",80,20)
	  GUI:PopStyleColor(2)
	  else
	  GUI:PushStyleColor(GUI.Col_ButtonHovered,1,0.3,0,1)
	  GUI:Button("General",80,20)
	  GUI:PopStyleColor()
	  if GUI:IsItemHovered() then
		if GUI:IsItemClicked(0) then
		  AHRadarGeneral = true
		  AHRadarhunt = false
		  AHRadarCustomList = false
		end
	  end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip187,mETp.tip187,mDTp.tip187,mFTp.tip187,mCTp.tip187,mKTp.tip187)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if AHRadarhunt == true then
	  GUI:PushStyleColor(GUI.Col_Button,1,0,0,1)
	  GUI:PushStyleColor(GUI.Col_ButtonHovered,1,0,0,1)
	  GUI:Button("Hunt",80,20)
	  GUI:PopStyleColor(2)
	  else
	  GUI:PushStyleColor(GUI.Col_ButtonHovered,1,0.3,0,1)
	  GUI:Button("Hunt",80,20)
	  GUI:PopStyleColor()
	  if GUI:IsItemHovered() then
		if GUI:IsItemClicked(0) then
		  AHRadarGeneral = false
		  AHRadarhunt = true
		  AHRadarCustomList = false
		end
	  end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip186,mETp.tip186,mDTp.tip186,mFTp.tip186,mCTp.tip186,mKTp.tip186)
		end
	  end
	  GUI:SameLine()
	  GUI:BeginGroup()
	  if AHRadarCustomList == true then
	  GUI:PushStyleColor(GUI.Col_Button,1,0,0,1)
	  GUI:PushStyleColor(GUI.Col_ButtonHovered,1,0,0,1)
	  GUI:Button("CustomList",80,20)
	  GUI:PopStyleColor(2)
	  else
	  GUI:PushStyleColor(GUI.Col_ButtonHovered,1,0.3,0,1)
	  GUI:Button("CustomList",80,20)
	  GUI:PopStyleColor()
	  if GUI:IsItemHovered() then
		if GUI:IsItemClicked(0) then
		  AHRadarGeneral = false
		  AHRadarhunt = false
		  AHRadarCustomList = true
		end
	  end
	  end
	  GUI:EndGroup()
	  if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip185,mETp.tip185,mDTp.tip185,mFTp.tip185,mCTp.tip185,mKTp.tip185)
		end
	  end

	  GUI:Spacing()
	  GUI:Separator()
	  GUI:Spacing()
	  if AHRadarGeneral == true then
	  AetheryteHelper.RadarGeneralDrow()
	  end
	  if AHRadarhunt == true then
	  AetheryteHelper.RadarhuntDrow()
	  end
	  if AHRadarCustomList == true then
	  AetheryteHelper.RadarCustomListDrow()
	  end
	end
	GUI:End()
  end
end

---------------------------------------------------------------
function AHRadarline(str,Colour,thick)
local ppos = {x = math.round(Player.pos.x,2), y = math.round(Player.pos.y,2), z = math.round(Player.pos.z,2)}
local screenppos = RenderManager:WorldToScreen(ppos)
local el = MEntityList(str)
	  if table.valid(el) then
	  for _,e in pairs(el) do
	  local tpos = {x = math.round(e.pos.x,2), y = math.round(e.pos.y,2), z = math.round(e.pos.z,2)}
	  local screentpos = RenderManager:WorldToScreen(tpos)
	  if not IsControlOpen("NowLoading") and not IsControlOpen("HudLayout") and screentpos ~= nil and e.targetable == true then
			   if Rset.indutyoff == true and Rset.gposeoff == true and Rset.cutoff == true then
				  if Player.onlinestatus ~= 18 and Player.onlinestatus ~= 15 and Duty:GetQueueStatus() < 4 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.gposeoff == true and Rset.cutoff == true then
				  if Player.onlinestatus ~= 18 and Player.onlinestatus ~= 15 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.gposeoff == true and Rset.indutyoff == true then
				  if Player.onlinestatus ~= 18 and Duty:GetQueueStatus() < 4 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.cutoff == true and Rset.indutyoff == true then
				  if Player.onlinestatus ~= 15 and Duty:GetQueueStatus() < 4 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.indutyoff == true then
				  if  Duty:GetQueueStatus() < 4 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.cutoff == true then
				  if Player.onlinestatus ~= 15 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.gposeoff == true then
				  if Player.onlinestatus ~= 18 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   else
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
			   end
	  end
	  end
	  end
return str,Colour,thick
end

function AHRadarEXline(str,Colour,thick)
local ppos = {x = math.round(Player.pos.x,2), y = math.round(Player.pos.y,2), z = math.round(Player.pos.z,2)}
local screenppos = RenderManager:WorldToScreen(ppos)
local el = MEntityList(str)
	  if table.valid(el) then
	  for _,e in pairs(el) do
	  local tpos = {x = math.round(e.pos.x,2), y = math.round(e.pos.y,2), z = math.round(e.pos.z,2)}
	  local screentpos = RenderManager:WorldToScreen(tpos)
	  if not IsControlOpen("NowLoading") and not IsControlOpen("HudLayout") and screentpos ~= nil then
			   if Rset.indutyoff == true and Rset.gposeoff == true and Rset.cutoff == true then
				  if Player.onlinestatus ~= 18 and Player.onlinestatus ~= 15 and Duty:GetQueueStatus() < 4 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.gposeoff == true and Rset.cutoff == true then
				  if Player.onlinestatus ~= 18 and Player.onlinestatus ~= 15 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.gposeoff == true and Rset.indutyoff == true then
				  if Player.onlinestatus ~= 18 and Duty:GetQueueStatus() < 4 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.cutoff == true and Rset.indutyoff == true then
				  if Player.onlinestatus ~= 15 and Duty:GetQueueStatus() < 4 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.indutyoff == true then
				  if  Duty:GetQueueStatus() < 4 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.cutoff == true then
				  if Player.onlinestatus ~= 15 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.gposeoff == true then
				  if Player.onlinestatus ~= 18 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   else
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
			   end
	  end
	  end
	  end
return str,Colour,thick
end
----------------------------------------------------------------------------------------------------------

function AHRadarlineNPC(str,Colour,thick)
local ppos = {x = math.round(Player.pos.x,2), y = math.round(Player.pos.y,2), z = math.round(Player.pos.z,2)}
local screenppos = RenderManager:WorldToScreen(ppos)
local el = MEntityList(str)
	  if table.valid(el) then
	  for _,e in pairs(el) do
	  local tpos = {x = math.round(e.pos.x,2), y = math.round(e.pos.y,2), z = math.round(e.pos.z,2)}
	  local screentpos = RenderManager:WorldToScreen(tpos)
	  if not IsControlOpen("NowLoading") and not IsControlOpen("HudLayout") and screentpos ~= nil and e.targetable == true and e.attackable == false then
			   if Rset.indutyoff == true and Rset.gposeoff == true and Rset.cutoff == true then
				  if Player.onlinestatus ~= 18 and Player.onlinestatus ~= 15 and Duty:GetQueueStatus() < 4 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.gposeoff == true and Rset.cutoff == true then
				  if Player.onlinestatus ~= 18 and Player.onlinestatus ~= 15 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.gposeoff == true and Rset.indutyoff == true then
				  if Player.onlinestatus ~= 18 and Duty:GetQueueStatus() < 4 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.cutoff == true and Rset.indutyoff == true then
				  if Player.onlinestatus ~= 15 and Duty:GetQueueStatus() < 4 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.indutyoff == true then
				  if  Duty:GetQueueStatus() < 4 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.cutoff == true then
				  if Player.onlinestatus ~= 15 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.gposeoff == true then
				  if Player.onlinestatus ~= 18 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   else
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
			   end
	  end
	  end
	  end
return str,Colour,thick
end

--------------------------------------------------------------------------------------------------------------

function AHRadarRecetveline(str,Colour,thick)
local ppos = {x = math.round(Player.pos.x,2), y = math.round(Player.pos.y,2), z = math.round(Player.pos.z,2)}
local screenppos = RenderManager:WorldToScreen(ppos)
local el = MEntityList(str)
	  if table.valid(el) then
	  for _,e in pairs(el) do
	  local targetname = ""
	  if (e.targetid ~= 0) then
	  local target = EntityList:Get(e.targetid)
	  if (target and target.name ~= nil) then
	  targetname = target.name
	  local tpos = {x = math.round(e.pos.x,2), y = math.round(e.pos.y,2), z = math.round(e.pos.z,2)}
	  local screentpos = RenderManager:WorldToScreen(tpos)
			if tostring(targetname) == tostring(Player.name) and screentpos ~= nil and not IsControlOpen("NowLoading") and not IsControlOpen("HudLayout") then
			   if Rset.indutyoff == true and Rset.gposeoff == true and Rset.cutoff == true then
				  if Player.onlinestatus ~= 18 and Player.onlinestatus ~= 15 and Duty:GetQueueStatus() < 4 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.gposeoff == true and Rset.cutoff == true then
				  if Player.onlinestatus ~= 18 and Player.onlinestatus ~= 15 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.gposeoff == true and Rset.indutyoff == true then
				  if Player.onlinestatus ~= 18 and Duty:GetQueueStatus() < 4 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.cutoff == true and Rset.indutyoff == true then
				  if Player.onlinestatus ~= 15 and Duty:GetQueueStatus() < 4 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.indutyoff == true then
				  if  Duty:GetQueueStatus() < 4 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.cutoff == true then
				  if Player.onlinestatus ~= 15 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   elseif Rset.gposeoff == true then
				  if Player.onlinestatus ~= 18 then
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
				  end
			   else
				  GUI:AddLine(screenppos.x, screenppos.y, screentpos.x, screentpos.y,Colour,thick)
			   end
			end
	  end
	  end
	  end
	  end
return str,Colour,thick
end

-----------------------------------------------------------------------------------------------------

function AHRadardot(str,Colour,size)
local ppos = {x = math.round(Player.pos.x,2), y = math.round(Player.pos.y,2), z = math.round(Player.pos.z,2)}
local screenppos = RenderManager:WorldToScreen(ppos)
local el = MEntityList(str)
	  if table.valid(el) then
	  for _,e in pairs(el) do
	  local tpos = {x = math.round(e.pos.x,2), y = math.round(e.pos.y,2), z = math.round(e.pos.z,2)}
	  local screentpos = RenderManager:WorldToScreen(tpos)
	  if not IsControlOpen("NowLoading") and not IsControlOpen("HudLayout") and screentpos ~= nil and e.targetable == true then
			   if Rset.indutyoff == true and Rset.gposeoff == true and Rset.cutoff == true then
				  if Player.onlinestatus ~= 18 and Player.onlinestatus ~= 15 and Duty:GetQueueStatus() < 4 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   elseif Rset.gposeoff == true and Rset.cutoff == true then
				  if Player.onlinestatus ~= 18 and Player.onlinestatus ~= 15 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   elseif Rset.gposeoff == true and Rset.indutyoff == true then
				  if Player.onlinestatus ~= 18 and Duty:GetQueueStatus() < 4 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   elseif Rset.cutoff == true and Rset.indutyoff == true then
				  if Player.onlinestatus ~= 15 and Duty:GetQueueStatus() < 4 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   elseif Rset.indutyoff == true then
				  if  Duty:GetQueueStatus() < 4 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   elseif Rset.cutoff == true then
				  if Player.onlinestatus ~= 15 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   elseif Rset.gposeoff == true then
				  if Player.onlinestatus ~= 18 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   else
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
			   end
	  end
	  end
	  end
return str,Colour,size
end

function AHRadarEXdot(str,Colour,size)
local ppos = {x = math.round(Player.pos.x,2), y = math.round(Player.pos.y,2), z = math.round(Player.pos.z,2)}
local screenppos = RenderManager:WorldToScreen(ppos)
local el = MEntityList(str)
	  if table.valid(el) then
	  for _,e in pairs(el) do
	  local tpos = {x = math.round(e.pos.x,2), y = math.round(e.pos.y,2), z = math.round(e.pos.z,2)}
	  local screentpos = RenderManager:WorldToScreen(tpos)
	  if not IsControlOpen("NowLoading") and not IsControlOpen("HudLayout") and screentpos ~= nil then
			   if Rset.indutyoff == true and Rset.gposeoff == true and Rset.cutoff == true then
				  if Player.onlinestatus ~= 18 and Player.onlinestatus ~= 15 and Duty:GetQueueStatus() < 4 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   elseif Rset.gposeoff == true and Rset.cutoff == true then
				  if Player.onlinestatus ~= 18 and Player.onlinestatus ~= 15 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   elseif Rset.gposeoff == true and Rset.indutyoff == true then
				  if Player.onlinestatus ~= 18 and Duty:GetQueueStatus() < 4 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   elseif Rset.cutoff == true and Rset.indutyoff == true then
				  if Player.onlinestatus ~= 15 and Duty:GetQueueStatus() < 4 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   elseif Rset.indutyoff == true then
				  if  Duty:GetQueueStatus() < 4 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   elseif Rset.cutoff == true then
				  if Player.onlinestatus ~= 15 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   elseif Rset.gposeoff == true then
				  if Player.onlinestatus ~= 18 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   else
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
			   end
	  end
	  end
	  end
return str,Colour,size
end
------------------------------------------------------------------------------------------

function AHRadardotNPC(str,Colour,size)
local ppos = {x = math.round(Player.pos.x,2), y = math.round(Player.pos.y,2), z = math.round(Player.pos.z,2)}
local screenppos = RenderManager:WorldToScreen(ppos)
local el = MEntityList(str)
	  if table.valid(el) then
	  for _,e in pairs(el) do
	  local tpos = {x = math.round(e.pos.x,2), y = math.round(e.pos.y,2), z = math.round(e.pos.z,2)}
	  local screentpos = RenderManager:WorldToScreen(tpos)
	  if not IsControlOpen("NowLoading") and not IsControlOpen("HudLayout") and screentpos ~= nil and e.targetable == true and e.attackable == false then
			   if Rset.indutyoff == true and Rset.gposeoff == true and Rset.cutoff == true then
				  if Player.onlinestatus ~= 18 and Player.onlinestatus ~= 15 and Duty:GetQueueStatus() < 4 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   elseif Rset.gposeoff == true and Rset.cutoff == true then
				  if Player.onlinestatus ~= 18 and Player.onlinestatus ~= 15 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   elseif Rset.gposeoff == true and Rset.indutyoff == true then
				  if Player.onlinestatus ~= 18 and Duty:GetQueueStatus() < 4 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   elseif Rset.cutoff == true and Rset.indutyoff == true then
				  if Player.onlinestatus ~= 15 and Duty:GetQueueStatus() < 4 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   elseif Rset.indutyoff == true then
				  if  Duty:GetQueueStatus() < 4 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   elseif Rset.cutoff == true then
				  if Player.onlinestatus ~= 15 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   elseif Rset.gposeoff == true then
				  if Player.onlinestatus ~= 18 then
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
				  end
			   else
				  GUI:AddCircleFilled(screentpos.x, screentpos.y,size,Colour)
			   end
	  end
	  end
	  end
return str,Colour,size
end


------------------------------------------------------------------------------------------------

function AetheryteHelper.DrawlineandDot(event, ticks)

  local maxWidth, maxHeight = GUI:GetScreenSize()
  GUI:SetNextWindowPos(0, 0, GUI.SetCond_Always)
  GUI:SetNextWindowSize(maxWidth,maxHeight,GUI.SetCond_Always)
  GUI:PushStyleColor(GUI.Col_WindowBg, 0, 0, 0, 0)
  flags = (GUI.WindowFlags_NoInputs + GUI.WindowFlags_NoBringToFrontOnFocus + GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_NoResize + GUI.WindowFlags_NoScrollbar + GUI.WindowFlags_NoCollapse)
  GUI:Begin("line", true, flags)
  local ppos = {x = math.round(Player.pos.x,2), y = math.round(Player.pos.y,2), z = math.round(Player.pos.z,2)}
  local screenppos = RenderManager:WorldToScreen(ppos)



  if Rset.RadarEnable == true and Rset.line == true then
	if Rset.object == true then
	AHRadarline("type=7,",R.Colorobject.U32,Rset.linethick)
	end
	if Rset.kagu == true then
	AHRadarline("type=12,",R.Colorkagu.U32,Rset.linethick)
	end
	if Rset.minion == true then
	AHRadarline("type=9,",R.Colorminion.U32,Rset.linethick)
	end
	if Rset.Gathernode == true then
	AHRadarline("type=6,",R.ColorGathernode.U32,Rset.linethick)
	end
	if Rset.Aetheryte == true then
	AHRadarline("type=5,",R.ColorAetheryte.U32,Rset.linethick)
	end
	if Rset.chest == true then
	AHRadarline("type=4,",R.Colorchest.U32,Rset.linethick)
	end
	if Rset.NPC == true then
	AHRadarlineNPC("type=2,alive,",R.ColorNPC.U32,Rset.linethick)
	AHRadarlineNPC("type=3,",R.ColorNPC.U32,Rset.linethick)
	end
	if Rset.pet == true then
	AHRadarlineNPC("type=2,alive,contentID=1398,contentID=1399,contentID=10261,",R.Colorpet.U32,Rset.linethick)
	end
	if Rset.tori == true then
	AHRadarlineNPC("type=2,alive,contentID=952",R.Colortori.U32,Rset.linethick)
	end
	if Rset.Attackable == true then
	AHRadarline("type=2,alive,",R.ColorAttackable.U32,Rset.linethick)
	end
	if Rset.Player == true then
	AHRadarline("type=1",R.ColorPlayer.U32,Rset.linethick)
	end
  end

  if Rset.RadarEnable == true and Rset.line == true and Rset.hunt == true then
   if Player.localmapid == 148 or Player.localmapid == 152 or Player.localmapid == 153 or Player.localmapid == 154 or
   	Player.localmapid == 135 or Player.localmapid == 137 or Player.localmapid == 138 or Player.localmapid == 139 or
   	Player.localmapid == 180 or Player.localmapid == 140 or Player.localmapid == 145 or Player.localmapid == 146 or
   	Player.localmapid == 147 or Player.localmapid == 155 or Player.localmapid == 156 or Player.localmapid == 141 or
   	Player.localmapid == 134 then 
	 if Rset.ARRB == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.ARR.B) do
		AHRadarline("type=2,alive,attackable,contentID="..tostring(v),R.ARRBC.U32,Rset.linethick)
	 end
	 end
	 if Rset.ARRA == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.ARR.A) do
		AHRadarline("type=2,alive,attackable,aggressive,contentID="..tostring(v),R.ARRAC.U32,Rset.linethick)
	 end
	 end
	 if Rset.ARRS == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.ARR.S) do
		AHRadarline("type=2,alive,attackable,aggressive,contentID="..tostring(v),R.ARRSC.U32,Rset.linethick)
	 end
	 end
	 if Rset.ARRFate == true then
		AHRadarline("type=2,alive,attackable,aggressive,contentID=887",R.ARRFC.U32,Rset.linethick)
		AHRadarline("type=2,alive,attackable,aggressive,contentID=655",R.ARRFC.U32,Rset.linethick)
	 end
	 end

	 if Player.localmapid == 397 or Player.localmapid == 401 or Player.localmapid == 402 or Player.localmapid == 398 or
	 	Player.localmapid == 400 or Player.localmapid == 399 then
	 if Rset.HWB == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.HW.B) do
		AHRadarline("type=2,alive,attackable,contentID="..tostring(v),R.HWBC.U32,Rset.linethick)
	 end
	 end
	 if Rset.HWA == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.HW.A) do
		AHRadarline("type=2,alive,attackable,aggressive,contentID="..tostring(v),R.HWAC.U32,Rset.linethick)
	 end
	 end
	 if Rset.HWS == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.HW.S) do
		AHRadarline("type=2,alive,attackable,aggressive,contentID="..tostring(v),R.HWSC.U32,Rset.linethick)
	 end
	 end
	 if Rset.HWFate == true then
		AHRadarline("type=2,alive,attackable,aggressive,contentID=3783",R.HWFC.U32,Rset.linethick)
		AHRadarline("type=2,alive,attackable,aggressive,contentID=3789",R.HWFC.U32,Rset.linethick)
	 end
	 end

	 if Player.localmapid == 612 or Player.localmapid == 620 or Player.localmapid == 621 or Player.localmapid == 613 or
	 	Player.localmapid == 614 or Player.localmapid == 622 then
	 if Rset.StBB == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.StB.B) do
		AHRadarline("type=2,alive,attackable,contentID="..tostring(v),R.StBBC.U32,Rset.linethick)
	 end
	 end
	 if Rset.StBA == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.StB.A) do
		AHRadarline("type=2,alive,attackable,aggressive,contentID="..tostring(v),R.StBAC.U32,Rset.linethick)
	 end
	 end
	 if Rset.StBS == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.StB.S) do
		AHRadarline("type=2,alive,attackable,aggressive,contentID="..tostring(v),R.StBSC.U32,Rset.linethick)
	 end
	 end
	 if Rset.StBFate == true then
		AHRadarline("type=2,alive,attackable,aggressive,contentID=6395",R.StBFC.U32,Rset.linethick)
		AHRadarline("type=2,alive,attackable,aggressive,contentID=6392",R.StBFC.U32,Rset.linethick)
		AHRadarline("type=2,alive,attackable,aggressive,contentID=6290",R.StBFC.U32,Rset.linethick)
	 end
	 end

	 if Player.localmapid == 813 or Player.localmapid == 814 or Player.localmapid == 815 or Player.localmapid == 817 or
	 	Player.localmapid == 816 or Player.localmapid == 818 then
	 if Rset.ShBB == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.ShB.B) do
		AHRadarline("type=2,alive,attackable,contentID="..tostring(v),R.ShBBC.U32,Rset.linethick)
	 end
	 end
	 if Rset.ShBA == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.ShB.A) do
		AHRadarline("type=2,alive,attackable,aggressive,contentID="..tostring(v),R.ShBAC.U32,Rset.linethick)
	 end
	 end
	 if Rset.ShBS == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.ShB.S) do
		AHRadarline("type=2,alive,attackable,aggressive,contentID="..tostring(v),R.ShBSC.U32,Rset.linethick)
	 end
	 end
	 if Rset.ShBFate == true then
		AHRadarline("type=2,alive,attackable,aggressive,contentID=8234",R.ShBFC.U32,Rset.linethick)
		AHRadarline("type=2,alive,attackable,aggressive,contentID=8822",R.ShBFC.U32,Rset.linethick)
	 end
	 end

	 if Player.localmapid == 956 or Player.localmapid == 957 or Player.localmapid == 958 or Player.localmapid == 959 or
	 	Player.localmapid == 961 or Player.localmapid == 960 then
	 if Rset.EWB == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.EW.B) do
		AHRadarline("type=2,alive,attackable,contentID="..tostring(v),R.EWBC.U32,Rset.linethick)
	 end
	 end
	 if Rset.EWA == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.EW.A) do
		AHRadarline("type=2,alive,attackable,aggressive,contentID="..tostring(v),R.EWAC.U32,Rset.linethick)
	 end
	 end
	 if Rset.EWS == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.EW.S) do
		AHRadarline("type=2,alive,attackable,aggressive,contentID="..tostring(v),R.EWSC.U32,Rset.linethick)
	 end
	 end
	 if Rset.EWFate == true then
		AHRadarline("type=2,alive,attackable,aggressive,contentID=10269",R.EWFC.U32,Rset.linethick)
		AHRadarline("type=2,alive,attackable,aggressive,contentID=10400",R.EWFC.U32,Rset.linethick)
	 end
	 end
  end


  if Rset.RadarEnable == true and Rset.line == true and Rset.fumyaku == true then
   if Player.localmapid == 397 or Player.localmapid == 401 or Player.localmapid == 402 or Player.localmapid == 398 or
	 	Player.localmapid == 400 or Player.localmapid == 399 then
	 for k,v in pairs(AetheryteHelper.AetherCurrents.HW) do
		AHRadarline("type=7,contentID="..tostring(v),R.Colorfumyaku.U32,Rset.linethick)
	 end
	 end
	 if Player.localmapid == 612 or Player.localmapid == 620 or Player.localmapid == 621 or Player.localmapid == 613 or
	 	Player.localmapid == 614 or Player.localmapid == 622 then
	 for k,v in pairs(AetheryteHelper.AetherCurrents.StB) do
		AHRadarline("type=7,contentID="..tostring(v),R.Colorfumyaku.U32,Rset.linethick)
	 end
	 end
	 if Player.localmapid == 813 or Player.localmapid == 814 or Player.localmapid == 815 or Player.localmapid == 817 or
	 	Player.localmapid == 816 or Player.localmapid == 818 then
	 for k,v in pairs(AetheryteHelper.AetherCurrents.ShB) do
		AHRadarline("type=7,contentID="..tostring(v),R.Colorfumyaku.U32,Rset.linethick)
	 end
	 end
	 if Player.localmapid == 956 or Player.localmapid == 957 or Player.localmapid == 958 or Player.localmapid == 959 or
	 	Player.localmapid == 961 or Player.localmapid == 960 then
	 for k,v in pairs(AetheryteHelper.AetherCurrents.EW) do
		AHRadarline("type=7,contentID="..tostring(v),R.Colorfumyaku.U32,Rset.linethick)
	 end
	 end
  end

  if Rset.RadarEnable == true and Rset.line == true and Rset.fumyaku == true and Rset.chest == true then
	 if Player.localmapid == 956 or Player.localmapid == 957 or Player.localmapid == 958 or Player.localmapid == 959 or
	 	Player.localmapid == 961 or Player.localmapid == 960 or Player.localmapid == 962 or Player.localmapid == 963 then
	 for k,v in pairs(AetheryteHelper.explorerEW) do
		AHRadarEXline("type=7,contentID="..tostring(v),R.Colorfumyaku.U32,Rset.linethick)
	 end
	 end
  end





  if Rset.RadarEnable == true and Rset.dot == true then
	if Rset.object == true then
	AHRadardot("type=7,",R.Colorobject.U32,Rset.dotsize)
	end
	if Rset.kagu == true then
	AHRadardot("type=12,",R.Colorkagu.U32,Rset.dotsize)
	end
	if Rset.minion == true then
	AHRadardot("type=9,",R.Colorminion.U32,Rset.dotsize)
	end
	if Rset.Gathernode == true then
	AHRadardot("type=6,",R.ColorGathernode.U32,Rset.dotsize)
	end
	if Rset.Aetheryte == true then
	AHRadardot("type=5,",R.ColorAetheryte.U32,Rset.dotsize)
	end
	if Rset.chest == true then
	AHRadardot("type=4,",R.Colorchest.U32,Rset.dotsize)
	end
	if Rset.NPC == true then
	AHRadardotNPC("type=2,alive,",R.ColorNPC.U32,Rset.dotsize)
	AHRadardotNPC("type=3,",R.ColorNPC.U32,Rset.dotsize)
	end
	if Rset.pet == true then
	AHRadardotNPC("type=2,alive,contentID=1398,contentID=1399,contentID=10261,",R.Colorpet.U32,Rset.dotsize)
	end
	if Rset.tori == true then
	AHRadardotNPC("type=2,alive,contentID=952",R.Colortori.U32,Rset.dotsize)
	end
	if Rset.Attackable == true then
	AHRadardot("type=2,attackable,alive,",R.ColorAttackable.U32,Rset.dotsize)
	end
	if Rset.Player == true then
	AHRadardot("type=1",R.ColorPlayer.U32,Rset.dotsize)
	end
  end

 if Rset.RadarEnable == true and Rset.dot == true and Rset.hunt == true then
 	 if Player.localmapid == 148 or Player.localmapid == 152 or Player.localmapid == 153 or Player.localmapid == 154 or
   	Player.localmapid == 135 or Player.localmapid == 137 or Player.localmapid == 138 or Player.localmapid == 139 or
   	Player.localmapid == 180 or Player.localmapid == 140 or Player.localmapid == 145 or Player.localmapid == 146 or
   	Player.localmapid == 147 or Player.localmapid == 155 or Player.localmapid == 156 or Player.localmapid == 141 or
   	Player.localmapid == 134 then 
	 if Rset.ARRB == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.ARR.B) do
		AHRadardot("alive,contentID="..tostring(v),R.ARRBC.U32,Rset.dotsize)
	 end
	 end
	 if Rset.ARRA == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.ARR.A) do
		AHRadardot("alive,contentID="..tostring(v),R.ARRAC.U32,Rset.dotsize)
	 end
	 end
	 if Rset.ARRS == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.ARR.S) do
		AHRadardot("alive,contentID="..tostring(v),R.ARRSC.U32,Rset.dotsize)
	 end
	 end
	 if Rset.ARRFate == true then
		AHRadardot("type=2,alive,contentID=887",R.ARRFC.U32,Rset.dotsize)
		AHRadardot("type=2,alive,contentID=655",R.ARRFC.U32,Rset.dotsize)
	 end
	 end

	 if Player.localmapid == 397 or Player.localmapid == 401 or Player.localmapid == 402 or Player.localmapid == 398 or
	 	Player.localmapid == 400 or Player.localmapid == 399 then
	 if Rset.HWB == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.HW.B) do
		AHRadardot("alive,contentID="..tostring(v),R.HWBC.U32,Rset.dotsize)
	 end
	 end
	 if Rset.HWA == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.HW.A) do
		AHRadardot("alive,contentID="..tostring(v),R.HWAC.U32,Rset.dotsize)
	 end
	 end
	 if Rset.HWS == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.HW.S) do
		AHRadardot("alive,contentID="..tostring(v),R.HWSC.U32,Rset.dotsize)
	 end
	 end
	 if Rset.HWFate == true then
		AHRadardot("type=2,alive,contentID=3789",R.HWFC.U32,Rset.dotsize)
		AHRadardot("type=2,alive,contentID=3783",R.HWFC.U32,Rset.dotsize)
	 end
	 end

	 if Player.localmapid == 612 or Player.localmapid == 620 or Player.localmapid == 621 or Player.localmapid == 613 or
	 	Player.localmapid == 614 or Player.localmapid == 622 then
	 if Rset.StBB == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.StB.B) do
		AHRadardot("alive,contentID="..tostring(v),R.StBBC.U32,Rset.dotsize)
	 end
	 end
	 if Rset.StBA == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.StB.A) do
		AHRadardot("alive,contentID="..tostring(v),R.StBAC.U32,Rset.dotsize)
	 end
	 end
	 if Rset.StBS == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.StB.S) do
		AHRadardot("alive,contentID="..tostring(v),R.StBSC.U32,Rset.dotsize)
	 end
	 end
	 if Rset.StBFate == true then
		AHRadardot("type=2,alive,contentID=6395",R.StBFC.U32,Rset.dotsize)
		AHRadardot("type=2,alive,contentID=6392",R.StBFC.U32,Rset.dotsize)
		AHRadardot("type=2,alive,contentID=6290",R.StBFC.U32,Rset.dotsize)
	 end
	 end

	 if Player.localmapid == 813 or Player.localmapid == 814 or Player.localmapid == 815 or Player.localmapid == 817 or
	 	Player.localmapid == 816 or Player.localmapid == 818 then
	 if Rset.ShBB == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.ShB.B) do
		AHRadardot("alive,contentID="..tostring(v),R.ShBBC.U32,Rset.dotsize)
	 end
	 end
	 if Rset.ShBA == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.ShB.A) do
		AHRadardot("alive,contentID="..tostring(v),R.ShBAC.U32,Rset.dotsize)
	 end
	 end
	 if Rset.ShBS == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.ShB.S) do
		AHRadardot("alive,contentID="..tostring(v),R.ShBSC.U32,Rset.dotsize)
	 end
	 end
	 if Rset.ShBFate == true then
		AHRadardot("type=2,alive,contentID=8822",R.ShBFC.U32,Rset.dotsize)
		AHRadardot("type=2,alive,contentID=8234",R.ShBFC.U32,Rset.dotsize)
	 end
	 end

	 if Player.localmapid == 956 or Player.localmapid == 957 or Player.localmapid == 958 or Player.localmapid == 959 or
	 	Player.localmapid == 961 or Player.localmapid == 960 then
	 if Rset.EWB == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.EW.B) do
		AHRadardot("alive,contentID="..tostring(v),R.EWBC.U32,Rset.dotsize)
	 end
	 end
	 if Rset.EWA == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.EW.A) do
		AHRadardot("alive,contentID="..tostring(v),R.EWAC.U32,Rset.dotsize)
	 end
	 end
	 if Rset.EWS == true then
	 for k,v in pairs(AetheryteHelper.RadarHuntList.EW.S) do
		AHRadardot("alive,contentID="..tostring(v),R.EWSC.U32,Rset.dotsize)
	 end
	 end
	 if Rset.EWFate == true then
		AHRadardot("type=2,alive,contentID=10269",R.EWFC.U32,Rset.dotsize)
		AHRadardot("type=2,alive,contentID=10400",R.EWFC.U32,Rset.dotsize)
	 end
	 end
  end

  if Rset.RadarEnable == true and Rset.dot == true and Rset.fumyaku == true then
	 for k,v in pairs(AetheryteHelper.AetherCurrents.HW) do
		AHRadardot("type=7,contentID="..tostring(v),R.Colorfumyaku.U32,Rset.dotsize)
	 end
	 for k,v in pairs(AetheryteHelper.AetherCurrents.StB) do
		AHRadardot("type=7,contentID="..tostring(v),R.Colorfumyaku.U32,Rset.dotsize)
	 end
	 for k,v in pairs(AetheryteHelper.AetherCurrents.ShB) do
		AHRadardot(",type=7,contentID="..tostring(v),R.Colorfumyaku.U32,Rset.dotsize)
	 end
	 for k,v in pairs(AetheryteHelper.AetherCurrents.EW) do
		AHRadardot("type=7,contentID="..tostring(v),R.Colorfumyaku.U32,Rset.dotsize)
	 end
  end
  if Rset.RadarEnable == true and Rset.dot == true and Rset.fumyaku == true and Rset.chest == true then
 	 if Player.localmapid == 956 or Player.localmapid == 957 or Player.localmapid == 958 or Player.localmapid == 959 or
	 	Player.localmapid == 961 or Player.localmapid == 960 or Player.localmapid == 962 or Player.localmapid == 963 then
	 for k,v in pairs(AetheryteHelper.explorerEW) do
		AHRadarEXdot("type=7,contentID="..tostring(v),R.Colorfumyaku.U32,Rset.dotsize)
	 end
	 end
  end




  for k,v in pairs(AetheryteHelper.RadarCustomList) do
  if tonumber(v[1]) ~= 0 and v[5] ~= 1 then
	 if Rset.RadarEnable == true and Rset.line == true and v[11] == 1 then
		AHRadarline("alive,contentID="..tostring(v[1]),v[6],v[13])
		AHRadarline("type=9,contentID="..tostring(v[1]),v[6],v[13])
		AHRadarline("type=12,contentID="..tostring(v[1]),v[6],v[13])
	 end
  end
  end
  for k,v in pairs(AetheryteHelper.RadarCustomList) do
  if tonumber(v[1]) == 0 or v[5] == 1 then
	 if Rset.RadarEnable == true and Rset.line == true and v[11] == 1 then
	 AHRadarline("name="..tostring(v[3]),v[6],v[13])
	 end
  end
  end
  for k,v in pairs(AetheryteHelper.RadarCustomList) do
  if tonumber(v[1]) ~= 0 and v[5] ~= 1 then
	 if Rset.RadarEnable == true and Rset.dot == true and v[11] == 1 then
		AHRadardot("alive,contentID="..tostring(v[1]),v[6],Rset.dotsize)
		AHRadardot("type=9,contentID="..tostring(v[1]),v[6],Rset.dotsize)
		AHRadardot("type=12,contentID="..tostring(v[1]),v[6],Rset.dotsize)
	 end
  end
  end
  for k,v in pairs(AetheryteHelper.RadarCustomList) do
  if tonumber(v[1]) == 0 or v[5] == 1 then
	 if Rset.RadarEnable == true and Rset.dot == true and v[11] == 1 then
	 AHRadardot("name="..tostring(v[3]),v[6],Rset.dotsize)
	 end
  end
  end
  if Rset.RadarEnable == true and Rset.TMline == true then
	 AHRadarRecetveline("type=2,alive,",R.ColorTMline.U32,Rset.TMlinethick)
  end
  if Rset.RadarEnable == true and Rset.TPline == true then
	AHRadarRecetveline("type=1",R.ColorTPline.U32,Rset.TPlinethick)
  end
  if Rset.RadarEnable == true and Rset.mydot == true then
		if not IsControlOpen("NowLoading") and not IsControlOpen("HudLayout") and screenppos ~= nil then
			   if Rset.indutyoff == true and Rset.gposeoff == true and Rset.cutoff == true then
				  if Player.onlinestatus ~= 18 and Player.onlinestatus ~= 15 and Duty:GetQueueStatus() < 4 then
				  GUI:AddCircleFilled(screenppos.x, screenppos.y,Rset.mydotsize,R.Colormydot.U32)
				  end
			   elseif Rset.gposeoff == true and Rset.cutoff == true then
				  if Player.onlinestatus ~= 18 and Player.onlinestatus ~= 15 then
				  GUI:AddCircleFilled(screenppos.x, screenppos.y,Rset.mydotsize,R.Colormydot.U32)
				  end
			   elseif Rset.gposeoff == true and Rset.indutyoff == true then
				  if Player.onlinestatus ~= 18 and Duty:GetQueueStatus() < 4 then
				  GUI:AddCircleFilled(screenppos.x, screenppos.y,Rset.mydotsize,R.Colormydot.U32)
				  end
			   elseif Rset.cutoff == true and Rset.indutyoff == true then
				  if Player.onlinestatus ~= 15 and Duty:GetQueueStatus() < 4 then
				  GUI:AddCircleFilled(screenppos.x, screenppos.y,Rset.mydotsize,R.Colormydot.U32)
				  end
			   elseif Rset.indutyoff == true then
				  if  Duty:GetQueueStatus() < 4 then
				  GUI:AddCircleFilled(screenppos.x, screenppos.y,Rset.mydotsize,R.Colormydot.U32)
				  end
			   elseif Rset.cutoff == true then
				  if Player.onlinestatus ~= 15 then
				  GUI:AddCircleFilled(screenppos.x, screenppos.y,Rset.mydotsize,R.Colormydot.U32)
				  end
			   elseif Rset.gposeoff == true then
				  if Player.onlinestatus ~= 18 then
				  GUI:AddCircleFilled(screenppos.x, screenppos.y,Rset.mydotsize,R.Colormydot.U32)
				  end
			   else
				  GUI:AddCircleFilled(screenppos.x, screenppos.y,Rset.mydotsize,R.Colormydot.U32)
			   end
		end
  end

  GUI:End()
  GUI:PopStyleColor()
end

--------------------------------------------------------------------------------------------------------------------

function AetheryteHelper.Radarlist()
if #AetheryteHelper.RadarCustomList ~= 0 then
  for k,v in pairs(AetheryteHelper.RadarCustomList) do
   GUI:Columns(3) GUI:SetColumnOffset(1, 50) GUI:SetColumnOffset(2, 350)
   if v[5] == 1 then
   GUI:BeginGroup()
   GUI:Image(ImageFolder..[[R_Player.png]],30,30)
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip144,mETp.tip144,mDTp.tip144,mFTp.tip144,mCTp.tip144,mKTp.tip144)
		end
	  end
   GUI:EndGroup()
   elseif v[5] == 2 and v[15] == true and v[16] > 0 then
   GUI:BeginGroup()
   GUI:Image(ImageFolder..[[R_fate.png]],30,30)
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip148,mETp.tip148,mDTp.tip148,mFTp.tip148,mCTp.tip148,mKTp.tip148)
		end
	  end
   GUI:EndGroup()
   elseif v[5] == 2 and v[15] == true then
   GUI:BeginGroup()
   GUI:Image(ImageFolder..[[R_mob.png]],30,30)
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip145,mETp.tip145,mDTp.tip145,mFTp.tip145,mCTp.tip145,mKTp.tip145)
		end
	  end
   GUI:EndGroup()
   elseif v[5] == 2 and v[1] == 952 and v[15] == false then
   GUI:BeginGroup()
   GUI:Image(ImageFolder..[[R_tori.png]],30,30)
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip153,mETp.tip153,mDTp.tip153,mFTp.tip153,mCTp.tip153,mKTp.tip153)
		end
	  end
   GUI:EndGroup()
   elseif v[5] == 2 and v[1] == 1398 and v[15] == false or
   v[5] == 2 and v[1] == 1399 and v[15] == false or v[5] == 2 and v[1] == 10261 and v[15] == false then
   GUI:BeginGroup()
   GUI:Image(ImageFolder..[[R_pet.png]],30,30)
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip154,mETp.tip154,mDTp.tip154,mFTp.tip154,mCTp.tip154,mKTp.tip154)
		end
	  end
   GUI:EndGroup()
   elseif v[5] == 2 and v[15] == false then
   GUI:BeginGroup()
   GUI:Image(ImageFolder..[[R_npc.png]],30,30)
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip146,mETp.tip146,mDTp.tip146,mFTp.tip146,mCTp.tip146,mKTp.tip146)
		end
	  end
   GUI:EndGroup()
   elseif v[5] == 3 then
   GUI:BeginGroup()
   GUI:Image(ImageFolder..[[R_npc.png]],30,30)
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip146,mETp.tip146,mDTp.tip146,mFTp.tip146,mCTp.tip146,mKTp.tip146)
		end
	  end
   GUI:EndGroup()
   elseif v[5] == 4 then
   GUI:BeginGroup()
   GUI:Image(ImageFolder..[[R_chest.png]],30,30)
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip147,mETp.tip147,mDTp.tip147,mFTp.tip147,mCTp.tip147,mKTp.tip147)
		end
	  end
   GUI:EndGroup()
   elseif v[5] == 5 then
   GUI:BeginGroup()
   GUI:Image(ImageFolder..[[R_aetheryte.png]],30,30)
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip150,mETp.tip150,mDTp.tip150,mFTp.tip150,mCTp.tip150,mKTp.tip150)
		end
	  end
   GUI:EndGroup()
   elseif v[5] == 6 then
   GUI:BeginGroup()
   GUI:Image(ImageFolder..[[R_node.png]],30,30)
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip155,mETp.tip155,mDTp.tip155,mFTp.tip155,mCTp.tip155,mKTp.tip155)
		end
	  end
   GUI:EndGroup()
   elseif v[5] == 7 then
   GUI:BeginGroup()
   GUI:Image(ImageFolder..[[R_object.png]],30,30)
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip151,mETp.tip151,mDTp.tip151,mFTp.tip151,mCTp.tip151,mKTp.tip151)
		end
	  end
   GUI:EndGroup()
   elseif v[5] == 9 then
   GUI:BeginGroup()
   GUI:Image(ImageFolder..[[R_minion.png]],30,30)
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip156,mETp.tip156,mDTp.tip156,mFTp.tip156,mCTp.tip156,mKTp.tip156)
		end
	  end
   GUI:EndGroup()
   elseif v[5] == 12 then
   GUI:BeginGroup()
   GUI:Image(ImageFolder..[[R_kagu.png]],30,30)
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip149,mETp.tip149,mDTp.tip149,mFTp.tip149,mCTp.tip149,mKTp.tip149)
		end
	  end
   GUI:EndGroup()
   elseif v[5] == 0 then
   GUI:BeginGroup()
   GUI:Image(ImageFolder..[[R_nazo.png]],30,30)
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip152,mETp.tip152,mDTp.tip152,mFTp.tip152,mCTp.tip152,mKTp.tip152)
		end
	  end
   GUI:EndGroup()
   end
   GUI:Spacing()
   GUI:BeginGroup()
   if v[11] == 1 then
	  GUI:Image(ImageFolder..[[R_on.png]],30,30)
	  if GUI:IsItemHovered() then
	  if GUI:IsItemClicked(0) then
	  v[11] = 0
	  AetheryteHelper.SaveSettings()
	  end
	  end
   elseif v[11] == 0 then
	  GUI:Image(ImageFolder..[[R_off.png]],30,30)
	  if GUI:IsItemHovered() then
	  if GUI:IsItemClicked(0) then
	  v[11] = 1
	  AetheryteHelper.SaveSettings()
	  end
	  end
   end
   GUI:EndGroup()
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip114,mETp.tip114,mDTp.tip114,mFTp.tip114,mCTp.tip114,mKTp.tip114)
		end
	  end
   GUI:NextColumn()
   GUI:BeginGroup()
   GUI:PushItemWidth(60)
   if v[1] == 0 or v[12] == 1 then
   GUI:InputText( "##Cid"..tostring(k), v[1],GUI.InputTextFlags_ReadOnly)
   else
   v[1],changed = GUI:InputText( "##Cid"..tostring(k), v[1],GUI.InputTextFlags_CharsDecimal)
	 if (changed) then
	 v[1] = v[1]
	 AetheryteHelper.SaveSettings()
	 end
   end
   GUI:PopItemWidth()
   GUI:EndGroup()
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip193,mETp.tip193,mDTp.tip193,mFTp.tip193,mCTp.tip193,mKTp.tip193)
		 end
	  end
   GUI:SameLine()
   GUI:BeginGroup()
   GUI:PushItemWidth(210)
   if v[5] == 1 then
   for key,val in pairs(WorldID) do
	   if ( val.id == v[4] ) then
	   Rwroldname = val.Name
	   end
   end
   end
   if v[5] == 1 then
   GUI:InputText( "##name"..tostring(k), v[3].." @"..Rwroldname,GUI.InputTextFlags_ReadOnly)
   elseif v[5] > 1 or v[12] == 1 then
   GUI:InputText( "##name"..tostring(k), v[3],GUI.InputTextFlags_ReadOnly)
   else
   v[3],changed = GUI:InputText( "##name"..tostring(k), v[3])
	 if (changed) then
	 v[3] = v[3]
	 AetheryteHelper.SaveSettings()
	 end
   end
   GUI:PopItemWidth()
   GUI:EndGroup()
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip194,mETp.tip194,mDTp.tip194,mFTp.tip194,mCTp.tip194,mKTp.tip194)
		 end
	  end
   GUI:BeginGroup()
   GUI:PushItemWidth(280)
   v[14],changed = GUI:InputText( "##note"..tostring(k), v[14])
   if (changed) then
   v[14] = v[14]
   AetheryteHelper.SaveSettings()
   end
   GUI:PopItemWidth()
   GUI:EndGroup()
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip195,mETp.tip195,mDTp.tip195,mFTp.tip195,mCTp.tip195,mKTp.tip195)
		 end
	  end
   GUI:BeginGroup()
   GUI:PushItemWidth(200)
   GUI:ColorEditMode(GUI.ColorEditMode_AlphaBar+GUI.ColorEditMode_NoOptions)
   v[7],v[8],v[9],v[10],changed = GUI:ColorEdit4("##Colour"..tostring(k),v[7],v[8],v[9],v[10])
   if (changed) then ColourU32 = GUI:ColorConvertFloat4ToU32(v[7],v[8],v[9],v[10])
   v[6] = ColourU32
   AetheryteHelper.SaveSettings()
   end
   GUI:PopItemWidth()
   GUI:EndGroup()
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip166,mETp.tip166,mDTp.tip166,mFTp.tip166,mCTp.tip166,mKTp.tip166)
		 end
	  end
   GUI:SameLine()
   GUI:BeginGroup()
   GUI:PushItemWidth(70)
   v[13] = GUI:InputInt("##thicks"..tostring(k),v[13],1,1)
   if GUI:IsItemHovered() then
	  if GUI:IsItemClicked(0) then
	  v[13] = v[13]
	  AetheryteHelper.SaveSettings()
	  end
   end
   if v[13] < 1 then v[13] = 1 end
   if v[13] > 10 then v[13] = 10 end
   GUI:PopItemWidth()
   GUI:EndGroup()
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip169,mETp.tip169,mDTp.tip169,mFTp.tip169,mCTp.tip169,mKTp.tip169)
		 end
	  end
   if v[1] == 0 then
   GUI:BeginGroup()
   if v[17] == 0 then
   GUI:PushStyleColor(GUI.Col_Button,0,.5,0,1)
   GUI:Button("Normal",80,20)
   GUI:PopStyleColor()
   if GUI:IsItemHovered() then
	  if GUI:IsItemClicked(0) then
	  v[17] = 1
	  AetheryteHelper.SaveSettings()
	  end
   end
   elseif v[17] == 1 then
   GUI:PushStyleColor(GUI.Col_Button,1,0,0,1)
   GUI:Button("Hazard",80,20)
   GUI:PopStyleColor()
   if GUI:IsItemHovered() then
	  if GUI:IsItemClicked(0) then
	  v[17] = 0
	  AetheryteHelper.SaveSettings()
	  end
   end
   end
   GUI:EndGroup()
   if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip198,mETp.tip198,mDTp.tip198,mFTp.tip198,mCTp.tip198,mKTp.tip198)
		 end
	  end
   if v[17] == 1 then
   GUI:SameLine()
   GUI:BeginGroup()
   GUI:PushItemWidth(120)
	 v[18], changed = GUI:SliderInt("##ylm"..tostring(k),v[18],10,150)
	 GUI:SameLine()
	 GUI:Text("ylm")
   GUI:EndGroup()
    if GUI:IsItemHovered() then
		if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip199,mETp.tip199,mDTp.tip199,mFTp.tip199,mCTp.tip199,mKTp.tip199)
		 end
	  end
   if v[11] == 1 then AetheryteHelper.HazardPlayer(v[18],v[3]) end
   end
   end
   GUI:NextColumn()
   GUI:BeginGroup()
   GUI:ImageButton("###del",ImageFolder..[[R_trash.png]], 25,25)
   if GUI:IsItemHovered() then
	  if GUI:IsItemClicked(0) then
	  table.remove(AetheryteHelper.RadarCustomList,k)
	  AetheryteHelper.SaveSettings()
	  end
	  if AHSET.mushtooltips == true then
		AetheryteHelper.SetToolTips(mJTp.tip182,mETp.tip182,mDTp.tip182,mFTp.tip182,mCTp.tip182,mKTp.tip182)
	  end
   end
   GUI:EndGroup()
   GUI:Spacing(5)
   GUI:BeginGroup()
   GUI:Text("No,"..k)
   GUI:EndGroup()
   GUI:Columns()
   GUI:Separator()
   end
else
GUI:BeginGroup()
GUI:Text("CustomList Empty")
GUI:EndGroup()
end
end
---------------------------------------------------------------------------------------------------------------------------------------------------
local clx
local cly
function AetheryteHelper.UserLanguageSet()
   if (AetheryteHelper.selectlanguage.open) then
   	local languageflags =  GUI.WindowFlags_ShowBorders + GUI.WindowFlags_AlwaysAutoResize + GUI.WindowFlags_NoScrollbar
	  GUI:SetNextWindowSize(240,80)
	  AetheryteHelper.selectlanguage.visible, AetheryteHelper.selectlanguage.open = GUI:Begin('Custom Language Select', AetheryteHelper.selectlanguage.open,languageflags)
	  clx,cly = GUI:GetWindowPos()
	  if (AetheryteHelper.selectlanguage.visible) then
	  	GUI:Spacing()
	  	GUI:BeginGroup()
	  	if AuL.JP == true then
	  	GUI:Image(ImageFolder..[[l_jp_on.png]],30,30)
	  	else
	  	GUI:Image(ImageFolder..[[l_jp_off.png]],30,30)
	  	end
	  	GUI:EndGroup()
	  	if (GUI:IsItemHovered()) then
		   		if GUI:IsMouseClicked(0) then
		    	AuL.JP = not AuL.JP
		    	AuL.EN = false
		    	AuL.DE = false
		    	AuL.FR = false
		    	AuL.CN = false
		    	AuL.KR = false
		    	AetheryteHelper.SaveSettings()
		   		end
		 			if AHSET.mushtooltips == true then
			  	GUI:SetTooltip("日本語")
     			end
	  	end
	  	GUI:SameLine()
	  	GUI:BeginGroup()
	  	if AuL.EN == true then
	  	GUI:Image(ImageFolder..[[l_en_on.png]],30,30)
	  	else
	  	GUI:Image(ImageFolder..[[l_en_off.png]],30,30)
	  	end
	  	GUI:EndGroup()
	  	if (GUI:IsItemHovered()) then
		  	  if GUI:IsMouseClicked(0) then
		    	AuL.EN = not AuL.EN
		    	AuL.JP = false
		    	AuL.DE = false
		    	AuL.FR = false
		    	AuL.CN = false
		    	AuL.KR = false
		    	AetheryteHelper.SaveSettings()
		   		end
		 			if AHSET.mushtooltips == true then
			  	GUI:SetTooltip("English")
     			end
	  	end
	  	GUI:SameLine()
	  	GUI:BeginGroup()
	  	if AuL.DE == true then
	  	GUI:Image(ImageFolder..[[l_de_on.png]],30,30)
	  	else
	  	GUI:Image(ImageFolder..[[l_de_off.png]],30,30)
	  	end
	  	GUI:EndGroup()
	  	if (GUI:IsItemHovered()) then
		  	  if GUI:IsMouseClicked(0) then
		    	AuL.DE = not AuL.DE
		    	AuL.JP = false
		    	AuL.EN = false
		    	AuL.FR = false
		    	AuL.CN = false
		    	AuL.KR = false
		    	AetheryteHelper.SaveSettings()
		   		end
		 			if AHSET.mushtooltips == true then
			  	GUI:SetTooltip("Deutsch")
     			end
	  	end
	    GUI:SameLine()
	    GUI:BeginGroup()
	    if AuL.FR == true then
	    GUI:Image(ImageFolder..[[l_fr_on.png]],30,30)
	    else
	  	GUI:Image(ImageFolder..[[l_fr_off.png]],30,30)
	  	end
	  	GUI:EndGroup()
	  	if (GUI:IsItemHovered()) then
		      if GUI:IsMouseClicked(0) then
		    	AuL.FR = not AuL.FR
		    	AuL.JP = false
		    	AuL.EN = false
		    	AuL.DE = false
		    	AuL.CN = false
		    	AuL.KR = false
		    	AetheryteHelper.SaveSettings()
		   		end
		 			if AHSET.mushtooltips == true then
			  	GUI:SetTooltip("Français")
     			end
	  	end
	  	GUI:SameLine()
	  	GUI:BeginGroup()
	  	if AuL.CN == true then
	  	GUI:Image(ImageFolder..[[l_cn_on.png]],30,30)
	  	else
	  	GUI:Image(ImageFolder..[[l_cn_off.png]],30,30)
	  	end
	  	GUI:EndGroup()
	  	if (GUI:IsItemHovered()) then
		      if GUI:IsMouseClicked(0) then
		   	  AuL.CN = not AuL.CN
		    	AuL.JP = false
		    	AuL.EN = false
		    	AuL.DE = false
		    	AuL.FR = false
		    	AuL.KR = false
		    	AetheryteHelper.SaveSettings()
		   		end
		 			if AHSET.mushtooltips == true then
			  	GUI:SetTooltip("中文")
     			end
	  	end
	  	GUI:SameLine()
	    GUI:BeginGroup()
	    if AuL.KR == true then
	  	GUI:Image(ImageFolder..[[l_kr_on.png]],30,30)
	  	else
	  	GUI:Image(ImageFolder..[[l_kr_off.png]],30,30)
	  	end
	  	GUI:EndGroup()
	  	if (GUI:IsItemHovered()) then
		  	  if GUI:IsMouseClicked(0) then
		    	AuL.KR = not AuL.KR
		    	AuL.JP = false
		    	AuL.EN = false
		    	AuL.DE = false
		    	AuL.FR = false
		    	AuL.CN = false
		    	AetheryteHelper.SaveSettings()
		   		end
		 			if AHSET.mushtooltips == true then
			  	GUI:SetTooltip("한국어")
     			end
	  	end
	  end
	  GUI:End()
	end
	if (AetheryteHelper.selectlanguage.open) then 
	  GUI:SetNextWindowSize(400,150,GUI.SetCond_FirstUseEver)
	  GUI:SetNextWindowPos(clx+240,cly+20)
	  GUI:Begin('bosyuu',true,GUI.WindowFlags_NoTitleBar + GUI.WindowFlags_AlwaysAutoResize)  
	    if AuL.JP == true then
	    GUI:Spacing()
	    GUI:BeginGroup()
	 		GUI:Text("現在翻訳は完全ではありません\n各言語の翻訳に協力してくださる方を募集しています\n是非Discordに参加してください")
	    GUI:EndGroup()
	    elseif AuL.EN == true then
	    GUI:Spacing()
	    GUI:BeginGroup() 
	 		GUI:Text("Translation is not yet complete\nI'm looking for people to help us translate each language\nPlease join my Discord!")
	    GUI:EndGroup()
	    elseif AuL.DE == true then
	    GUI:Spacing()
	    GUI:BeginGroup() 
	 		GUI:Text("Die Übersetzung ist noch nicht abgeschlossen\nIch suche Leute, die uns bei der Übersetzung der einzelnen Sprachen helfen\nBitte tritt meinem Discord bei!")
	    GUI:EndGroup()
	    elseif AuL.FR == true then
	    GUI:Spacing()
	    GUI:BeginGroup() 
	 		GUI:Text("La traduction n'est pas encore terminée\nJe cherche des personnes pour nous aider à traduire chaque langue.\nRejoignez mon Discord!")
	    GUI:EndGroup()
	    elseif AuL.CN == true then 
	    GUI:Spacing()
	    GUI:BeginGroup()
	 		GUI:Text("翻译尚未完成\n我正在寻找帮助我们翻译每种语言的人\n请加入我的 Discord!")
	    GUI:EndGroup()
	    elseif AuL.KR == true then
	    GUI:Spacing()
	    GUI:BeginGroup() 
	 		GUI:Text("번역이 아직 완료되지 않았습니다.\n각 언어의 번역을 도와주실 분을 찾고 있습니다\n내 Discord에 가입하십시오!")
	 	  GUI:EndGroup()
	 	  elseif gRegion == 1 and language == 0 then
	 	  GUI:Spacing()
	    GUI:BeginGroup()
	 		GUI:Text("現在翻訳は完全ではありません\n各言語の翻訳に協力してくださる方を募集しています\n是非Discordに参加してください")
	    GUI:EndGroup()
	    elseif gRegion == 1 and language == 1 then
	    GUI:Spacing()
	    GUI:BeginGroup()
	 		GUI:Text("Translation is not yet complete\nI'm looking for people to help us translate each language\nPlease join my Discord!")
	    GUI:EndGroup()
	    elseif gRegion == 1 and language == 2 then
	    GUI:Spacing()
	    GUI:BeginGroup()
	 		GUI:Text("Die Übersetzung ist noch nicht abgeschlossen\nIch suche Leute, die uns bei der Übersetzung der einzelnen Sprachen helfen\nBitte tritt meinem Discord bei!")
	    GUI:EndGroup()
	    elseif gRegion == 1 and language == 3 then
	    GUI:Spacing()
	    GUI:BeginGroup()
	 		GUI:Text("La traduction n'est pas encore terminée\nJe cherche des personnes pour nous aider à traduire chaque langue.\nRejoignez mon Discord!")
	    GUI:EndGroup()
	    elseif gRegion == 2 then
	    GUI:Spacing()
	    GUI:BeginGroup()
	 		GUI:Text("翻译尚未完成\n我正在寻找帮助我们翻译每种语言的人\n请加入我的 Discord!")
	    GUI:EndGroup()
	    elseif gRegion == 3 then
	    GUI:Spacing()
	    GUI:BeginGroup()
	 		GUI:Text("번역이 아직 완료되지 않았습니다.\n각 언어의 번역을 도와주실 분을 찾고 있습니다\n내 Discord에 가입하십시오!")
	    GUI:EndGroup()
	    end
	    GUI:Spacing()
	    GUI:BeginGroup()
	    GUI:TextColored(1,.2,.2,1,"[[mushroom's Room]]")
	    if (GUI:IsItemHovered()) then
		  	  if GUI:IsMouseClicked(0) then
		    	io.popen([[cmd /c start "" "]]..AHLinks.link1..[["]]):close()
     			end
     			GUI:SetTooltip("Discord Link")
	  	end
	    GUI:EndGroup()
	  GUI:End()
   end
end


---------------------------------------------------------------------------------------------------------------------------------------------------


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
			  AetheryteHelper.SetToolTips(mJTp.tip28,mETp.tip28,mDTp.tip28,mFTp.tip28,mCTp.tip28,mKTp.tip28)
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
			  AetheryteHelper.SetToolTips(mJTp.tip28,mETp.tip28,mDTp.tip28,mFTp.tip28,mCTp.tip28,mKTp.tip28)
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
			  AetheryteHelper.SetToolTips(mJTp.tip29,mETp.tip29,mDTp.tip29,mFTp.tip29,mCTp.tip29,mKTp.tip29)
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
			  AetheryteHelper.SetToolTips(mJTp.tip29,mETp.tip29,mDTp.tip29,mFTp.tip29,mCTp.tip29,mKTp.tip29)
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
			  AetheryteHelper.SetToolTips(mJTp.tip30,mETp.tip30,mDTp.tip30,mFTp.tip30,mCTp.tip30,mKTp.tip30)
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
			  AetheryteHelper.SetToolTips(mJTp.tip32,mETp.tip32,mDTp.tip32,mFTp.tip32,mCTp.tip32,mKTp.tip32)
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
			  AetheryteHelper.SetToolTips(mJTp.tip31,mETp.tip31,mDTp.tip31,mFTp.tip31,mCTp.tip31,mKTp.tip31)
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
			  AetheryteHelper.SetToolTips(mJTp.tip45,mETp.tip45,mDTp.tip45,mFTp.tip45,mCTp.tip45,mKTp.tip45)
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
			  AetheryteHelper.SetToolTips(mJTp.tip34,mETp.tip34,mDTp.tip34,mFTp.tip34,mCTp.tip34,mKTp.tip34)
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
			  AetheryteHelper.SetToolTips(mJTp.tip34,mETp.tip34,mDTp.tip34,mFTp.tip34,mCTp.tip34,mKTp.tip34)
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
			  AetheryteHelper.SetToolTips(mJTp.tip35,mETp.tip35,mDTp.tip35,mFTp.tip35,mCTp.tip35,mKTp.tip35)
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
			  AetheryteHelper.SetToolTips(mJTp.tip35,mETp.tip35,mDTp.tip35,mFTp.tip35,mCTp.tip35,mKTp.tip35)
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
			  AetheryteHelper.SetToolTips(mJTp.tip36,mETp.tip36,mDTp.tip36,mFTp.tip36,mCTp.tip36,mKTp.tip36)
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
			  AetheryteHelper.SetToolTips(mJTp.tip36,mETp.tip36,mDTp.tip36,mFTp.tip36,mCTp.tip36,mKTp.tip36)
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
			  AetheryteHelper.SetToolTips(mJTp.tip37,mETp.tip37,mDTp.tip37,mFTp.tip37,mCTp.tip37,mKTp.tip37)
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
			  AetheryteHelper.SetToolTips(mJTp.tip37,mETp.tip37,mDTp.tip37,mFTp.tip37,mCTp.tip37,mKTp.tip37)
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
			  AetheryteHelper.SetToolTips(mJTp.tip38,mETp.tip38,mDTp.tip38,mFTp.tip38,mCTp.tip38,mKTp.tip38)
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
			  AetheryteHelper.SetToolTips(mJTp.tip38,mETp.tip38,mDTp.tip38,mFTp.tip38,mCTp.tip38,mKTp.tip38)
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
			  AetheryteHelper.SetToolTips(mJTp.tip39,mETp.tip39,mDTp.tip39,mFTp.tip39,mCTp.tip39,mKTp.tip39)
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
			  AetheryteHelper.SetToolTips(mJTp.tip39,mETp.tip39,mDTp.tip39,mFTp.tip39,mCTp.tip39,mKTp.tip39)
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
			  AetheryteHelper.SetToolTips(mJTp.tip40,mETp.tip40,mDTp.tip40,mFTp.tip40,mCTp.tip40,mKTp.tip40)
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
			  AetheryteHelper.SetToolTips(mJTp.tip40,mETp.tip40,mDTp.tip40,mFTp.tip40,mCTp.tip40,mKTp.tip40)
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
			  AetheryteHelper.SetToolTips(mJTp.tip41,mETp.tip41,mDTp.tip41,mFTp.tip41,mCTp.tip41,mKTp.tip41)
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
			  AetheryteHelper.SetToolTips(mJTp.tip41,mETp.tip41,mDTp.tip41,mFTp.tip41,mCTp.tip41,mKTp.tip41)
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
			  AetheryteHelper.SetToolTips(mJTp.tip42,mETp.tip42,mDTp.tip42,mFTp.tip42,mCTp.tip42,mKTp.tip42)
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
			  AetheryteHelper.SetToolTips(mJTp.tip42,mETp.tip42,mDTp.tip42,mFTp.tip42,mCTp.tip42,mKTp.tip42)
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
			  AetheryteHelper.SetToolTips(mJTp.tip43,mETp.tip43,mDTp.tip43,mFTp.tip43,mCTp.tip43,mKTp.tip43)
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
			  AetheryteHelper.SetToolTips(mJTp.tip43,mETp.tip43,mDTp.tip43,mFTp.tip43,mCTp.tip43,mKTp.tip43)
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
			  AetheryteHelper.SetToolTips(mJTp.tip44,mETp.tip44,mDTp.tip44,mFTp.tip44,mCTp.tip44,mKTp.tip44)
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
			  AetheryteHelper.SetToolTips(mJTp.tip44,mETp.tip44,mDTp.tip44,mFTp.tip44,mCTp.tip44,mKTp.tip44)
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
			  AetheryteHelper.SetToolTips(mJTp.tip45,mETp.tip45,mDTp.tip45,mFTp.tip45,mCTp.tip45,mKTp.tip45)
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
			  AetheryteHelper.SetToolTips(mJTp.tip46,mETp.tip46,mDTp.tip46,mFTp.tip46,mCTp.tip46,mKTp.tip46)
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
			  AetheryteHelper.SetToolTips(mJTp.tip46,mETp.tip46,mDTp.tip46,mFTp.tip46,mCTp.tip46,mKTp.tip46)
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
			  AetheryteHelper.SetToolTips(mJTp.tip47,mETp.tip47,mDTp.tip47,mFTp.tip47,mCTp.tip47,mKTp.tip47)
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
			  AetheryteHelper.SetToolTips(mJTp.tip47,mETp.tip47,mDTp.tip47,mFTp.tip47,mCTp.tip47,mKTp.tip47)
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
			  AetheryteHelper.SetToolTips(mJTp.tip48,mETp.tip48,mDTp.tip48,mFTp.tip48,mCTp.tip48,mKTp.tip48)
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
			  AetheryteHelper.SetToolTips(mJTp.tip48,mETp.tip48,mDTp.tip48,mFTp.tip48,mCTp.tip48,mKTp.tip48)
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
			  AetheryteHelper.SetToolTips(mJTp.tip50,mETp.tip50,mDTp.tip50,mFTp.tip50,mCTp.tip50,mKTp.tip50)
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
			  AetheryteHelper.SetToolTips(mJTp.tip50,mETp.tip50,mDTp.tip50,mFTp.tip50,mCTp.tip50,mKTp.tip50)
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
			  AetheryteHelper.SetToolTips(mJTp.tip52,mETp.tip52,mDTp.tip52,mFTp.tip52,mCTp.tip52,mKTp.tip52)
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
			  AetheryteHelper.SetToolTips(mJTp.tip52,mETp.tip52,mDTp.tip52,mFTp.tip52,mCTp.tip52,mKTp.tip52)
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
			  AetheryteHelper.SetToolTips(mJTp.tip54,mETp.tip54,mDTp.tip54,mFTp.tip54,mCTp.tip54,mKTp.tip54)
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
			  AetheryteHelper.SetToolTips(mJTp.tip54,mETp.tip54,mDTp.tip54,mFTp.tip54,mCTp.tip54,mKTp.tip54)
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
			  AetheryteHelper.SetToolTips(mJTp.tip49,mETp.tip49,mDTp.tip49,mFTp.tip49,mCTp.tip49,mKTp.tip49)
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
			  AetheryteHelper.SetToolTips(mJTp.tip49,mETp.tip49,mDTp.tip49,mFTp.tip49,mCTp.tip49,mKTp.tip49)
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
			  AetheryteHelper.SetToolTips(mJTp.tip51,mETp.tip51,mDTp.tip51,mFTp.tip51,mCTp.tip51,mKTp.tip51)
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
			  AetheryteHelper.SetToolTips(mJTp.tip51,mETp.tip51,mDTp.tip51,mFTp.tip51,mCTp.tip51,mKTp.tip51)
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
			  AetheryteHelper.SetToolTips(mJTp.tip53,mETp.tip53,mDTp.tip53,mFTp.tip53,mCTp.tip53,mKTp.tip53)
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
			  AetheryteHelper.SetToolTips(mJTp.tip53,mETp.tip53,mDTp.tip53,mFTp.tip53,mCTp.tip53,mKTp.tip53)
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
			  AetheryteHelper.SetToolTips(mJTp.tip45,mETp.tip45,mDTp.tip45,mFTp.tip45,mCTp.tip45,mKTp.tip45)
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
			  AetheryteHelper.SetToolTips(mJTp.tip104,mETp.tip104,mDTp.tip104,mFTp.tip104,mCTp.tip104,mKTp.tip104)
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
			  AetheryteHelper.SetToolTips(mJTp.tip104,mETp.tip104,mDTp.tip104,mFTp.tip104,mCTp.tip104,mKTp.tip104)
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
			  AetheryteHelper.SetToolTips(mJTp.tip55,mETp.tip55,mDTp.tip55,mFTp.tip55,mCTp.tip55,mKTp.tip55)
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
			  AetheryteHelper.SetToolTips(mJTp.tip55,mETp.tip55,mDTp.tip55,mFTp.tip55,mCTp.tip55,mKTp.tip55)
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
			  AetheryteHelper.SetToolTips(mJTp.tip56,mETp.tip56,mDTp.tip56,mFTp.tip56,mCTp.tip56,mKTp.tip56)
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
			  AetheryteHelper.SetToolTips(mJTp.tip56,mETp.tip56,mDTp.tip56,mFTp.tip56,mCTp.tip56,mKTp.tip56)
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
			  AetheryteHelper.SetToolTips(mJTp.tip57,mETp.tip57,mDTp.tip57,mFTp.tip57,mCTp.tip57,mKTp.tip57)
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
			  AetheryteHelper.SetToolTips(mJTp.tip57,mETp.tip57,mDTp.tip57,mFTp.tip57,mCTp.tip57,mKTp.tip57)
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
			  AetheryteHelper.SetToolTips(mJTp.tip58,mETp.tip58,mDTp.tip58,mFTp.tip58,mCTp.tip58,mKTp.tip58)
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
			  AetheryteHelper.SetToolTips(mJTp.tip58,mETp.tip58,mDTp.tip58,mFTp.tip58,mCTp.tip58,mKTp.tip58)
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
			  AetheryteHelper.SetToolTips(mJTp.tip59,mETp.tip59,mDTp.tip59,mFTp.tip59,mCTp.tip59,mKTp.tip59)
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
			  AetheryteHelper.SetToolTips(mJTp.tip59,mETp.tip59,mDTp.tip59,mFTp.tip59,mCTp.tip59,mKTp.tip59)
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
			  AetheryteHelper.SetToolTips(mJTp.tip60,mETp.tip60,mDTp.tip60,mFTp.tip60,mCTp.tip60,mKTp.tip60)
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
			  AetheryteHelper.SetToolTips(mJTp.tip60,mETp.tip60,mDTp.tip60,mFTp.tip60,mCTp.tip60,mKTp.tip60)
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
			  AetheryteHelper.SetToolTips(mJTp.tip61,mETp.tip61,mDTp.tip61,mFTp.tip61,mCTp.tip61,mKTp.tip61)
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
			  AetheryteHelper.SetToolTips(mJTp.tip61,mETp.tip61,mDTp.tip61,mFTp.tip61,mCTp.tip61,mKTp.tip61)
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
			  AetheryteHelper.SetToolTips(mJTp.tip62,mETp.tip62,mDTp.tip62,mFTp.tip62,mCTp.tip62,mKTp.tip62)
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
			  AetheryteHelper.SetToolTips(mJTp.tip62,mETp.tip62,mDTp.tip62,mFTp.tip62,mCTp.tip62,mKTp.tip62)
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
			  AetheryteHelper.SetToolTips(mJTp.tip63,mETp.tip63,mDTp.tip63,mFTp.tip63,mCTp.tip63,mKTp.tip63)
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
			  AetheryteHelper.SetToolTips(mJTp.tip63,mETp.tip63,mDTp.tip63,mFTp.tip63,mCTp.tip63,mKTp.tip63)
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
			  AetheryteHelper.SetToolTips(mJTp.tip64,mETp.tip64,mDTp.tip64,mFTp.tip64,mCTp.tip64,mKTp.tip64)
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
			  AetheryteHelper.SetToolTips(mJTp.tip64,mETp.tip64,mDTp.tip64,mFTp.tip64,mCTp.tip64,mKTp.tip64)
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
			  AetheryteHelper.SetToolTips(mJTp.tip65,mETp.tip65,mDTp.tip65,mFTp.tip65,mCTp.tip65,mKTp.tip65)
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
			  AetheryteHelper.SetToolTips(mJTp.tip65,mETp.tip65,mDTp.tip65,mFTp.tip65,mCTp.tip65,mKTp.tip65)
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
			  AetheryteHelper.SetToolTips(mJTp.tip66,mETp.tip66,mDTp.tip66,mFTp.tip66,mCTp.tip66,mKTp.tip66)
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
			  AetheryteHelper.SetToolTips(mJTp.tip66,mETp.tip66,mDTp.tip66,mFTp.tip66,mCTp.tip66,mKTp.tip66)
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
			  AetheryteHelper.SetToolTips(mJTp.tip67,mETp.tip67,mDTp.tip67,mFTp.tip67,mCTp.tip67,mKTp.tip67)
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
			  AetheryteHelper.SetToolTips(mJTp.tip67,mETp.tip67,mDTp.tip67,mFTp.tip67,mCTp.tip67,mKTp.tip67)
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
			  AetheryteHelper.SetToolTips(mJTp.tip68,mETp.tip68,mDTp.tip68,mFTp.tip68,mCTp.tip68,mKTp.tip68)
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
			  AetheryteHelper.SetToolTips(mJTp.tip68,mETp.tip68,mDTp.tip68,mFTp.tip68,mCTp.tip68,mKTp.tip68)
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
			  AetheryteHelper.SetToolTips(mJTp.tip69,mETp.tip69,mDTp.tip69,mFTp.tip69,mCTp.tip69,mKTp.tip69)
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
			  AetheryteHelper.SetToolTips(mJTp.tip69,mETp.tip69,mDTp.tip69,mFTp.tip69,mCTp.tip69,mKTp.tip69)
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
			  AetheryteHelper.SetToolTips(mJTp.tip70,mETp.tip70,mDTp.tip70,mFTp.tip70,mCTp.tip70,mKTp.tip70)
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
			  AetheryteHelper.SetToolTips(mJTp.tip70,mETp.tip70,mDTp.tip70,mFTp.tip70,mCTp.tip70,mKTp.tip70)
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
			  AetheryteHelper.SetToolTips(mJTp.tip71,mETp.tip71,mDTp.tip71,mFTp.tip71,mCTp.tip71,mKTp.tip71)
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
			  AetheryteHelper.SetToolTips(mJTp.tip71,mETp.tip71,mDTp.tip71,mFTp.tip71,mCTp.tip71,mKTp.tip71)
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
			  AetheryteHelper.SetToolTips(mJTp.tip72,mETp.tip72,mDTp.tip72,mFTp.tip72,mCTp.tip72,mKTp.tip72)
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
			  AetheryteHelper.SetToolTips(mJTp.tip72,mETp.tip72,mDTp.tip72,mFTp.tip72,mCTp.tip72,mKTp.tip72)
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
			  AetheryteHelper.SetToolTips(mJTp.tip73,mETp.tip73,mDTp.tip73,mFTp.tip73,mCTp.tip73,mKTp.tip73)
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
			  AetheryteHelper.SetToolTips(mJTp.tip73,mETp.tip73,mDTp.tip73,mFTp.tip73,mCTp.tip73,mKTp.tip73)
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
			  AetheryteHelper.SetToolTips(mJTp.tip74,mETp.tip74,mDTp.tip74,mFTp.tip74,mCTp.tip74,mKTp.tip74)
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
			  AetheryteHelper.SetToolTips(mJTp.tip74,mETp.tip74,mDTp.tip74,mFTp.tip74,mCTp.tip74,mKTp.tip74)
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

function AetheryteHelper.AutoLegacy()
     if Duty:IsQueued() == true then
        if IsControlOpen("SystemMenu") then
        UseControlAction("SystemMenu","Close")
        end
     end
     local movemode = Player.settings.movemode
     if AHSET.AutoLegacy ==  true then
        if table.valid(ml_navigation.path) then
           if movemode == 1 then
           Player:SetMoveMode(0)
           end
        else
           if movemode == 0 then
           Player:SetMoveMode(1)
           end
        end
     else
        if movemode == 1 then
           Player:SetMoveMode(0)
        end
     end
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
			  AetheryteHelper.SetToolTips(mJTp.tip85,mETp.tip85,mDTp.tip85,mFTp.tip85,mCTp.tip85,mKTp.tip85)
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
			  AetheryteHelper.SetToolTips(mJTp.tip85,mETp.tip85,mDTp.tip85,mFTp.tip85,mCTp.tip85,mKTp.tip85)
			  end
			  end
		 end
	  else
		 GUI:SameLine(10,-40)
		 GUI:Image(ImageFolder..[[materia_lock.png]],40,40)
		 if (GUI:IsItemHovered()) then
		 if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip99,mETp.tip99,mDTp.tip99,mFTp.tip99,mCTp.tip99,mKTp.tip99)
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
			  AetheryteHelper.SetToolTips(mJTp.tip82,mETp.tip82,mDTp.tip82,mFTp.tip82,mCTp.tip82,mKTp.tip82)
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
			  AetheryteHelper.SetToolTips(mJTp.tip82,mETp.tip82,mDTp.tip82,mFTp.tip82,mCTp.tip82,mKTp.tip82)
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
			  AetheryteHelper.SetToolTips(mJTp.tip82,mETp.tip82,mDTp.tip82,mFTp.tip82,mCTp.tip82,mKTp.tip82)
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
			  AetheryteHelper.SetToolTips(mJTp.tip82,mETp.tip82,mDTp.tip82,mFTp.tip82,mCTp.tip82,mKTp.tip82)
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
			  AetheryteHelper.SetToolTips(mJTp.tip83,mETp.tip83,mDTp.tip83,mFTp.tip83,mCTp.tip83,mKTp.tip83)
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
			  AetheryteHelper.SetToolTips(mJTp.tip83,mETp.tip83,mDTp.tip83,mFTp.tip83,mCTp.tip83,mKTp.tip83)
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
			  AetheryteHelper.SetToolTips(mJTp.tip83,mETp.tip83,mDTp.tip83,mFTp.tip83,mCTp.tip83,mKTp.tip83)
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
			  AetheryteHelper.SetToolTips(mJTp.tip83,mETp.tip83,mDTp.tip83,mFTp.tip83,mCTp.tip83,mKTp.tip83)
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
			  AetheryteHelper.SetToolTips(mJTp.tip100,mETp.tip100,mDTp.tip100,mFTp.tip100,mCTp.tip100,mKTp.tip100)
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
			  AetheryteHelper.SetToolTips(mJTp.tip27,mETp.tip27,mDTp.tip27,mFTp.tip27,mCTp.tip27,mKTp.tip27)
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
			  AetheryteHelper.SetToolTips(mJTp.tip27,mETp.tip27,mDTp.tip27,mFTp.tip27,mCTp.tip27,mKTp.tip27)
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
			  AetheryteHelper.SetToolTips(mJTp.tip27,mETp.tip27,mDTp.tip27,mFTp.tip27,mCTp.tip27,mKTp.tip27)
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
			  AetheryteHelper.SetToolTips(mJTp.tip27,mETp.tip27,mDTp.tip27,mFTp.tip27,mCTp.tip27,mKTp.tip27)
			  end
				end
			 end
		  end
	  else
	  GUI:SameLine(10,-40)
	  GUI:Image(ImageFolder..[[desynth_lock.png]],40,40)
		 if (GUI:IsItemHovered()) then
		 if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip99,mETp.tip99,mDTp.tip99,mFTp.tip99,mCTp.tip99,mKTp.tip99)
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
			  AetheryteHelper.SetToolTips(mJTp.tip108,mETp.tip108,mDTp.tip108,mFTp.tip108,mCTp.tip108,mKTp.tip108)
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
			  AetheryteHelper.SetToolTips(mJTp.tip101,mETp.tip101,mDTp.tip101,mFTp.tip101,mCTp.tip101,mKTp.tip101)
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
								  AetheryteHelper.SetToolTips(mJTp.tip92,mETp.tip92,mDTp.tip92,mFTp.tip92,mCTp.tip92,mKTp.tip92)
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
								  AetheryteHelper.SetToolTips(mJTp.tip92,mETp.tip92,mDTp.tip92,mFTp.tip92,mCTp.tip92,mKTp.tip92)
							  end
						  end

					end
			 elseif AHSET.isQuestmode == true then
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
									AetheryteHelper.SetToolTips(mJTp.tip92,mETp.tip92,mDTp.tip92,mFTp.tip92,mCTp.tip92,mKTp.tip92)
								end
							end
			 end
	  else
	  GUI:SameLine(10,-40)
	  GUI:Image(ImageFolder..[[AR_lock.png]],40,40)
	  if (GUI:IsItemHovered()) then
			  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip99,mETp.tip99,mDTp.tip99,mFTp.tip99,mCTp.tip99,mKTp.tip99)
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
			  AetheryteHelper.SetToolTips(mJTp.tip102,mETp.tip102,mDTp.tip102,mFTp.tip102,mCTp.tip102,mKTp.tip102)
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
	 if AuL.JP == true then
	    AHSET.selectGC = GUI:Combo("###GC",Player.GrandCompany,mushGCJP,1)
	 elseif AuL.EN == true then 
	 	  AHSET.selectGC = GUI:Combo("###GC",Player.GrandCompany,mushGCEN,1)
	 elseif AuL.DE == true then 
	 	  AHSET.selectGC = GUI:Combo("###GC",Player.GrandCompany,mushGCDE,1)
	 elseif AuL.FR == true then 
	 	  AHSET.selectGC = GUI:Combo("###GC",Player.GrandCompany,mushGCFR,1)
	 elseif AuL.CN == true then 
	 	  AHSET.selectGC = GUI:Combo("###GC",Player.GrandCompany,mushGCCN,1)
	 elseif AuL.KR == true then 
	 	  AHSET.selectGC = GUI:Combo("###GC",Player.GrandCompany,mushGCKR,1)
	 elseif gRegion == 1 and language == 0 and Player.GrandCompany ~= 0 then
	 		AHSET.selectGC = GUI:Combo("###GC",Player.GrandCompany,mushGCJP,1)
	 elseif gRegion == 1 and language == 1 and Player.GrandCompany ~= 0 then
	 		AHSET.selectGC = GUI:Combo("###GC",Player.GrandCompany,mushGCEN,1)
	 elseif gRegion == 1 and language == 2 and Player.GrandCompany ~= 0 then
	 		AHSET.selectGC = GUI:Combo("###GC",Player.GrandCompany,mushGCDE,1)
	 elseif gRegion == 1 and language == 3 and Player.GrandCompany ~= 0 then
	 		AHSET.selectGC = GUI:Combo("###GC",Player.GrandCompany,mushGCFR,1)
	 elseif gRegion == 2 and Player.GrandCompany ~= 0 then
	 		AHSET.selectGC = GUI:Combo("###GC",Player.GrandCompany,mushGCCN,1)
	 elseif gRegion == 3 and Player.GrandCompany ~= 0 then
	 		AHSET.selectGC = GUI:Combo("###GC",Player.GrandCompany,mushGCKR,1)
	 end
	 if Player.GrandCompany == 0 then
	 AHSET.selectGC = GUI:Combo("###",4,mushGCEN,1) end
	 AetheryteHelper.SaveSettings()
	 if (GUI:IsItemHovered()) then
	   if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip84,mETp.tip84,mDTp.tip84,mFTp.tip84,mCTp.tip84,mKTp.tip84)
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
			  AetheryteHelper.SetToolTips(mJTp.tip87,mETp.tip87,mDTp.tip87,mFTp.tip87,mCTp.tip87,mKTp.tip87)
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
			  AetheryteHelper.SetToolTips(mJTp.tip87,mETp.tip87,mDTp.tip87,mFTp.tip87,mCTp.tip87,mKTp.tip87)
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
			  AetheryteHelper.SetToolTips(mJTp.tip88,mETp.tip88,mDTp.tip88,mFTp.tip88,mCTp.tip88,mKTp.tip88)
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
			  AetheryteHelper.SetToolTips(mJTp.tip88,mETp.tip88,mDTp.tip88,mFTp.tip88,mCTp.tip88,mKTp.tip88)
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
			  AetheryteHelper.SetToolTips(mJTp.tip89,mETp.tip89,mDTp.tip89,mFTp.tip89,mCTp.tip89,mKTp.tip89)
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
			  AetheryteHelper.SetToolTips(mJTp.tip90,mETp.tip90,mDTp.tip90,mFTp.tip90,mCTp.tip90,mKTp.tip90)
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
			  AetheryteHelper.SetToolTips(mJTp.tip90,mETp.tip90,mDTp.tip90,mFTp.tip90,mCTp.tip90,mKTp.tip90)
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
			  AetheryteHelper.SetToolTips(mJTp.tip91,mETp.tip91,mDTp.tip91,mFTp.tip91,mCTp.tip91,mKTp.tip91)
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
			  AetheryteHelper.SetToolTips(mJTp.tip91,mETp.tip91,mDTp.tip91,mFTp.tip91,mCTp.tip91,mKTp.tip91)
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
			  AetheryteHelper.SetToolTips(mJTp.tip103,mETp.tip103,mDTp.tip103,mFTp.tip103,mCTp.tip103,mKTp.tip103)
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
			  AetheryteHelper.SetToolTips(mJTp.tip25,mETp.tip25,mDTp.tip25,mFTp.tip25,mCTp.tip25,mKTp.tip25)
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
			  AetheryteHelper.SetToolTips(mJTp.tip75,mETp.tip75,mDTp.tip75,mFTp.tip75,mCTp.tip75,mKTp.tip75)
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
			  AetheryteHelper.SetToolTips(mJTp.tip75,mETp.tip75,mDTp.tip75,mFTp.tip75,mCTp.tip75,mKTp.tip75)
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
			  AetheryteHelper.SetToolTips(mJTp.tip26,mETp.tip26,mDTp.tip26,mFTp.tip26,mCTp.tip26,mKTp.tip26)
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
			  AetheryteHelper.SetToolTips(mJTp.tip26,mETp.tip26,mDTp.tip26,mFTp.tip26,mCTp.tip26,mKTp.tip26)
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
			  AetheryteHelper.SetToolTips(mJTp.tip77,mETp.tip77,mDTp.tip77,mFTp.tip77,mCTp.tip77,mKTp.tip77)
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
			  AetheryteHelper.SetToolTips(mJTp.tip78,mETp.tip78,mDTp.tip78,mFTp.tip78,mCTp.tip78,mKTp.tip78)
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
			  AetheryteHelper.SetToolTips(mJTp.tip76,mETp.tip76,mDTp.tip76,mFTp.tip76,mCTp.tip76,mKTp.tip76)
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
         AetheryteHelper.SetToolTips(mJTp.tip76,mETp.tip76,mDTp.tip76,mFTp.tip76,mCTp.tip76,mKTp.tip76)
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
			  AetheryteHelper.SetToolTips(mJTp.tip79,mETp.tip79,mDTp.tip79,mFTp.tip79,mCTp.tip79,mKTp.tip79)
			  end
	 end
	 GUI:EndGroup()
	 GUI:AlignFirstTextHeightToWidgets()
	 GUI:BeginGroup()
	 GUI:PushItemWidth(170)
	 if AuL.JP == true then 
	 	  AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.jp,5)
	 		AetheryteHelper.SaveSettings()
	 elseif AuL.EN == true then 
	 	  AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.En,5)
	 		AetheryteHelper.SaveSettings()
	 elseif AuL.DE == true then 
	 	  AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.De,5)
	 		AetheryteHelper.SaveSettings()
	 elseif AuL.FR == true then 
	 	  AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.Fr,5)
	 		AetheryteHelper.SaveSettings()
	 elseif AuL.CN == true then 
	 	  AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.Cn,5)
	 		AetheryteHelper.SaveSettings()
	 elseif AuL.KR == true then 
	 	  AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.Kr,5)
	 		AetheryteHelper.SaveSettings()
	 elseif language == 0 and gRegion == 1 then
	 		AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.jp,5)
	 		AetheryteHelper.SaveSettings()
	 elseif language == 1 and gRegion == 1 then
	 		AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.En,5)
	 		AetheryteHelper.SaveSettings()
	 elseif language == 2 and gRegion == 1 then
	 		AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.De,5)
	 		AetheryteHelper.SaveSettings()
	 elseif language == 3 and gRegion == 1 then
	 		AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.Fr,5)
	 		AetheryteHelper.SaveSettings()
	 elseif gRegion == 2 then
	 		AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.Cn,5)
	 		AetheryteHelper.SaveSettings()
	 elseif gRegion == 3 then
	 		AHSET.koukanhin = GUI:Combo("",AHSET.koukanhin,GCexchangeItems.Kr,5)
	 		AetheryteHelper.SaveSettings()
	 end
	 GUI:EndGroup()
	 if (GUI:IsItemHovered()) then
	   if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip80,mETp.tip80,mDTp.tip80,mFTp.tip80,mCTp.tip80,mKTp.tip80)
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
			  AetheryteHelper.SetToolTips(mJTp.tip81,mETp.tip81,mDTp.tip81,mFTp.tip81,mCTp.tip81,mKTp.tip81)
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
			  AetheryteHelper.SetToolTips(mJTp.tip81,mETp.tip81,mDTp.tip81,mFTp.tip81,mCTp.tip81,mKTp.tip81)
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
			  AetheryteHelper.SetToolTips(mJTp.tip98,mETp.tip98,mDTp.tip98,mFTp.tip98,mCTp.tip98,mKTp.tip98)
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
			  AetheryteHelper.SetToolTips(mJTp.tip97,mETp.tip97,mDTp.tip97,mFTp.tip97,mCTp.tip97,mKTp.tip97)
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
	   if (v.id == Player.homeworld) then local homeWorld = v
		  GUI:Text("Home：" ..tostring(homeWorld.Name).."["..tostring(homeWorld.DC).."]")
	   end
	end
	GUI:EndGroup()
	--GUI:SameLine()
	GUI:BeginGroup()
	for k,v in pairs(WorldID) do
	   if (v.id == Player.currentworld) then local NowWorld = v
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
     elseif (AH_AutoDC == "豆豆柴" ) then AHSET.selectDC = 11
     elseif (AH_AutoDC == "猫小胖" ) then AHSET.selectDC = 12
     elseif (AH_AutoDC == "莫古力" ) then AHSET.selectDC = 13
     elseif (AH_AutoDC == "陆行鸟" ) then AHSET.selectDC = 14
     elseif (AH_AutoDC == "KR" ) then AHSET.selectDC = 15
     else AHSET.selectDC = 1
	  end
	  --[[
	  if (AH_AutoDC == "Elemental") then AHSET.selectDC = 2
		 elseif (AH_AutoDC == "Gaia" ) then AHSET.selectDC = 3
		 elseif (AH_AutoDC == "Mana" ) then AHSET.selectDC = 4
		 elseif (AH_AutoDC == "Meteor" ) then AHSET.selectDC = 5
		 elseif (AH_AutoDC == "Aether" ) then AHSET.selectDC = 6
		 elseif (AH_AutoDC == "Primal" ) then AHSET.selectDC = 7
		 elseif (AH_AutoDC == "Chaos" ) then AHSET.selectDC = 8
		 elseif (AH_AutoDC == "Light" ) then AHSET.selectDC = 9
		 elseif (AH_AutoDC == "Crystal" ) then AHSET.selectDC = 10
		 elseif (AH_AutoDC == "Materia" ) then AHSET.selectDC = 11
     elseif (AH_AutoDC == "豆豆柴" ) then AHSET.selectDC = 12
     elseif (AH_AutoDC == "猫小胖" ) then AHSET.selectDC = 13
     elseif (AH_AutoDC == "莫古力" ) then AHSET.selectDC = 14
     elseif (AH_AutoDC == "陆行鸟" ) then AHSET.selectDC = 15
     elseif (AH_AutoDC == "KR" ) then AHSET.selectDC = 16
		 else AHSET.selectDC = 1
	  end
	  ]]
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
	  if Player.localmapid == 132 or Player.localmapid == 129 or Player.localmapid == 130 then
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
			  AetheryteHelper.SetToolTips(mJTp.tip01,mETp.tip01,mDTp.tip01,mFTp.tip01,mCTp.tip01,mKTp.tip01)
			  end
			  end
	  elseif selectins == false then
			  GUI:SameLine(-5,-20)
			  GUI:Image(ImageFolder..[[AHoff.png]],20,20)
			  if (GUI:IsItemHovered()) then
			  if (GUI:IsMouseClicked(0)) then
			  isins = 4
			  selectins = not selectins
			  end
			  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip01,mETp.tip01,mDTp.tip01,mFTp.tip01,mCTp.tip01,mKTp.tip01)
			  end
			  end
	  end
	  else
	  	GUI:SameLine(-5,-20)
		  GUI:Image(ImageFolder..[[AH_non.png]],20,20)
		  if (GUI:IsItemHovered()) then
			  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip00,mETp.tip00,mDTp.tip00,mFTp.tip00,mCTp.tip00,mKTp.tip00)
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
					if (v.id == Player.currentworld) then local tempWorld = v
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
	 GUI:Combo( "server",1,FFXIVServerlist[16],1)
	 --GUI:Combo( "server",1,FFXIVServerlist[17],1)
	 end
	 if (GUI:IsItemHovered()) then
	  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip95,mETp.tip95,mDTp.tip95,mFTp.tip95,mCTp.tip95,mKTp.tip95)
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
			  AetheryteHelper.SetToolTips(mJTp.tip22,mETp.tip22,mDTp.tip22,mFTp.tip22,mCTp.tip22,mKTp.tip22)
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
					if (v.id == Player.currentworld) then local tempWorld = v
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

	 --if ( gRegion == 1) then
		AHSET.selectDC = GUI:Combo( "###DC", AHSET.selectDC,FFXIVDClist,1)
	 --end
	 if (GUI:IsItemHovered()) then
	 if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip93,mETp.tip93,mDTp.tip93,mFTp.tip93,mCTp.tip93,mKTp.tip93)
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
			  AetheryteHelper.SetToolTips(mJTp.tip04,mETp.tip04,mDTp.tip04,mFTp.tip04,mCTp.tip04,mKTp.tip04)
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
			  AetheryteHelper.SetToolTips(mJTp.tip04,mETp.tip04,mDTp.tip04,mFTp.tip04,mCTp.tip04,mKTp.tip04)
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
	 GUI:Combo( "server",1,FFXIVServerlist[16],1)
	 end
	 if (GUI:IsItemHovered()) then
	  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip95,mETp.tip95,mDTp.tip95,mFTp.tip95,mCTp.tip95,mKTp.tip95)
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
			  	if (GUI:IsMouseClicked(1)) then
			  	AetheryteHelper.selectlanguage.open = not AetheryteHelper.selectlanguage.open
			  	end
			  AetheryteHelper.SetToolTips(mJTp.tip109,mETp.tip109,mDTp.tip109,mFTp.tip109,mCTp.tip109,mKTp.tip109)
			  end
	  elseif AHSET.mushtooltips == false then
			  GUI:SameLine(2.5,-25)
			  GUI:Image(ImageFolder..[[tips_non.png]],25,25)
			  if (GUI:IsItemHovered()) then
			  	if (GUI:IsMouseClicked(0)) then
			  	AHSET.mushtooltips = not AHSET.mushtooltips
			  	AetheryteHelper.SaveSettings()
			  	end
			  	if (GUI:IsMouseClicked(1)) then
			  	AetheryteHelper.selectlanguage.open = not AetheryteHelper.selectlanguage.open
			  	end
			  AetheryteHelper.SetToolTips(mJTp.tip109,mETp.tip109,mDTp.tip109,mFTp.tip109,mCTp.tip109,mKTp.tip109)
			  end
	  end
	  GUI:EndGroup()
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:ImageButton("###flag",ImageFolder..[[Radar.png]], 20,20)
			if (GUI:IsItemHovered()) then
			  if (GUI:IsMouseClicked(0)) then
			  AetheryteHelper.RadarWindow.open = not AetheryteHelper.RadarWindow.open
			  end
			  if (GUI:IsMouseClicked(1)) then
			  AetheryteHelper.miniRadarWindow.open = not AetheryteHelper.miniRadarWindow.open
			  end
			  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip143,mETp.tip143,mDTp.tip143,mFTp.tip143,mCTp.tip143,mKTp.tip143)
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
			  AetheryteHelper.SetToolTips(mJTp.tip03,mETp.tip03,mDTp.tip03,mFTp.tip03,mCTp.tip03,mKTp.tip03)
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
			  AetheryteHelper.SetToolTips(mJTp.tip117,mETp.tip117,mDTp.tip117,mFTp.tip117,mCTp.tip117,mKTp.tip117)
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
	  GUI:Image(ImageFolder..[[kofi.png]],25,25)
	  if (GUI:IsItemHovered()) then
	  if GUI:IsItemClicked(0) then
			io.popen([[cmd /c start "" "]]..kinokoProject.HELP.mykofi..[["]]):close()
	  end
	  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip96,mETp.tip96,mDTp.tip96,mFTp.tip96,mCTp.tip96,mKTp.tip96)
			  end
	  end
	  GUI:EndGroup()
	  GUI:SameLine()
	  GUI:BeginGroup()
	  GUI:Image(ImageFolder..[[patreon.png]],25,25)
	  if (GUI:IsItemHovered()) then
	  if GUI:IsItemClicked(0) then
			io.popen([[cmd /c start "" "]]..kinokoProject.HELP.mypatreon..[["]]):close()
	  end
	  if AHSET.mushtooltips == true then
			  AetheryteHelper.SetToolTips(mJTp.tip96,mETp.tip96,mDTp.tip96,mFTp.tip96,mCTp.tip96,mKTp.tip96)
			  end
	  end
	  GUI:EndGroup()

end

function AetheryteHelper.UPCKB()
   if mushVC == false then
     GUI:BeginGroup()
	   GUI:Image(ImageFolder..[[CB_clear.png]],30,30)
	   if (GUI:IsItemHovered()) then
		  	if (GUI:IsMouseClicked(0)) then
				AetheryteHelper.UpdateConfig.open = not AetheryteHelper.UpdateConfig.open
			  end
			  if AHSET.mushtooltips == true then
			     AetheryteHelper.SetToolTips(mJTp.tip220,mETp.tip220,mDTp.tip220,mFTp.tip220,mCTp.tip220,mKTp.tip220)
			  end
	   end
	   GUI:EndGroup()
	 elseif mushVC == true then
	 	 GUI:BeginGroup()
	   GUI:Image(ImageFolder..[[download.png]],30,30)
	   if (GUI:IsItemHovered()) then
		  	if (GUI:IsMouseClicked(0)) then
				AetheryteHelper.UpdateConfig.open = not AetheryteHelper.UpdateConfig.open
			  end
			  if AHSET.mushtooltips == true then
			     AetheryteHelper.SetToolTips(mJTp.tip223,mETp.tip223,mDTp.tip223,mFTp.tip223,mCTp.tip223,mKTp.tip223)
			  end
	   end
	   GUI:EndGroup()
	 end
end
--------------------------------------------------------------------------------
-- header & All Drowcall GUI

function AetheryteHelper.DrawCall()
  local Windows = kinokoProject.Windows.MainWindows
  local Addon = kinokoProject.Addon
  local minikinoko = kinokoProject.Windows.minibutton
  local num = 230
 if GetGameState() == FFXIV.GAMESTATE.INGAME and not IsControlOpen("Title") or
	GetGameState() == FFXIV.GAMESTATE.INGAME and not IsControlOpen("CharaSelect") then
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


	  if (AetheryteHelper.GUI.tabs[1].isselected) and mushTrustmode == false then--main

	  if gRegion == 1 and Player.localmapid == 957 then
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
	elseif gRegion == 2 and Player.localmapid == 956 or gRegion == 2 and Player.localmapid == 957 or gRegion == 2 and Player.localmapid == 958 or
	  gRegion == 2 and Player.localmapid == 959 or gRegion == 2 and Player.localmapid == 960 or gRegion == 2 and Player.localmapid == 961 then
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
	  GUI:SameLine(num)
	  AetheryteHelper.UPCKB()

	  elseif (AetheryteHelper.GUI.tabs[2].isselected) and mushTrustmode == false then--tool
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
	  GUI:SameLine(num)
	  AetheryteHelper.UPCKB()

	  elseif (AetheryteHelper.GUI.tabs[3].isselected) and mushTrustmode == false then--toys
	  AetheryteHelper.DrawadWIP() ------button
	  GUI:Spacing()
	  GUI:Separator()
	  GUI:Spacing()
	  AetheryteHelper.footerkofi()
	  GUI:SameLine()
	  AetheryteHelper.statuscheck()
	  GUI:SameLine(num)
	  AetheryteHelper.UPCKB()

	  elseif (AetheryteHelper.GUI.tabs[4].isselected) and mushTrustmode == false then--jank
	  AetheryteHelper.Drawadjank() ------button
	  GUI:Spacing()
	  GUI:Separator()
	  GUI:Spacing()
	  AetheryteHelper.footerkofi()
	  GUI:SameLine()
	  AetheryteHelper.statuscheck()
	  GUI:SameLine(num)
	  AetheryteHelper.UPCKB()

	  elseif (AetheryteHelper.GUI.tabs[5].isselected) or mushTrustmode == true then--GC
	  AetheryteHelper.subtoolGC()
	  AetheryteHelper.GCtrunin()
	  GUI:Spacing()
	  GUI:Separator()
	  GUI:Spacing()
	  AetheryteHelper.footerkofi()
	  GUI:SameLine()
	  AetheryteHelper.statuscheck()
	  GUI:SameLine(num)
	  AetheryteHelper.UPCKB()
	  if mushTrustmode == true then
		AetheryteHelper.GUI.tabs[1].isselected = false
		AetheryteHelper.GUI.tabs[2].isselected = false
		AetheryteHelper.GUI.tabs[3].isselected = false
		AetheryteHelper.GUI.tabs[4].isselected = false
		AetheryteHelper.GUI.tabs[5].isselected = true
		AetheryteHelper.GUI.tabs[6].isselected = false
		AetheryteHelper.GUI.tabs[7].isselected = false
	  end
	  elseif (AetheryteHelper.GUI.tabs[6].isselected) and mushTrustmode == false then--item
	  AetheryteHelper.DrawadItems()------button
	  GUI:Spacing()
	  GUI:Separator()
	  GUI:Spacing()
	  AetheryteHelper.footerkofi()
	  GUI:SameLine()
	  AetheryteHelper.statuscheck()
	  GUI:SameLine(num)
	  AetheryteHelper.UPCKB()
	  elseif (AetheryteHelper.GUI.tabs[7].isselected) and mushTrustmode == false then--tcmd
	  AetheryteHelper.TCListHeader()
	  GUI:BeginChild("##AHtcmd", 0, GUI_GetFrameHeight(4), true)
	  AetheryteHelper.TCListwindow()
	  GUI:EndChild()
	  GUI:Spacing()
	  GUI:Separator()
	  GUI:Spacing()
	  AetheryteHelper.footerkofi()
	  GUI:SameLine()
	  AetheryteHelper.statuscheck()
	  GUI:SameLine(num)
	  AetheryteHelper.UPCKB()
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
  AetheryteHelper.SVRSelectermini()
  AetheryteHelper.MIPselect()
  AetheryteHelper.YoroOtu()
  AetheryteHelper.Radar()
  AetheryteHelper.DrawlineandDot()
  AetheryteHelper.miniRadar()
  AetheryteHelper.CreateButtonWindows()
  AetheryteHelper.CBcodeEditWindows()
  AetheryteHelper.userButtonAllDrow()
  AetheryteHelper.UserLanguageSet()
  AetheryteHelper.UpdateWindow()
  end
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
			  local el = MEntityList("nearest,type=5")
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
			  if AetheryteHelper.ATuse.ATuseEnable == true then
			  Player:Teleport(8,0,true)
			  else
			  Player:Teleport(8,0,false)
			  end
			end
		 end

			 if (GCStep == 0) then
				   if Player.localmapid == 129 then
					  Player:SetTarget(4298661156)
					  limsaAethe = Player:GetTarget()
					  local pos = limsaAethe.pos
					  local dis = limsaAethe.Distance
					  Player:MoveTo(pos.x,pos.y,pos.z,10,true,true)
					  if dis <= 6 then
					  GCStep = 1
					  end
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
				  if AetheryteHelper.ATuse.ATuseEnable == true then
				  AetheryteHelper.Teleport(2,0)
				  --Player:Teleport(2,0,true)
				  else
				  Player:Teleport(2,0,false)
				  end
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
				  if AetheryteHelper.ATuse.ATuseEnable == true then
				  AetheryteHelper.Teleport(9,0)
				  --Player:Teleport(9,0,true)
				  else
				  Player:Teleport(9,0,false)
				  end
				  end
				  end
			  end
end

---------------------------------------------------------------------------------------------------------------------------
function AetheryteHelper.moveMBlimsa()
				limaetheID = 0
				local el = MEntityList("nearest,type=5")
				if table.valid(el) then
				for k,v in pairs(el) do
				limaetheID = v.id
				end
				end
				limMBID = 0
				local elm = MEntityList("nearest,contentID=2000402")
				if table.valid(elm) then
				for k,v in pairs(elm) do
				limMBID = v.id
				end
				end
		 if mushMBlim == true then

			if limMBStep == 0 then
			   if AHSET.mushmovetoMB == false then
				  if ActionList:IsReady() and (Player.localmapid ~= 129) and (Player.localmapid ~= 128) then
				  if AetheryteHelper.ATuse.ATuseEnable == true then
				  AetheryteHelper.Teleport(8,0)
				  --Player:Teleport(8,0,true)
				  else
				  Player:Teleport(8,0,false)
				  end
				  mushlooptimer = 1000
				  end
				  if Player.localmapid == 129 then
				  mushlooptimer = 1000
				  mushMBlim = false
				  elseif Player.localmapid == 128 then
				  mushlooptimer = 1000
				  mushMBlim = false
				  end
			   elseif AHSET.mushmovetoMB == true then
				  if ActionList:IsReady() and (Player.localmapid ~= 129) and (Player.localmapid ~= 128) then
				  if AetheryteHelper.ATuse.ATuseEnable == true then
				  AetheryteHelper.Teleport(8,0)
				  --Player:Teleport(8,0,true)
				  else
				  Player:Teleport(8,0,false)
				  end
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
				local el = MEntityList("nearest,type=5")
				if table.valid(el) then
				for k,v in pairs(el) do
				griaetheID = v.id
				end
				end
				griMBID = 0
				local elm = MEntityList("nearest,contentID=2000402")
				if table.valid(elm) then
				for k,v in pairs(elm) do
				griMBID = v.id
				end
				end
		 if mushMBgri == true then

			if griMBStep == 0 then
			   if AHSET.mushmovetoMB == false then
				  if ActionList:IsReady() and (Player.localmapid ~= 132) and (Player.localmapid ~= 133) then
				  if AetheryteHelper.ATuse.ATuseEnable == true then
				  AetheryteHelper.Teleport(2,0)
				  --Player:Teleport(2,0,true)
				  else
				  Player:Teleport(2,0,false)
				  end
				  mushlooptimer = 1000
				  end
				  if Player.localmapid == 132 then
				  mushlooptimer = 1000
				  mushMBgri = false
				  elseif Player.localmapid == 133 then
				  mushlooptimer = 1000
				  mushMBgri = false
				  end
			   elseif AHSET.mushmovetoMB == true then
				  if ActionList:IsReady() and (Player.localmapid ~= 132) and (Player.localmapid ~= 133) then
				  if AetheryteHelper.ATuse.ATuseEnable == true then
				  AetheryteHelper.Teleport(2,0)
				  --Player:Teleport(2,0,true)
				  else
				  Player:Teleport(2,0,false)
				  end
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
				local el = MEntityList("nearest,type=5")
				if table.valid(el) then
				for k,v in pairs(el) do
				uldaetheID = v.id
				end
				end
				uldMBID = 0
				local elm = MEntityList("nearest,contentID=2000442")
				if table.valid(elm) then
				for k,v in pairs(elm) do
				uldMBID = v.id
				end
				end
		 if mushMBul == true then

			if uldMBStep == 0 then
			   if AHSET.mushmovetoMB == false then
				  if ActionList:IsReady() and (Player.localmapid ~= 130) and (Player.localmapid ~= 131) then
				  if AetheryteHelper.ATuse.ATuseEnable == true then
				  AetheryteHelper.Teleport(9,0)
				  --Player:Teleport(9,0,true)
				  else
				  Player:Teleport(9,0,false)
				  end
				  end
				  if Player.localmapid == 130 then
				  mushlooptimer = 1000
				  mushMBul = false
				  elseif Player.localmapid == 131 then
				  mushlooptimer = 1000
				  mushMBul = false
				  end
			   elseif AHSET.mushmovetoMB == true then
				  if ActionList:IsReady() and (Player.localmapid ~= 130) and (Player.localmapid ~= 131) then
				  if AetheryteHelper.ATuse.ATuseEnable == true then
				  AetheryteHelper.Teleport(9,0)
				  --Player:Teleport(9,0,true)
				  else
				  Player:Teleport(9,0,false)
				  end
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
			 if Player.GrandCompany == 1 and Player.localmapid ~= 128 then GCexchange = false end
			 if Player.GrandCompany == 2 and Player.localmapid ~= 132 then GCexchange = false end
			 if Player.GrandCompany == 3 and Player.localmapid ~= 130 then GCexchange = false end

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
				 mushlooptimer = 1000
				 GCexchange = false
			  end
  end
 end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--seals to items
function AetheryteHelper.mushSealstoItem()
	   if Player.GrandCompany == 1 and Player.localmapid ~= 128 then sealstoitem = false end
	   if Player.GrandCompany == 2 and Player.localmapid ~= 132 then sealstoitem = false end
	   if Player.GrandCompany == 3 and Player.localmapid ~= 130 then sealstoitem = false end
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
function AetheryteHelper.HazardPlayer(ylm,Pname)
	if Rset.RadarEnable == true then
		local el = MEntityList("maxdistance="..tostring(ylm))
		if table.valid(el) then
			for _,e in pairs(el) do
				if e.name == Pname and e.distance <= ylm then
				Player:Stop()
				end
			end
  	end
  	return ylm,Pname
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
		 if (AHSET.isMateriaEnabled and Player.IsMounted == false and Player:GetTarget() == nil and Duty:GetQueueStatus() == 4 and not IsControlOpen("Synthesis") and not IsControlOpen("RecipeNote")) then
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
	else
		mushlooptimer = 1000
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
	else
	  mushlooptimer = 1000
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
		if (Player.IsMounted == false and Player:GetTarget() == nil and Duty:IsQueued() == false and not IsControlOpen("Trade") and not IsControlOpen("Synthesis") and not IsControlOpen("RecipeNote")) then
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
		for _, item in pairs(ilist) do
		if table.size(item.materias) > 0 and item.equipslot > 0 and item.requiredlevel > 1 then
		  mushlooptimer = 1000
		  if ActionList:IsReady() then
		  d("[AH][RetrieveMateria]:Count["..materia.."]")
		  item:RetrieveMateria()
		  return
		  end
		--else
		--Remateria = false
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
	   if (AHSET.isQuestmode == true and FFXIV_Common_BotRunning == false and Player.IsMounted == false and not IsControlOpen("Trade") and not IsControlOpen("Synthesis") and not IsControlOpen("RecipeNote")) then
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
			 if( item.IsCollectable == true and item.IsBinding == true and item.id ~= 19903 ) then
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


	if (AHSET.isReductionEnabled == true and Player.IsMounted == false and Player:GetTarget() == nil and not IsControlOpen("Trade") and not IsControlOpen("Synthesis") and not IsControlOpen("RecipeNote")) then
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
		if( item.IsCollectable == true and item.IsBinding == true and item.id ~= 19903 ) then
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
	   if (AHSET.isSalvageEnabled and Player.IsMounted == false and Player:GetTarget() == nil and not IsControlOpen("Trade") and Duty:GetQueueStatus() == 4 and not IsControlOpen("Synthesis") and not IsControlOpen("RecipeNote")) then
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
   elseif (AHSET.isSalvageEnabled and Player.IsMounted == false and Player:GetTarget() == nil and not IsControlOpen("Trade") and not IsControlOpen("Synthesis") and not IsControlOpen("RecipeNote")) then
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

---------------------------------------------------------------------------------------------

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
		  if AHSET.syokuzai then
			if item.ishq == 1 and item.searchcategory == 44 then
			   item:LowerQuality()
			end
		  end
		  if AHSET.sekizai then
			if item.ishq == 1 and item.searchcategory == 47 then
				item:LowerQuality()
			end
		  end
		  if AHSET.kinzoku then
			if item.ishq == 1 and item.searchcategory == 48 then
			   item:LowerQuality()
			end
		  end
		  if AHSET.mokuzai then
			if item.ishq == 1 and item.searchcategory == 49 then
			   item:LowerQuality()
			end
		  end
		  if AHSET.nuno then
			if item.ishq == 1 and item.searchcategory == 50 then
			   item:LowerQuality()
			end
		  end
		  if AHSET.kawa then
			if item.ishq == 1 and item.searchcategory == 51 then
			   item:LowerQuality()
			end
		  end
		  if AHSET.hone then
			if item.ishq == 1 and item.searchcategory == 52 then
			   item:LowerQuality()
			end
		  end
		  if AHSET.renkin then
			if item.ishq == 1 and item.searchcategory == 53 then
			   item:LowerQuality()
			end
		  end
		  if item.count ~= item.max and item.IsCollectable == false then
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
						if GetChatLines()[table.maxn(GetChatLines())].timestamp == GetEorzeaTime().servertime - 10 and jufuku == jufuku and jufuku > 1 then
						v:Move(3,34)
						elseif GetChatLines()[table.maxn(GetChatLines())].timestamp == GetEorzeaTime().servertime - 20 and jufuku == jufuku and jufuku > 1 then
						v:Move(3,33)
						else
						v:Move(0,0)
						end
					end
				 end
			  end
			 end
		  end
		  d("[AH][ItemSort]num of items to separated:"..jufuku)
		  if GetChatLines()[table.maxn(GetChatLines())].timestamp == GetEorzeaTime().servertime - 30 and jufuku == jufuku and jufuku > 1 then
		   AetheryteHelper.IssueNotice(AHitemsortError.title01,AHitemsortError.J01,AHitemsortError.E01,AHitemsortError.D01,AHitemsortError.F01,AHitemsortError.C01,AHitemsortError.K01)
		   AHitemsort = false
		  end
		  if jufuku == 0 then
		  mushlooptimer = 1000
		  Inventory:SortInventory()
		  AHitemsort = false
		  end
	  end
end
---------------------------------------------------------------------------------------------

function AetheryteHelper.itemsortB()
		local nonmaxitemB = {}
		local jufukuB = 0
		local Bbags = {4000, 4001, 4100, 4101}
	 if AHitemsortB then
		mushlooptimer = 100
		for _, e in pairs(Bbags) do
		local Bbag = Inventory:Get(e)
		if (table.valid(Bbag)) then
		local Bilist = Bbag:GetList()
		if (table.valid(Bilist)) then
		for _, Bitem in pairs(Bilist) do
		  if Bitem.count ~= Bitem.max and Bitem.IsCollectable == false then
			table.insert(nonmaxitemB,Bitem)
		  end
		end
		end
		end
		end
		  for i = 1,tonumber(#nonmaxitemB),1 do
			 for k,v in pairs(nonmaxitemB) do
			  if k == i then
				 for key,val in pairs(nonmaxitemB) do
					if v.hqid == val.hqid and k ~= key then
					   jufukuB = jufukuB + 1
						if GetChatLines()[table.maxn(GetChatLines())].timestamp == GetEorzeaTime().servertime - 10 and jufukuB == jufukuB and jufukuB > 1 then
						v:Move(4000,1)
						elseif GetChatLines()[table.maxn(GetChatLines())].timestamp == GetEorzeaTime().servertime - 20 and jufukuB == jufukuB and jufukuB > 1 then
						v:Move(4001,2)
						else
						v:Move(4000,3)
						end
					end
				 end
			  end
			 end
		  end
		  d("[AH][ItemSort]num of items to separated:"..jufukuB)
		  if GetChatLines()[table.maxn(GetChatLines())].timestamp == GetEorzeaTime().servertime - 30 and jufukuB == jufukuB and jufukuB > 1 then
		   AetheryteHelper.IssueNotice(AHitemsortError.title01,AHitemsortError.J01,AHitemsortError.E01,AHitemsortError.D01,AHitemsortError.F01,AHitemsortError.C01,AHitemsortError.K01)
		   AHitemsortB = false
		  end
		  if jufukuB == 0 then
		  mushlooptimer = 1000
		  Inventory:SortInventory()
		  AHitemsortB = false
		  end
	  end
end

-----------------------------------------------------------------------------------------------------
function AetheryteHelper.itemsortRite()
		local nonmaxitemR = {}
		local jufukuR = 0
		local Rtype = nil
		local Rslot = nil
		local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	 if AHitemsortR and IsControlOpen("InventoryRetainer") or AHitemsortR and IsControlOpen("InventoryRetainerLarge") then
		mushlooptimer = 100
		for _, e in pairs(Rbags) do
		local Rbag = Inventory:Get(e)
		if (table.valid(Rbag)) then
		local Rilist = Rbag:GetList()
		if (table.valid(Rilist)) then
		for _, Ritem in pairs(Rilist) do
		  if Ritem.count ~= Ritem.max and Ritem.IsCollectable == false then
			table.insert(nonmaxitemR,Ritem)
		  end
		end
		end
		end
		end
		  for i = 1,tonumber(#nonmaxitemR),1 do
			 for k,v in pairs(nonmaxitemR) do
			  if k == i then
				 for key,val in pairs(nonmaxitemR) do
					if v.hqid == val.hqid and k ~= key then
					   jufukuR = jufukuR + 1
						if GetChatLines()[table.maxn(GetChatLines())].timestamp == GetEorzeaTime().servertime - 20 and jufukuR == jufukuR and jufukuR > 1 then
						v:Move(10006,24)
						elseif GetChatLines()[table.maxn(GetChatLines())].timestamp == GetEorzeaTime().servertime - 30 and jufukuR == jufukuR and jufukuR > 1 then
						v:Move(10006,23)
						else
						v:Move(10000,0)
						end
					end
				 end
			  end
			 end
		  end
		  d("[AH][ItemSort]num of items to separated:"..jufukuR)
		  if GetChatLines()[table.maxn(GetChatLines())].timestamp == GetEorzeaTime().servertime - 40 and jufukuR == jufukuR and jufukuR > 1 then
		   AetheryteHelper.IssueNotice(AHitemsortError.title01,AHitemsortError.J01,AHitemsortError.E01,AHitemsortError.D01,AHitemsortError.F01,AHitemsortError.C01,AHitemsortError.K01)
		   AHitemsortR = false
		  end
		  if jufukuR == 0 then
		  mushlooptimer = 1000
		  Inventory:SortInventory()
		  AHitemsortR = false
		  end
	  end
end

-----------------------------------------------------------------------------------------------------
function AetheryteHelper.itemSearch()
   local sagashimono = {}
   local bags = {0, 1, 2, 3}
  if AHSET.mushitemSearch and mushiS_rite == true or AHSET.mushitemSearch and mushiS_tori == true or AHSET.mushitemSearch and mushiS_FC == true then
		if IsControlOpen("Talk") then
			UseControlAction("Talk","Click")
			return
		end
		if IsControlOpen("InventoryRetainer") then
			mushlooptimer = 2000
		elseif IsControlOpen("InventoryRetainerLarge") then
			mushlooptimer = 2000
		elseif IsControlOpen("FreeCompanyChest") then
			mushlooptimer = 3000
		else
			mushlooptimer = 1300
		end

   if ISstep == 0 then
		for _, e in pairs(bags) do
		local bag = Inventory:Get(e)
		if (table.valid(bag)) then
		local ilist = bag:GetList()
		if (table.valid(ilist)) then
		for _, item in pairs(ilist) do
		  table.insert(sagashimono,item)
		end
		end
		end
		end
		if IsControlOpen("ItemFinder") then
		local mono = GetControl("ItemFinder"):GetRawData()[1].value
		syojisu = GetControl("ItemFinder"):GetRawData()[8].value
			  for i = 1,tonumber(#sagashimono),1 do
			  for k,v in pairs(sagashimono) do
				if k == i then
				  if mono:match(v.name) then
				  itemID = v.id
				  itemhqID = v.hqid
				  itemcount = v.count
				  itemmax = v.max
				  mybagslot = v.slot
				  mybagtype = v.type
				  itemunique = v.isunique
				  end
				end
			  end
			end
		  end
		if IsControlOpen("RecipeProductList") then
		  nhitemID = GetControl("RecipeProductList"):GetRawData()[2].value
		  nhitemhqID = tonumber("10"..nhitemID)
		  for i = 1,tonumber(#sagashimono),1 do
			  for k,v in pairs(sagashimono) do
				if k == i then
				  if nhitemID == v.id then
				  itemID = v.id
				  itemhqID = v.hqid
				  itemcount = v.count
				  itemmax = v.max
				  mybagslot = v.slot
				  mybagtype = v.type
				  itemunique = v.isunique
				  end
				end
			  end
			end
		end
		if itemID > 0 and itemhqID > 0 and tonumber(syojisu) > 0 or nhitemID > 0 and nhitemhqID > 0 then
		  d("[AH][itemSearch]:in bag item:"..itemID.."/ not have item:"..nhitemID)
		ISstep = 1
		else
		ISstep = 0
		end
   end

   if ISstep == 1 then
		  if IsControlOpen("ItemFinder") then
		  UseControlAction("ItemFinder","Close")
		  elseif IsControlOpen("RecipeProductList") then
		  UseControlAction("RecipeProductList","Close")
		  elseif IsControlOpen("Inventory") then
		  UseControlAction("Inventory","Close")
		  ISstep = 1
		  elseif itemunique == true then
		   d("[AH][itemSearch]:UnidueItem Noticet")
		   AetheryteHelper.IssueNotice(AHitemsortError.title02,AHitemsortError.J02,AHitemsortError.E02,AHitemsortError.D02,AHitemsortError.F02,AHitemsortError.C02,AHitemsortError.K02)
		   ISstep = 200
		  elseif itemunique ~= true and AHSET.mushitemSearch and mushiS_rite == true then
		  ISstep = 2
		  elseif itemunique ~= true and AHSET.mushitemSearch and mushiS_tori == true then
		  ISstep = 120
		  elseif itemunique ~= true and AHSET.mushitemSearch and mushiS_FC == true then
		  ISstep = 130
		  end
   end

   if ISstep == 2 then
		local el = MEntityList("nearest,contentID=196630,contentID=2000401,contentID=2010284,contentID=2000441")
		if table.valid(el) then
		for k,v in pairs(el) do
		ritebel = v.id
		end
		end
		if ritebel == 0 then
		d("[AH][itemSearch]:bell is not near")
		ISstep = 200
		else
		Player:SetTarget(ritebel)
		ISstep = 3
		end
   end
   if ISstep == 3 then
		Player:SetTarget(ritebel)
		local pos = Player:GetTarget().pos
		if Player:GetTarget().Distance > 6 then
		d("[AH][itemSearch]:move to bell:"..ritebel)
		   Player:MoveTo(pos.x,pos.y,pos.z,10,true,true)
		ISstep = 4
		elseif Player:GetTarget().Distance < 6 then
		ISstep = 5
		end
   end
   if ISstep == 4 then
		Player:SetTarget(ritebel)
		if Player:GetTarget().Distance <= 3 then
		Player:Stop()
		ISstep = 5
		end
   end
   if ISstep == 5 then
		Player:SetTarget(ritebel)
		Player:Interact(ritebel)
		ISstep = 6
   end
   if ISstep == 6 then
		if IsControlOpen("RetainerList") then
		ISstep = 7
		else
		ISstep = 5
		end
   end
   if ISstep == 7 then
		if IsControlOpen("RetainerList") then
		ritekazu = GetControl("RetainerList"):GetRawData()[3].value
		end
	  ISstep = 8
   end

-----1
   if ISstep == 8 then
		if IsControlOpen("RetainerList") then
		GetControl("RetainerList"):Action("SelectIndex",0)--rite
		ISstep = 9
		end
   end
   if ISstep == 9 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		end
		if IsControlOpen("SelectString") then
		ISstep = 10
		else
		ISstep = 9
		end
   end
   if ISstep == 10 then
	  if IsControlOpen("SelectString") then
		 GetControl("SelectString"):Action("SelectIndex",0)
	  end
	  if IsControlOpen("InventoryRetainer") then
	  ISstep = 11
	  elseif IsControlOpen("InventoryRetainerLarge") then
	  ISstep = 11
	  else
	  ISstep = 10
	  end
   end

   if ISstep == 11 then
	  if IsControlOpen("InventoryRetainer") or IsControlOpen("InventoryRetainerLarge") then
	  d("[AH][itemSearch]:1:in bag item:"..itemID.."/ not have item:"..nhitemID)
	   local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	   local bags = {0,1,2,3}
	   for _, e in pairs(Rbags) do
	   local Rbag = Inventory:Get(e)
	   if (table.valid(Rbag)) then
	   local Rilist = Rbag:GetList()
	   if (table.valid(Rilist)) then
	   for _, Ritem in pairs(Rilist) do
		  if itemID == Ritem.id then
			 if mushaccelerator == true then
			 Ritem:Move(mybagtype,mybagslot)
			 d("[AH][itemSearch]:item move")
			 elseif mushaccelerator == false then
				 for _, e in pairs(bags) do
				 local bag = Inventory:Get(e)
				 if (table.valid(bag)) then
				 local ilist = bag:GetList()
				 if (table.valid(ilist)) then
				 for _, item in pairs(ilist) do
				 if itemID == Ritem.id and itemID == item.id then
				 item:Move(Ritem.type,Ritem.slot)
				 d("[AH][itemSearch]:item move")
				 end
				 end
				 end
				 end
				 end
			 end
			 d("[AH][itemSearch]:item move")
				if itemcount == itemmax and mushaccelerator == true then
				local Fbags = {3}
				local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
				for _, e in pairs(Fbags) do
				local Fbag = Inventory:Get(e)
				if (table.valid(Fbag)) then
				local Filist = Fbag:GetList()
				if (table.valid(Filist)) then
				for _, Fitem in pairs(Filist) do
				   for s = 0,34,1 do
				   if Fitem.slot == s then
					  table.remove(Fslot,Fitem.slot)
				   end
				   for k,v in pairs(Fslot) do
					  Ritem:Move(3,v)
					  d("[AH][itemSearch]:item move")
				   end
				   end
				end
				end
				end
				end
				end
		  ISstep = 10
		  elseif nhitemID == Ritem.id and mushaccelerator == true then
			 local Fbags = {3}
			 local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
			 for _, e in pairs(Fbags) do
			 local Fbag = Inventory:Get(e)
			 if (table.valid(Fbag)) then
			 local Filist = Fbag:GetList()
			 if (table.valid(Filist)) then
			 for _, Fitem in pairs(Filist) do
				for s = 0,34,1 do
				  if Fitem.slot == s then
					table.remove(Fslot,Fitem.slot)
				  end
				  for k,v in pairs(Fslot) do
					Ritem:Move(3,v)
					d("[AH][itemSearch]:item move")
				  end
				end
			 end
			 end
			 end
			 end
		  ISstep = 10
		  else
		  ISstep = 12
		  end
	   end
	   end
	   end
	   end
	   end
   end
   if ISstep == 12 then
	  local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	  local bags = {0,1,2,3}
	  if mushaccelerator == true then
		 for _, e in pairs(Rbags) do
		 local Rbag = Inventory:Get(e)
		 if (table.valid(Rbag)) then
		 local Rilist = Rbag:GetList()
		 if (table.valid(Rilist)) then
		 for _, Ritem in pairs(Rilist) do
		 if itemID == Ritem.id then
			if Ritem.count ~= 0 then
			  ISstep = 11
			end
		 else
		 mushrite1uke = true
		 ISstep = 13
		 end
		 end
		 end
		 end
		 end
	  elseif mushaccelerator == false then
		 for _, e in pairs(bags) do
		 local bag = Inventory:Get(e)
		 if (table.valid(bag)) then
		 local ilist = bag:GetList()
		 if (table.valid(ilist)) then
		 for _, item in pairs(ilist) do
		 if itemID == item.id then
		  d("[AH][itemcount]:"..item.count)
			if item.count ~= 0 then
			  ISstep = 11
			end
		 else
		 mushrite1azuke = true
		 ISstep = 13
		 end
		 end
		 end
		 end
		 end
	  end
   end
   if ISstep == 13 then
	  if IsControlOpen("InventoryRetainer") then
		 UseControlAction("InventoryRetainer","Close")
		 ISstep = 13
	  elseif IsControlOpen("InventoryRetainerLarge") then
		 UseControlAction("InventoryRetainerLarge","Close")
		 ISstep = 13
	  elseif IsControlOpen("SelectString") then
		 Inventory:SortInventory()
		 ISstep = 14
	  end
   end
   if ISstep == 14 then
	   if IsControlOpen("SelectString") then
	   GetControl("SelectString"):Action("SelectIndex",9)
	   ISstep = 14
	   else
	   ISstep = 15
	   end
   end
   if ISstep == 15 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		ISstep = 15
		elseif IsControlOpen("RetainerList") and ritekazu > 1 then
		ISstep = 16
		elseif ritekazu == 1 then
		ISstep = 199
		end
   end
   if ISstep == 16 then
	  local bags = {0, 1, 2, 3}
	  for _, e in pairs(bags) do
	  local bag = Inventory:Get(e)
	  if (table.valid(bag)) then
	  local ilist = bag:GetList()
	  if (table.valid(ilist)) then
	  for _, item in pairs(ilist) do
		 if item.id == itemID or item.id == nhitemID then
			if item.isunique == true then
			ISstep = 199
			else
			ISstep = 20
			end
		 else
		 ISstep = 20
		 end
	  end
	  end
	  end
	  end
   end

-----2
   if ISstep == 20 then
		if IsControlOpen("RetainerList") then
		GetControl("RetainerList"):Action("SelectIndex",1)--rite
		ISstep = 21
		end
   end
   if ISstep == 21 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		end
		if IsControlOpen("SelectString") then
		ISstep = 22
		else
		ISstep = 21
		end
   end
   if ISstep == 22 then
	  if IsControlOpen("SelectString") then
		 GetControl("SelectString"):Action("SelectIndex",0)
	  end
	  if IsControlOpen("InventoryRetainer") then
	  ISstep = 23
	  elseif IsControlOpen("InventoryRetainerLarge") then
	  ISstep = 23
	  else
	  ISstep = 22
	  end
   end

   if ISstep == 23 then
	  if IsControlOpen("InventoryRetainer") or IsControlOpen("InventoryRetainerLarge") then
	  d("[AH][itemSearch]:2:in bag item:"..itemID.."/ not have item:"..nhitemID)
	   local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	   local bags = {0,1,2,3}
	   for _, e in pairs(Rbags) do
	   local Rbag = Inventory:Get(e)
	   if (table.valid(Rbag)) then
	   local Rilist = Rbag:GetList()
	   if (table.valid(Rilist)) then
	   for _, Ritem in pairs(Rilist) do
		  if itemID == Ritem.id then
			 if mushaccelerator == true then
			 Ritem:Move(mybagtype,mybagslot)
			 d("[AH][itemSearch]:item move")
			 elseif mushaccelerator == false then
				 for _, e in pairs(bags) do
				 local bag = Inventory:Get(e)
				 if (table.valid(bag)) then
				 local ilist = bag:GetList()
				 if (table.valid(ilist)) then
				 for _, item in pairs(ilist) do
				 if itemID == Ritem.id and itemID == item.id then
				 item:Move(Ritem.type,Ritem.slot)
				 d("[AH][itemSearch]:item move")
				 end
				 end
				 end
				 end
				 end
			 end
			 d("[AH][itemSearch]:item move")
				if itemcount == itemmax and mushaccelerator == true then
				local Fbags = {3}
				local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
				for _, e in pairs(Fbags) do
				local Fbag = Inventory:Get(e)
				if (table.valid(Fbag)) then
				local Filist = Fbag:GetList()
				if (table.valid(Filist)) then
				for _, Fitem in pairs(Filist) do
				   for s = 0,34,1 do
				   if Fitem.slot == s then
					  table.remove(Fslot,Fitem.slot)
				   end
				   for k,v in pairs(Fslot) do
					  Ritem:Move(3,v)
					  d("[AH][itemSearch]:item move")
				   end
				   end
				end
				end
				end
				end
				end
		  ISstep = 22
		  elseif nhitemID == Ritem.id and mushaccelerator == true then
			 local Fbags = {3}
			 local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
			 for _, e in pairs(Fbags) do
			 local Fbag = Inventory:Get(e)
			 if (table.valid(Fbag)) then
			 local Filist = Fbag:GetList()
			 if (table.valid(Filist)) then
			 for _, Fitem in pairs(Filist) do
				for s = 0,34,1 do
				  if Fitem.slot == s then
					table.remove(Fslot,Fitem.slot)
				  end
				  for k,v in pairs(Fslot) do
					Ritem:Move(3,v)
					d("[AH][itemSearch]:item move")
				  end
				end
			 end
			 end
			 end
			 end
		  ISstep = 22
		  else
		  ISstep = 24
		  end
	   end
	   end
	   end
	   end
	   end
   end
   if ISstep == 24 then
	  local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	  local bags = {0,1,2,3}
	  if mushaccelerator == true then
		 for _, e in pairs(Rbags) do
		 local Rbag = Inventory:Get(e)
		 if (table.valid(Rbag)) then
		 local Rilist = Rbag:GetList()
		 if (table.valid(Rilist)) then
		 for _, Ritem in pairs(Rilist) do
		 if itemID == Ritem.id then
			if Ritem.count ~= 0 then
			  ISstep = 23
			end
		 else
		 mushrite2uke = true
		 ISstep = 25
		 end
		 end
		 end
		 end
		 end
	  elseif mushaccelerator == false then
		 for _, e in pairs(bags) do
		 local bag = Inventory:Get(e)
		 if (table.valid(bag)) then
		 local ilist = bag:GetList()
		 if (table.valid(ilist)) then
		 for _, item in pairs(ilist) do
		 if itemID == item.id then
		  d("[AH][itemcount]:"..item.count)
			if item.count ~= 0 then
			  ISstep = 23
			end
		 else
		 mushrite2azuke = true
		 ISstep = 25
		 end
		 end
		 end
		 end
		 end
	  end
   end
   if ISstep == 25 then
	  if IsControlOpen("InventoryRetainer") then
		 UseControlAction("InventoryRetainer","Close")
		 ISstep = 25
	  elseif IsControlOpen("InventoryRetainerLarge") then
		 UseControlAction("InventoryRetainerLarge","Close")
		 ISstep = 25
	  elseif IsControlOpen("SelectString") then
		 Inventory:SortInventory()
		 ISstep = 26
	  end
   end
   if ISstep == 26 then
	   if IsControlOpen("SelectString") then
	   GetControl("SelectString"):Action("SelectIndex",9)
	   ISstep = 26
	   else
	   ISstep = 27
	   end
   end
   if ISstep == 27 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		ISstep = 27
		elseif IsControlOpen("RetainerList") and ritekazu > 2 then
		ISstep = 28
		elseif ritekazu == 2 then
		ISstep = 199
		end
   end
   if ISstep == 28 then
	  local bags = {0, 1, 2, 3}
	  for _, e in pairs(bags) do
	  local bag = Inventory:Get(e)
	  if (table.valid(bag)) then
	  local ilist = bag:GetList()
	  if (table.valid(ilist)) then
	  for _, item in pairs(ilist) do
		 if item.id == itemID or item.id == nhitemID then
			if item.isunique == true then
			ISstep = 199
			else
			ISstep = 30
			end
		 else
		 ISstep = 30
		 end
	  end
	  end
	  end
	  end
   end

-----3
   if ISstep == 30 then
		if IsControlOpen("RetainerList") then
		GetControl("RetainerList"):Action("SelectIndex",2)--rite
		ISstep = 31
		end
   end
   if ISstep == 31 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		end
		if IsControlOpen("SelectString") then
		ISstep = 32
		else
		ISstep = 31
		end
   end
   if ISstep == 32 then
	  if IsControlOpen("SelectString") then
		 GetControl("SelectString"):Action("SelectIndex",0)
	  end
	  if IsControlOpen("InventoryRetainer") then
	  ISstep = 33
	  elseif IsControlOpen("InventoryRetainerLarge") then
	  ISstep = 33
	  else
	  ISstep = 32
	  end
   end

   if ISstep == 33 then
	  if IsControlOpen("InventoryRetainer") or IsControlOpen("InventoryRetainerLarge") then
	  d("[AH][itemSearch]:3:in bag item:"..itemID.."/ not have item:"..nhitemID)
	   local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	   local bags = {0,1,2,3}
	   for _, e in pairs(Rbags) do
	   local Rbag = Inventory:Get(e)
	   if (table.valid(Rbag)) then
	   local Rilist = Rbag:GetList()
	   if (table.valid(Rilist)) then
	   for _, Ritem in pairs(Rilist) do
		  if itemID == Ritem.id then
			 if mushaccelerator == true then
			 Ritem:Move(mybagtype,mybagslot)
			 d("[AH][itemSearch]:item move")
			 elseif mushaccelerator == false then
				 for _, e in pairs(bags) do
				 local bag = Inventory:Get(e)
				 if (table.valid(bag)) then
				 local ilist = bag:GetList()
				 if (table.valid(ilist)) then
				 for _, item in pairs(ilist) do
				 if itemID == Ritem.id and itemID == item.id then
				 item:Move(Ritem.type,Ritem.slot)
				 d("[AH][itemSearch]:item move")
				 end
				 end
				 end
				 end
				 end
			 end
			 d("[AH][itemSearch]:item move")
				if itemcount == itemmax and mushaccelerator == true then
				local Fbags = {3}
				local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
				for _, e in pairs(Fbags) do
				local Fbag = Inventory:Get(e)
				if (table.valid(Fbag)) then
				local Filist = Fbag:GetList()
				if (table.valid(Filist)) then
				for _, Fitem in pairs(Filist) do
				   for s = 0,34,1 do
				   if Fitem.slot == s then
					  table.remove(Fslot,Fitem.slot)
				   end
				   for k,v in pairs(Fslot) do
					  Ritem:Move(3,v)
					  d("[AH][itemSearch]:item move")
				   end
				   end
				end
				end
				end
				end
				end
		  ISstep = 32
		  elseif nhitemID == Ritem.id and mushaccelerator == true then
			 local Fbags = {3}
			 local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
			 for _, e in pairs(Fbags) do
			 local Fbag = Inventory:Get(e)
			 if (table.valid(Fbag)) then
			 local Filist = Fbag:GetList()
			 if (table.valid(Filist)) then
			 for _, Fitem in pairs(Filist) do
				for s = 0,34,1 do
				  if Fitem.slot == s then
					table.remove(Fslot,Fitem.slot)
				  end
				  for k,v in pairs(Fslot) do
					Ritem:Move(3,v)
					d("[AH][itemSearch]:item move")
				  end
				end
			 end
			 end
			 end
			 end
		  ISstep = 32
		  else
		  ISstep = 34
		  end
	   end
	   end
	   end
	   end
	   end
   end
   if ISstep == 34 then
	  local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	  local bags = {0,1,2,3}
	  if mushaccelerator == true then
		 for _, e in pairs(Rbags) do
		 local Rbag = Inventory:Get(e)
		 if (table.valid(Rbag)) then
		 local Rilist = Rbag:GetList()
		 if (table.valid(Rilist)) then
		 for _, Ritem in pairs(Rilist) do
		 if itemID == Ritem.id then
			if Ritem.count ~= 0 then
			  ISstep = 33
			end
		 else
		 mushrite3uke = true
		 ISstep = 35
		 end
		 end
		 end
		 end
		 end
	  elseif mushaccelerator == false then
		 for _, e in pairs(bags) do
		 local bag = Inventory:Get(e)
		 if (table.valid(bag)) then
		 local ilist = bag:GetList()
		 if (table.valid(ilist)) then
		 for _, item in pairs(ilist) do
		 if itemID == item.id then
		  d("[AH][itemcount]:"..item.count)
			if item.count ~= 0 then
			  ISstep = 33
			end
		 else
		 mushrite3azuke = true
		 ISstep = 35
		 end
		 end
		 end
		 end
		 end
	  end
   end
   if ISstep == 35 then
	  if IsControlOpen("InventoryRetainer") then
		 UseControlAction("InventoryRetainer","Close")
		 ISstep = 35
	  elseif IsControlOpen("InventoryRetainerLarge") then
		UseControlAction("InventoryRetainerLarge","Close")
		 ISstep = 35
	  elseif IsControlOpen("SelectString") then
		 Inventory:SortInventory()
		 ISstep = 36
	  end
   end
   if ISstep == 36 then
	   if IsControlOpen("SelectString") then
	   GetControl("SelectString"):Action("SelectIndex",9)
	   ISstep = 36
	   else
	   ISstep = 37
	   end
   end
   if ISstep == 37 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		ISstep = 37
		elseif IsControlOpen("RetainerList") and ritekazu > 3 then
		ISstep = 38
		elseif ritekazu == 3 then
		ISstep = 199
		end
   end
   if ISstep == 38 then
	  local bags = {0, 1, 2, 3}
	  for _, e in pairs(bags) do
	  local bag = Inventory:Get(e)
	  if (table.valid(bag)) then
	  local ilist = bag:GetList()
	  if (table.valid(ilist)) then
	  for _, item in pairs(ilist) do
		 if item.id == itemID or item.id == nhitemID then
			if item.isunique == true then
			ISstep = 199
			else
			ISstep = 40
			end
		 else
		 ISstep = 40
		 end
	  end
	  end
	  end
	  end
   end

-----4
   if ISstep == 40 then
		if IsControlOpen("RetainerList") then
		GetControl("RetainerList"):Action("SelectIndex",3)--rite
		ISstep = 41
		end
   end
   if ISstep == 41 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		end
		if IsControlOpen("SelectString") then
		ISstep = 42
		else
		ISstep = 41
		end
   end
   if ISstep == 42 then
	  if IsControlOpen("SelectString") then
		 GetControl("SelectString"):Action("SelectIndex",0)
	  end
	  if IsControlOpen("InventoryRetainer") then
	  ISstep = 43
	  elseif IsControlOpen("InventoryRetainerLarge") then
	  ISstep = 43
	  else
	  ISstep = 42
	  end
   end

   if ISstep == 43 then
	  if IsControlOpen("InventoryRetainer")  or IsControlOpen("InventoryRetainerLarge") then
	  d("[AH][itemSearch]:4:in bag item:"..itemID.."/ not have item:"..nhitemID)
	   local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	   local bags = {0,1,2,3}
	   for _, e in pairs(Rbags) do
	   local Rbag = Inventory:Get(e)
	   if (table.valid(Rbag)) then
	   local Rilist = Rbag:GetList()
	   if (table.valid(Rilist)) then
	   for _, Ritem in pairs(Rilist) do
		  if itemID == Ritem.id then
			 if mushaccelerator == true then
			 Ritem:Move(mybagtype,mybagslot)
			 d("[AH][itemSearch]:item move")
			 elseif mushaccelerator == false then
				 for _, e in pairs(bags) do
				 local bag = Inventory:Get(e)
				 if (table.valid(bag)) then
				 local ilist = bag:GetList()
				 if (table.valid(ilist)) then
				 for _, item in pairs(ilist) do
				 if itemID == Ritem.id and itemID == item.id then
				 item:Move(Ritem.type,Ritem.slot)
				 d("[AH][itemSearch]:item move")
				 end
				 end
				 end
				 end
				 end
			 end
			 d("[AH][itemSearch]:item move")
				if itemcount == itemmax and mushaccelerator == true then
				local Fbags = {3}
				local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
				for _, e in pairs(Fbags) do
				local Fbag = Inventory:Get(e)
				if (table.valid(Fbag)) then
				local Filist = Fbag:GetList()
				if (table.valid(Filist)) then
				for _, Fitem in pairs(Filist) do
				   for s = 0,34,1 do
				   if Fitem.slot == s then
					  table.remove(Fslot,Fitem.slot)
				   end
				   for k,v in pairs(Fslot) do
					  Ritem:Move(3,v)
					  d("[AH][itemSearch]:item move")
				   end
				   end
				end
				end
				end
				end
				end
		  ISstep = 42
		  elseif nhitemID == Ritem.id and mushaccelerator == true then
			 local Fbags = {3}
			 local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
			 for _, e in pairs(Fbags) do
			 local Fbag = Inventory:Get(e)
			 if (table.valid(Fbag)) then
			 local Filist = Fbag:GetList()
			 if (table.valid(Filist)) then
			 for _, Fitem in pairs(Filist) do
				for s = 0,34,1 do
				  if Fitem.slot == s then
					table.remove(Fslot,Fitem.slot)
				  end
				  for k,v in pairs(Fslot) do
					Ritem:Move(3,v)
					d("[AH][itemSearch]:item move")
				  end
				end
			 end
			 end
			 end
			 end
		  ISstep = 42
		  else
		  ISstep = 44
		  end
	   end
	   end
	   end
	   end
	   end
   end
   if ISstep == 44 then
	  local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	  local bags = {0,1,2,3}
	  if mushaccelerator == true then
		 for _, e in pairs(Rbags) do
		 local Rbag = Inventory:Get(e)
		 if (table.valid(Rbag)) then
		 local Rilist = Rbag:GetList()
		 if (table.valid(Rilist)) then
		 for _, Ritem in pairs(Rilist) do
		 if itemID == Ritem.id then
			if Ritem.count ~= 0 then
			  ISstep = 43
			end
		 else
		 mushrite4uke = true
		 ISstep = 45
		 end
		 end
		 end
		 end
		 end
	  elseif mushaccelerator == false then
		 for _, e in pairs(bags) do
		 local bag = Inventory:Get(e)
		 if (table.valid(bag)) then
		 local ilist = bag:GetList()
		 if (table.valid(ilist)) then
		 for _, item in pairs(ilist) do
		 if itemID == item.id then
		  d("[AH][itemcount]:"..item.count)
			if item.count ~= 0 then
			  ISstep = 43
			end
		 else
		 mushrite4azuke = true
		 ISstep = 45
		 end
		 end
		 end
		 end
		 end
	  end
   end
   if ISstep == 45 then
	  if IsControlOpen("InventoryRetainer") then
		 UseControlAction("InventoryRetainer","Close")
		 ISstep = 45
	  elseif IsControlOpen("InventoryRetainerLarge") then
		 UseControlAction("InventoryRetainerLarge","Close")
		 ISstep = 45
	  elseif IsControlOpen("SelectString") then
		 Inventory:SortInventory()
		 ISstep = 46
	  end
   end
   if ISstep == 46 then
	   if IsControlOpen("SelectString") then
	   GetControl("SelectString"):Action("SelectIndex",9)
	   ISstep = 46
	   else
	   ISstep = 47
	   end
   end
   if ISstep == 47 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		ISstep = 47
		elseif IsControlOpen("RetainerList") and ritekazu > 4 then
		ISstep = 48
		elseif ritekazu == 4 then
		ISstep = 199
		end
   end
   if ISstep == 48 then
	  local bags = {0, 1, 2, 3}
	  for _, e in pairs(bags) do
	  local bag = Inventory:Get(e)
	  if (table.valid(bag)) then
	  local ilist = bag:GetList()
	  if (table.valid(ilist)) then
	  for _, item in pairs(ilist) do
		 if item.id == itemID or item.id == nhitemID then
			if item.isunique == true then
			ISstep = 199
			else
			ISstep = 50
			end
		 else
		 ISstep = 50
		 end
	  end
	  end
	  end
	  end
   end

-----5
   if ISstep == 50 then
		if IsControlOpen("RetainerList") then
		GetControl("RetainerList"):Action("SelectIndex",4)--rite
		ISstep = 51
		end
   end
   if ISstep == 51 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		end
		if IsControlOpen("SelectString") then
		ISstep = 52
		else
		ISstep = 51
		end
   end
   if ISstep == 52 then
	  if IsControlOpen("SelectString") then
		 GetControl("SelectString"):Action("SelectIndex",0)
	  end
	  if IsControlOpen("InventoryRetainer") then
	  ISstep = 53
	  elseif IsControlOpen("InventoryRetainerLarge") then
	  ISstep = 53
	  else
	  ISstep = 52
	  end
   end

   if ISstep == 53 then
	  if IsControlOpen("InventoryRetainer") or IsControlOpen("InventoryRetainerLarge") then
	  d("[AH][itemSearch]:5:in bag item:"..itemID.."/ not have item:"..nhitemID)
	   local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	   local bags = {0,1,2,3}
	   for _, e in pairs(Rbags) do
	   local Rbag = Inventory:Get(e)
	   if (table.valid(Rbag)) then
	   local Rilist = Rbag:GetList()
	   if (table.valid(Rilist)) then
	   for _, Ritem in pairs(Rilist) do
		  if itemID == Ritem.id then
			 if mushaccelerator == true then
			 Ritem:Move(mybagtype,mybagslot)
			 d("[AH][itemSearch]:item move")
			 elseif mushaccelerator == false then
				 for _, e in pairs(bags) do
				 local bag = Inventory:Get(e)
				 if (table.valid(bag)) then
				 local ilist = bag:GetList()
				 if (table.valid(ilist)) then
				 for _, item in pairs(ilist) do
				 if itemID == Ritem.id and itemID == item.id then
				 item:Move(Ritem.type,Ritem.slot)
				 d("[AH][itemSearch]:item move")
				 end
				 end
				 end
				 end
				 end
			 end
			 d("[AH][itemSearch]:item move")
				if itemcount == itemmax and mushaccelerator == true then
				local Fbags = {3}
				local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
				for _, e in pairs(Fbags) do
				local Fbag = Inventory:Get(e)
				if (table.valid(Fbag)) then
				local Filist = Fbag:GetList()
				if (table.valid(Filist)) then
				for _, Fitem in pairs(Filist) do
				   for s = 0,34,1 do
				   if Fitem.slot == s then
					  table.remove(Fslot,Fitem.slot)
				   end
				   for k,v in pairs(Fslot) do
					  Ritem:Move(3,v)
					  d("[AH][itemSearch]:item move")
				   end
				   end
				end
				end
				end
				end
				end
		  ISstep = 52
		  elseif nhitemID == Ritem.id and mushaccelerator == true then
			 local Fbags = {3}
			 local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
			 for _, e in pairs(Fbags) do
			 local Fbag = Inventory:Get(e)
			 if (table.valid(Fbag)) then
			 local Filist = Fbag:GetList()
			 if (table.valid(Filist)) then
			 for _, Fitem in pairs(Filist) do
				for s = 0,34,1 do
				  if Fitem.slot == s then
					table.remove(Fslot,Fitem.slot)
				  end
				  for k,v in pairs(Fslot) do
					Ritem:Move(3,v)
					d("[AH][itemSearch]:item move")
				  end
				end
			 end
			 end
			 end
			 end
		  ISstep = 52
		  else
		  ISstep = 54
		  end
	   end
	   end
	   end
	   end
	   end
   end
   if ISstep == 54 then
	  local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	  local bags = {0,1,2,3}
	  if mushaccelerator == true then
		 for _, e in pairs(Rbags) do
		 local Rbag = Inventory:Get(e)
		 if (table.valid(Rbag)) then
		 local Rilist = Rbag:GetList()
		 if (table.valid(Rilist)) then
		 for _, Ritem in pairs(Rilist) do
		 if itemID == Ritem.id then
			if Ritem.count ~= 0 then
			  ISstep = 53
			end
		 else
		 mushrite5uke = true
		 ISstep = 55
		 end
		 end
		 end
		 end
		 end
	  elseif mushaccelerator == false then
		 for _, e in pairs(bags) do
		 local bag = Inventory:Get(e)
		 if (table.valid(bag)) then
		 local ilist = bag:GetList()
		 if (table.valid(ilist)) then
		 for _, item in pairs(ilist) do
		 if itemID == item.id then
		  d("[AH][itemcount]:"..item.count)
			if item.count ~= 0 then
			  ISstep = 53
			end
		 else
		 mushrite5azuke = true
		 ISstep = 55
		 end
		 end
		 end
		 end
		 end
	  end
   end
   if ISstep == 55 then
	  if IsControlOpen("InventoryRetainer") then
		 UseControlAction("InventoryRetainer","Close")
		 ISstep = 55
	  elseif IsControlOpen("InventoryRetainerLarge") then
		 UseControlAction("InventoryRetainerLarge","Close")
		 ISstep = 55
	  elseif IsControlOpen("SelectString") then
		 Inventory:SortInventory()
		 ISstep = 56
	  end
   end
   if ISstep == 56 then
	   if IsControlOpen("SelectString") then
	   GetControl("SelectString"):Action("SelectIndex",9)
	   ISstep = 56
	   else
	   ISstep = 57
	   end
   end
   if ISstep == 57 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		ISstep = 57
		elseif IsControlOpen("RetainerList") and ritekazu > 5 then
		ISstep = 58
		elseif ritekazu == 5 then
		ISstep = 199
		end
   end
   if ISstep == 58 then
	  local bags = {0, 1, 2, 3}
	  for _, e in pairs(bags) do
	  local bag = Inventory:Get(e)
	  if (table.valid(bag)) then
	  local ilist = bag:GetList()
	  if (table.valid(ilist)) then
	  for _, item in pairs(ilist) do
		 if item.id == itemID or item.id == nhitemID then
			if item.isunique == true then
			ISstep = 199
			else
			ISstep = 60
			end
		 else
		 ISstep = 60
		 end
	  end
	  end
	  end
	  end
   end

-----6
   if ISstep == 60 then
		if IsControlOpen("RetainerList") then
		GetControl("RetainerList"):Action("SelectIndex",5)--rite
		ISstep = 61
		end
   end
   if ISstep == 61 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		end
		if IsControlOpen("SelectString") then
		ISstep = 62
		else
		ISstep = 61
		end
   end
   if ISstep == 62 then
	  if IsControlOpen("SelectString") then
		 GetControl("SelectString"):Action("SelectIndex",0)
	  end
	  if IsControlOpen("InventoryRetainer") then
	  ISstep = 63
	  elseif IsControlOpen("InventoryRetainerLarge") then
	  ISstep = 63
	  else
	  ISstep = 62
	  end
   end

   if ISstep == 63 then
	  if IsControlOpen("InventoryRetainer") or IsControlOpen("InventoryRetainerLarge") then
	  d("[AH][itemSearch]:6:in bag item:"..itemID.."/ not have item:"..nhitemID)
	   local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	   local bags = {0,1,2,3}
	   for _, e in pairs(Rbags) do
	   local Rbag = Inventory:Get(e)
	   if (table.valid(Rbag)) then
	   local Rilist = Rbag:GetList()
	   if (table.valid(Rilist)) then
	   for _, Ritem in pairs(Rilist) do
		  if itemID == Ritem.id then
			 if mushaccelerator == true then
			 Ritem:Move(mybagtype,mybagslot)
			 d("[AH][itemSearch]:item move")
			 elseif mushaccelerator == false then
				 for _, e in pairs(bags) do
				 local bag = Inventory:Get(e)
				 if (table.valid(bag)) then
				 local ilist = bag:GetList()
				 if (table.valid(ilist)) then
				 for _, item in pairs(ilist) do
				 if itemID == Ritem.id and itemID == item.id then
				 item:Move(Ritem.type,Ritem.slot)
				 d("[AH][itemSearch]:item move")
				 end
				 end
				 end
				 end
				 end
			 end
			 d("[AH][itemSearch]:item move")
				if itemcount == itemmax and mushaccelerator == true then
				local Fbags = {3}
				local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
				for _, e in pairs(Fbags) do
				local Fbag = Inventory:Get(e)
				if (table.valid(Fbag)) then
				local Filist = Fbag:GetList()
				if (table.valid(Filist)) then
				for _, Fitem in pairs(Filist) do
				   for s = 0,34,1 do
				   if Fitem.slot == s then
					  table.remove(Fslot,Fitem.slot)
				   end
				   for k,v in pairs(Fslot) do
					  Ritem:Move(3,v)
					  d("[AH][itemSearch]:item move")
				   end
				   end
				end
				end
				end
				end
				end
		  ISstep = 62
		  elseif nhitemID == Ritem.id and mushaccelerator == true then
			 local Fbags = {3}
			 local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
			 for _, e in pairs(Fbags) do
			 local Fbag = Inventory:Get(e)
			 if (table.valid(Fbag)) then
			 local Filist = Fbag:GetList()
			 if (table.valid(Filist)) then
			 for _, Fitem in pairs(Filist) do
				for s = 0,34,1 do
				  if Fitem.slot == s then
					table.remove(Fslot,Fitem.slot)
				  end
				  for k,v in pairs(Fslot) do
					Ritem:Move(3,v)
					d("[AH][itemSearch]:item move")
				  end
				end
			 end
			 end
			 end
			 end
		  ISstep = 62
		  else
		  ISstep = 64
		  end
	   end
	   end
	   end
	   end
	   end
   end
   if ISstep == 64 then
	  local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	  local bags = {0,1,2,3}
	  if mushaccelerator == true then
		 for _, e in pairs(Rbags) do
		 local Rbag = Inventory:Get(e)
		 if (table.valid(Rbag)) then
		 local Rilist = Rbag:GetList()
		 if (table.valid(Rilist)) then
		 for _, Ritem in pairs(Rilist) do
		 if itemID == Ritem.id then
			if Ritem.count ~= 0 then
			  ISstep = 63
			end
		 else
		 mushrite6uke = true
		 ISstep = 65
		 end
		 end
		 end
		 end
		 end
	  elseif mushaccelerator == false then
		 for _, e in pairs(bags) do
		 local bag = Inventory:Get(e)
		 if (table.valid(bag)) then
		 local ilist = bag:GetList()
		 if (table.valid(ilist)) then
		 for _, item in pairs(ilist) do
		 if itemID == item.id then
		  d("[AH][itemcount]:"..item.count)
			if item.count ~= 0 then
			  ISstep = 53
			end
		 else
		 mushrite6azuke = true
		 ISstep = 65
		 end
		 end
		 end
		 end
		 end
	  end
   end
   if ISstep == 65 then
	  if IsControlOpen("InventoryRetainer") then
		 UseControlAction("InventoryRetainer","Close")
		 ISstep = 65
	  elseif IsControlOpen("InventoryRetainerLarge") then
		 UseControlAction("InventoryRetainerLarge","Close")
		 ISstep = 65
	  elseif IsControlOpen("SelectString") then
		 Inventory:SortInventory()
		 ISstep = 66
	  end
   end
   if ISstep == 66 then
	   if IsControlOpen("SelectString") then
	   GetControl("SelectString"):Action("SelectIndex",9)
	   ISstep = 66
	   else
	   ISstep = 67
	   end
   end
   if ISstep == 67 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		ISstep = 67
		elseif IsControlOpen("RetainerList") and ritekazu > 6 then
		ISstep = 68
		elseif ritekazu == 6 then
		ISstep = 199
		end
   end
   if ISstep == 68 then
	  local bags = {0, 1, 2, 3}
	  for _, e in pairs(bags) do
	  local bag = Inventory:Get(e)
	  if (table.valid(bag)) then
	  local ilist = bag:GetList()
	  if (table.valid(ilist)) then
	  for _, item in pairs(ilist) do
		 if item.id == itemID or item.id == nhitemID then
			if item.isunique == true then
			ISstep = 199
			else
			ISstep = 70
			end
		 else
		 ISstep = 70
		 end
	  end
	  end
	  end
	  end
   end

-----7
   if ISstep == 70 then
		if IsControlOpen("RetainerList") then
		GetControl("RetainerList"):Action("SelectIndex",6)--rite
		ISstep = 71
		end
   end
   if ISstep == 71 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		end
		if IsControlOpen("SelectString") then
		ISstep = 72
		else
		ISstep = 71
		end
   end
   if ISstep == 72 then
	  if IsControlOpen("SelectString") then
		 GetControl("SelectString"):Action("SelectIndex",0)
	  end
	  if IsControlOpen("InventoryRetainer") then
	  ISstep = 73
	  elseif IsControlOpen("InventoryRetainerLarge") then
	  ISstep = 73
	  else
	  ISstep = 72
	  end
   end

   if ISstep == 73 then
	  if IsControlOpen("InventoryRetainer") or IsControlOpen("InventoryRetainerLarge") then
	  d("[AH][itemSearch]:7:in bag item:"..itemID.."/ not have item:"..nhitemID)
	   local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	   local bags = {0,1,2,3}
	   for _, e in pairs(Rbags) do
	   local Rbag = Inventory:Get(e)
	   if (table.valid(Rbag)) then
	   local Rilist = Rbag:GetList()
	   if (table.valid(Rilist)) then
	   for _, Ritem in pairs(Rilist) do
		  if itemID == Ritem.id then
			 if mushaccelerator == true then
			 Ritem:Move(mybagtype,mybagslot)
			 d("[AH][itemSearch]:item move")
			 elseif mushaccelerator == false then
				 for _, e in pairs(bags) do
				 local bag = Inventory:Get(e)
				 if (table.valid(bag)) then
				 local ilist = bag:GetList()
				 if (table.valid(ilist)) then
				 for _, item in pairs(ilist) do
				 if itemID == Ritem.id and itemID == item.id then
				 item:Move(Ritem.type,Ritem.slot)
				 d("[AH][itemSearch]:item move")
				 end
				 end
				 end
				 end
				 end
			 end
			 d("[AH][itemSearch]:item move")
				if itemcount == itemmax and mushaccelerator == true then
				local Fbags = {3}
				local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
				for _, e in pairs(Fbags) do
				local Fbag = Inventory:Get(e)
				if (table.valid(Fbag)) then
				local Filist = Fbag:GetList()
				if (table.valid(Filist)) then
				for _, Fitem in pairs(Filist) do
				   for s = 0,34,1 do
				   if Fitem.slot == s then
					  table.remove(Fslot,Fitem.slot)
				   end
				   for k,v in pairs(Fslot) do
					  Ritem:Move(3,v)
					  d("[AH][itemSearch]:item move")
				   end
				   end
				end
				end
				end
				end
				end
		  ISstep = 72
		  elseif nhitemID == Ritem.id and mushaccelerator == true then
			 local Fbags = {3}
			 local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
			 for _, e in pairs(Fbags) do
			 local Fbag = Inventory:Get(e)
			 if (table.valid(Fbag)) then
			 local Filist = Fbag:GetList()
			 if (table.valid(Filist)) then
			 for _, Fitem in pairs(Filist) do
				for s = 0,34,1 do
				  if Fitem.slot == s then
					table.remove(Fslot,Fitem.slot)
				  end
				  for k,v in pairs(Fslot) do
					Ritem:Move(3,v)
					d("[AH][itemSearch]:item move")
				  end
				end
			 end
			 end
			 end
			 end
		  ISstep = 72
		  else
		  ISstep = 74
		  end
	   end
	   end
	   end
	   end
	   end
   end
   if ISstep == 74 then
	  local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	  local bags = {0,1,2,3}
	  if mushaccelerator == true then
		 for _, e in pairs(Rbags) do
		 local Rbag = Inventory:Get(e)
		 if (table.valid(Rbag)) then
		 local Rilist = Rbag:GetList()
		 if (table.valid(Rilist)) then
		 for _, Ritem in pairs(Rilist) do
		 if itemID == Ritem.id then
			if Ritem.count ~= 0 then
			  ISstep = 73
			end
		 else
		 mushrite7uke = true
		 ISstep = 75
		 end
		 end
		 end
		 end
		 end
	  elseif mushaccelerator == false then
		 for _, e in pairs(bags) do
		 local bag = Inventory:Get(e)
		 if (table.valid(bag)) then
		 local ilist = bag:GetList()
		 if (table.valid(ilist)) then
		 for _, item in pairs(ilist) do
		 if itemID == item.id then
		  d("[AH][itemcount]:"..item.count)
			if item.count ~= 0 then
			  ISstep = 73
			end
		 else
		 mushrite7azuke = true
		 ISstep = 75
		 end
		 end
		 end
		 end
		 end
	  end
   end
   if ISstep == 75 then
	  if IsControlOpen("InventoryRetainer") then
		 UseControlAction("InventoryRetainer","Close")
		 ISstep = 75
	  elseif IsControlOpen("InventoryRetainerLarge") then
		 UseControlAction("InventoryRetainerLarge","Close")
		 ISstep = 75
	  elseif IsControlOpen("SelectString") then
		 Inventory:SortInventory()
		 ISstep = 76
	  end
   end
   if ISstep == 76 then
	   if IsControlOpen("SelectString") then
	   GetControl("SelectString"):Action("SelectIndex",9)
	   ISstep = 76
	   else
	   ISstep = 77
	   end
   end
   if ISstep == 77 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		ISstep = 77
		elseif IsControlOpen("RetainerList") and ritekazu > 7 then
		ISstep = 78
		elseif ritekazu == 7 then
		ISstep = 199
		end
   end
   if ISstep == 78 then
	  local bags = {0, 1, 2, 3}
	  for _, e in pairs(bags) do
	  local bag = Inventory:Get(e)
	  if (table.valid(bag)) then
	  local ilist = bag:GetList()
	  if (table.valid(ilist)) then
	  for _, item in pairs(ilist) do
		 if item.id == itemID or item.id == nhitemID then
			if item.isunique == true then
			ISstep = 199
			else
			ISstep = 80
			end
		 else
		 ISstep = 80
		 end
	  end
	  end
	  end
	  end
   end

-----8
   if ISstep == 80 then
		if IsControlOpen("RetainerList") then
		GetControl("RetainerList"):Action("SelectIndex",7)--rite
		ISstep = 81
		end
   end
   if ISstep == 81 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		end
		if IsControlOpen("SelectString") then
		ISstep = 82
		else
		ISstep = 81
		end
   end
   if ISstep == 82 then
	  if IsControlOpen("SelectString") then
		 GetControl("SelectString"):Action("SelectIndex",0)
	  end
	  if IsControlOpen("InventoryRetainer") then
	  ISstep = 83
	  elseif IsControlOpen("InventoryRetainerLarge") then
	  ISstep = 83
	  else
	  ISstep = 82
	  end
   end

   if ISstep == 83 then
	  if IsControlOpen("InventoryRetainer") or IsControlOpen("InventoryRetainerLarge") then
	  d("[AH][itemSearch]:8:in bag item:"..itemID.."/ not have item:"..nhitemID)
	   local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	   local bags = {0,1,2,3}
	   for _, e in pairs(Rbags) do
	   local Rbag = Inventory:Get(e)
	   if (table.valid(Rbag)) then
	   local Rilist = Rbag:GetList()
	   if (table.valid(Rilist)) then
	   for _, Ritem in pairs(Rilist) do
		  if itemID == Ritem.id then
			 if mushaccelerator == true then
			 Ritem:Move(mybagtype,mybagslot)
			 d("[AH][itemSearch]:item move")
			 elseif mushaccelerator == false then
				 for _, e in pairs(bags) do
				 local bag = Inventory:Get(e)
				 if (table.valid(bag)) then
				 local ilist = bag:GetList()
				 if (table.valid(ilist)) then
				 for _, item in pairs(ilist) do
				 if itemID == Ritem.id and itemID == item.id then
				 item:Move(Ritem.type,Ritem.slot)
				 d("[AH][itemSearch]:item move")
				 end
				 end
				 end
				 end
				 end
			 end
			 d("[AH][itemSearch]:item move")
				if itemcount == itemmax and mushaccelerator == true then
				local Fbags = {3}
				local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
				for _, e in pairs(Fbags) do
				local Fbag = Inventory:Get(e)
				if (table.valid(Fbag)) then
				local Filist = Fbag:GetList()
				if (table.valid(Filist)) then
				for _, Fitem in pairs(Filist) do
				   for s = 0,34,1 do
				   if Fitem.slot == s then
					  table.remove(Fslot,Fitem.slot)
				   end
				   for k,v in pairs(Fslot) do
					  Ritem:Move(3,v)
					  d("[AH][itemSearch]:item move")
				   end
				   end
				end
				end
				end
				end
				end
		  ISstep = 82
		  elseif nhitemID == Ritem.id and mushaccelerator == true then
			 local Fbags = {3}
			 local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
			 for _, e in pairs(Fbags) do
			 local Fbag = Inventory:Get(e)
			 if (table.valid(Fbag)) then
			 local Filist = Fbag:GetList()
			 if (table.valid(Filist)) then
			 for _, Fitem in pairs(Filist) do
				for s = 0,34,1 do
				  if Fitem.slot == s then
					table.remove(Fslot,Fitem.slot)
				  end
				  for k,v in pairs(Fslot) do
					Ritem:Move(3,v)
					d("[AH][itemSearch]:item move")
				  end
				end
			 end
			 end
			 end
			 end
		  ISstep = 82
		  else
		  ISstep = 84
		  end
	   end
	   end
	   end
	   end
	   end
   end
   if ISstep == 84 then
	  local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	  local bags = {0,1,2,3}
	  if mushaccelerator == true then
		 for _, e in pairs(Rbags) do
		 local Rbag = Inventory:Get(e)
		 if (table.valid(Rbag)) then
		 local Rilist = Rbag:GetList()
		 if (table.valid(Rilist)) then
		 for _, Ritem in pairs(Rilist) do
		 if itemID == Ritem.id then
			if Ritem.count ~= 0 then
			  ISstep = 83
			end
		 else
		 mushrite8uke = true
		 ISstep = 85
		 end
		 end
		 end
		 end
		 end
	  elseif mushaccelerator == false then
		 for _, e in pairs(bags) do
		 local bag = Inventory:Get(e)
		 if (table.valid(bag)) then
		 local ilist = bag:GetList()
		 if (table.valid(ilist)) then
		 for _, item in pairs(ilist) do
		 if itemID == item.id then
		  d("[AH][itemcount]:"..item.count)
			if item.count ~= 0 then
			  ISstep = 83
			end
		 else
		 mushrite8azuke = true
		 ISstep = 85
		 end
		 end
		 end
		 end
		 end
	  end
   end
   if ISstep == 85 then
	  if IsControlOpen("InventoryRetainer") then
		 UseControlAction("InventoryRetainer","Close")
		 ISstep = 85
	  elseif IsControlOpen("InventoryRetainerLarge") then
		 UseControlAction("InventoryRetainerLarge","Close")
		 ISstep = 85
	  elseif IsControlOpen("SelectString") then
		 Inventory:SortInventory()
		 ISstep = 86
	  end
   end
   if ISstep == 86 then
	   if IsControlOpen("SelectString") then
	   GetControl("SelectString"):Action("SelectIndex",9)
	   ISstep = 86
	   else
	   ISstep = 87
	   end
   end
   if ISstep == 87 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		ISstep = 87
		elseif IsControlOpen("RetainerList") and ritekazu > 8 then
		ISstep = 88
		elseif ritekazu == 8 then
		ISstep = 199
		end
   end
   if ISstep == 88 then
	  local bags = {0, 1, 2, 3}
	  for _, e in pairs(bags) do
	  local bag = Inventory:Get(e)
	  if (table.valid(bag)) then
	  local ilist = bag:GetList()
	  if (table.valid(ilist)) then
	  for _, item in pairs(ilist) do
		 if item.id == itemID or item.id == nhitemID then
			if item.isunique == true then
			ISstep = 199
			else
			ISstep = 90
			end
		 else
		 ISstep = 90
		 end
	  end
	  end
	  end
	  end
   end

-----9
   if ISstep == 90 then
		if IsControlOpen("RetainerList") then
		GetControl("RetainerList"):Action("SelectIndex",8)--rite
		ISstep = 91
		end
   end
   if ISstep == 91 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		end
		if IsControlOpen("SelectString") then
		ISstep = 92
		else
		ISstep = 91
		end
   end
   if ISstep == 92 then
	  if IsControlOpen("SelectString") then
		 GetControl("SelectString"):Action("SelectIndex",0)
	  end
	  if IsControlOpen("InventoryRetainer") then
	  ISstep = 93
	  elseif IsControlOpen("InventoryRetainerLarge") then
	  ISstep = 93
	  else
	  ISstep = 92
	  end
   end

   if ISstep == 93 then
	  if IsControlOpen("InventoryRetainer") or IsControlOpen("InventoryRetainerLarge") then
	  d("[AH][itemSearch]:9:in bag item:"..itemID.."/ not have item:"..nhitemID)
	   local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	   local bags = {0,1,2,3}
	   for _, e in pairs(Rbags) do
	   local Rbag = Inventory:Get(e)
	   if (table.valid(Rbag)) then
	   local Rilist = Rbag:GetList()
	   if (table.valid(Rilist)) then
	   for _, Ritem in pairs(Rilist) do
		  if itemID == Ritem.id then
			 if mushaccelerator == true then
			 Ritem:Move(mybagtype,mybagslot)
			 d("[AH][itemSearch]:item move")
			 elseif mushaccelerator == false then
				 for _, e in pairs(bags) do
				 local bag = Inventory:Get(e)
				 if (table.valid(bag)) then
				 local ilist = bag:GetList()
				 if (table.valid(ilist)) then
				 for _, item in pairs(ilist) do
				 if itemID == Ritem.id and itemID == item.id then
				 item:Move(Ritem.type,Ritem.slot)
				 d("[AH][itemSearch]:item move")
				 end
				 end
				 end
				 end
				 end
			 end
			 d("[AH][itemSearch]:item move")
				if itemcount == itemmax and mushaccelerator == true then
				local Fbags = {3}
				local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
				for _, e in pairs(Fbags) do
				local Fbag = Inventory:Get(e)
				if (table.valid(Fbag)) then
				local Filist = Fbag:GetList()
				if (table.valid(Filist)) then
				for _, Fitem in pairs(Filist) do
				   for s = 0,34,1 do
				   if Fitem.slot == s then
					  table.remove(Fslot,Fitem.slot)
				   end
				   for k,v in pairs(Fslot) do
					  Ritem:Move(3,v)
					  d("[AH][itemSearch]:item move")
				   end
				   end
				end
				end
				end
				end
				end
		  ISstep = 92
		  elseif nhitemID == Ritem.id and mushaccelerator == true then
			 local Fbags = {3}
			 local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
			 for _, e in pairs(Fbags) do
			 local Fbag = Inventory:Get(e)
			 if (table.valid(Fbag)) then
			 local Filist = Fbag:GetList()
			 if (table.valid(Filist)) then
			 for _, Fitem in pairs(Filist) do
				for s = 0,34,1 do
				  if Fitem.slot == s then
					table.remove(Fslot,Fitem.slot)
				  end
				  for k,v in pairs(Fslot) do
					Ritem:Move(3,v)
					d("[AH][itemSearch]:item move")
				  end
				end
			 end
			 end
			 end
			 end
		  ISstep = 92
		  else
		  ISstep = 94
		  end
	   end
	   end
	   end
	   end
	   end
   end
   if ISstep == 94 then
	  local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	  local bags = {0,1,2,3}
	  if mushaccelerator == true then
		 for _, e in pairs(Rbags) do
		 local Rbag = Inventory:Get(e)
		 if (table.valid(Rbag)) then
		 local Rilist = Rbag:GetList()
		 if (table.valid(Rilist)) then
		 for _, Ritem in pairs(Rilist) do
		 if itemID == Ritem.id then
			if Ritem.count ~= 0 then
			  ISstep = 93
			end
		 else
		 mushrite9uke = true
		 ISstep = 95
		 end
		 end
		 end
		 end
		 end
	  elseif mushaccelerator == false then
		 for _, e in pairs(bags) do
		 local bag = Inventory:Get(e)
		 if (table.valid(bag)) then
		 local ilist = bag:GetList()
		 if (table.valid(ilist)) then
		 for _, item in pairs(ilist) do
		 if itemID == item.id then
		  d("[AH][itemcount]:"..item.count)
			if item.count ~= 0 then
			  ISstep = 93
			end
		 else
		 mushrite9azuke = true
		 ISstep = 95
		 end
		 end
		 end
		 end
		 end
	  end
   end
   if ISstep == 95 then
	  if IsControlOpen("InventoryRetainer") then
		 UseControlAction("InventoryRetainer","Close")
		 ISstep = 95
	  elseif IsControlOpen("InventoryRetainerLarge") then
		 UseControlAction("InventoryRetainerLarge","Close")
		 ISstep = 95
	  elseif IsControlOpen("SelectString") then
		 Inventory:SortInventory()
		 ISstep = 96
	  end
   end
   if ISstep == 96 then
	   if IsControlOpen("SelectString") then
	   GetControl("SelectString"):Action("SelectIndex",9)
	   ISstep = 96
	   else
	   ISstep = 97
	   end
   end
   if ISstep == 97 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		ISstep = 97
		elseif IsControlOpen("RetainerList") and ritekazu > 9 then
		ISstep = 98
		elseif ritekazu == 9 then
		ISstep = 199
		end
   end
   if ISstep == 98 then
	  local bags = {0, 1, 2, 3}
	  for _, e in pairs(bags) do
	  local bag = Inventory:Get(e)
	  if (table.valid(bag)) then
	  local ilist = bag:GetList()
	  if (table.valid(ilist)) then
	  for _, item in pairs(ilist) do
		 if item.id == itemID or item.id == nhitemID then
			if item.isunique == true then
			ISstep = 199
			else
			ISstep = 100
			end
		 else
		 ISstep = 100
		 end
	  end
	  end
	  end
	  end
   end

-----10
   if ISstep == 100 then
		if IsControlOpen("RetainerList") then
		GetControl("RetainerList"):Action("SelectIndex",9)--rite
		ISstep = 101
		end
   end
   if ISstep == 101 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		end
		if IsControlOpen("SelectString") then
		ISstep = 102
		else
		ISstep = 101
		end
   end
   if ISstep == 102 then
	  if IsControlOpen("SelectString") then
		 GetControl("SelectString"):Action("SelectIndex",0)
	  end
	  if IsControlOpen("InventoryRetainer") then
	  ISstep = 103
	  elseif IsControlOpen("InventoryRetainerLarge") then
	  ISstep = 103
	  else
	  ISstep = 102
	  end
   end

   if ISstep == 103 then
	  if IsControlOpen("InventoryRetainer") or IsControlOpen("InventoryRetainerLarge") then
	  d("[AH][itemSearch]:10:in bag item:"..itemID.."/ not have item:"..nhitemID)
	   local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	   local bags = {0,1,2,3}
	   for _, e in pairs(Rbags) do
	   local Rbag = Inventory:Get(e)
	   if (table.valid(Rbag)) then
	   local Rilist = Rbag:GetList()
	   if (table.valid(Rilist)) then
	   for _, Ritem in pairs(Rilist) do
		  if itemID == Ritem.id then
			 if mushaccelerator == true then
			 Ritem:Move(mybagtype,mybagslot)
			 d("[AH][itemSearch]:item move")
			 elseif mushaccelerator == false then
				 for _, e in pairs(bags) do
				 local bag = Inventory:Get(e)
				 if (table.valid(bag)) then
				 local ilist = bag:GetList()
				 if (table.valid(ilist)) then
				 for _, item in pairs(ilist) do
				 if itemID == Ritem.id and itemID == item.id then
				 item:Move(Ritem.type,Ritem.slot)
				 d("[AH][itemSearch]:item move")
				 end
				 end
				 end
				 end
				 end
			 end
			 d("[AH][itemSearch]:item move")
				if itemcount == itemmax and mushaccelerator == true then
				local Fbags = {3}
				local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
				for _, e in pairs(Fbags) do
				local Fbag = Inventory:Get(e)
				if (table.valid(Fbag)) then
				local Filist = Fbag:GetList()
				if (table.valid(Filist)) then
				for _, Fitem in pairs(Filist) do
				   for s = 0,34,1 do
				   if Fitem.slot == s then
					  table.remove(Fslot,Fitem.slot)
				   end
				   for k,v in pairs(Fslot) do
					  Ritem:Move(3,v)
					  d("[AH][itemSearch]:item move")
				   end
				   end
				end
				end
				end
				end
				end
		  ISstep = 102
		  elseif nhitemID == Ritem.id and mushaccelerator == true then
			 local Fbags = {3}
			 local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
			 for _, e in pairs(Fbags) do
			 local Fbag = Inventory:Get(e)
			 if (table.valid(Fbag)) then
			 local Filist = Fbag:GetList()
			 if (table.valid(Filist)) then
			 for _, Fitem in pairs(Filist) do
				for s = 0,34,1 do
				  if Fitem.slot == s then
					table.remove(Fslot,Fitem.slot)
				  end
				  for k,v in pairs(Fslot) do
					Ritem:Move(3,v)
					d("[AH][itemSearch]:item move")
				  end
				end
			 end
			 end
			 end
			 end
		  ISstep = 102
		  else
		  ISstep = 104
		  end
	   end
	   end
	   end
	   end
	   end
   end
   if ISstep == 104 then
	  local Rbags = {10000,10001,10002,10003,10004,10005,10006}
	  local bags = {0,1,2,3}
	  if mushaccelerator == true then
		 for _, e in pairs(Rbags) do
		 local Rbag = Inventory:Get(e)
		 if (table.valid(Rbag)) then
		 local Rilist = Rbag:GetList()
		 if (table.valid(Rilist)) then
		 for _, Ritem in pairs(Rilist) do
		 if itemID == Ritem.id then
			if Ritem.count ~= 0 then
			  ISstep = 103
			end
		 else
		 mushrite10uke = true
		 ISstep = 105
		 end
		 end
		 end
		 end
		 end
	  elseif mushaccelerator == false then
		 for _, e in pairs(bags) do
		 local bag = Inventory:Get(e)
		 if (table.valid(bag)) then
		 local ilist = bag:GetList()
		 if (table.valid(ilist)) then
		 for _, item in pairs(ilist) do
		 if itemID == item.id then
		  d("[AH][itemcount]:"..item.count)
			if item.count ~= 0 then
			  ISstep = 103
			end
		 else
		 mushrite10azuke = true
		 ISstep = 105
		 end
		 end
		 end
		 end
		 end
	  end
   end
   if ISstep == 105 then
	  if IsControlOpen("InventoryRetainer") then
		 UseControlAction("InventoryRetainer","Close")
		 ISstep = 105
	  elseif IsControlOpen("InventoryRetainerLarge") then
		 UseControlAction("InventoryRetainerLarge","Close")
		 ISstep = 105
	  elseif IsControlOpen("SelectString") then
		 Inventory:SortInventory()
		 ISstep = 106
	  end
   end
   if ISstep == 106 then
	   if IsControlOpen("SelectString") then
	   GetControl("SelectString"):Action("SelectIndex",9)
	   ISstep = 106
	   else
	   ISstep = 107
	   end
   end
   if ISstep == 107 then
		if IsControlOpen("Talk") then
		GetControl("Talk"):Action("Click")
		ISstep = 107
		elseif IsControlOpen("RetainerList") then
		ISstep = 108
		end
   end
   if ISstep == 108 then
	  local bags = {0, 1, 2, 3}
	  for _, e in pairs(bags) do
	  local bag = Inventory:Get(e)
	  if (table.valid(bag)) then
	  local ilist = bag:GetList()
	  if (table.valid(ilist)) then
	  for _, item in pairs(ilist) do
		 if item.id == itemID or item.id == nhitemID then
			if item.isunique == true then
			ISstep = 199
			else
			ISstep = 199
			end
		 else
		 ISstep = 199
		 end
	  end
	  end
	  end
	  end
   end

--tori

   if ISstep == 120 then
	  if ActionList:Get(10,77):IsReady() == true then
		ActionList:Get(10,77):Cast()
	  end
	  if IsControlOpen("InventoryBuddy") then
	  ISstep = 121
	  end
   end
   if ISstep == 121 then
	  if IsControlOpen("InventoryBuddy") then
	  d("[AH][itemSearch]:Buddy:in bag item:"..itemID.."/ not have item:"..nhitemID)
	   local Bbags = {4000,4001,4100,4101}
	   local bags = {0,1,2,3}
	   for _, e in pairs(Bbags) do
	   local Bbag = Inventory:Get(e)
	   if (table.valid(Bbag)) then
	   local Bilist = Bbag:GetList()
	   if (table.valid(Bilist)) then
	   for _, Bitem in pairs(Bilist) do
		  if itemID == Bitem.id then
			 if mushaccelerator == true then
			 Bitem:Move(mybagtype,mybagslot)
			 elseif mushaccelerator == false then
				 for _, e in pairs(bags) do
				 local bag = Inventory:Get(e)
				 if (table.valid(bag)) then
				 local ilist = bag:GetList()
				 if (table.valid(ilist)) then
				 for _, item in pairs(ilist) do
				 if itemID == Bitem.id and itemID == item.id then
				 item:Move(Bitem.type,Bitem.slot)
				 end
				 end
				 end
				 end
				 end
			 end
			 d("[AH][itemSearch]:item move")
				if itemcount == itemmax and mushaccelerator == true then
				local Fbags = {3}
				local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
				for _, e in pairs(Fbags) do
				local Fbag = Inventory:Get(e)
				if (table.valid(Fbag)) then
				local Filist = Fbag:GetList()
				if (table.valid(Filist)) then
				for _, Fitem in pairs(Filist) do
				   for s = 0,34,1 do
				   if Fitem.slot == s then
					  table.remove(Fslot,Fitem.slot)
				   end
				   for k,v in pairs(Fslot) do
					  Bitem:Move(3,v)
					  d("[AH][itemSearch]:item move")
				   end
				   end
				end
				end
				end
				end
				end
			 ISstep = 121
		  elseif nhitemID == Bitem.id and mushaccelerator == true then
			 local Fbags = {3}
			 local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
			 for _, e in pairs(Fbags) do
			 local Fbag = Inventory:Get(e)
			 if (table.valid(Fbag)) then
			 local Filist = Fbag:GetList()
			 if (table.valid(Filist)) then
			 for _, Fitem in pairs(Filist) do
				for s = 0,34,1 do
				  if Fitem.slot == s then
					table.remove(Fslot,Fitem.slot)
				  end
				  for k,v in pairs(Fslot) do
					Bitem:Move(3,v)
					d("[AH][itemSearch]:item move")
				  end
				end
			 end
			 end
			 end
			 end
			 ISstep = 121
		  else
		  ISstep = 122
		  end
	   end
	   end
	   end
	   end
	   end
   end
	  if ISstep == 122 then
	  local Bbags = {4000,4001,4100,4101}
	  local bags = {0,1,2,3}
	  if mushaccelerator == true then
		 for _, e in pairs(Bbags) do
		 local Bbag = Inventory:Get(e)
		 if (table.valid(Bbag)) then
		 local Bilist = Bbag:GetList()
		 if (table.valid(Bilist)) then
		 for _, Bitem in pairs(Bilist) do
		 if itemID == Bitem.id then
			if Bitem.count == 0 then
			  ISstep = 123
			end
		 else
		 ISstep = 123
		 end
		 end
		 end
		 end
		 end
	  elseif mushaccelerator == false then
		 for _, e in pairs(bags) do
		 local bag = Inventory:Get(e)
		 if (table.valid(bag)) then
		 local ilist = bag:GetList()
		 if (table.valid(ilist)) then
		 for _, item in pairs(ilist) do
		 if itemID == item.id then
		  d("[AH][itemcount]:"..item.count)
			if item.count == 0 then
			  ISstep = 123
			end
		 else
		 ISstep = 123
		 end
		 end
		 end
		 end
		 end
	  end
   end
   if ISstep == 123 then
	 if IsControlOpen("InventoryBuddy") then
	 UseControlAction("InventoryBuddy","Close")
	 ISstep = 123
	 else
	 ISstep = 200
	 end
   end

--FC
   if ISstep == 130 then
		local el = MEntityList("nearest,contentID=2000470,contentID=196627")
		if table.valid(el) then
		for k,v in pairs(el) do
		FCchest = v.id
		end
		end
		if FCchest == 0 then
		d("[AH][itemSearch]:FCchest is not near")
		ISstep = 200
		else
		Player:SetTarget(FCchest)
		ISstep = 131
		end
   end

   if ISstep == 131 then
		Player:SetTarget(FCchest)
		local pos = Player:GetTarget().pos
		if Player:GetTarget().Distance > 6 then
		d("[AH][itemSearch]:move to bell:"..FCchest)
		   Player:MoveTo(pos.x,pos.y,pos.z,10,true,true)
		ISstep = 132
		elseif Player:GetTarget().Distance < 6 then
		ISstep = 133
		end
   end
   if ISstep == 132 then
		Player:SetTarget(FCchest)
		if Player:GetTarget().Distance <= 3 then
		Player:Stop()
		ISstep = 133
		end
   end
   if ISstep == 133 then
		Player:SetTarget(FCchest)
		Player:Interact(FCchest)
		ISstep = 134
   end
   if ISstep == 134 then
		if IsControlOpen("FreeCompanyChest") then
		ISstep = 135
		else
		ISstep = 133
		end
   end

   if ISstep == 135 then
	  if IsControlOpen("FreeCompanyChest") then
	  GetControl("FreeCompanyChest"):PushButton(25,1)
	  SendTextCommand("/e [AH][notice]FCchest1 load")
	  ISstep = 136
	  end
   end
	  if ISstep == 136 then
	  if GetChatLines()[table.maxn(GetChatLines())].timestamp == GetEorzeaTime().servertime - 3 then
	  mushFCchestload = GetControl("FreeCompanyChest"):GetRawData()[11].value
	  if tonumber(mushFCchestload) == 1 then
	  ISstep = 135
	  elseif tonumber(mushFCchestload) == 0 then
	  ISstep = 137
	  end
	  end
   end
   if ISstep == 137 then
	  if IsControlOpen("FreeCompanyChest") then
	  GetControl("FreeCompanyChest"):PushButton(25,2)
	  SendTextCommand("/e [AH][notice]FCchest2 load")
	  ISstep = 138
	  end
   end
	  if ISstep == 138 then
	  if GetChatLines()[table.maxn(GetChatLines())].timestamp == GetEorzeaTime().servertime - 3 then
	  mushFCchestload = GetControl("FreeCompanyChest"):GetRawData()[11].value
	  if tonumber(mushFCchestload) == 1 then
	  ISstep = 137
	  elseif tonumber(mushFCchestload) == 0 then
	  ISstep = 139
	  end
	  end
   end
   if ISstep == 139 then
	  if IsControlOpen("FreeCompanyChest") then
	  GetControl("FreeCompanyChest"):PushButton(25,3)
	  SendTextCommand("/e [AH][notice]FCchest3 load")
	  ISstep = 140
	  end
   end
	  if ISstep == 140 then
	  if GetChatLines()[table.maxn(GetChatLines())].timestamp == GetEorzeaTime().servertime - 3 then
	  mushFCchestload = GetControl("FreeCompanyChest"):GetRawData()[11].value
	  if tonumber(mushFCchestload) == 1 then
	  ISstep = 139
	  elseif tonumber(mushFCchestload) == 0 then
	  ISstep = 141
	  end
	  end
   end
   if ISstep == 141 then
	  if IsControlOpen("FreeCompanyChest") then
	  GetControl("FreeCompanyChest"):PushButton(25,4)
	  SendTextCommand("/e [AH][notice]FCchest4 load")
	  ISstep = 142
	  end
   end
	  if ISstep == 142 then
	  if GetChatLines()[table.maxn(GetChatLines())].timestamp == GetEorzeaTime().servertime - 3 then
	  mushFCchestload = GetControl("FreeCompanyChest"):GetRawData()[11].value
	  if tonumber(mushFCchestload) == 1 then
	  ISstep = 141
	  elseif tonumber(mushFCchestload) == 0 then
	  ISstep = 143
	  end
	  end
   end
   if ISstep == 143 then
	  if IsControlOpen("FreeCompanyChest") then
	  GetControl("FreeCompanyChest"):PushButton(25,5)
	  SendTextCommand("/e [AH][notice]FCchest5 load")
	  ISstep = 144
	  end
   end
	  if ISstep == 144 then
	  if GetChatLines()[table.maxn(GetChatLines())].timestamp == GetEorzeaTime().servertime - 3 then
	  mushFCchestload = GetControl("FreeCompanyChest"):GetRawData()[11].value
	  if tonumber(mushFCchestload) == 1 then
	  ISstep = 143
	  elseif tonumber(mushFCchestload) == 0 then
	  ISstep = 145
	  end
	  end
   end
   if ISstep == 145 then
	  if IsControlOpen("FreeCompanyChest") then
	  d("[AH][itemSearch]:FCchest:in bag item:"..itemID.."/ not have item:"..nhitemID)
	   local FCbags = {20000,20001,20002,20003,20004}
	   local bags = {0,1,2,3}
	   for _, e in pairs(FCbags) do
	   local FCbag = Inventory:Get(e)
	   if (table.valid(FCbag)) then
	   local FCilist = FCbag:GetList()
	   if (table.valid(FCilist)) then
	   for _, FCitem in pairs(FCilist) do
		  if itemID == FCitem.id then
			 if mushaccelerator == true then
			 FCitem:Move(mybagtype,mybagslot)
			 elseif mushaccelerator == false then
				 for _, e in pairs(bags) do
				 local bag = Inventory:Get(e)
				 if (table.valid(bag)) then
				 local ilist = bag:GetList()
				 if (table.valid(ilist)) then
				 for _, item in pairs(ilist) do
				 if itemID == FCitem.id and itemID == item.id then
				 item:Move(FCitem.type,FCitem.slot)
				 end
				 end
				 end
				 end
				 end
			 end
			 d("[AH][itemSearch]:item move")
				if itemcount == itemmax and mushaccelerator == true then
				local Fbags = {3}
				local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
				for _, e in pairs(Fbags) do
				local Fbag = Inventory:Get(e)
				if (table.valid(Fbag)) then
				local Filist = Fbag:GetList()
				if (table.valid(Filist)) then
				for _, Fitem in pairs(Filist) do
				   for s = 0,34,1 do
				   if Fitem.slot == s then
					  table.remove(Fslot,Fitem.slot)
				   end
				   for k,v in pairs(Fslot) do
					  FCitem:Move(3,v)
					  d("[AH][itemSearch]:item move")
				   end
				   end
				end
				end
				end
				end
				end
			 ISstep = 145
		  elseif nhitemID == FCitem.id and mushaccelerator == true then
			 local Fbags = {3}
			 local Fslot = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
			 for _, e in pairs(Fbags) do
			 local Fbag = Inventory:Get(e)
			 if (table.valid(Fbag)) then
			 local Filist = Fbag:GetList()
			 if (table.valid(Filist)) then
			 for _, Fitem in pairs(Filist) do
				for s = 0,34,1 do
				  if Fitem.slot == s then
					table.remove(Fslot,Fitem.slot)
				  end
				  for k,v in pairs(Fslot) do
					Bitem:Move(3,v)
					d("[AH][itemSearch]:item move")
				  end
				end
			 end
			 end
			 end
			 end
			 ISstep = 145
		  else
		  ISstep = 146
		  end
	   end
	   end
	   end
	   end
	   end
   end
	  if ISstep == 146 then
	  local FCbags = {20000,20001,20002,20003,20004}
	  local bags = {0,1,2,3}
	  if mushaccelerator == true then
		 for _, e in pairs(FCbags) do
		 local FCbag = Inventory:Get(e)
		 if (table.valid(FCbag)) then
		 local FCilist = FCbag:GetList()
		 if (table.valid(FCilist)) then
		 for _, FCitem in pairs(FCilist) do
		 if itemID == FCitem.id then
			if FCitem.count == 0 then
			  ISstep = 147
			end
		 else
		 ISstep = 147
		 end
		 end
		 end
		 end
		 end
	  elseif mushaccelerator == false then
		 for _, e in pairs(bags) do
		 local bag = Inventory:Get(e)
		 if (table.valid(bag)) then
		 local ilist = bag:GetList()
		 if (table.valid(ilist)) then
		 for _, item in pairs(ilist) do
		 if itemID == item.id then
		  d("[AH][itemcount]:"..item.count)
			if item.count == 0 then
			  ISstep = 147
			end
		 else
		 ISstep = 147
		 end
		 end
		 end
		 end
		 end
	  end
   end
   if ISstep == 147 then
	 if IsControlOpen("FreeCompanyChest") then
	 UseControlAction("FreeCompanyChest","Close")
	 ISstep = 147
	 else
	 ISstep = 148
	 end
   end
   if ISstep == 148 then
	 Player:ClearTarget()
	 if Player:GetTarget() == nil then
		ISstep = 200
	 else
	 ISstep = 148
	 end
   end

   if ISstep == 199 then
		if IsControlOpen("RetainerList") then
		UseControlAction("RetainerList","Close")
		ISstep = 199
		Player:ClearTarget()
		elseif Player:GetTarget() == nil then
		ISstep = 200
		end
   end

   if ISstep == 200 then
	d("[AH][itemSearch]:END")
		itemID = 0
		itemhqID = 0
		nhitemID = 0
		nhitemhqID = 0
		ISstep = 0
		ritebel = 0
		FCchest = 0
		ritekazu = 0
		mybagslot = 0
		mybagtype = 0
		itemcount = 0
		itemmax = 0
		syojisu = 0
		mushrite1uke = false
		mushrite1azuke = false
		mushrite2uke = false
		mushrite2azuke = false
		mushrite3uke = false
		mushrite3azuke = false
		mushrite4uke = false
		mushrite4azuke = false
		mushrite5uke = false
		mushrite5azuke = false
		mushrite6uke = false
		mushrite6azuke = false
		mushrite7uke = false
		mushrite7azuke = false
		mushrite8uke = false
		mushrite8azuke = false
		mushrite9uke = false
		mushrite9azuke = false
		mushrite10uke = false
		mushrite10azuke = false
		itemunique = nil
		mushitemname = nil
		mushISinbag = {}
		mushlooptimer = 1000
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
			  if Duty:GetActiveDutyInfo().timer == 7198 then
			  SendTextCommand("/p "..tostring(Scall.word01))
			  SendTextCommand(tostring(Scall.word02))
			  PScallstep = 99
			  end
		 end
		 if PScallstep == 20 then
			  if Duty:GetActiveDutyInfo().timer == 5398 then
			  SendTextCommand("/p "..tostring(Scall.word01))
			  SendTextCommand(tostring(Scall.word02))
			  PScallstep = 99
			  end
		 end
		 if PScallstep == 30 then
			  if Duty:GetActiveDutyInfo().timer == 3598 then
			  SendTextCommand("/p "..tostring(Scall.word01))
			  SendTextCommand(tostring(Scall.word02))
			  PScallstep = 99
			  end
		 end
		 if PScallstep == 40 then
			  if Duty:GetActiveDutyInfo().timer == 1798 then
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
   local Entity = 0
   local el = MEntityList("type=2")
			  if table.valid(el) then
					  for k,v in pairs(el) do
							Entity = Entity + 1
					  end
			  end
   if (Ecall.Enable) then
		 if PEcallstep == 0 then
			if Duty:IsQueued() == true and Duty:GetQueueStatus() == 4 and
			   Player.Targetable == true and Duty:GetActiveDutyInfo() ~= nil then
			  if (#EntityList.myparty) ~= 0 then PEcallstep = 10 end
			  if Player.OnlineStatus == 43 or (#EntityList.myparty) == 0 then PEcallstep = 20 end
			end
		 end
		 if PEcallstep == 10 then
			  if Duty:IsQueued() == true and Duty:GetQueueStatus() == 4 and IsControlOpen("_NotificationIcMvp") or
				 Duty:IsQueued() == true and Duty:GetQueueStatus() == 4 and Duty:GetActiveDutyInfo() == nil and Entity == 0 then
			  -- Duty:IsQueued() == true and Duty:GetQueueStatus() == 4 and IsControlOpen("NowLoading") and Entity == 0 then
			  SendTextCommand("/p "..tostring(Ecall.word01))
			  SendTextCommand(tostring(Ecall.word02))
			  PEcallstep = 99
			  end
		 end
		 if PEcallstep == 20 then
			  if Duty:IsQueued() == true and Duty:GetQueueStatus() == 4 and
				 IsControlOpen("NowLoading") and Entity == 0 then
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


------------------------------------------------------------


function AetheryteHelper.mushTextCommands()
	local log = GetChatLines()
	local logmatch = nil
	local mushtextstep = 99
	local logmatchtime = 2
	local ezt = GetEorzeaTime().servertime
	local mushlogtime = ezt
	local worldname = ""
	
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
	  if command.line:match("AH itemsort") then
		   logmatch = command.line
		   mushlogtime = command.timestamp
		   mushtextstep = 80
	  end
	  if command.line:match("AH minion") then
		   logmatch = command.line
		   mushlogtime = command.timestamp
		   mushtextstep = 90
	  end
	  if command.line:match("AHminiRadar") then
		   logmatch = command.line
		   mushlogtime = command.timestamp
		   mushtextstep = 100
	  end
	  if command.line:match("AHWV:.*") then
		   logmatch = command.line
		   mushlogtime = command.timestamp
		   mushtextstep = 110
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
		  local el = MEntityList("type=9,maxdistance=30")
		  for i,entity in pairs(el) do
			  if entity.ContentID == 423 then
				WeeEa = WeeEa + 1
			  end
		  end
		  d("[AH][textcommand]:success")
		   SendTextCommand(tostring("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH]WeeEa(within 30ylm)："..WeeEa))
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
	 if mushtextstep == 80 then
	   if AHitemsort == true then
	   logmatch = nil
	   mushtextstep = 99
	   else
	   mushtextstep = 81
	   end
	end
	if mushtextstep == 81 then
	   if logmatch then
		d("[AH][text][Progress]"..(mushlogtime+logmatchtime)-ezt)
		  if mushlogtime+logmatchtime == ezt then
		  mushlooptimer = 1000
		  mushtextstep = 82
		  else
		  mushtextstep = 99
		  end
	   end
	 end
	  if mushtextstep == 82 then
		   AHitemsort = true
		   d("[AH][textcommand]:success")
		   SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][Itemsort]:sort")
		   mushtextstep = 99
	 end
	 if mushtextstep == 90 then
	   if FFXIV_Common_BotRunning == true then
	   mushtextstep = 91
	   elseif FFXIV_Common_BotRunning == false then
	   mushtextstep = 93
	   end
	end
	if mushtextstep == 91 then
	   if logmatch then
		d("[AH][text][Progress]"..(mushlogtime+logmatchtime)-ezt)
		  if mushlogtime+logmatchtime == ezt then
		  mushlooptimer = 1000
		  mushtextstep = 92
		  else
		  mushtextstep = 99
		  end
	   end
	 end
	 if mushtextstep == 92 then
		   d("[AH][textcommand]:success")
		   SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][minion]:OFF")
		   ml_global_information.ToggleRun()
		   mushtextstep = 99
	 end
	 if mushtextstep == 93 then
	   if logmatch then
		d("[AH][text][Progress]"..(mushlogtime+logmatchtime)-ezt)
		  if mushlogtime+logmatchtime == ezt then
		  mushlooptimer = 1000
		  mushtextstep = 94
		  else
		  mushtextstep = 99
		  end
	   end
	 end
	 if mushtextstep == 94 then
		   d("[AH][textcommand]:success")
		   SendTextCommand("/e \x02\x13\x06\xfe\xff\xff\xff\x11 [AH][minion]:ON")
		   ml_global_information.ToggleRun()
		   mushtextstep = 99
	 end
	 if mushtextstep == 100 then
	   if AetheryteHelper.miniRadarWindow.open == true then
	   logmatch = nil
	   mushtextstep = 99
	   else
	   mushtextstep = 101
	   end
	end
	if mushtextstep == 101 then
	   if logmatch then
		d("[AH][text][Progress]"..(mushlogtime+logmatchtime)-ezt)
		  if mushlogtime+logmatchtime == ezt then
		  mushlooptimer = 1000
		  mushtextstep = 102
		  else
		  mushtextstep = 99
		  end
	   end
	 end
	 if mushtextstep == 102 then
		   AetheryteHelper.miniRadarWindow.open = true
		   d("[AH][textcommand]:success")
		   SendTextCommand("/e \x02\x13\x06\xfe\xff\x11\x99\x11 [AH][MiniRadar]:open")
		   mushtextstep = 99
	 end
	 if mushtextstep == 110 then
	 		AetheryteHelper.Origin()
			AetheryteHelper.SaveSettings()
			MushmoveServerlist = Origin_list
			for k, v in pairs(MushmoveServerlist) do
			local templist = MushmoveServerlist
			for k,v in pairs(WorldID) do
			if (v.id == Player.currentworld) then local tempWorld = v
			tempname = tostring(tempWorld.Name)
			for k,v in pairs(templist) do
			local tempindex = table.find(templist, tempname)
			if (tempindex ~= nil) then
			table.remove(templist,tempindex)
			else tempindex = 0
			end
			end
			end
			end
			end
			AetheryteHelper.autoDCset()
	 		if #MushmoveServerlist == 1 then
	 			if kinokoProject.Windows.minibutton.Open == true then
	 			kinokoProject.Windows.minibutton.Open = false	
	 			kinokoProject.Windows.MainWindows.Open = true
	 			AetheryteHelper.miniWV.open = false
	 			AetheryteHelper.SaveSettings()
	 			elseif kinokoProject.Windows.minibutton.Open == false and kinokoProject.Windows.MainWindows.Open == false then
	 			kinokoProject.Windows.MainWindows.Open = true
	 			AetheryteHelper.miniWV.open = false
  			AetheryteHelper.SaveSettings()
	 			end
	 			d("[AH][textcommand]:Get ServerList")
		  	SendTextCommand("/e [AH][notice]:Get ServerList/Please Retry")
	 			logmatch = nil
    		mushtextstep = 99
	 		elseif #MushmoveServerlist > 1 then
	 			if kinokoProject.Windows.MainWindows.Open == true and AetheryteHelper.GUI.tabs[1].isselected == true then
	 			kinokoProject.Windows.minibutton.Open = true	
	 			kinokoProject.Windows.MainWindows.Open = false
	 		  end
	 	  	for k, v in pairs(MushmoveServerlist) do
	     		if logmatch:match(v) then
	     		worldname = v
	     	  mushtextstep = 111
	     	  end 
	    	end
	  	end
	end
	if mushtextstep == 111 then
	   if logmatch then
		d("[AH][text][Progress]"..(mushlogtime+logmatchtime)-ezt)
		  if mushlogtime+logmatchtime == ezt then
	  	AetheryteHelper.miniWV.open = false
		  mushlooptimer = 1000
		  mushtextstep = 112
		  else
		  mushtextstep = 99
		  end
	   end
	 end
	 if mushtextstep == 112 then
	 		if Player.localmapid == 132 or Player.localmapid == 129 or Player.localmapid == 130 then
	 			for k, v in pairs(MushmoveServerlist) do
	 				if worldname == v then
      		isServer = k
      		end
      	end
      selectins = true
		  d("[AH][textcommand]:success")
		  	if isServer == 1 then
      	SendTextCommand("/e \x02\x13\x06\xfe\xff\x99\x11\x11 [AH][WV]:not found or Now World")
      	elseif isServer > 1 then
		  	SendTextCommand("/e \x02\x13\x06\xfe\xff\x11\x99\x11 [AH][WV]:move to "..worldname)
		  	end
		  mushtextstep = 113
			else
			d("[AH][textcommand]:success")
			d("[AH][textcommand]:Not Support Area")
		  SendTextCommand("/e [AH][notice]:Not Support Area")
		  mushtextstep = 99
			end
	 end
	 if mushtextstep == 113 then
	 	  if IsControlOpen("WorldTravelFinderReady") or isServer == 1 then
      selectins = false
      isServer = 1
      mushtextstep = 99
      end
	 end

	 if mushtextstep == 99 then
		mushlogtime = ezt
		logmatch = nil
	 end
end

function AetheryteHelper.AutoUpdateCheck()
if AHSET.AutoUpdate == true then
	  mushlooptimer = 1000
 		table.insert(AetheryteHelper.UpdateTimeSince,GetEorzeaTime().servertime)
 		if #AetheryteHelper.UpdateTimeSince > 1 then
 		  table.remove(AetheryteHelper.UpdateTimeSince)
 		end
 		if tonumber(AetheryteHelper.UpdateTimeSince[1]) + 7200 < GetEorzeaTime().servertime then
 			AetheryteHelper.VersionCheck()
 			d("[AH][notice]AutoUpdateCheck")
 			AetheryteHelper.UpdateTimeSince = {}
 		elseif tonumber(AetheryteHelper.UpdateTimeSince[1]) + 10 == GetEorzeaTime().servertime then
 			AetheryteHelper.VersionCheck()
 			d("[AH][notice]AutoUpdateCheck")
 		end 
 	else
 		AetheryteHelper.UpdateTimeSince = {}
 	end
end

function AetheryteHelper.AutoUpdate()
  io.popen([[start /b powershell -Command "-Force; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Tls11; $tag = (Invoke-WebRequest -Uri https://api.github.com/repos/mushroom8009/AetheryteHelper/releases -UseBasicParsing | ConvertFrom-Json)[0].tag_name; $name = (Invoke-WebRequest -Uri https://api.github.com/repos/mushroom8009/AetheryteHelper/releases -UseBasicParsing | ConvertFrom-Json)[0].name; Invoke-WebRequest -Uri https://github.com/mushroom8009/AetheryteHelper/releases/download/$tag/AetheryteHelper_$name.zip -OutFile ']] ..ModulePath.. [[cash\AetheryteHelper_$name.zip'; Expand-Archive ']] ..ModulePath.. [[cash\AetheryteHelper_$name.zip' -DestinationPath ']] ..LuaPath.. [[' -Force; Remove-Item ']] ..ModulePath.. [[cash\AetheryteHelper_$name.zip' -Force; "Set-Content -Path ']] ..ModulePath.. [[\version_info\nowversion.txt' -Value 'v]]..kinokoProject.Addon.Version..[['; stop-process -Id $PID"]]):close()
--io.popen([[start /b powershell -Command "Set-Content -Path ']] ..ModulePath.. [[\version_info\nowversion.txt' -Value 'v]]..kinokoProject.Addon.Version..[['; stop-process -Id $PID"]]):close()
  local NewV = io.open(ModulePath.."version_info/version.txt")
  local tag = io.open(ModulePath.."version_info/tag.txt")
  local NowV = io.open(ModulePath.."version_info/nowversion.txt")
  if NewV ~= nil then	NewVtext = NewV:read() NewV:close()	end
  if NowV ~= nil then	NowVtext = NowV:read() NowV:close()	end
  if tag ~= nil then tagtext = tag:read() tag:close()	end
  if NewVtext == NowVtext then
  	 mushVC = false
  end
  if mushVC == false and mushVUP == nil then
  io.popen([[cmd /c start "" "]]..AHLinks.link3..[["]]):close()
     mushVUP = false
  end
end

function AetheryteHelper.VersionCheck()
  io.popen([[start /b powershell -Command "-Force; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Tls11; $json = (Invoke-WebRequest -Uri https://api.github.com/repos/mushroom8009/AetheryteHelper/releases -UseBasicParsing | ConvertFrom-Json); Set-Content -Path ']] ..ModulePath.. [[\version_info\ReleaseNote.txt' -Value $json[0].body; stop-process -Id $PID"]]):close()
  io.popen([[start /b powershell -Command "-Force; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Tls11; $json = (Invoke-WebRequest -Uri https://api.github.com/repos/mushroom8009/AetheryteHelper/releases -UseBasicParsing | ConvertFrom-Json); Set-Content -Path ']] ..ModulePath.. [[\version_info\downloadURL.txt' -Value $json[0].assets[0].browser_download_url; stop-process -Id $PID"]]):close()
  io.popen([[start /b powershell -Command "-Force; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Tls11; $name = (Invoke-WebRequest -Uri https://api.github.com/repos/mushroom8009/AetheryteHelper/releases -UseBasicParsing | ConvertFrom-Json); Set-Content -Path ']] ..ModulePath.. [[\version_info\version.txt' -Value $name[0].name; stop-process -Id $PID"]]):close()
  io.popen([[start /b powershell -Command "-Force; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Tls11; $tag = (Invoke-WebRequest -Uri https://api.github.com/repos/mushroom8009/AetheryteHelper/releases -UseBasicParsing | ConvertFrom-Json); Set-Content -Path ']] ..ModulePath.. [[\version_info\tag.txt' -Value $tag[0].tag_name; stop-process -Id $PID"]]):close()
  local NewV = io.open(ModulePath.."version_info/version.txt")
  local tag = io.open(ModulePath.."version_info/tag.txt")
  local NowV = io.open(ModulePath.."version_info/nowversion.txt")
  if NewV ~= nil then	NewVtext = NewV:read() NewV:close()	end
  if NowV ~= nil then	NowVtext = NowV:read() NowV:close()	end
  if tag ~= nil then tagtext = tag:read() tag:close()	end
    if NewVtext ~= NowVtext and tonumber(tagtext) > kinokoProject.Addon.tag then
  	 mushVC = true
  	 mushVUP = true
  	end
end
---------------------------------------------------------------
function AetheryteHelper.UBDmode03func()
     for k,v in pairs(AetheryteHelper.userCustomfunc) do
		  	if v[1] == 1 and v[7] == 2 then
			  	if v[10] == 1 then
  				  mushlooptimer = v[13]
        		  assert(loadstring(v[14]))()
  			  end
	  	  end
     end
end
---------------------------------------------------------------

function AetheryteHelper.mushsubtool()

	if (GetGameState() == FFXIV.GAMESTATE.INGAME and TimeSince(lastUpdatePulse) > mushlooptimer) then
	   lastUpdatePulse = Now()
  
      AetheryteHelper.AutoUpdateCheck()
			AetheryteHelper.UBDmode03func()
      AetheryteHelper.undersizeIDswitch()
			AetheryteHelper.explorerIDswitch()
			AetheryteHelper.Exchange()
			AetheryteHelper.mushSealstoItem()
			AetheryteHelper.movetoGCAll()
			AetheryteHelper.mushpotionmanual()
			AetheryteHelper.mushEXchangeTrust()
			AetheryteHelper.moveMBlimsa()
			AetheryteHelper.moveMBgridania()
			AetheryteHelper.moveMBuldah()
			AetheryteHelper.mushsRemateria()
			AetheryteHelper.mushMaterialize()
			AetheryteHelper.mushsubAR()
			AetheryteHelper.Desynthseis()
			AetheryteHelper.mushTextCommands()
			AetheryteHelper.nonAFK()
			AetheryteHelper.voteMVP()
			AetheryteHelper.PartyCall()
			AetheryteHelper.itemsort()
			AetheryteHelper.itemSearch()
			AetheryteHelper.itemsortRite()
			AetheryteHelper.itemsortB()
			AetheryteHelper.Jumbocactpothelper()

	 end
AetheryteHelper.AutoLegacy()
end





---------------------------------------------------------------------------------------------------------------------------------------------------
-- Register
RegisterEventHandler("Module.Initalize",AetheryteHelper.Init,"AetheryteHelper.Init")
RegisterEventHandler("Module.Initalize",AetheryteHelper.ModuleInit,"AetheryteHelper.ModuleInit")
RegisterEventHandler("Gameloop.Draw", AetheryteHelper.DrawCall,"AetheryteHelper.DrawCall")
RegisterEventHandler("Gameloop.Update", AetheryteHelper.mushMaintool,"AetheryteHelper.mushMaintool")
RegisterEventHandler("Gameloop.Update", AetheryteHelper.mushsubtool,"AetheryteHelper.mushsubtool")
---------------------------------------------------------------------------------------------------------------------------------------------------

