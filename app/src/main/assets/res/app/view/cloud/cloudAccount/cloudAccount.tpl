(function (_cfg, it, it1) {
	var _$temp = void 0,
	    node = void 0;_$temp = node;{
		var _$parent = _$temp;var _node = { "attrs": {}, "tagName": "div", "sid": 0 };_node.children = [];_node.attrSize = 3;_node.attrHash = 3608432725;_node.attrs["w-class"] = "account";_node.attrs["class"] = "ga-new-page";_node.attrs["ev-back-click"] = "backClick";_$temp = _node;{
			var _$parent2 = _$temp;var _node2 = { "attrs": {}, "tagName": "app-components-topBar-topBar", "sid": 1 };_node2.hasChild = false;_node2.child = null;_node2.childHash = 2244542897;_node2.attrHash = 0;_$temp = _node2;{
				var _$parent3 = _$temp;var _node3 = {}; //jpair pre

				{
					var jvalue = "";
					jvalue = "云账户";
					//jpair suf

					_node3["title"] = jvalue;
				}
				_addJson(_node3, _$parent3);
			}_$parent2.children.push(_node2);
		}_$temp = _node;{
			var _$parent4 = _$temp;var _node4 = { "attrs": {}, "tagName": "div", "sid": 2 };_node4.children = [];_node4.attrSize = 1;_node4.attrHash = 3507715450;_node4.attrs["w-class"] = "accountInfo";_$temp = _node4;{
				var _$parent5 = _$temp;var _node5 = { "attrs": {}, "tagName": "img", "sid": 3 };_node5.children = [];_node5.attrSize = 2;_node5.attrHash = 3826644838;{
					var attrvalue = "";attrvalue += "../../../res/image/";attrvalue += it1.accoutHeadImg;attrvalue += "";_node5.attrs["src"] = attrvalue;
				}_node5.attrHash = _hash.nextHash(_node5.attrHash, _calTextHash(_node5.attrs["src"]));_node5.attrs["w-class"] = "headImg";_chFunc(_node5);_$parent5.children.push(_node5);
			}_$temp = _node4;{
				var _$parent6 = _$temp;_addText(it1.accoutNickName, _$parent6);
			}_chFunc(_node4);_$parent4.children.push(_node4);
		}_$temp = _node;{
			var _$parent7 = _$temp;var _node6 = { "attrs": {}, "tagName": "div", "sid": 4 };_node6.children = [];_node6.attrSize = 1;_node6.attrHash = 3366723212;_node6.attrs["w-class"] = "balanceDetail";_$temp = _node6;{
				var _$parent8 = _$temp;var _node7 = { "attrs": {}, "tagName": "div", "sid": 5 };_node7.children = [];_node7.attrSize = 1;_node7.attrHash = 2187270484;_node7.attrs["w-class"] = "overView";_$temp = _node7;{
					var _$parent9 = _$temp;var _node8 = _installText("账户资产", 3209357994);;
					_$parent9.children.push(_node8);
				}_$temp = _node7;{
					var _$parent10 = _$temp;var _node9 = { "attrs": {}, "tagName": "span", "sid": 6 };_node9.children = [];_node9.attrSize = 1;_node9.attrHash = 1349797565;_node9.attrs["w-class"] = "balance";_$temp = _node9;{
						var _$parent11 = _$temp;_addText(it1.accountAssets, _$parent11);
					}_chFunc(_node9);_$parent10.children.push(_node9);
				}_chFunc(_node7);_$parent8.children.push(_node7);
			}{
				var _$i = 0;
				for (var _iterator = it1.coinList, _isArray = Array.isArray(_iterator), _i = 0, _iterator = _isArray ? _iterator : _iterator[Symbol.iterator]();;) {
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
					var i = _$i++;_$temp = _node6;{
						var _$parent12 = _$temp;var _node10 = { "attrs": {}, "tagName": "div", "sid": 7 };_node10.children = [];_node10.attrSize = 2;_node10.attrHash = 2223718299;_node10.attrs["w-class"] = "item";{
							var _attrvalue = "";_attrvalue += "itemClicked(e,'";_attrvalue += v.coinType;_attrvalue += "')";_node10.attrs["on-tap"] = _attrvalue;
						}_node10.attrHash = _hash.nextHash(_node10.attrHash, _calTextHash(_node10.attrs["on-tap"]));_$temp = _node10;{
							var _$parent13 = _$temp;var _node11 = { "attrs": {}, "tagName": "img", "sid": 8 };_node11.children = [];_node11.attrSize = 2;_node11.attrHash = 1984673181;{
								var _attrvalue2 = "";_attrvalue2 += "../../../res/image/currency/";_attrvalue2 += v.coinType;_attrvalue2 += ".png";_node11.attrs["src"] = _attrvalue2;
							}_node11.attrHash = _hash.nextHash(_node11.attrHash, _calTextHash(_node11.attrs["src"]));_node11.attrs["w-class"] = "coinIcon";_chFunc(_node11);_$parent13.children.push(_node11);
						}_$temp = _node10;{
							var _$parent14 = _$temp;var _node12 = { "attrs": {}, "tagName": "span", "sid": 9 };_node12.children = [];_node12.attrSize = 1;_node12.attrHash = 4281788275;_node12.attrs["w-class"] = "coinType";_$temp = _node12;{
								var _$parent15 = _$temp;_addText(v.coinType, _$parent15);
							}_chFunc(_node12);_$parent14.children.push(_node12);
						}_$temp = _node10;{
							var _$parent16 = _$temp;var _node13 = { "attrs": {}, "tagName": "span", "sid": 10 };_node13.children = [];_node13.attrSize = 1;_node13.attrHash = 3029102199;_node13.attrs["w-class"] = "coinBalance";_$temp = _node13;{
								var _$parent17 = _$temp;_addText(v.coinBalance, _$parent17);
							}_chFunc(_node13);_$parent16.children.push(_node13);
						}_$temp = _node10;{
							var _$parent18 = _$temp;var _node14 = { "attrs": {}, "tagName": "img", "sid": 11 };_node14.children = [];_node14.childHash = 0;_node14.attrSize = 2;_node14.attrHash = 3725440045;_node14.attrs["src"] = "../../../res/image/cloud_arow_right.png";_node14.attrs["w-class"] = "arow";_$parent18.children.push(_node14);
						}_chFunc(_node10);_$parent12.children.push(_node10);
					}
				}
			}_chFunc(_node6);_$parent7.children.push(_node6);
		}_chFunc(_node);return _node;
	}
});