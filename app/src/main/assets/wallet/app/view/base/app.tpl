(function (_cfg, it, it1) {
	var _$temp = void 0,
	    node = void 0;_$temp = node;{
		var _$parent = _$temp;var _node = { "attrs": {}, "tagName": "div", "sid": 0 };_node.children = [];_node.attrSize = 1;_node.attrHash = 263893721;_node.attrs["style"] = "width:100%;height:100%";_$temp = _node;{
			var _$parent2 = _$temp;var _node2 = { "attrs": {}, "tagName": "div", "sid": 1 };_node2.children = [];_node2.attrSize = 1;_node2.attrHash = 904429599;_node2.attrs["w-class"] = "tabs";if (it1.type === 0) {
				{
					var _$i = 0;
					for (var _iterator = it1.tabBarList, _isArray = Array.isArray(_iterator), _i = 0, _iterator = _isArray ? _iterator : _iterator[Symbol.iterator]();;) {
						var _ref;

						if (_isArray) {
							if (_i >= _iterator.length) break;
							_ref = _iterator[_i++];
						} else {
							_i = _iterator.next();
							if (_i.done) break;
							_ref = _i.value;
						}

						var v = _ref;
						var i = _$i++;if (i == it1.isActive) {
							_$temp = _node2;{
								var _$parent3 = _$temp;var _node3 = { "attrs": {}, "tagName": "widget", "sid": 2 };_node3.hasChild = false;_node3.child = null;_node3.attrSize = 1;_node3.attrHash = 264436563;{
									var attrvalue = "";attrvalue = v.components;_node3.attrs["w-tag"] = attrvalue;
								}_node3.attrHash = _hash.nextHash(_node3.attrHash, _calTextHash(_node3.attrs["w-tag"]));_node3.tagName = _node3.attrs["w-tag"];_node3.attrs["style"] = "visibility:visible;z-index:0;position:absolute;width:100%;height:100%;";_$temp = _node3;{
									var _$parent4 = _$temp;var _node4 = {}; //jpair pre

									_node4["isActive"] = i == it1.isActive;
									//jpair suf
									_addJson(_node4, _$parent4);
								}_chFunc(_node3);_$parent3.children.push(_node3);
							}
						} else if (it1.old[i]) {
							_$temp = _node2;{
								var _$parent5 = _$temp;var _node5 = { "attrs": {}, "tagName": "widget", "sid": 3 };_node5.hasChild = false;_node5.child = null;_node5.attrSize = 1;_node5.attrHash = 2140759890;{
									var _attrvalue = "";_attrvalue = v.components;_node5.attrs["w-tag"] = _attrvalue;
								}_node5.attrHash = _hash.nextHash(_node5.attrHash, _calTextHash(_node5.attrs["w-tag"]));_node5.tagName = _node5.attrs["w-tag"];_node5.attrs["style"] = "visibility:hidden;z-index:-1;position: absolute;width:100%;height:100%;";_$temp = _node5;{
									var _$parent6 = _$temp;var _node6 = {}; //jpair pre

									_node6["isActive"] = i == it1.isActive;
									//jpair suf
									_addJson(_node6, _$parent6);
								}_chFunc(_node5);_$parent5.children.push(_node5);
							}
						}
					}
				}
			} else if (it1.type === 1) {
				_$temp = _node2;{
					var _$parent7 = _$temp;var _node7 = { "attrs": {}, "tagName": "widget", "sid": 4 };_node7.hasChild = false;_node7.child = null;_node7.attrSize = 1;_node7.attrHash = 3518817415;{
						var _attrvalue2 = "";_attrvalue2 = it1.tabBarList[it1.isActive].components;_node7.attrs["w-tag"] = _attrvalue2;
					}_node7.attrHash = _hash.nextHash(_node7.attrHash, _calTextHash(_node7.attrs["w-tag"]));_node7.tagName = _node7.attrs["w-tag"];_node7.attrs["style"] = "position:absolute;width:100%;height:100%;";_$temp = _node7;{
						var _$parent8 = _$temp;var _node8 = {}; //jpair pre

						_node8["isActive"] = false;
						//jpair suf
						_addJson(_node8, _$parent8);
					}_chFunc(_node7);_$parent7.children.push(_node7);
				}
			} else {
				{
					var _$i2 = 0;
					for (var _iterator2 = it1.tabBarList, _isArray2 = Array.isArray(_iterator2), _i2 = 0, _iterator2 = _isArray2 ? _iterator2 : _iterator2[Symbol.iterator]();;) {
						var _ref2;

						if (_isArray2) {
							if (_i2 >= _iterator2.length) break;
							_ref2 = _iterator2[_i2++];
						} else {
							_i2 = _iterator2.next();
							if (_i2.done) break;
							_ref2 = _i2.value;
						}

						var _v = _ref2;
						var _i3 = _$i2++;if (_v.name !== 'chat') {
							_$temp = _node2;{
								var _$parent9 = _$temp;var _node9 = { "attrs": {}, "tagName": "widget", "sid": 5 };_node9.hasChild = false;_node9.child = null;_node9.attrSize = 1;_node9.attrHash = 3770069693;{
									var _attrvalue3 = "";_attrvalue3 = _v.components;_node9.attrs["w-tag"] = _attrvalue3;
								}_node9.attrHash = _hash.nextHash(_node9.attrHash, _calTextHash(_node9.attrs["w-tag"]));_node9.tagName = _node9.attrs["w-tag"];{
									var _attrvalue4 = "";_attrvalue4 += "visibility: ";_attrvalue4 += _i3 == it1.isActive ? 'visible' : 'hidden';_attrvalue4 += "; z-index:";_attrvalue4 += _i3 == it1.isActive ? 0 : -1;_attrvalue4 += "; position:absolute; width:100%;height:100%;";_node9.attrs["style"] = _attrvalue4;
								}_node9.attrHash = _hash.nextHash(_node9.attrHash, _calTextHash(_node9.attrs["style"]));_$temp = _node9;{
									var _$parent10 = _$temp;var _node10 = {}; //jpair pre

									_node10["isActive"] = _i3 == it1.isActive;
									//jpair suf
									_addJson(_node10, _$parent10);
								}_chFunc(_node9);_$parent9.children.push(_node9);
							}
						}
					}
				}
			}_chFunc(_node2);_$parent2.children.push(_node2);
		}_$temp = _node;{
			var _$parent11 = _$temp;var _node11 = { "attrs": {}, "tagName": "div", "sid": 6 };_node11.children = [];_node11.attrSize = 1;_node11.attrHash = 2762162298;_node11.attrs["w-class"] = "ga-bottom-tab-bar-container";{
				var _$i3 = 0;
				for (var _iterator3 = it1.tabBarList, _isArray3 = Array.isArray(_iterator3), _i4 = 0, _iterator3 = _isArray3 ? _iterator3 : _iterator3[Symbol.iterator]();;) {
					var _ref3;

					if (_isArray3) {
						if (_i4 >= _iterator3.length) break;
						_ref3 = _iterator3[_i4++];
					} else {
						_i4 = _iterator3.next();
						if (_i4.done) break;
						_ref3 = _i4.value;
					}

					var item = _ref3;
					var index = _$i3++;_$temp = _node11;{
						var _$parent12 = _$temp;var _node12 = { "attrs": {}, "tagName": "div", "sid": 7 };_node12.children = [];_node12.attrSize = 2;_node12.attrHash = 848835576;{
							var _attrvalue5 = "";_attrvalue5 += "ga-tab-bar-item ";_attrvalue5 += it1.isActive == index ? 'ga-tab-bar-item-active' : '';_attrvalue5 += "";_node12.attrs["w-class"] = _attrvalue5;
						}_node12.attrHash = _hash.nextHash(_node12.attrHash, _calTextHash(_node12.attrs["w-class"]));{
							var _attrvalue6 = "";_attrvalue6 += "tabBarChangeListener(e,";_attrvalue6 += index;_attrvalue6 += ")";_node12.attrs["on-down"] = _attrvalue6;
						}_node12.attrHash = _hash.nextHash(_node12.attrHash, _calTextHash(_node12.attrs["on-down"]));_$temp = _node12;{
							var _$parent13 = _$temp;var _node13 = { "attrs": {}, "tagName": "img", "sid": 8 };_node13.children = [];_node13.attrSize = 2;_node13.attrHash = 549034932;{
								var _attrvalue7 = "";_attrvalue7 += "../../res/image/";_attrvalue7 += it1.isActive == index ? item.iconActive : item.icon;_attrvalue7 += "";_node13.attrs["src"] = _attrvalue7;
							}_node13.attrHash = _hash.nextHash(_node13.attrHash, _calTextHash(_node13.attrs["src"]));{
								var _attrvalue8 = "";_attrvalue8 += "ga-tab-bar-icon ";_attrvalue8 += index === 2 ? 'iconCenter' : '';_attrvalue8 += "";_node13.attrs["w-class"] = _attrvalue8;
							}_node13.attrHash = _hash.nextHash(_node13.attrHash, _calTextHash(_node13.attrs["w-class"]));_chFunc(_node13);_$parent13.children.push(_node13);
						}_$temp = _node12;{
							var _$parent14 = _$temp;var _node14 = { "attrs": {}, "tagName": "span", "sid": 9 };_node14.children = [];_node14.attrSize = 1;_node14.attrHash = 1456402504;_node14.attrs["w-class"] = "ga-tab-bar-text";_$temp = _node14;{
								var _$parent15 = _$temp;_addText(item.text, _$parent15);
							}_chFunc(_node14);_$parent14.children.push(_node14);
						}_chFunc(_node12);_$parent12.children.push(_node12);
					}
				}
			}_chFunc(_node11);_$parent11.children.push(_node11);
		}_chFunc(_node);return _node;
	}
});