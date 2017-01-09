
var wpStatistic = {
    _atk: "",
    _ip: "",
    _checkLocation: false,
    _checkInformation: false,
    Utils: {
        browserWho: function () {
            var ua = navigator.userAgent, tem,
             M = ua.match(/(opera|chrome|safari|firefox|msie|trident(?=\/))\/?\s*(\d+)/i) || [];
            if (/trident/i.test(M[1])) {
                tem = /\brv[ :]+(\d+)/g.exec(ua) || [];
                return 'IE ' + (tem[1] || '');
            }
            if (M[1] === 'Chrome') {
                tem = ua.match(/\bOPR\/(\d+)/)
                if (tem != null) return 'Opera ' + tem[1];
            }
            M = M[2] ? [M[1], M[2]] : [navigator.appName, navigator.appVersion, '-?'];
            if ((tem = ua.match(/version\//)) != null) M.splice(1, 1, tem[1]);
            return M.join(' ');
        },
        find_os: function () {
            var OSName = "Can't find OS name";
            //The below few line of code will find the OS name 
            if (navigator.appVersion.indexOf("Win") != -1) OSName = "Windows";
            if (navigator.appVersion.indexOf("Mac") != -1) OSName = "MacOS";
            if (navigator.appVersion.indexOf("X11") != -1) OSName = "UNIX";
            if (navigator.appVersion.indexOf("Linux") != -1) OSName = "Linux";

            var OSVer = "";
            if (navigator.userAgent.indexOf("Mac OS X 10.4") != -1) OSVer = "Tiger";
            if (navigator.userAgent.indexOf("Mac OS X 10.5") != -1) OSVer = "Leopard";
            if (navigator.userAgent.indexOf("Mac OS X 10.6") != -1) OSVer = "Snow Leopard";
            if (navigator.appVersion.indexOf("NT 5.1") != -1) OSVer = "XP";
            if (navigator.appVersion.indexOf("NT 6.0") != -1) OSVer = "Vista";
            if (navigator.appVersion.indexOf("NT 6.1") != -1) OSVer = "7";
            var full_os_name = OSName + ' ' + OSVer;
            return full_os_name;
        },
        myUrl: function () {
            return window.location.href;
        },
        myHost: function () {
            return window.location.host;
        },
        myUrlReferrer: function () {
            return document.referrer;
        },
        detectMob: function () {
            if (navigator.userAgent.match(/Android/i)
            || navigator.userAgent.match(/webOS/i)
            || navigator.userAgent.match(/iPhone/i)
            || navigator.userAgent.match(/iPad/i)
            || navigator.userAgent.match(/iPod/i)
            || navigator.userAgent.match(/BlackBerry/i)
            || navigator.userAgent.match(/Windows Phone/i)
            ) {
                return true;
            }
            else {
                return false;
            }
        }
    },
    FillData: function () {
        var _os = wpStatistic.Utils.find_os();
        var _browser = wpStatistic.Utils.browserWho();
        var _myUrl = wpStatistic.Utils.myUrl();
        var _myUrlReferrer = wpStatistic.Utils.myUrlReferrer();
        var _userAgent = navigator.userAgent;
        var _host = wpStatistic.Utils.myHost();
        var _loc = "";
        var _city = "";
        var _country = "";
        var _mobile = "Destop";
        if (wpStatistic.Utils.detectMob()) {
            _mobile = "Mobile";
        }
        //information client
        if (wpStatistic._checkInformation) {
            $.get("http://ipinfo.io/", function (data) {
                wpStatistic._ip = data.ip;
                _loc = data.loc;
                _city = data.city;
                _country = data.country;
            }, "jsonp");
        }
        //get location. 
        if (wpStatistic._checkLocation) {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    _loc = position.coords.latitude + "," + position.coords.longitude;
                });
            }
        }
        // alert(_loc);
        //get location end.
        var _url = "http://scontent.webpluscnd.net/statistic.html?atk=" + wpStatistic._atk;
        if ((wpStatistic._ip != '') && (wpStatistic._ip != null))
            _url += "&ip=" + wpStatistic._ip;
        if ((_os != '') && (_os != null))
            _url += "&os=" + _os;
        if ((_myUrl != '') && (_myUrl != null))
            _url += "&url=" + _myUrl;
        if ((_browser != '') && (_browser != null))
            _url += "&bro=" + _browser;
        if ((_myUrlReferrer != '') && (_myUrlReferrer != null))
            _url += "&ref=" + _myUrlReferrer;
        if ((_city != '') && (_city != null))
            _url += "&city=" + _city;
        if ((_country != '') && (_country != null))
            _url += "&country=" + _country;
        if ((_loc != '') && (_loc != null))
            _url += "&loc=" + _loc;
        if ((_mobile != '') && (_mobile != null))
            _url += "&dType=" + _mobile;
        if ((_userAgent != '') && (_userAgent != null))
            _url += "&uAgent=" + _userAgent;
        if ((_host != '') && (_host != null))
            _url += "&host=" + _host;
        $.ajax({
            url: _url,
            success: function (data) { },
            error: function (data) { }
        });
        //end fill data
    },
    init: function (_atk, _ip) {
        wpStatistic._atk = _atk;
        wpStatistic._ip = _ip;
        wpStatistic.FillData();
    }
}

