JP
---
UserSettingsフォルダ内に、データが保存されるのでフォルダを消すとErrorが起きます。ご注意ください。
このテキストは削除しても問題は起きません。
-----------------------------------------------------------------------------------------------------------------
・delayを「 114 」(いいよ)にすると、イスタンス選択の際、インスタンス選択のボタンを押すだけでAHがオンになります。
	つまり混雑時にエラーでAHが停止することなく、ボタン連打が可能になります。
	ただ、インスタンスが350人を超えるとどう頑張っても入れないようです。
	そろそろ混雑も落ち着いてきたのであまり使う機会はないとおもいますが…

・delayを「 194 」(いくよ)にすると[ i ]（インフォボタン）を押したときに別のものが表示されます。
	HMのTrustで納品と交換を繰り返したい方向けです。
	以下の様に設定してください。

※数字は「CTRL+クリック」で直接入力が可能です
*****************************************************************************************************************
HMのDMのResting「Runs Before Resting」を 1 に
HMのDMのResting「Rest Time(m)」を 1 以上に（単位は分）
	※「IDを1回クリアするごとに1分のクールタイムを設ける」ということです。
	このクールタイム中はウィンドウが勝手に閉じられることがないので、
	これに合わせてコードを組み直し、以前より安定した動作が可能になりました。

交換に必要な軍票計算をOptionタブ表示の際にしか行なわないので
[ i ]で表示させた小窓の「 Exchange on Trust 」チェックを入れると自働でタブが切り替わり、オフにするまで変更できなくなります。
また、必須である分解オプションの「Trust mode」にもチェックが入ります。

移動はしないので、所属GCのNPC前で使って下さい。
交換時はOptionタブのままにしておいて下さい。
	exchangeオプションの「 adjust off 」はノンチェックがおすすめです。
	所持軍票に合わせて交換したいものの数を常に最大にしてくれます。
	Start amountはお好みでいいですが、1にしとくと常に交換してくれるようになります。
	ただ、納品→交換→納品→交換と時間がかかるので一定以上の数字にしとくのがおすすめです。
	あるいはRest Timeの数字を上げて下さい。
	なお、保証はしませんが、フェイスじゃなくて制限解除で行くソロIDでも使えます
*****************************************************************************************************************

EN
---
the data is stored in the "UserSettings" folder, so deleting the folder will cause an Error.
please be careful.
-----------------------------------------------------------------------------------------------------------------
If you set the delay to "114"
 (in Japan, 114 reading is "iiyo" / meaning good), 
the AH will be turned on just by pressing the button for instance selection.
	This means that you can hit the button repeatedly without the AH stopping due to an error during congestion.
	However, it seems that if an instance has more than 350 users, you can't get in no matter how hard you try.
	I don't think I'll have much chance to use it now that the congestion has settled down, but...

If you set the delay to "194"
(in Japan, 194 reading is "ikuyo"/ meaning going), 
something else will be displayed when you press [ i ] (info button).
	This is for those who want to repeat exchange and trun in with HM's Trust.
	This is a rather aggressive process, so please set it as follows.

*numbers can be entered directly by "CTRL+leftclick".
*****************************************************************************************************************
Set Resting "Runs Before Resting" of DM of HM to 1.
Set Resting "Rest Time(m)" of HM's DM to 1 or more.
Since the military voucher calculation required for exchange is performed only when the Option tab is displayed
If the "Exchange on Trust" checkbox in the small window displayed by [ i ] is checked,
the tab will switch automatically and cannot be changed until it is turned off.


	It is recommended to uncheck the "adjust off" option for trun in.
	It will always maximize the number of items you want to trun in according to your seals.
	Start amount is your choice, but if you set it to 1, it will always trun in.
	In addition, 
	it can be used for Dungeon that are not Trust,
	for example, where you go solo with undersize.(but not guaranteed to work.)
*****************************************************************************************************************