(function (_cfg, it, it1) {
	var _$temp = void 0,
	    node = void 0;_$temp = node;{
		var _$parent = _$temp;var _node = { "attrs": {}, "tagName": "div", "sid": 0 };_node.children = [];_node.attrSize = 2;_node.attrHash = 124358627;_node.attrs["class"] = "ga-new-page";_node.attrs["w-class"] = "ga-new-page";_$temp = _node;{
			var _$parent2 = _$temp;var _node2 = { "attrs": {}, "tagName": "div", "sid": 1 };_node2.children = [];_node2.childHash = 1914658367;_node2.attrSize = 2;_node2.attrHash = 1024049843;_node2.attrs["w-class"] = "ga-title-bar";_node2.attrs["ev-back-click"] = "backPrePage";_$temp = _node2;{
				var _$parent3 = _$temp;var _node3 = { "attrs": {}, "tagName": "app-components-topBar-topBar", "sid": 2 };_node3.hasChild = false;_node3.child = null;_node3.childHash = 2910332348;_node3.attrHash = 0;_$temp = _node3;{
					var _$parent4 = _$temp;var _node4 = {}; //jpair pre

					{
						var jvalue = "";
						jvalue = "发红包";
						//jpair suf

						_node4["title"] = jvalue;
					}
					//jpair pre

					{
						var _jvalue = "";
						_jvalue = "white";
						//jpair suf

						_node4["iconColor"] = _jvalue;
					}
					//jpair pre

					{
						var _jvalue2 = "";
						_jvalue2 = "color:#fff;backgroundColor:#DF5E5E;";
						//jpair suf

						_node4["style"] = _jvalue2;
					}
					_addJson(_node4, _$parent4);
				}_$parent3.children.push(_node3);
			}_$temp = _node2;{
				var _$parent5 = _$temp;var _node5 = { "attrs": {}, "tagName": "div", "sid": 3 };_node5.children = [];_node5.childHash = 2679169879;_node5.attrSize = 2;_node5.attrHash = 2082808853;_node5.attrs["w-class"] = "ga-red-envelope-record";_node5.attrs["on-tap"] = "redEnvelopeRecordsClick";_$temp = _node5;{
					var _$parent6 = _$temp;var _node6 = _installText("红包记录", 3545032324);;
					_$parent6.children.push(_node6);
				}_$parent5.children.push(_node5);
			}_$parent2.children.push(_node2);
		}_$temp = _node;{
			var _$parent7 = _$temp;var _node7 = { "attrs": {}, "tagName": "div", "sid": 4 };_node7.children = [];_node7.attrSize = 1;_node7.attrHash = 3683563707;_node7.attrs["w-class"] = "ga-body";_$temp = _node7;{
				var _$parent8 = _$temp;var _node8 = { "attrs": {}, "tagName": "div", "sid": 5 };_node8.children = [];_node8.attrSize = 2;_node8.attrHash = 1738060459;_node8.attrs["w-class"] = "ga-item-box";_node8.attrs["on-tap"] = "chooseCurrencyClick";_$temp = _node8;{
					var _$parent9 = _$temp;var _node9 = { "attrs": {}, "tagName": "div", "sid": 6 };_node9.children = [];_node9.attrSize = 1;_node9.attrHash = 1225849618;_node9.attrs["w-class"] = "ga-balance-inner-box";_$temp = _node9;{
						var _$parent10 = _$temp;var _node10 = { "attrs": {}, "tagName": "span", "sid": 7 };_node10.children = [];_node10.childHash = 1164436141;_node10.attrSize = 1;_node10.attrHash = 919829941;_node10.attrs["w-class"] = "ga-balance-title";_$temp = _node10;{
							var _$parent11 = _$temp;var _node11 = _installText("余额", 3098370858);;
							_$parent11.children.push(_node11);
						}_$parent10.children.push(_node10);
					}_$temp = _node9;{
						var _$parent12 = _$temp;var _node12 = { "attrs": {}, "tagName": "span", "sid": 8 };_node12.children = [];_node12.attrSize = 1;_node12.attrHash = 915537050;_node12.attrs["w-class"] = "ga-balance";_$temp = _node12;{
							var _$parent13 = _$temp;_addText(it1.balance, _$parent13);
						}_chFunc(_node12);_$parent12.children.push(_node12);
					}_$temp = _node9;{
						var _$parent14 = _$temp;var _node13 = { "attrs": {}, "tagName": "span", "sid": 9 };_node13.children = [];_node13.attrHash = 0;_$temp = _node13;{
							var _$parent15 = _$temp;_addText(it1.currencyName, _$parent15);
						}_chFunc(_node13);_$parent14.children.push(_node13);
					}_chFunc(_node9);_$parent9.children.push(_node9);
				}_$temp = _node8;{
					var _$parent16 = _$temp;var _node14 = { "attrs": {}, "tagName": "div", "sid": 10 };_node14.children = [];_node14.attrSize = 1;_node14.attrHash = 981385873;_node14.attrs["w-class"] = "ga-choose-currency";_$temp = _node14;{
						var _$parent17 = _$temp;var _node15 = { "attrs": {}, "tagName": "span", "sid": 11 };_node15.children = [];_node15.attrHash = 0;_$temp = _node15;{
							var _$parent18 = _$temp;_addText(it1.currencyName, _$parent18);
						}_chFunc(_node15);_$parent17.children.push(_node15);
					}_$temp = _node14;{
						var _$parent19 = _$temp;var _node16 = { "attrs": {}, "tagName": "img", "sid": 12 };_node16.children = [];_node16.childHash = 0;_node16.attrSize = 2;_node16.attrHash = 4063960821;_node16.attrs["w-class"] = "ga-currency-img";_node16.attrs["src"] = "../../../res/image/right_arrow.png";_$parent19.children.push(_node16);
					}_chFunc(_node14);_$parent16.children.push(_node14);
				}_chFunc(_node8);_$parent8.children.push(_node8);
			}if (it1.itype === 0) {
				_$temp = _node7;{
					var _$parent20 = _$temp;var _node17 = { "attrs": {}, "tagName": "div", "sid": 13 };_node17.children = [];_node17.attrSize = 1;_node17.attrHash = 2367462560;_node17.attrs["w-class"] = "ga-item-box";_$temp = _node17;{
						var _$parent21 = _$temp;var _node18 = { "attrs": {}, "tagName": "span", "sid": 14 };_node18.children = [];_node18.childHash = 2915429758;_node18.attrSize = 1;_node18.attrHash = 406484528;_node18.attrs["w-class"] = "ga-tag";_$temp = _node18;{
							var _$parent22 = _$temp;var _node19 = _installText("单个金额", 850543566);;
							_$parent22.children.push(_node19);
						}_$parent21.children.push(_node18);
					}_$temp = _node17;{
						var _$parent23 = _$temp;var _node20 = { "attrs": {}, "tagName": "div", "sid": 15 };_node20.children = [];_node20.attrSize = 1;_node20.attrHash = 2495133769;_node20.attrs["w-class"] = "ga-amount-inner";_$temp = _node20;{
							var _$parent24 = _$temp;var _node21 = { "attrs": {}, "tagName": "div", "sid": 16 };_node21.children = [];_node21.attrSize = 2;_node21.attrHash = 2543736454;_node21.attrs["ev-input-change"] = "singleAmountInputChange";_node21.attrs["w-class"] = "input-father";_$temp = _node21;{
								var _$parent25 = _$temp;var _node22 = { "attrs": {}, "tagName": "app-components-input-input_simple", "sid": 17 };_node22.hasChild = false;_node22.child = null;_node22.attrHash = 0;_$temp = _node22;{
									var _$parent26 = _$temp;var _node23 = {}; //jpair pre

									{
										var _jvalue3 = "";
										_jvalue3 = "fontSize:32px;textAlign:right;";
										//jpair suf

										_node23["style"] = _jvalue3;
									}
									//jpair pre

									_node23["input"] = it1.singleAmount;
									//jpair suf
									//jpair pre

									{
										var _jvalue4 = "";
										_jvalue4 = "0";
										//jpair suf

										_node23["placeHolder"] = _jvalue4;
									}
									//jpair pre

									{
										var _jvalue5 = "";
										_jvalue5 = "[^0-9.]";
										//jpair suf

										_node23["reg"] = _jvalue5;
									}
									_addJson(_node23, _$parent26);
								}_chFunc(_node22);_$parent25.children.push(_node22);
							}_chFunc(_node21);_$parent24.children.push(_node21);
						}_$temp = _node20;{
							var _$parent27 = _$temp;var _node24 = { "attrs": {}, "tagName": "span", "sid": 18 };_node24.children = [];_node24.attrSize = 1;_node24.attrHash = 1803895593;_node24.attrs["w-class"] = "ga-currency-name";_$temp = _node24;{
								var _$parent28 = _$temp;_addText(it1.currencyName, _$parent28);
							}_chFunc(_node24);_$parent27.children.push(_node24);
						}_chFunc(_node20);_$parent23.children.push(_node20);
					}_chFunc(_node17);_$parent20.children.push(_node17);
				}
			} else {
				_$temp = _node7;{
					var _$parent29 = _$temp;var _node25 = { "attrs": {}, "tagName": "div", "sid": 19 };_node25.children = [];_node25.attrSize = 1;_node25.attrHash = 2367462560;_node25.attrs["w-class"] = "ga-item-box";_$temp = _node25;{
						var _$parent30 = _$temp;var _node26 = { "attrs": {}, "tagName": "div", "sid": 20 };_node26.children = [];_node26.childHash = 3795443808;_node26.attrSize = 1;_node26.attrHash = 2920714695;_node26.attrs["w-class"] = "ga-box";_$temp = _node26;{
							var _$parent31 = _$temp;var _node27 = { "attrs": {}, "tagName": "img", "sid": 21 };_node27.children = [];_node27.childHash = 0;_node27.attrSize = 1;_node27.attrHash = 909252181;_node27.attrs["src"] = "../../../res/image/currency/AION.png";_$parent31.children.push(_node27);
						}_$temp = _node26;{
							var _$parent32 = _$temp;var _node28 = { "attrs": {}, "tagName": "span", "sid": 22 };_node28.children = [];_node28.childHash = 3695160313;_node28.attrSize = 1;_node28.attrHash = 4053120143;_node28.attrs["w-class"] = "ga-tag ga-total-tag";_$temp = _node28;{
								var _$parent33 = _$temp;var _node29 = _installText("总金额", 3776557455);;
								_$parent33.children.push(_node29);
							}_$parent32.children.push(_node28);
						}_$parent30.children.push(_node26);
					}_$temp = _node25;{
						var _$parent34 = _$temp;var _node30 = { "attrs": {}, "tagName": "div", "sid": 23 };_node30.children = [];_node30.attrSize = 1;_node30.attrHash = 2495133769;_node30.attrs["w-class"] = "ga-amount-inner";_$temp = _node30;{
							var _$parent35 = _$temp;var _node31 = { "attrs": {}, "tagName": "div", "sid": 24 };_node31.children = [];_node31.attrSize = 2;_node31.attrHash = 2223871228;_node31.attrs["ev-input-change"] = "totalAmountInputChange";_node31.attrs["w-class"] = "input-father";_$temp = _node31;{
								var _$parent36 = _$temp;var _node32 = { "attrs": {}, "tagName": "app-components-input-input_simple", "sid": 25 };_node32.hasChild = false;_node32.child = null;_node32.attrHash = 0;_$temp = _node32;{
									var _$parent37 = _$temp;var _node33 = {}; //jpair pre

									{
										var _jvalue6 = "";
										_jvalue6 = "fontSize:32px;textAlign:right;";
										//jpair suf

										_node33["style"] = _jvalue6;
									}
									//jpair pre

									_node33["input"] = it1.totalAmount;
									//jpair suf
									//jpair pre

									{
										var _jvalue7 = "";
										_jvalue7 = "0";
										//jpair suf

										_node33["placeHolder"] = _jvalue7;
									}
									//jpair pre

									{
										var _jvalue8 = "";
										_jvalue8 = "[^0-9.]";
										//jpair suf

										_node33["reg"] = _jvalue8;
									}
									_addJson(_node33, _$parent37);
								}_chFunc(_node32);_$parent36.children.push(_node32);
							}_chFunc(_node31);_$parent35.children.push(_node31);
						}_$temp = _node30;{
							var _$parent38 = _$temp;var _node34 = { "attrs": {}, "tagName": "span", "sid": 26 };_node34.children = [];_node34.attrSize = 1;_node34.attrHash = 1803895593;_node34.attrs["w-class"] = "ga-currency-name";_$temp = _node34;{
								var _$parent39 = _$temp;_addText(it1.currencyName, _$parent39);
							}_chFunc(_node34);_$parent38.children.push(_node34);
						}_chFunc(_node30);_$parent34.children.push(_node30);
					}_chFunc(_node25);_$parent29.children.push(_node25);
				}
			}_$temp = _node7;{
				var _$parent40 = _$temp;var _node35 = { "attrs": {}, "tagName": "div", "sid": 27 };_node35.children = [];_node35.attrSize = 1;_node35.attrHash = 2367462560;_node35.attrs["w-class"] = "ga-item-box";_$temp = _node35;{
					var _$parent41 = _$temp;var _node36 = { "attrs": {}, "tagName": "span", "sid": 28 };_node36.children = [];_node36.childHash = 4126243599;_node36.attrSize = 1;_node36.attrHash = 406484528;_node36.attrs["w-class"] = "ga-tag";_$temp = _node36;{
						var _$parent42 = _$temp;var _node37 = _installText("红包个数", 3157817600);;
						_$parent42.children.push(_node37);
					}_$parent41.children.push(_node36);
				}_$temp = _node35;{
					var _$parent43 = _$temp;var _node38 = { "attrs": {}, "tagName": "div", "sid": 29 };_node38.children = [];_node38.attrSize = 1;_node38.attrHash = 2959141837;_node38.attrs["w-class"] = "ga-number-inner";_$temp = _node38;{
						var _$parent44 = _$temp;var _node39 = { "attrs": {}, "tagName": "div", "sid": 30 };_node39.children = [];_node39.attrSize = 2;_node39.attrHash = 282667617;_node39.attrs["ev-input-change"] = "redEnvelopeNumberChange";_node39.attrs["w-class"] = "input-father";_$temp = _node39;{
							var _$parent45 = _$temp;var _node40 = { "attrs": {}, "tagName": "app-components-input-input_simple", "sid": 31 };_node40.hasChild = false;_node40.child = null;_node40.attrHash = 0;_$temp = _node40;{
								var _$parent46 = _$temp;var _node41 = {}; //jpair pre

								{
									var _jvalue9 = "";
									_jvalue9 = "fontSize:32px;textAlign:right;";
									//jpair suf

									_node41["style"] = _jvalue9;
								}
								//jpair pre

								_node41["input"] = it1.redEnvelopeNumber;
								//jpair suf
								//jpair pre

								{
									var _jvalue10 = "";
									_jvalue10 = "0";
									//jpair suf

									_node41["placeHolder"] = _jvalue10;
								}
								//jpair pre

								{
									var _jvalue11 = "";
									_jvalue11 = "[^1-9]";
									//jpair suf

									_node41["reg"] = _jvalue11;
								}
								_addJson(_node41, _$parent46);
							}_chFunc(_node40);_$parent45.children.push(_node40);
						}_chFunc(_node39);_$parent44.children.push(_node39);
					}_$temp = _node38;{
						var _$parent47 = _$temp;var _node42 = { "attrs": {}, "tagName": "span", "sid": 32 };_node42.children = [];_node42.childHash = 1551329683;_node42.attrSize = 1;_node42.attrHash = 3598222852;_node42.attrs["w-class"] = "ga-number-unit";_$temp = _node42;{
							var _$parent48 = _$temp;var _node43 = _installText("个", 4203015536);;
							_$parent48.children.push(_node43);
						}_$parent47.children.push(_node42);
					}_chFunc(_node38);_$parent43.children.push(_node38);
				}_chFunc(_node35);_$parent40.children.push(_node35);
			}_$temp = _node7;{
				var _$parent49 = _$temp;var _node44 = { "attrs": {}, "tagName": "div", "sid": 33 };_node44.children = [];_node44.attrSize = 1;_node44.attrHash = 2367462560;_node44.attrs["w-class"] = "ga-item-box";_$temp = _node44;{
					var _$parent50 = _$temp;var _node45 = { "attrs": {}, "tagName": "div", "sid": 34 };_node45.children = [];_node45.attrSize = 1;_node45.attrHash = 2781560451;_node45.attrs["w-class"] = "ga-type";_$temp = _node45;{
						var _$parent51 = _$temp;var _node46 = { "attrs": {}, "tagName": "span", "sid": 35 };_node46.children = [];_node46.attrHash = 0;_$temp = _node46;{
							var _$parent52 = _$temp;_addText(it1.itype === 0 ? "每个红包金额固定，" : "每个红包金额随机，", _$parent52);
						}_chFunc(_node46);_$parent51.children.push(_node46);
					}_$temp = _node45;{
						var _$parent53 = _$temp;var _node47 = { "attrs": {}, "tagName": "span", "sid": 36 };_node47.children = [];_node47.attrSize = 2;_node47.attrHash = 71402342;_node47.attrs["w-class"] = "ga-switch";_node47.attrs["on-tap"] = "redEnvelopeTypeSwitchClick";_$temp = _node47;{
							var _$parent54 = _$temp;_addText(it1.itype === 0 ? "改为拼手气红包" : "改为普通红包", _$parent54);
						}_chFunc(_node47);_$parent53.children.push(_node47);
					}_chFunc(_node45);_$parent50.children.push(_node45);
				}_chFunc(_node44);_$parent49.children.push(_node44);
			}_$temp = _node7;{
				var _$parent55 = _$temp;var _node48 = { "attrs": {}, "tagName": "div", "sid": 37 };_node48.children = [];_node48.attrSize = 1;_node48.attrHash = 2367462560;_node48.attrs["w-class"] = "ga-item-box";_$temp = _node48;{
					var _$parent56 = _$temp;var _node49 = { "attrs": {}, "tagName": "span", "sid": 38 };_node49.children = [];_node49.childHash = 1327697979;_node49.attrSize = 1;_node49.attrHash = 406484528;_node49.attrs["w-class"] = "ga-tag";_$temp = _node49;{
						var _$parent57 = _$temp;var _node50 = _installText("留言", 1153837930);;
						_$parent57.children.push(_node50);
					}_$parent56.children.push(_node49);
				}_$temp = _node48;{
					var _$parent58 = _$temp;var _node51 = { "attrs": {}, "tagName": "div", "sid": 39 };_node51.children = [];_node51.attrSize = 2;_node51.attrHash = 2381290955;_node51.attrs["w-class"] = "ga-leave-message input-father";_node51.attrs["ev-input-change"] = "leaveMessageChange";_$temp = _node51;{
						var _$parent59 = _$temp;var _node52 = { "attrs": {}, "tagName": "app-components-input-input_simple", "sid": 40 };_node52.hasChild = false;_node52.child = null;_node52.attrHash = 0;_$temp = _node52;{
							var _$parent60 = _$temp;var _node53 = {}; //jpair pre

							_node53["placeHolder"] = it1.lmPlaceHolder;
							//jpair suf
							//jpair pre

							{
								var _jvalue12 = "";
								_jvalue12 = "fontSize:32px;textAlign:right;";
								//jpair suf

								_node53["style"] = _jvalue12;
							}
							//jpair pre

							_node53["input"] = it1.leaveMessage;
							//jpair suf
							_addJson(_node53, _$parent60);
						}_chFunc(_node52);_$parent59.children.push(_node52);
					}_chFunc(_node51);_$parent58.children.push(_node51);
				}_chFunc(_node48);_$parent55.children.push(_node48);
			}_$temp = _node7;{
				var _$parent61 = _$temp;var _node54 = { "attrs": {}, "tagName": "div", "sid": 41 };_node54.children = [];_node54.attrSize = 1;_node54.attrHash = 1301100981;_node54.attrs["w-class"] = "ga-send-amount";_$temp = _node54;{
					var _$parent62 = _$temp;_addText(it1.totalAmount || '0', _$parent62);
				}_$temp = _node54;{
					var _$parent63 = _$temp;var _node55 = _installText("&nbsp;", 1553561131);;
					_$parent63.children.push(_node55);
				}_$temp = _node54;{
					var _$parent64 = _$temp;_addText(it1.currencyName, _$parent64);
				}_chFunc(_node54);_$parent61.children.push(_node54);
			}_$temp = _node7;{
				var _$parent65 = _$temp;var _node56 = { "attrs": {}, "tagName": "div", "sid": 42 };_node56.children = [];_node56.childHash = 1047487065;_node56.attrSize = 2;_node56.attrHash = 3470514556;_node56.attrs["w-class"] = "ga-send-btn";_node56.attrs["on-tap"] = "sendRedEnvelopeClick";_$temp = _node56;{
					var _$parent66 = _$temp;var _node57 = _installText("塞钱进红包", 2710905583);;
					_$parent66.children.push(_node57);
				}_$parent65.children.push(_node56);
			}_$temp = _node7;{
				var _$parent67 = _$temp;var _node58 = { "attrs": {}, "tagName": "div", "sid": 43 };_node58.children = [];_node58.childHash = 194413569;_node58.attrSize = 1;_node58.attrHash = 2394645962;_node58.attrs["w-class"] = "ga-tips";_$temp = _node58;{
					var _$parent68 = _$temp;var _node59 = _installText("可以直接使用云账户里的货币发红包", 212209632);;
					_$parent68.children.push(_node59);
				}_$parent67.children.push(_node58);
			}_chFunc(_node7);_$parent7.children.push(_node7);
		}_chFunc(_node);return _node;
	}
});