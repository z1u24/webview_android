(function (_cfg, it, it1) {
  var _$temp = void 0,
      node = void 0;_$temp = node;{
    var _$parent = _$temp;var _node = { "attrs": {}, "tagName": "div", "sid": 0 };_node.children = [];_node.attrSize = 2;_node.attrHash = 1336491880;{
      var attrvalue = "";attrvalue += "ga-top-banner ";attrvalue += it.titlePosition === 'left' ? 'ga-title-left' : '';attrvalue += "";_node.attrs["w-class"] = attrvalue;
    }_node.attrHash = _hash.nextHash(_node.attrHash, _calTextHash(_node.attrs["w-class"]));{
      var _attrvalue = "";_attrvalue += it.style ? it.style : '';_attrvalue += "";_node.attrs["style"] = _attrvalue;
    }_node.attrHash = _hash.nextHash(_node.attrHash, _calTextHash(_node.attrs["style"]));_$temp = _node;{
      var _$parent2 = _$temp;var _node2 = { "attrs": {}, "tagName": "div", "sid": 1 };_node2.children = [];_node2.attrSize = 2;_node2.attrHash = 2778469753;_node2.attrs["on-tap"] = "backPrePage";_node2.attrs["w-class"] = "ga-back-container";_$temp = _node2;{
        var _$parent3 = _$temp;var _node3 = { "attrs": {}, "tagName": "img", "sid": 2 };_node3.children = [];_node3.attrSize = 2;_node3.attrHash = 3797255077;{
          var _attrvalue2 = "";_attrvalue2 += "../../res/image/";_attrvalue2 += it.iconColor ? it1.backIcon[it.iconColor] : it1.backIcon['default'];_attrvalue2 += "";_node3.attrs["src"] = _attrvalue2;
        }_node3.attrHash = _hash.nextHash(_node3.attrHash, _calTextHash(_node3.attrs["src"]));_node3.attrs["w-class"] = "ga-back";_chFunc(_node3);_$parent3.children.push(_node3);
      }_chFunc(_node2);_$parent2.children.push(_node2);
    }_$temp = _node;{
      var _$parent4 = _$temp;var _node4 = { "attrs": {}, "tagName": "span", "sid": 3 };_node4.children = [];_node4.attrSize = 2;_node4.attrHash = 4098047378;_node4.attrs["on-tap"] = "backPrePage";_node4.attrs["w-class"] = "ga-banner-title";_$temp = _node4;{
        var _$parent5 = _$temp;_addText(it.title, _$parent5);
      }_chFunc(_node4);_$parent4.children.push(_node4);
    }_chFunc(_node);return _node;
  }
});