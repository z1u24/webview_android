_$define("app/view/wallet/transaction/currency_details", function (require, exports, module){
"use strict";

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _get = function get(object, property, receiver) { if (object === null) object = Function.prototype; var desc = Object.getOwnPropertyDescriptor(object, property); if (desc === undefined) { var parent = Object.getPrototypeOf(object); if (parent === null) { return undefined; } else { return get(parent, property, receiver); } } else if ("value" in desc) { return desc.value; } else { var getter = desc.get; if (getter === undefined) { return undefined; } return getter.call(receiver); } };

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var __awaiter = undefined && undefined.__awaiter || function (thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) {
            try {
                step(generator.next(value));
            } catch (e) {
                reject(e);
            }
        }
        function rejected(value) {
            try {
                step(generator["throw"](value));
            } catch (e) {
                reject(e);
            }
        }
        function step(result) {
            result.done ? resolve(result.value) : new P(function (resolve) {
                resolve(result.value);
            }).then(fulfilled, rejected);
        }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
/**
 * 货币详情
 */
var root_1 = require("../../../../pi/ui/root");
var widget_1 = require("../../../../pi/widget/widget");
var tokens_1 = require("../../../core/eth/tokens");
var dataCenter_1 = require("../../../store/dataCenter");
var store_1 = require("../../../store/store");
var tools_1 = require("../../../utils/tools");

var AddAsset = function (_widget_1$Widget) {
    _inherits(AddAsset, _widget_1$Widget);

    function AddAsset() {
        _classCallCheck(this, AddAsset);

        var _this = _possibleConstructorReturn(this, (AddAsset.__proto__ || Object.getPrototypeOf(AddAsset)).call(this));

        _this.timerRef = 0;
        _this.registerWalletsFun = function (wallets) {
            var wallet = tools_1.getCurrentWallet(wallets);
            if (!wallet) return;
            _this.resetCurrentAddr(wallet, _this.props.currencyName);
            _this.parseBalance();
            _this.parseTransactionDetails();
            _this.paint();
        };
        _this.registerAddrsFun = function (addrs) {
            if (addrs.length === 0) return;
            _this.parseTransactionDetails();
            _this.paint();
        };
        return _this;
    }

    _createClass(AddAsset, [{
        key: "setProps",
        value: function setProps(props, oldProps) {
            _get(AddAsset.prototype.__proto__ || Object.getPrototypeOf(AddAsset.prototype), "setProps", this).call(this, props, oldProps);
            this.init();
        }
    }, {
        key: "init",
        value: function init() {
            store_1.register('wallets', this.registerWalletsFun);
            store_1.register('addrs', this.registerAddrsFun);
            var data = tools_1.currencyExchangeAvailable();
            var dataList = [];
            data.forEach(function (element) {
                dataList.push(element.symbol);
            });
            var wallets = tools_1.getLocalStorage('wallets');
            var wallet = tools_1.getCurrentWallet(wallets);
            this.state = {
                list: [],
                currentAddr: '',
                balance: 0,
                showBalance: "0 " + this.props.currencyName,
                showBalanceConversion: '≈0.00 CNY',
                canCurrencyExchange: dataList.indexOf(this.props.currencyName) >= 0
            };
            this.resetCurrentAddr(wallet, this.props.currencyName);
            this.parseBalance();
            this.parseTransactionDetails();
            // 启动定时器，每10秒更新一次记录
            this.openCheck();
        }
    }, {
        key: "attach",
        value: function attach() {
            _get(AddAsset.prototype.__proto__ || Object.getPrototypeOf(AddAsset.prototype), "attach", this).call(this);
            // this.kLineInit();
            console.log('');
        }
    }, {
        key: "destroy",
        value: function destroy() {
            store_1.unregister('wallets', this.registerWalletsFun);
            store_1.unregister('addrs', this.registerAddrsFun);
            return _get(AddAsset.prototype.__proto__ || Object.getPrototypeOf(AddAsset.prototype), "destroy", this).call(this);
        }
        /**
         * 处理关闭
         */

    }, {
        key: "doClose",
        value: function doClose() {
            if (this.timerRef) {
                clearTimeout(this.timerRef);
                this.timerRef = 0;
            }
            this.ok && this.ok();
        }
        /**
         * 处理选择地址
         */

    }, {
        key: "doSearch",
        value: function doSearch() {
            if (!this.state.currentAddr) {
                root_1.popNew('app-components-message-message', { itype: 'notice', content: '敬请期待', center: true });
                return;
            }
            root_1.popNew('app-view-wallet-transaction-choose_address', { currencyName: this.props.currencyName });
        }
        /**
         * 显示交易详情
         */

    }, {
        key: "showTransactionDetails",
        value: function showTransactionDetails(e, index) {
            root_1.popNew('app-view-wallet-transaction-transaction_details', this.state.list[index]);
        }
        /**
         * 显示简介
         */

    }, {
        key: "currencyExchangeClick",
        value: function currencyExchangeClick() {
            // console.log("onSwitchChange", e, index)
            // this.state.list[index].isChoose = e.newType;
            // // todo 这里处理数据变化
            // 这里暂时作为币币兑换的入口
            root_1.popNew('app-view-currencyExchange-currencyExchange', { currencyName: this.props.currencyName });
        }
        /**
         * 处理转账
         */

    }, {
        key: "doTransfer",
        value: function doTransfer() {
            return __awaiter(this, void 0, void 0, /*#__PURE__*/regeneratorRuntime.mark(function _callee() {
                return regeneratorRuntime.wrap(function _callee$(_context) {
                    while (1) {
                        switch (_context.prev = _context.next) {
                            case 0:
                                if (this.state.currentAddr) {
                                    _context.next = 3;
                                    break;
                                }

                                root_1.popNew('app-components-message-message', { itype: 'notice', content: '敬请期待', center: true });
                                return _context.abrupt("return");

                            case 3:
                                root_1.popNew('app-view-wallet-transaction-transfer', {
                                    currencyBalance: this.state.balance,
                                    fromAddr: this.state.currentAddr,
                                    currencyName: this.props.currencyName
                                });

                            case 4:
                            case "end":
                                return _context.stop();
                        }
                    }
                }, _callee, this);
            }));
        }
        /**
         * 处理收款
         */

    }, {
        key: "doReceipt",
        value: function doReceipt() {
            // todo 这里获取地址
            if (!this.state.currentAddr) {
                root_1.popNew('app-components-message-message', { itype: 'notice', content: '敬请期待', center: true });
                return;
            }
            root_1.popNew('app-view-wallet-transaction-receipt', {
                currencyName: this.props.currencyName,
                currencyBalance: this.state.balance,
                addr: this.state.currentAddr
            });
        }
        /**
         * 解析交易详情
         */

    }, {
        key: "parseTransactionDetails",
        value: function parseTransactionDetails() {
            var _this2 = this;

            if (!this.state.currentAddr) return;
            var list = dataCenter_1.dataCenter.getAllTransactionsByAddr(this.state.currentAddr, this.props.currencyName);
            list = list.map(function (v) {
                var pay = tools_1.effectiveCurrencyNoConversion(v.value, _this2.props.currencyName, true);
                // tslint:disable-next-line:max-line-length
                var fees = tools_1.effectiveCurrencyNoConversion(v.fees, tokens_1.ERC20Tokens[_this2.props.currencyName] ? 'ETH' : _this2.props.currencyName, true);
                var isFromMe = v.from.toLowerCase() === _this2.state.currentAddr.toLowerCase();
                var isToMe = v.to.toLowerCase() === _this2.state.currentAddr.toLowerCase();
                return {
                    id: v.hash,
                    type: isFromMe ? isToMe ? '自己' : '转账' : '收款',
                    fromAddr: v.from,
                    to: v.to,
                    pay: pay.num,
                    tip: fees.show,
                    time: v.time,
                    showTime: tools_1.parseDate(new Date(v.time)),
                    result: '已完成',
                    info: v.info,
                    account: tools_1.parseAccount(isFromMe ? isToMe ? v.from : v.to : v.from).toLowerCase(),
                    showPay: pay.show,
                    currencyName: _this2.props.currencyName
                };
            });
            var addr = tools_1.getAddrById(this.state.currentAddr, this.props.currencyName);
            var recordList = [];
            if (addr) {
                recordList = addr.record.map(function (v) {
                    var pay = tools_1.effectiveCurrencyNoConversion(v.pay, _this2.props.currencyName, false);
                    v.account = tools_1.parseAccount(v.to).toLowerCase();
                    v.showPay = pay.show;
                    return v;
                });
            }
            this.state.list = list.concat(recordList).sort(function (a, b) {
                return b.time - a.time;
            });
        }
        /**
         * 解析余额
         */

    }, {
        key: "parseBalance",
        value: function parseBalance() {
            if (!this.state.currentAddr) return;
            var info = dataCenter_1.dataCenter.getAddrInfoByAddr(this.state.currentAddr, this.props.currencyName);
            // console.log('parseBalance',info);
            var r = tools_1.effectiveCurrency(info.balance, this.props.currencyName, 'CNY', false);
            this.state.balance = r.num;
            this.state.showBalance = r.show;
            this.state.showBalanceConversion = r.conversionShow;
        }
        // tslint:disable-next-line:max-func-body-length

    }, {
        key: "kLineInit",
        value: function kLineInit() {
            var upColor = '#ec0000';
            var upBorderColor = '#8A0000';
            var downColor = '#00da3c';
            var downBorderColor = '#008F28';
            var splitData = function splitData(rawData) {
                var categoryData = [];
                var values = [];
                for (var i = 0; i < rawData.length; i++) {
                    categoryData.push(rawData[i].splice(0, 1)[0]);
                    values.push(rawData[i]);
                }
                return {
                    categoryData: categoryData,
                    values: values
                };
            };
            var calculateMA = function calculateMA(dayCount) {
                var result = [];
                for (var i = 0, len = data0.values.length; i < len; i++) {
                    if (i < dayCount) {
                        result.push('-');
                        continue;
                    }
                    var sum = 0;
                    for (var j = 0; j < dayCount; j++) {
                        sum += data0.values[i - j][1];
                    }
                    result.push(sum / dayCount);
                }
                return result;
            };
            // 数据意义：开盘(open)，收盘(close)，最低(lowest)，最高(highest)
            var data0 = splitData([['2013/1/24', 2320.26, 2320.26, 2287.3, 2362.94], ['2013/1/25', 2300, 2291.3, 2288.26, 2308.38], ['2013/1/28', 2295.35, 2346.5, 2295.35, 2346.92], ['2013/1/29', 2347.22, 2358.98, 2337.35, 2363.8], ['2013/1/30', 2360.75, 2382.48, 2347.89, 2383.76], ['2013/1/31', 2383.43, 2385.42, 2371.23, 2391.82], ['2013/2/1', 2377.41, 2419.02, 2369.57, 2421.15], ['2013/2/4', 2425.92, 2428.15, 2417.58, 2440.38], ['2013/2/5', 2411, 2433.13, 2403.3, 2437.42], ['2013/2/6', 2432.68, 2434.48, 2427.7, 2441.73], ['2013/2/7', 2430.69, 2418.53, 2394.22, 2433.89], ['2013/2/8', 2416.62, 2432.4, 2414.4, 2443.03], ['2013/2/18', 2441.91, 2421.56, 2415.43, 2444.8], ['2013/2/19', 2420.26, 2382.91, 2373.53, 2427.07], ['2013/2/20', 2383.49, 2397.18, 2370.61, 2397.94], ['2013/2/21', 2378.82, 2325.95, 2309.17, 2378.82], ['2013/2/22', 2322.94, 2314.16, 2308.76, 2330.88], ['2013/2/25', 2320.62, 2325.82, 2315.01, 2338.78], ['2013/2/26', 2313.74, 2293.34, 2289.89, 2340.71], ['2013/2/27', 2297.77, 2313.22, 2292.03, 2324.63], ['2013/2/28', 2322.32, 2365.59, 2308.92, 2366.16], ['2013/3/1', 2364.54, 2359.51, 2330.86, 2369.65], ['2013/3/4', 2332.08, 2273.4, 2259.25, 2333.54], ['2013/3/5', 2274.81, 2326.31, 2270.1, 2328.14], ['2013/3/6', 2333.61, 2347.18, 2321.6, 2351.44], ['2013/3/7', 2340.44, 2324.29, 2304.27, 2352.02], ['2013/3/8', 2326.42, 2318.61, 2314.59, 2333.67], ['2013/3/11', 2314.68, 2310.59, 2296.58, 2320.96], ['2013/3/12', 2309.16, 2286.6, 2264.83, 2333.29], ['2013/3/13', 2282.17, 2263.97, 2253.25, 2286.33], ['2013/3/14', 2255.77, 2270.28, 2253.31, 2276.22], ['2013/3/15', 2269.31, 2278.4, 2250, 2312.08], ['2013/3/18', 2267.29, 2240.02, 2239.21, 2276.05], ['2013/3/19', 2244.26, 2257.43, 2232.02, 2261.31], ['2013/3/20', 2257.74, 2317.37, 2257.42, 2317.86], ['2013/3/21', 2318.21, 2324.24, 2311.6, 2330.81], ['2013/3/22', 2321.4, 2328.28, 2314.97, 2332], ['2013/3/25', 2334.74, 2326.72, 2319.91, 2344.89], ['2013/3/26', 2318.58, 2297.67, 2281.12, 2319.99], ['2013/3/27', 2299.38, 2301.26, 2289, 2323.48], ['2013/3/28', 2273.55, 2236.3, 2232.91, 2273.55], ['2013/3/29', 2238.49, 2236.62, 2228.81, 2246.87], ['2013/4/1', 2229.46, 2234.4, 2227.31, 2243.95], ['2013/4/2', 2234.9, 2227.74, 2220.44, 2253.42], ['2013/4/3', 2232.69, 2225.29, 2217.25, 2241.34], ['2013/4/8', 2196.24, 2211.59, 2180.67, 2212.59], ['2013/4/9', 2215.47, 2225.77, 2215.47, 2234.73], ['2013/4/10', 2224.93, 2226.13, 2212.56, 2233.04], ['2013/4/11', 2236.98, 2219.55, 2217.26, 2242.48], ['2013/4/12', 2218.09, 2206.78, 2204.44, 2226.26], ['2013/4/15', 2199.91, 2181.94, 2177.39, 2204.99], ['2013/4/16', 2169.63, 2194.85, 2165.78, 2196.43], ['2013/4/17', 2195.03, 2193.8, 2178.47, 2197.51], ['2013/4/18', 2181.82, 2197.6, 2175.44, 2206.03], ['2013/4/19', 2201.12, 2244.64, 2200.58, 2250.11], ['2013/4/22', 2236.4, 2242.17, 2232.26, 2245.12], ['2013/4/23', 2242.62, 2184.54, 2182.81, 2242.62], ['2013/4/24', 2187.35, 2218.32, 2184.11, 2226.12], ['2013/4/25', 2213.19, 2199.31, 2191.85, 2224.63], ['2013/4/26', 2203.89, 2177.91, 2173.86, 2210.58], ['2013/5/2', 2170.78, 2174.12, 2161.14, 2179.65], ['2013/5/3', 2179.05, 2205.5, 2179.05, 2222.81], ['2013/5/6', 2212.5, 2231.17, 2212.5, 2236.07], ['2013/5/7', 2227.86, 2235.57, 2219.44, 2240.26], ['2013/5/8', 2242.39, 2246.3, 2235.42, 2255.21], ['2013/5/9', 2246.96, 2232.97, 2221.38, 2247.86], ['2013/5/10', 2228.82, 2246.83, 2225.81, 2247.67], ['2013/5/13', 2247.68, 2241.92, 2231.36, 2250.85], ['2013/5/14', 2238.9, 2217.01, 2205.87, 2239.93], ['2013/5/15', 2217.09, 2224.8, 2213.58, 2225.19], ['2013/5/16', 2221.34, 2251.81, 2210.77, 2252.87], ['2013/5/17', 2249.81, 2282.87, 2248.41, 2288.09], ['2013/5/20', 2286.33, 2299.99, 2281.9, 2309.39], ['2013/5/21', 2297.11, 2305.11, 2290.12, 2305.3], ['2013/5/22', 2303.75, 2302.4, 2292.43, 2314.18], ['2013/5/23', 2293.81, 2275.67, 2274.1, 2304.95], ['2013/5/24', 2281.45, 2288.53, 2270.25, 2292.59], ['2013/5/27', 2286.66, 2293.08, 2283.94, 2301.7], ['2013/5/28', 2293.4, 2321.32, 2281.47, 2322.1], ['2013/5/29', 2323.54, 2324.02, 2321.17, 2334.33], ['2013/5/30', 2316.25, 2317.75, 2310.49, 2325.72], ['2013/5/31', 2320.74, 2300.59, 2299.37, 2325.53], ['2013/6/3', 2300.21, 2299.25, 2294.11, 2313.43], ['2013/6/4', 2297.1, 2272.42, 2264.76, 2297.1], ['2013/6/5', 2270.71, 2270.93, 2260.87, 2276.86], ['2013/6/6', 2264.43, 2242.11, 2240.07, 2266.69], ['2013/6/7', 2242.26, 2210.9, 2205.07, 2250.63], ['2013/6/13', 2190.1, 2148.35, 2126.22, 2190.1]]);
            var option = {
                title: {
                    text: '上证指数',
                    left: 0
                },
                tooltip: {
                    trigger: 'axis',
                    axisPointer: {
                        type: 'cross'
                    }
                },
                legend: {
                    data: ['日K', 'MA5', 'MA10', 'MA20', 'MA30']
                },
                grid: {
                    left: '10%',
                    right: '10%',
                    bottom: '15%'
                },
                xAxis: {
                    type: 'category',
                    data: data0.categoryData,
                    scale: true,
                    boundaryGap: false,
                    axisLine: { onZero: false },
                    splitLine: { show: false },
                    splitNumber: 20,
                    min: 'dataMin',
                    max: 'dataMax'
                },
                yAxis: {
                    scale: true,
                    splitArea: {
                        show: true
                    }
                },
                dataZoom: [{
                    type: 'inside',
                    start: 50,
                    end: 100
                }, {
                    show: true,
                    type: 'slider',
                    y: '90%',
                    start: 50,
                    end: 100
                }],
                series: [{
                    name: '日K',
                    type: 'candlestick',
                    data: data0.values,
                    itemStyle: {
                        normal: {
                            color: upColor,
                            color0: downColor,
                            borderColor: upBorderColor,
                            borderColor0: downBorderColor
                        }
                    },
                    markPoint: {
                        label: {
                            normal: {
                                formatter: function formatter(param) {
                                    return param !== null ? Math.round(param.value) : '';
                                }
                            }
                        },
                        data: [{
                            name: 'XX标点',
                            coord: ['2013/5/31', 2300],
                            value: 2300,
                            itemStyle: {
                                normal: { color: 'rgb(41,60,85)' }
                            }
                        }, {
                            name: 'highest value',
                            type: 'max',
                            valueDim: 'highest'
                        }, {
                            name: 'lowest value',
                            type: 'min',
                            valueDim: 'lowest'
                        }, {
                            name: 'average value on close',
                            type: 'average',
                            valueDim: 'close'
                        }],
                        tooltip: {
                            formatter: function formatter(param) {
                                // tslint:disable-next-line:prefer-template
                                return param.name + '<br>' + (param.data.coord || '');
                            }
                        }
                    },
                    markLine: {
                        symbol: ['none', 'none'],
                        data: [[{
                            name: 'from lowest to highest',
                            type: 'min',
                            valueDim: 'lowest',
                            symbol: 'circle',
                            symbolSize: 10,
                            label: {
                                normal: { show: false },
                                emphasis: { show: false }
                            }
                        }, {
                            type: 'max',
                            valueDim: 'highest',
                            symbol: 'circle',
                            symbolSize: 10,
                            label: {
                                normal: { show: false },
                                emphasis: { show: false }
                            }
                        }], {
                            name: 'min line on close',
                            type: 'min',
                            valueDim: 'close'
                        }, {
                            name: 'max line on close',
                            type: 'max',
                            valueDim: 'close'
                        }]
                    }
                }, {
                    name: 'MA5',
                    type: 'line',
                    data: calculateMA(5),
                    smooth: true,
                    lineStyle: {
                        normal: { opacity: 0.5 }
                    }
                }, {
                    name: 'MA10',
                    type: 'line',
                    data: calculateMA(10),
                    smooth: true,
                    lineStyle: {
                        normal: { opacity: 0.5 }
                    }
                }, {
                    name: 'MA20',
                    type: 'line',
                    data: calculateMA(20),
                    smooth: true,
                    lineStyle: {
                        normal: { opacity: 0.5 }
                    }
                }, {
                    name: 'MA30',
                    type: 'line',
                    data: calculateMA(30),
                    smooth: true,
                    lineStyle: {
                        normal: { opacity: 0.5 }
                    }
                }]
            };
            //  // 基于准备好的dom，初始化echarts实例
            // const myChart = echarts.init(document.getElementById('k-line'));
            // // 使用刚指定的配置项和数据显示图表。
            // myChart.setOption(option);
        }
    }, {
        key: "resetCurrentAddr",
        value: function resetCurrentAddr(wallet, currencyName) {
            if (!wallet.currencyRecords || !currencyName) return [];
            var currencyRecord = wallet.currencyRecords.filter(function (v) {
                return v.currencyName === currencyName;
            })[0];
            if (!currencyRecord) return [];
            this.state.currentAddr = currencyRecord.currentAddr || wallet.walletId;
        }
    }, {
        key: "openCheck",
        value: function openCheck() {
            var _this3 = this;

            this.timerRef = setTimeout(function () {
                _this3.timerRef = 0;
                _this3.openCheck();
            }, 10 * 1000);
            this.parseTransactionDetails();
            this.parseBalance();
            this.paint();
            dataCenter_1.dataCenter.updatetTransaction(this.state.currentAddr, this.props.currencyName);
        }
    }]);

    return AddAsset;
}(widget_1.Widget);

exports.AddAsset = AddAsset;
})