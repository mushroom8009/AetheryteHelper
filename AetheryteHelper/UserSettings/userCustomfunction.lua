-- Persistent Data
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	[1] = {
		[1] = 0;
		[2] = "Sample01";
		[3] = "";
		[4] = "";
		[5] = "";
		[6] = "TextCommand";
		[7] = 0;
		[8] = "/e Sample <se.7> ";
		[9] = "";
		[10] = 0;
		[11] = "";
		[12] = "";
		[13] = 1000;
		[14] = "";
		[15] = 0;
		[16] = 0;
	};
	[2] = {
		[1] = 0;
		[2] = "Sample02";
		[3] = "icon_Sharlayan.png";
		[4] = "";
		[5] = "";
		[6] = "Teleport to OldSharlayan";
		[7] = 1;
		[8] = "";
		[9] = "";
		[10] = 0;
		[11] = "Player:Teleport(182,0)";
		[12] = "";
		[13] = 1000;
		[14] = "";
		[15] = 0;
		[16] = 0;
	};
	[3] = {
		[1] = 0;
		[2] = "Sample03";
		[3] = "";
		[4] = "";
		[5] = "";
		[6] = "Auto Talk Click";
		[7] = 2;
		[8] = "";
		[9] = "";
		[10] = 0;
		[11] = "";
		[12] = "";
		[13] = 1000;
		[14] = "if IsControlOpen(\"Talk\") then\
		  UseControlAction(\"Talk\", \"Close\")\
end";
		[15] = 0;
		[16] = 0;
	};
}
return obj1
