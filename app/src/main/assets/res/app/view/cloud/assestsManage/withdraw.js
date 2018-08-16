_$define("app/view/cloud/assestsManage/withdraw", function (require, exports, module){
"use strict";

var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

var _get = function get(object, property, receiver) { if (object === null) object = Function.prototype; var desc = Object.getOwnPropertyDescriptor(object, property); if (desc === undefined) { var parent = Object.getPrototypeOf(object); if (parent === null) { return undefined; } else { return get(parent, property, receiver); } } else if ("value" in desc) { return desc.value; } else { var getter = desc.get; if (getter === undefined) { return undefined; } return getter.call(receiver); } };

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

Object.defineProperty(exports, "__esModule", { value: true });
/**
 * 提现界面
 */
var widget_1 = require("../../../../pi/widget/widget");

var Withdraw = function (_widget_1$Widget) {
    _inherits(Withdraw, _widget_1$Widget);

    function Withdraw() {
        _classCallCheck(this, Withdraw);

        return _possibleConstructorReturn(this, (Withdraw.__proto__ || Object.getPrototypeOf(Withdraw)).call(this));
    }

    _createClass(Withdraw, [{
        key: "create",
        value: function create() {
            _get(Withdraw.prototype.__proto__ || Object.getPrototypeOf(Withdraw.prototype), "create", this).call(this);
            this.init();
        }
    }, {
        key: "init",
        value: function init() {
            this.state = {
                amount: 0,
                serviceCharge: 0.001,
                cloudBalance: 0.00,
                isFeeEnough: true
            };
            this.judgeFeeEnough();
        }
    }, {
        key: "backClick",
        value: function backClick() {
            this.ok && this.ok();
        }
    }, {
        key: "amountInput",
        value: function amountInput(e) {
            this.state.amount = Number(e.currentTarget.value);
            this.judgeFeeEnough();
            this.paint();
        }
    }, {
        key: "serviceChargeInput",
        value: function serviceChargeInput(e) {
            this.state.serviceCharge = Number(e.currentTarget.value);
            this.judgeFeeEnough();
            this.paint();
        }
    }, {
        key: "judgeFeeEnough",
        value: function judgeFeeEnough() {
            var amount = this.state.amount;
            var serviceCharge = this.state.serviceCharge;
            var cloudBalance = this.state.cloudBalance;
            if (amount + serviceCharge > cloudBalance || cloudBalance === 0 || serviceCharge === cloudBalance) {
                this.state.isFeeEnough = false;
            } else {
                this.state.isFeeEnough = true;
            }
        }
    }]);

    return Withdraw;
}(widget_1.Widget);

exports.Withdraw = Withdraw;
})